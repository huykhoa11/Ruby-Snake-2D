require 'dxruby'

Window.caption = 'OneBlockTetris'
Window.width = 500
Window.height = 600

X = 20
Y = 20

X_BUFFER = 30
Y_BUFFER = 100

NEXT_PRINT_X = X_BUFFER + X * 14 + 10
NEXT_PRINT_Y = Y_BUFFER + Y * 17 + 10
NEXT_FONT = Font.new(19)

RED = 0
BLUE = 1
GREEN = 2
ORANGE = 3
YELLOW = 4
GRAY = 5

blocks = Image.loadTiles('../image/colorbox.png', 6, 1)

map_tmp = [
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0],
       [0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      ]

map = []

for i in (0..(map_tmp.length-1))
  for j in (0..(map_tmp[0].length-1))
    map.push(Sprite.new(X_BUFFER + X * j, Y_BUFFER + Y * i, blocks[GRAY])) if map_tmp[i][j] == 0
  end
end

def create(block, x=X_BUFFER+X+50, y=Y_BUFFER)
  Sprite.new(x, y, block)
end

def clean(map)

  20.downto(0) do |height|
    if map.count {|block| (block.x < X_BUFFER + X * 11) && (block.y == Y_BUFFER + Y * height)} == 11
=begin
      map.delete_if {|block| (block.x < X_BUFFER + X * 11) && (block.y == Y_BUFFER + Y * height)}
      map.collect do |block|
        if (block.x > X_BUFFER + X * 1 && block.x < X_BUFFER + X * 11) && block.y >= Y_BUFFER + Y * 21
          block.y += 20
        end
      end
    end
  end
  map
=end
      return true
    end
  end
  false
end

clear = false

current_block = nil
next_block = rand(5)
next_block_view = nil

Window.loop do
  if Input.keyPush?(K_Q)
    break
  end

  if clear
    Window.drawFontEx(100, 300, 'CLEAR!!!', Font.new(70), { font: [255, 255, 255] })
    if Input.keyPush?(K_RETURN)
      break
    end
  else

  unless current_block
    current_block = create(blocks[next_block])
    next_block = rand(5)
    next_block_view = create(blocks[next_block], NEXT_PRINT_X+10, NEXT_PRINT_Y+30)
  end

  if Input.keyDown?(K_H)
    current_block.x -= 2
    if current_block === map
      current_block.x += 2
    end
  end

  if Input.keyDown?(K_L)
    current_block.x += 2
    if current_block === map
      current_block.x -= 2
    end
  end

  if Input.keyDown?(K_J)
    current_block.y += 2
    if current_block === map
      current_block.y -= 2
    end
  end

  if current_block === map
    current_block.y -= 1
    map.push(current_block)
    clear = clean(map)
    current_block = nil
  else
    current_block.y += 1
  end

  current_block.draw if current_block
  Window.drawFontEx(NEXT_PRINT_X, NEXT_PRINT_Y, 'Next', NEXT_FONT, { font: [255, 255, 255] })
  Sprite.draw(next_block_view)
  Sprite.draw(map)
  end
end
