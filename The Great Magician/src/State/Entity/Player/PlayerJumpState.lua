PlayerJumpState = Class{_includes = BaseState}


function PlayerJumpState:init(player)
  self.tempplayer = player
  self.dy = -225
  self.gravity = 8
  self.currentAnimation = player:changeAnimation('idle')
  self.currentAnimation = player.currentAnimation

  world:setGravity(0,100)
  count = 0
  tempx = 0
  tempy = 0
end




function PlayerJumpState:update(dt)

  self.currentAnimation:update(dt)

while count < 3 do
  if love.keyboard.wasPressed('right') then
  avtarBody:applyForce(300,-550)
  avtar_direction = 'right'
--  world:setGravity(0,1000)
  self.tempplayer:changeState('walk')
  --

elseif love.keyboard.wasPressed('left') then
  avtar_direction = 'left'
  avtarBody:applyForce(-300,-500)
  self.tempplayer:changeState('walk')
else
  avtarBody:applyForce(0,-500)
  self.tempplayer:changeState('idle')


end
count = count +1
end
  --world:setGravity(0,1000)

  if love.keyboard.wasPressed('m') then
    self.tempplayer:changeState('idle')

  end
avtarBody:setPosition(self.tempplayer.x,self.tempplayer.y)

end


function PlayerJumpState:render()
  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  
  25,35)
--  self.tempplayer:renderHealth(self.tempplayer.currentHealth)

  --love.graphics.print(tostring(self.dy),math.floor(avtarBody:getX())+25,virtual_height/2)
end
