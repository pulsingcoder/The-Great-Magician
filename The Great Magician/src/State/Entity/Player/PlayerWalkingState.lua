PlayerWalkingState = Class{_includes = BaseState}


function PlayerWalkingState:init(player)
  self.tempplayer = player
  self.x = player.x
  self.y = player.y

  self.walkspeed = player.walkspeed
  self.dy = 0
  self.currentAnimation = player:changeAnimation('moving')
  self.currentAnimation = player.currentAnimation
end


function PlayerWalkingState:update(dt)
  self.currentAnimation:update(dt)
  if not love.keyboard.isDown('right') and not love.keyboard.isDown('left') then
    self.tempplayer:changeState('idle')
  end
  if love.keyboard.isDown('right') then
    self.x = self.x + self.walkspeed*dt
    avtar_direction = 'right'
  elseif love.keyboard.isDown('left') then
    self.x = self.x - self.walkspeed*dt
    avtar_direction = 'left'
  end
  if love.keyboard.wasPressed('up') then
    self.tempplayer:changeState('jump')
  end

    --self.currentAnimation = self.tempplayer:changeAnimation('moving')


  avtarBody:setPosition(self.x,avtarBody:getY())
end


function PlayerWalkingState:render()
  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  -- lastly, the origin offsets relative to 0,0 on the sprite (set here to the sprite's center)
  25,35)
--  love.graphics.print("Hello",virtual_width/2,virtual_height/2)


end
