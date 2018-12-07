# MWG Movies

- ruby 2.5.1
- rails 5.2.0
- node 10.11.0

## 開発環境構築

```
$ bin/setup
$ foreman start -f Foremanfile
```

## 動画の変換やAWS S3&ElasticTranscoderの運用について

画像などのファイルはcarrierwaveでAWS S3にアップロードする。

動画に関してはアプリケーションサーバーを経由するのが無駄なので、S3に直接アップロードする事にする。

mp4がアップロードされた場合、ElasticTranscoderでhlsに変換する(S3 -> Lambda -> ElasticTranscoder -> 別のS3)。変換の内容に関してはlambda_function.jsまたはAWSに書いてあるコードを参照。

アップロード時にランダムな文字列を生成してDBの保管し、変換後の再生用パスも同じ文字列を使うこととする。