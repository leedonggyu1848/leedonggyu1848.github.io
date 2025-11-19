#!/bin/bash

# 도움말 출력 함수
usage() {
    echo "사용법: $0 [-c 카테고리] [-h] <파일이름>"
    echo ""
    echo "옵션:"
    echo "  -c <카테고리>  : 카테고리(폴더)를 직접 지정합니다. (기본값: General)"
    echo "  -h             : 이 도움말을 출력합니다."
    echo ""
    echo "예시:"
    echo "  $0 my-daily-log             # General/my-daily-log.md 생성"
    echo "  $0 -c python study-note     # python/study-note.md 생성"
}

# 1. 기본값 설정
CATEGORY="General"

# 2. getopts를 이용한 옵션 파싱
# "c:h"의 의미: c 뒤에는 값(:)이 오고, h는 단독 플래그임
while getopts "c:h" opt; do
    case $opt in
        c)
            CATEGORY="$OPTARG" # -c 뒤에 입력된 값을 변수에 저장
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            # 알 수 없는 옵션이 들어오면 도움말 출력
            usage
            exit 1
            ;;
    esac
done

# 3. 처리된 옵션들을 인자 목록에서 제거 (shift)
# 이렇게 하면 남은 것은 오직 '파일이름' 뿐이게 됨
shift $((OPTIND -1))

FILENAME="$1"

# 4. 파일 이름이 입력되지 않았을 경우 처리
if [ -z "$FILENAME" ]; then
    echo "❌ 에러: 파일 이름(제목)은 필수입니다."
    echo ""
    usage
    exit 1
fi

# 5. 파일 이름에 .md 확장자가 없으면 자동으로 추가
if [[ "$FILENAME" != *.md ]]; then
    FILENAME="${FILENAME}.md"
fi

mkdir -p "content/posts/$CATEGORY"

# 6. Hugo 명령어 실행
hugo new "posts/$CATEGORY/$FILENAME"

# 7. 결과 메시지
if [ $? -eq 0 ]; then
    echo "----------------------------------------"
    echo "✅ 생성 완료!"
    echo "📂 위치: content/posts/$CATEGORY/$FILENAME"
    echo "----------------------------------------"
fi