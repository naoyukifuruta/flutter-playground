# splash_screen_sample

デフォルトのスプラッシュ画面は白背景のものが表示される。
下記パッケージを導入することで任意の画像を表示させることができる。
※iOS/Android両方に適用される

<img src="https://user-images.githubusercontent.com/12977376/132288789-04d7c35b-a423-4645-8e69-64df767502c8.png" width="30%">


## 導入パッケージ

[flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

## 画像の設定

```pubspec.yaml```に下記を追加する

```
flutter_native_splash:
  color: "#FFFFFF"
  image: assets/splash.png
  fullscreen: true
```

imageのところは自分の構成に合わせて変更する。
上記はassets配下にsplash.pngを配置している場合。

## スプラッシュ画面へ適用

下記コマンドを実行する。

```
flutter pub run flutter_native_splash:create
```