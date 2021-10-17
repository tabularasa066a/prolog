# Prologを初めてみる
## 環境構築
### dockerを用いる
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

### docker commands
1. ビルド
sudo docker-compose build
2. コンテナ立ち上げ
sudo docker-compose up -d
3. コンテナに入る
※ファイル編集時はコンテナ外で編集する方が楽
sudo docker-compose exec prolog bash

## 参考
### 環境構築
https://qiita.com/physicalcotton/items/3e8e7fe3dc208856cd0a
