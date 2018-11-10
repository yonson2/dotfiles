function prm
  set repo (git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/")
  xdg-open https://github.com/$repo/compare/master...dev
end
