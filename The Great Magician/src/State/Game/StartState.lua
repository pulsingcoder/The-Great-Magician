StartState = Class{_includes =BaseState}

function StartState:init()
  startlocal = love.graphics.newImage('Graphics/startback.png')
  
end



function StartState:update(dt)
  gSongs['startLoop']:setLooping(true)
  gSongs['startLoop']:play()
  --gSongs['startLoop']:setVolume(0.2)
  if love.keyboard.wasPressed('return') then
    gStateMachine:change('play')

    gSongs['startLoop']:stop()
  end

end



function StartState:render()
  love.graphics.setColor(1, 1, 1, 1)


  love.graphics.draw(startlocal, 0, 0,0,1.6,0.752)
love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(avtar,sprite[4], 120, virtual_height/2-42,0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)*2/(virtual_height),
  -- lastly, the origin offsets relative to 0,0 on the sprite (set here to the sprite's center)
  25,35)


  love.graphics.setColor(1, 0.1, 0.1, 1)
  love.graphics.setFont(gFonts['MagicianFont'])

  love.graphics.printf("The Great Magician", 60, virtual_height/2-30, virtual_width, 'center',0,0.5,0.5)
    love.graphics.setColor(1, 0.1, 0.1, 1)

  love.graphics.printf("The Great Magician", 60, virtual_height/2-32, virtual_width, 'center',0,0.5,0.5)



end
