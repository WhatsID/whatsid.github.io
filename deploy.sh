hexo generate
cp -R public/* ./blog/deploy/WhatsID.github.io
cd ./blog/deploy/WhatsID.github.io
git add .
git commit -m "update article"
git push origin master