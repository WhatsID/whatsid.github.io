---
title: 个人技能树-Android
date: 2020-11-29 11:14:18
tags:
---

千里之行，始于足下。

<!-- more -->

## 一、Android
 
### Activity启动流程 (API 28)

**Step1. 从点击应用图标到AMS的调用**
```
1. Launcher调用startActivity 
2. Activity#startActivity 
3. Activity#startActivityForResult 
4. Instrumentation#execStartActivity,内部通过AIDL调用AMS#startActivity,传入IApplicationThread的句柄,本地实现为ActivityThread的内部类ApplicationThread
5. AMS#startActivityAsUser
6. ActivityStarter#execute
7. ActivityStarter#startActivityMayWait,内部调用到startActivityUnchecked
8. ActivityStackSupervisor#resumeFocusedStackTopActivityLocked
9. ActivityStack#resumeTopActivityUncheckedLocked,内部调用到resumeTopActivityInnerLocked
10. ActivityStackSupervisor#startSpecificActivityLocked 
```

**Step2. AMS调用Zygote创建app进程**
在ActivitySupervisor#startSpecificActivityLocked方法中，会判断app进程是否已经被创建，r如果已经创建，则直接从Step5开始继续。则如果还没有被创建，则开始进行app进程初始化工作：
```
void startSpecificActivityLocked(ActivityRecord r, boolean andResume, boolean checkConfig) {
    // Is this activity's application already running?
    ProcessRecord app = mService.getProcessRecordLocked(r.processName,
                r.info.applicationInfo.uid, true);

    getLaunchTimeTracker().setLaunchTime(r);
    // app进行是否被创建
    if (app != null && app.thread != null) {
        try {
            if ((r.info.flags&ActivityInfo.FLAG_MULTIPROCESS) == 0
                    || !"android".equals(r.info.packageName)) {
                app.addPackage(r.info.packageName, r.info.applicationInfo.longVersionCode,
                        mService.mProcessStats);
            }
            	// 已经创建，进入activity启动流程
            realStartActivityLocked(r, app, andResume, checkConfig);
            return;
        } catch (RemoteException e) {
            Slog.w(TAG, "Exception when starting activity "
                    + r.intent.getComponent().flattenToShortString(), e);
        }
    }
    // 没有创建，开始创建app进程
    mService.startProcessLocked(r.processName, r.info.applicationInfo, true, 0,"activity", 		r.intent.getComponent(), false, false, true);
}
```
创建app进程的方法调用流程为：

```
1. ActivitySupervisor#startProcessLocked
2. AMS#startProcessLocked,这里指定了entryPoint=android.app.ActivityThread,然后内部调用至startProcess
3. Process#start 
4. ZygoteProcess#start
5. ZygoteProcess#startViaZygote
6. ZygoteProcess#openZygoteSocketIfNeeded, 打开本地Socket，AMS作为Client
7. ZygoteProcess#zygoteSendArgsAndGetResult,通过Socket向Zygote进程发送一个参数列表,然后就进入阻塞状态，直到远程Socket服务端返回新创建的进程pid。
```

**Step3. Zygote处理Socket请求，创建子进程并反射调用ActivityThread的main函数**
在Android系统启动进行初始化时，首先会初始化Zygote进程的相关内容。在ZygoteInit的main函数中,会初始化ZygoteServer,并调用ZygoteServer#runSelectLoop来死循环监听Socket的Client（AMS）发来的消息。方法调用流程为：

```
1. ZygoteServer#runSelectLoop
2. ZygoteConnection#processOneCommand()
3. Zygote.forkAndSpecialize()
4. Zygote#nativeForkAndSpecialize
```

processOneCommand方法代码如下
```
Runnable processOneCommand(ZygoteServer zygoteServer) {
	...省略部分代码
	
	//fork进程
	pid = Zygote.forkAndSpecialize(...);
   try {
        if (pid == 0) {
            // in child,子进程执行
            zygoteServer.setForkChild();

            zygoteServer.closeServerSocket();
            IoUtils.closeQuietly(serverPipeFd);
            serverPipeFd = null;

		    //进入子进程流程,parsedArgs.startClass就是ActivityThread类，是前面AMS通过Socket发送过来的
            return handleChildProc(parsedArgs, descriptors, childPipeFd,
                        parsedArgs.startChildZygote);
        } else {
            // 父进程执行
            IoUtils.closeQuietly(childPipeFd);
            childPipeFd = null;
            handleParentProc(pid, descriptors, serverPipeFd);
            return null;
        }
    } finally {
        IoUtils.closeQuietly(childPipeFd);
        IoUtils.closeQuietly(serverPipeFd);
    }
}
```

接着执行子进程，这里即app进程流程

```
1. ZygoteConnection#handleChildProc
2. ZygoteInit#zygoteInit
3. RuntimeInit#commonInit()，在这个方法中设置了线程的DefaultUncaughtExceptionHandler
4. RuntimeInit#applicationInit 
5. RuntimeInit#findStaticMain
6. RuntimeInit#MethodAndArgsCaller,在这个方法中将ActivityThread的main方法包装为Runnable并向上返回,Runnable接收者为ZygoteInit的main方法,接收到Runnable的返回之后就直接调用了runnable.run()，此时便调用了ActivityThread的mian方法
```

**Step4. ActivityThread的main方法**
```
1. ActivityThread的mian方法中，启动了主线程looper，并创建了ActivityThread实例，然后调用ActivityThread#attach
2. AIDL调用AMS#attachApplication
3. AMS#attachApplicationLocked
4. AIDL调用ApplicationThread#bindApplication,同时AMS#attachApplicationLocked方法还会调用ActivityStackSupervisor#attachApplicationLocked,这个在Step5中进行分析
5. ApplicationThread的bindApplication中通过H.sendMessage(H.BIND_APPLICATION,data)
6. ActivityThread#handleBindApplication,该方法中完成了Instrumentation实例的创建、Application实例的创建并调用到了Application.onCreate,至此app进程启动，并完成了Application类的创建和启动
```

**Step5. Activity的启动**
在Step4的第四步中,AMS#attachApplicationLocked方法首先会通过AIDL调用ApplicationThread#bindApplication，然后调用了ActivityStackSupervisor#attachApplicationLocked。前者会完成Application的创建和启动，由于AIDL方法会阻塞调用方的继续执行，在Application完成创建和启动后，AMS会继续执行到ActivityStackSupervisor#attachApplicationLocked,该方法内部会尝试从ActivityList缓存中寻找app进程是否有待启动的activity(这里是有缓存的activity的，在Step1的第10步中，在启动activity之前会先判断app进行有没有启动，没有的话先启动app进程，待启动的activity已经被缓存起来了)。如果有的话会调用realStartActivityLocked：
```
final boolean realStartActivityLocked(...) throws RemoteException {
	...省略代码...
	final ClientTransaction clientTransaction = ClientTransaction.obtain(app.thread, r.appToken);
	// 注释1：添加LaunchActivityItem
	clientTransaction.addCallback(LaunchActivityItem.obtain(new Intent(r.intent),
                        System.identityHashCode(r), r.info,

	final ActivityLifecycleItem lifecycleItem;
	if (andResume) {
		// 注释2：添加ResumeActivityItem
            lifecycleItem = ResumeActivityItem.obtain(mService.isNextTransitionForward());
        } else {
            lifecycleItem = PauseActivityItem.obtain();
        }
        clientTransaction.setLifecycleStateRequest(lifecycleItem);

        // 执行transaction
        mService.getLifecycleManager().scheduleTransaction(clientTransaction); 
        ...省略代码...
}
```
在注释1和注释2处，向ClientTransaction中添加了LaunchActivityItem和ResumeActivityItem，记住这两个item，后面会有用。然后执行了mService.getLifecycleManager().scheduleTransaction(clientTransaction);

```
ClientLifecycleManager#scheduleTransaction方法：
void scheduleTransaction(ClientTransaction transaction) throws RemoteException {
	final IApplicationThread client = transaction.getClient();
      transaction.schedule();
      if (!(client instanceof Binder)) {
            transaction.recycle();
      }
  }
    
ClientTransaction#getClient和schedule()方法：
private IApplicationThread mClient;
public IApplicationThread getClient() {
    return mClient;
}
    
public void schedule() throws RemoteException {
    mClient.scheduleTransaction(this);
}
```
mClient就是在客户端的实现是ApplicationThread，所以最终执行到了ApplicationThread#scheduleTransaction方法:
```
1. ApplicationThread#scheduleTransaction
2. ActivityThread#scheduleTransaction
3. TrasactionExecutor#execute
```
TrasactionExecutor#execute方法如下
```
    public void execute(ClientTransaction transaction) {
        final IBinder token = transaction.getActivityToken();
        log("Start resolving transaction for client: " + mTransactionHandler + ", token: " + token);

        executeCallbacks(transaction);

        executeLifecycleState(transaction);
        mPendingActions.clear();
        log("End resolving transaction");
    }
    
    public void executeCallbacks(ClientTransaction transaction) {
        final List<ClientTransactionItem> callbacks = transaction.getCallbacks();
        if (callbacks == null) {
            // No callbacks to execute, return early.
            return;
        }
        ...省略代码...
        final int size = callbacks.size();
        for (int i = 0; i < size; ++i) {
            final ClientTransactionItem item = callbacks.get(i);
            ...省略代码...
            item.execute(mTransactionHandler, token, mPendingActions);
            item.postExecute(mTransactionHandler, token, mPendingActions);
            ...省略代码...
        }
    }
  
    private void executeLifecycleState(ClientTransaction transaction) {
        final ActivityLifecycleItem lifecycleItem = transaction.getLifecycleStateRequest();
        if (lifecycleItem == null) {
             return;
        }
        ...省略代码...
        lifecycleItem.execute(mTransactionHandler, token, mPendingActions);
        lifecycleItem.postExecute(mTransactionHandler, token, mPendingActions);
    }
```

其实就是顺序执行了LaunchActivityItem和ResumeActivityItem（还记得这两个item吗）的execute方法：
```
    @Override
    public void execute(...) {
        ...省略代码...
        client.handleLaunchActivity(r, pendingActions, null /* customIntent */);
        ...省略代码...
    }
    
    @Override
    public void execute(...) {
        ...省略代码...
        client.handleResumeActivity(token, true /* finalStateRequest */, mIsForward,
                "RESUME_ACTIVITY");
        ...省略代码...
    }
```
handleLaunchActivity和handleResumeActivity中完成了Activity的创建和展示，具体的代码细节就不贴了。到这里整个app就启动起来了。

### View绘制流程 (API 28)
在上面Activity的启动流程中，最后会调用handleResumeActivity，绘制流程就从这里开始分析。

handleResumeActivity方法中会调用performResultActivity,该方法中会调用Activity#performResume,从而完成对onStart和onResume方法的回调。

再回到handleResumeActivity方法中，该方法中有一段关键代码：

```
if (r.window == null && !a.mFinished && willBeVisible) {
	// r.window的实现类为PhoneWindow，PhoneWindow的创建是在activity#attach方法中，attach方法是ActivityThread#performLaunchActivity方法调用的
	r.window = r.activity.getWindow();
	// PhoneWindow#getDecorView中如果decor为空，会执行installDecor来完成DecorView的创建，同时将DecorView和PhoneWindow关联起来
	View decor = r.window.getDecorView();
	// 这里将decor设置为不可见，暂时还没找到在哪里设置为可见
	decor.setVisibility(View.INVISIBLE);
	// wm实现类为WindowManagerImpl
	ViewManager wm = a.getWindowManager();
	WindowManager.LayoutParams l = r.window.getAttributes();
	a.mDecor = decor;
	...省略代码...
	if (a.mVisibleFromClient) {
		if (!a.mWindowAdded) {
			a.mWindowAdded = true;
			// 重点方法
			wm.addView(decor, l);
		} else {
			...省略代码...
		}
	}
}
```

WindowManagerImpl是典型的桥接模式实现，内部将所有方法都委托给了WindowManagerGlobal来实现，所以直接看WindowManagerGlobal#addView:

```
public void addView(View view, ViewGroup.LayoutParams params,
        Display display, Window parentWindow) {
    ...省略代码...

    ViewRootImpl root;
    View panelParentView = null;

    synchronized (mLock) {
        ...省略代码...

        root = new ViewRootImpl(view.getContext(), display);

        view.setLayoutParams(wparams);

        mViews.add(view);
        mRoots.add(root);
        mParams.add(wparams);

        
        try {
            // 调用了ViewRootImpl#setView
            root.setView(view, wparams, panelParentView);
        } catch (RuntimeException e) {
            // BadTokenException or InvalidDisplayException, clean up.
            if (index >= 0) {
                removeViewLocked(index, true);
            }
            throw e;
        }
    }
}
```
ViewRootImpl#setView中调用了requestLayout:
```
@Override
public void requestLayout() {
    if (!mHandlingLayoutInLayoutRequest) {
        checkThread();
        mLayoutRequested = true;
        scheduleTraversals();
    }
}

void scheduleTraversals() {
    if (!mTraversalScheduled) {
        mTraversalScheduled = true;
        // 这里通过handler发送了一个同步屏障，在后面介绍消息机制的时候再解释同步屏障
        mTraversalBarrier = mHandler.getLooper().getQueue().postSyncBarrier();
        // Choreographer就先不介绍了，和屏幕刷新机制有关，重点关注mTraversalRunnable
        mChoreographer.postCallback(
                Choreographer.CALLBACK_TRAVERSAL, mTraversalRunnable, null);
        if (!mUnbufferedInputDispatch) {
            scheduleConsumeBatchedInput();
        }
        notifyRendererOfFramePending();
        pokeDrawLockIfNeeded();
    }
}

final class TraversalRunnable implements Runnable {
    @Override
    public void run() {
        doTraversal();
    }
}

void doTraversal() {
    if (mTraversalScheduled) {
        mTraversalScheduled = false;
        mHandler.getLooper().getQueue().removeSyncBarrier(mTraversalBarrier);

        if (mProfile) {
            Debug.startMethodTracing("ViewAncestor");
        }
	  // 这里就是绘制流程的起源啦
        performTraversals();

        if (mProfile) {
            Debug.stopMethodTracing();
            mProfile = false;
        }
    }
}
```
在performTraversals方法中依次调用了performMeasure、performLayout、performDraw方法来完成View绘制的三大流程：测量、布局和绘制。另外ViewRootImpl中还涉及到了Choreographer屏幕刷新机制、invalidate和requestLayout的区别等内容，这里就不再多介绍了，我也懒得写了吼吼吼😎


### Android消息机制
Android消息机制中主要有Handler、Looper、MessageQueue、ThreadLocal、ThreadLocalMap等几个重点类。但是实在不知道该写点啥，感觉没什么难点（菜鸡的迷之自信）。随便写点个人理解吧。(可能有误

1. Android是以消息机制为驱动的系统，事件在底层产生，传到系统层，再由系统层用AIDL的方式分发给各应用进程，应用受到事件后进行相应的处理。如果没有事件产生，应用进程需要等待消息的产生再做相应的处理。所以必然有某种等待消息时的阻塞机制。
2. ApplicationThread作为Binder机制在client中的实现类，在接收到消息之后使用mH将消息直接传递给ActivityThread，具体的行为都是在ActivityThread中进行的。mH是ActivityThread中的Handler类型的成员变量，在ActivityThread#main中会初始化Looper，Looper的初始化线程为主线程，所以消息都是在主线程中处理的。
3. 在ActivityThread#main中，最后两行代码：

```
Looper.loop();

throw new RuntimeException("Main thread loop unexpectedly exited");
```
也就是如果执行到了Looper.loop()的下一行，程序就会抛出异常然后退出，所以Looper.loop()必然需要是死循环。

4. Looper#loop为死循环，其实并不是因为loop中的死循环阻塞了，而是因为方法中的queue.next()阻塞了，一旦queue.next()返回空的msg，方法就会return从而退出，所以正常情况下queue.next()要么返回正常的msg，要么阻塞。如果返回了空msg，则代表程序要退出了(针对main looper而言)。

```
public static void loop() {
    ...省略代码...
    for (;;) {
        Message msg = queue.next(); // might block
        if (msg == null) {
            // No message indicates that the message queue is quitting.
            return;
        }
        ...省略代码...
    }
}
```

5. MessageQueue#next方法中有对同步屏障进行处理的代码，可以看出单纯设置msg.setAsynchronous(true)并不能生成同步屏障，生成同步屏障需要msg.target == null
```
Message prevMsg = null;
Message msg = mMessages;
if (msg != null && msg.target == null) {
    // Stalled by a barrier.  Find the next asynchronous message in the queue.
    do {
        prevMsg = msg;
        msg = msg.next;
    } while (msg != null && !msg.isAsynchronous());
}
```

6. MessageQueue中有postSyncBarrier方法，该方法是唯一可以产生msg.target == null的方法，在Handler中所有sendMessage、postDelay等方法最终都会走到enqueueMessage方法中，该方法会给message.target赋值:
```
private boolean enqueueMessage(MessageQueue queue, Message msg, long uptimeMillis) {
    msg.target = this;
    if (mAsynchronous) {
        msg.setAsynchronous(true);
    }
    return queue.enqueueMessage(msg, uptimeMillis);
}
```
7. MessageQueue#next方法中的nextPollTimeoutMillis变量，-1代表一直阻塞，直到调用nativeWake来唤醒；0代表不会阻塞，立即返回；>0代表最长阻塞nextPollTimeoutMillis毫秒，期间如果调用nativeWake则立即返回。
8. IdleHandler只会在MessageQueue#next第一次循环时被调用。（？
9. ThreadLocal并不是线程本地变量，ThreadLocalMap才是，只不过通过ThreadLocal可以取出Thread中的ThreadLocalMap。ThreadLocalMap是ThreadLocal中的静态内部类。
10. ThreadLocalMap中的数据结构是数组+Map。Map的key为软引用，意味着如果key的实例没有强引用存在时，不会因为ThreadLocalMap中的引用导致内存泄漏。同时在ThreadLocalMap的set/get/remove等方法中，会检查key为空的内容，将value也置为空，防止value的内存泄漏。

### Binder机制（害没写

### Android编译流程

## 二、Java基础知识

## 三、Kotlin
