function pr
  set repo (git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/")
  set branch (git name-rev --name-only HEAD)
  xdg-open https://github.com/$repo/pull/new/$branch
end
