PlayerIdleState = Class{_includes = BaseState}


function PlayerIdleState:init(player)
  self.tempplayer = player
  self.x = player.x
  self.y = player.y
  self.dy = 0
  self.currentAnimation = player:changeAnimation('idle')
  self.currentAnimation = player.currentAnimation
end



function PlayerIdleState:update(dt)
  if love.keyboard.isDown('right') or love.keyboard.isDown('left') then
    self.tempplayer:changeState('walk')

  elseif love.keyboard.wasPressed('up') then
    self.tempplayer:changeState('jump')
end



end


function PlayerIdleState:render()
  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  -- lastly, the origin offsets relative to 0,0 on the sprite (set here to the sprite's center)
  25,35)
--  love.graphics.print("Hello",virtual_width/2,virtual_height/2)


end
