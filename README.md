# ruby-cgi
## Perfecu Ruby
### Rackのインストール
Gemfileの生成
`bundle init`

rackをgemfileに追加
`gem "rack", "~> 2.0"`

bundle install
`bundle install`

rubyのバージョンが低くてerrorになった場合
rack (~> 2.0) was resolved to 2.0.4, which depends on
  ruby (>= 2.2.2)
`rbenv versions`
  2.2.3
  2.3.0
  2.5.0-dev
`rbenv local 2.3.0`
`bundle install`

rackupコマンドでインストールされたRackのバージョンを確認
`bundle exec rackup -v`
Rack 1.3 (Release: 2.0.4)

### 動作確認
起動
`bundle exec rackup config.ru`

確認（ブラウザ）
localhost:9292

確認（curlコマンド）
curl http://localhost:9292/