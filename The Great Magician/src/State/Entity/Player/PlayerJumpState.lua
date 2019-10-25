PlayerJumpState = Class{_includes = BaseState}


function PlayerJumpState:init(player)
  self.tempplayer = player
  self.dy = -225
  self.gravity = 8
  self.currentAnimation = player:changeAnimation('moving')
  self.currentAnimation = player.currentAnimation
  tempx = 0
  tempy = 0
end




function PlayerJumpState:update(dt)
  self.currentAnimation:update(dt)
  if self.dy < 0 then

  self.dy = self.dy + self.gravity
  self.tempplayer.y = self.tempplayer.y + self.dy*dt
  if love.keyboard.isDown('right') then
    self.tempplayer.x = self.tempplayer.x + self.tempplayer.walkspeed*dt
    avtar_direction = 'right'
  elseif love.keyboard.isDown('left') then
    self.tempplayer.x = self.tempplayer.x - self.tempplayer.walkspeed*dt
    avtar_direction = 'left'
  end
else

  if love.keyboard.isDown('right')  then
    self.tempplayer.x = self.tempplayer.x + self.tempplayer.walkspeed*dt

    avtar_direction = 'right'

    self.tempplayer:changeState('walk')

    world:setGravity(0,1000)
  elseif love.keyboard.isDown('left') then
    self.tempplayer.x = self.tempplayer.x - self.tempplayer.walkspeed*dt
    avtar_direction = 'left'
    self.tempplayer:changeState("walk")
    world:setGravity(0,1000)
  end

end



  avtarBody:setPosition(self.tempplayer.x,self.tempplayer.y)
  world:setGravity(0,100)
  world:update(dt)
  if love.keyboard.wasPressed('m') then
    self.tempplayer:changeState('idle')

  end
  tempx,tempy = world:getGravity()

end


function PlayerJumpState:render()
  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  -- lastly, the origin offsets relative to 0,0 on the sprite (set here to the sprite's center)
  25,35)
--  love.graphics.print(tostring(tempy),math.floor(avtarBody:getX())+25,virtual_height/2)
end
