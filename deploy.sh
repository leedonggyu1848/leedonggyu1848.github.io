#!/bin/bash
echo -e "\033[0;32mDeploying updates to GitHub\033[0m"
 
# 모든 서브모듈의 변경사항을 업데이트
echo -e "\033[0;32mUpdating all submodules\033[0m"
git submodule sync
git submodule update --remote --init
 
# 프로젝트 빌드
# `hugo -t <테마명>`
echo -e "\033[0;32mBuilding the hugo project\033[0m"
hugo -t papermod
 
# `source` 브랜치로 이동
echo -e "\033[0;32mUpdating the branch with build files\033[0m"
cd public
git add .
# 인자가 없을 경우 현재 시간을 커밋 메시지로 등록
msg="rebuild: $(date +"%Y-%m-%dT%H:%M:%S%z")"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push -u origin source
 
# 현재까지의 변경사항을 `main` 브랜치에 반영
echo -e "\033[0;32mUpdating the main branch\033[0m"
cd ..
git add .
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin main
