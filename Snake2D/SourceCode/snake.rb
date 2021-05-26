# coding: utf-8
require 'dxruby'

Window.width = 300
Window.height = 300
font = Font.new(20)
font1 = Font.new(14)

right = 0
left = 0
up = 0
down = 0
gameover = 0
score = 0


img_tohu = Image.new(20, 20, C_RED)
img_block = Image.new(20, 20, C_WHITE)
sample_blocks = Sprite.new(-100, -100, img_block)


map = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      ]


blocks = Array.new
point_arr = Array.new
blocks_tmp = Array.new


map.each_with_index do |line, yy|
  line.each_with_index do |col, xx|
    point_arr << Sprite.new(xx*20, yy*20, Image.new(20, 20, C_RED))
    if col == 1
      sample_blocks = Sprite.new(xx*20, yy*20, img_block)
      blocks << sample_blocks
      #blocks << Sprite.new(xx*20, yy*20, img_block)
      tmp = sample_blocks
      point_arr.delete_at(15*yy+xx)     #because Window.width/20 = 15
    end
  end
end
point = point_arr.sample      #pick a random element from point_arr

size = 3

Window.fps = 10
#sleep(0.1)


Window.loop do
  Window.draw_font(215, 0, "SCORE: #{score}", font1)
  if gameover == 0
    if  sample_blocks.x > Window.width-20 || sample_blocks.x < 0 || sample_blocks.y > Window.height-20 || sample_blocks.y < 0 #|| sample_blocks === blocks

        gameover = 1
    end

   if Input.keyDown?(K_RIGHT) && left == 0
      right = 1
      left  = 0
      up    = 0
      down  = 0

    end
    if Input.keyDown?(K_LEFT) && right == 0
      right = 0
      left  = 1
      up    = 0
      down  = 0
    end

    if Input.keyDown?(K_DOWN) && up == 0
      right = 0
      left  = 0
      up    = 0
      down  = 1
    end

    if Input.keyDown?(K_UP) && down == 0
      right = 0
      left  = 0
      up    = 1
      down  = 0
    end

    if right == 1 
 
      tmp = blocks.shift
      #point_arr.insert((tmp.y/20*15+tmp.x/20), Sprite.new(tmp.x, tmp.y, Image.new(20, 20, C_RED)))
      map[tmp.y/20][tmp.x/20] = 0
      sample_blocks = Sprite.new(sample_blocks.x+20, sample_blocks.y, img_block)
      blocks << sample_blocks
      #point_arr.delete_at(sample_blocks.y/20*15+sample_blocks.x/20)
      map[sample_blocks.y/20][sample_blocks.x/20] = 1
      #size += 1

      blocks_tmp = blocks.slice(0,(size-2))
      if sample_blocks === blocks_tmp 
        gameover = 1
      end

    end

    if left == 1 
      tmp = blocks.shift
      #point_arr.insert((tmp.y/20*15+tmp.x/20), Sprite.new(tmp.x, tmp.y, Image.new(20, 20, C_RED)))
      map[tmp.y/20][tmp.x/20] = 0
      sample_blocks = Sprite.new(sample_blocks.x-20, sample_blocks.y, img_block)
      blocks << sample_blocks
      #point_arr.delete_at(sample_blocks.y/20*15+sample_blocks.x/20)
      map[sample_blocks.y/20][sample_blocks.x/20] = 1
      #size += 1

      blocks_tmp = blocks.slice(0,(size-2))
      if sample_blocks === blocks_tmp 
        gameover = 1
      end
    end

    if down == 1
      tmp = blocks.shift
      #point_arr.insert((tmp.y/20*15+tmp.x/20), Sprite.new(tmp.x, tmp.y, Image.new(20, 20, C_RED)))
      map[tmp.y/20][tmp.x/20] = 0
      sample_blocks = Sprite.new(sample_blocks.x, sample_blocks.y+20, img_block)
      blocks << sample_blocks
      #point_arr.delete_at(sample_blocks.y/20*15+sample_blocks.x/20)
      map[sample_blocks.y/20][sample_blocks.x/20] = 1
      #size += 1
      blocks_tmp = blocks.slice(0,(size-2))
      if sample_blocks === blocks_tmp 
        gameover = 1
      end
    end

    if up == 1
      tmp = blocks.shift
      #point_arr.insert((tmp.y/20*15+tmp.x/20), Sprite.new(tmp.x, tmp.y, Image.new(20, 20, C_RED)))
      map[tmp.y/20][tmp.x/20] = 0
      sample_blocks = Sprite.new(sample_blocks.x, sample_blocks.y-20, img_block)
      blocks << sample_blocks
      #point_arr.delete_at(sample_blocks.y/20*15+sample_blocks.x/20)
      map[sample_blocks.y/20][sample_blocks.x/20] = 1
      #size += 1
      blocks_tmp = blocks.slice(0,(size-2))
      if sample_blocks === blocks_tmp 
        gameover = 1
      end
    end

   
  ########################################################################################
    if sample_blocks === point
      point = nil
      blocks.unshift(blocks[0])
      size += 1
      score += 100
    end

    if point.nil? == false
      Sprite.draw(point)
    end  


    if point.nil? == true
      #while point = point_arr.sample && map[point.y/20][point.x/20] == 1
      loop do 
        point = point_arr.sample
        if map[point.y/20][point.x/20] != 1
          Sprite.draw(point)
          break
        end
      end
      
    end
  #########################################################################################
  
  end #gameover's end

  if gameover == 1
    sample_blocks.x += 0
    sample_blocks.y += 0

    #hien thi game over
    Window.draw_font(100, 100, "GAME OVER", font)
    Window.draw_font(100, 150, "press ESC to quit", font)
    if Input.keyDown?(K_ESCAPE)
      break                 #キーを押したらloopを抜けて終了
    end
  end  



  Sprite.draw(blocks)
  Sprite.draw(sample_blocks)

end
