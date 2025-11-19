+++
date = '{{ .Date }}'
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
author = "leedonggyu1848"
tags = []
categories = ["{{ .Section | default "General" | title }}"]
description = "여기에 글 요약을 적으세요."
+++
