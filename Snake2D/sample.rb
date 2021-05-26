require 'dxruby'

x = 0                           # x座標の変数
y = 0                           # y座標の変数
Window.bgcolor = [255, 255, 255, 255]             # 背景色設定
image = Image.load("character.png", 0, 0, 32, 32) # 画像読み込み

Window.loop do
  break if Input.keyDown?(K_ESCAPE)
  x += Input.x * 8
  y += Input.y * 8

  Window.draw(x, y, image)        # data.bmpを座標の位置に表示
end
