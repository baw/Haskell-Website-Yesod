#!/bin/sh

npm run compile-less

vagrant ssh -c "cd /vagrant; stack build"
cp .stack-work/install/x86_64-linux/lts-3.1/7.10.2/bin/website ./website
branch="deploy-$(date +%F)"
git checkout $branch || git checkout -b $branch
git add ./website
git commit -m "deploy"

echo "Should the branch be deployed?"
read deploy

if ([ "$deploy" == "y" ] || [ "$deploy" == "Y" ]); then
	git push -f heroku $branch:master
else
	echo "not deploying"
fi
