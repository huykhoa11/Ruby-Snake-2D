require 'dxruby'

x = 0                           # x���W�̕ϐ�
y = 0                           # y���W�̕ϐ�
Window.bgcolor = [255, 255, 255, 255]             # �w�i�F�ݒ�
image = Image.load("character.png", 0, 0, 32, 32) # �摜�ǂݍ���

Window.loop do
  break if Input.keyDown?(K_ESCAPE)
  x += Input.x * 8
  y += Input.y * 8

  Window.draw(x, y, image)        # data.bmp�����W�̈ʒu�ɕ\��
end
