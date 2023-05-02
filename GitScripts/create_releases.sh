branchname="release/1.30.0"
while IFS= read -r line
do
  cd /git
  git config user.email "bleronshabiuu@gmail.com"
  git config user.name "bleronsh"
  # when line starts with # ignore it
  [[ $line =~ ^#.* ]] && continue

  reponame=$(echo $line | cut -d: -f4)
  touch $reponame
  git checkout -b $reponame/$branchname
  git add .
  git commit -m "new branch"
  # [[ $release == "BGS" ]] && ./delete_releasebranch.sh $cda_component $branchname
done < "psd2-repos.txt"