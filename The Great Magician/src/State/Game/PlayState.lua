PlayState = Class{_includes = BaseState}

function PlayState:init()
  self.player = Player{
    animations = Entity_Data['player'].animations,
    walkspeed = Entity_Data['player'].walkspeed,
    jumpspeed = Entity_Data['player'].jumpspeed,

    x = avtarBody:getX(),
    y = avtarBody:getY(),


    dy = 0

  }

  self.player.stateMachine = StateMachine{
    ['walk'] = function() return PlayerWalkingState(self.player) end,
    ['idle'] = function() return PlayerIdleState(self.player) end,
    ['jump'] = function() return PlayerJumpState(self.player) end
  }
  self.player:changeState('idle')
  temporry = avtarBody:getY();
  self.camX = math.max(0,
  math.min(16*map.width-virtual_width,math.floor(self.player.x)-virtual_width/2-8) )
--  backx = backx%(130*(1.5*virtual_width)/background['back5']:getWidth())


end


function PlayState:update(dt)
  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
  self.player.x = avtarBody:getX()
  self.player.y = avtarBody:getY()


  world:update(dt)

  self.player:update(dt)
  self.camX = math.max(0,
  math.min(16*map.width-virtual_width,math.floor(avtarBody:getX())-virtual_width/2-8) )
  --world:setGravity(0,100)



end


function PlayState:render()
  love.graphics.push()
  for key,back in pairs(background) do


    love.graphics.draw(back, 0, 0,0,(1.5*virtual_width)/background['back5']:getWidth(),virtual_height/background['back5']:getHeight())
  end
   --love.graphics.draw(background['back5'], -math.floor(backx), 0,0,(1.5*virtual_width)/background['back5']:getWidth(),virtual_height/background['back5']:getHeight())

    love.graphics.scale(1)
    love.graphics.translate(-math.floor(self.camX), 0)
    map:draw(math.floor(self.camX*5.45),0)


    self.player:render()



    --love.graphics.print(tostring(math.floor(self.camX*5.47)).." "..tostring(math.floor(self.camX)),math.floor(self.player.x),virtual_height/2+10)
    --love.graphics.polygon('line',avtarBody:getWorldPoints(avtarShape:getPoints()))
    love.graphics.setLineWidth(2)
    tile:render()
    love.graphics.pop()
  end
