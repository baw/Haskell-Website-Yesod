#!/bin/sh

npm run compile-less

vagrant ssh -c "cd /vagrant; stack clean; stack build; stack install"
cp /home/vagrant/.local/bin/website ./website
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
