# Prologを初めてみる
## 環境構築
Dockerを用いる
1. Dockerfileを作る
```yaml
FROM swipl
RUN apt-get update && \
    apt-get install -y -y --no-install-recommends \
        vim
WORKDIR /usr/src
```

2. dcoker-composeを作る（マウントとか面倒だしね）
```yaml
version: "3"
services:
  prolog:
    build:
      context: .
      dockerfile: ./Dockerfile
    container_name: prolog
    volumes:
      - ./:/usr/src
    tty: true
```
3. ビルド
`sudo docker-compose build`
4. コンテナ立ち上げ
`sudo docker-compose up -d`
5. コンテナに入る
※ファイル編集時はコンテナ外で編集する方が楽
`sudo docker-compose exec prolog bash`

## Prologメモ
### 構造
- 述語論理とコーディングできる（要は高校数学のP → Qの命題構造をそのままプログラミングで扱える）
- 以下の３つの概念
  - 事実：「太郎は人である」
  - 規則：「Aさんが人ならば、Aさんはいずれ死ぬ」
  - 帰結：「太郎はいずれ死ぬ」 -> true

### 記法
1. 述語（事実の記述に用いることが多い）
``` prolog
% taroならばhuman
human(taro)
```

2. 規則
```prolog
% Aがhumanである場合、Aはmortalである
% P ⇨ Qのとき、Q :- P
mortal(A) :- human(A)
```


## 参考
### 環境構築
https://qiita.com/physicalcotton/items/3e8e7fe3dc208856cd0a

### 教材（少な・・・）
http://www.k-techlabo.org/www_prolog/prolog_main.pdf
