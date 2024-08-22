# ベースイメージとしてNode.js 20を使用
FROM node:20-alpine

# Yarnをインストール
RUN apk add --no-cache yarn

# 作業ディレクトリを設定
WORKDIR /app

# package.jsonとyarn.lockをコピー
COPY package.json yarn.lock ./

# 依存関係をインストール
RUN yarn install

# ソースコードをコピー
COPY . .

# アプリケーションをビルド
RUN yarn build

# ポート3000を開放
EXPOSE 3000

# アプリケーションを起動
CMD ["yarn", "start"]
