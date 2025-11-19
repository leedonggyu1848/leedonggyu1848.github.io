+++
date = '2025-11-19T18:52:36+09:00'
title = 'Test Highlighting'
author = "leedonggyu1848"
tags = []
categories = ["Posts"]
description = "여기에 글 요약을 적으세요."
+++

이 포스트는 Hugo의 `markup.highlight` 설정이 올바르게 적용되었는지 확인하기 위한 테스트 페이지입니다.

## 1. Python (기본 테스트)

가장 대중적인 파이썬 코드입니다. 데코레이터와 함수 정의가 잘 보이는지 확인하세요.

```python
import time

def time_decorator(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        print(f"Execution time: {end_time - start_time} seconds")
        return result
    return wrapper

@time_decorator
def say_hello(name):
    time.sleep(1)
    print(f"Hello, {name}!")

if __name__ == "__main__":
    say_hello("Hugo User")
````

## 2\. JavaScript / TypeScript (모던 문법)

ES6+ 문법과 화살표 함수, `async/await` 키워드 색상을 확인하세요.

```typescript
interface User {
  id: number;
  name: string;
}

const fetchUser = async (id: number): Promise<User> => {
  try {
    const response = await fetch(`https://api.example.com/users/${id}`);
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    const data: User = await response.json();
    return data;
  } catch (error) {
    console.error("Fetching user failed", error);
    throw error;
  }
};

fetchUser(1).then(user => console.log(user.name));
```

## 3\. Java (클래스 구조)

클래스, 어노테이션, 그리고 제네릭 타입의 하이라이팅을 확인합니다.

```java
package com.example.hugo;

import java.util.List;
import java.util.ArrayList;

public class SyntaxTest {

    private final String message;

    public SyntaxTest(String message) {
        this.message = message;
    }

    public void printList(List<String> items) {
        for (String item : items) {
            System.out.println(this.message + ": " + item);
        }
    }

    public static void main(String[] args) {
        SyntaxTest tester = new SyntaxTest("Check");
        List<String> list = new ArrayList<>();
        list.add("Line Numbers");
        list.add("Colors");

        tester.printList(list);
    }
}
```

## 4\. Go (Golang)

Hugo가 작성된 언어인 Go입니다. 구조체와 포인터 문법을 확인하세요.

```go
package main

import (
	"fmt"
	"sync"
)

type Counter struct {
	mu    sync.Mutex
	value int
}

func (c *Counter) Increment() {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.value++
}

func main() {
	c := Counter{}
	c.Increment()
	fmt.Printf("Count: %d\n", c.value)
}
```

## 5\. HTML & CSS (프론트엔드)

태그(Tag)와 속성(Attribute), 그리고 CSS 선택자의 색상을 확인하세요.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            background-color: #f0f0f0;
        }
        h1 {
            color: #333;
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <div class="container" id="main">
        <h1>Hello Hugo!</h1>
        <!-- 주석이 제대로 흐리게 나오나요? -->
    </div>
</body>
</html>
```

## 6\. Shell / Bash (터미널 명령어)

터미널 명령어와 플래그, 문자열이 구분되는지 확인합니다.

```bash
#!/bin/bash

# 변수 설정
APP_NAME="my-hugo-site"
PORT=1313

echo "Starting $APP_NAME on port $PORT..."

# 서버 시작
if [ -d "./public" ]; then
    rm -rf ./public
    echo "Cleaned public directory."
fi

hugo server -D --port $PORT
```

## 7\. 특정 줄 강조 테스트 (Highlight Lines)

특정 줄을 강조하는 기능이 작동하는지 확인합니다.
(코드 블록 뒤에 `{ hl_lines=[4, "8-10"] }` 옵션을 사용했습니다.)

```go { hl_lines=[4, "8-10"] }
package main

import "fmt"
// 이 줄은 강조됩니다.
// 아래 줄(4번)은 노란색(또는 테마색) 배경이 깔려야 합니다.
func main() {
    fmt.Println("Highlight Start")
    // 여기부터(8번)
    // 여기까지(10번)
    // 3줄이 강조되어야 합니다.

    fmt.Println("Highlight End")
}
```

## 8\. 가로 스크롤 테스트 (Long Lines)

코드가 매우 길 때 줄바꿈이 되는지, 아니면 가로 스크롤이 생기는지 확인합니다. (보통 스크롤이 생기는 것이 좋습니다.)

```json
{
  "id": "0001",
  "type": "donut",
  "name": "Cake",
  "ppu": 0.55,
  "batters": {
    "batter": [
      { "id": "1001", "type": "Regular" },
      { "id": "1002", "type": "Chocolate" },
      { "id": "1003", "type": "Blueberry" },
      { "id": "1004", "type": "Devil's Food" }
    ]
  },
  "description": "This is a very long description text to test if the code block creates a horizontal scrollbar properly when the content exceeds the width of the container instead of wrapping the text to the next line which can make code hard to read."
}
```