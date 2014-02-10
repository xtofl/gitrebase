rm -rf rebasing_repo1
rm -rf rebasing_repo2

mkdir rebasing_repo1

pushd rebasing_repo1
git init
echo "a tool to demonstrate rebasing" > readme.txt
git add readme.txt
git commit -m "create initial repo"

git branch development
git checkout development

git branch feature2
git checkout feature2
echo > feature2.txt
git add feature2.txt
git commit -m "create feature2"

git checkout development
git branch feature1
git checkout feature1

echo "feature1" > feature1.txt
git add feature1.txt
git commit -m "implemented feature1"
echo "fix feature1" >> feature1.txt
git add feature1.txt
git commit -m "fix feature1"

popd




git clone rebasing_repo1 rebasing_repo2
pushd rebasing_repo2

# the wrong path...
git checkout development
echo "feature 1.b" >> feature1b.txt
git add feature1b.txt
git commit -m "create feature 1.b"
echo "fix" >> feature1b.txt
git add feature1b.txt
git commit -m "fix feature 1.b"
# now, we have committed feature 1.b onto branch
# 'development' while it should have been on 'feature1'...
git rebase feature1
gitk --all
