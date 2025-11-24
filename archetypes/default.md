+++
draft = true
date = '{{ .Date }}'
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
author = "leedonggyu1848"
tags = []
categories = ["{{ $path := .File.Dir }}{{ $cleanedPath := trim $path "/" }}{{ $parts := split $cleanedPath "/" }}{{ $lastIndex := sub (len $parts) 1 }}{{ $category := index $parts $lastIndex | default .Section }}{{ $category | title }}"]
description = "여기에 글 요약을 적으세요."
+++
