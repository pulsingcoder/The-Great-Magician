PlayerWalkingState = Class{_includes = BaseState}


function PlayerWalkingState:init(player)
  self.tempplayer = player
  self.x = player.x
  self.y = player.y

  --self.count = 0
  self.walkspeed = player.walkspeed
  self.dy = 0
  self.currentAnimation = player:changeAnimation('moving')
  self.currentAnimation = player.currentAnimation
  self.aya = false
end


function PlayerWalkingState:update(dt)
  self.currentAnimation:update(dt)
--  self.tempplayer:update(dt)
if collision then
  self.tempplayer.timer = self.tempplayer.timer + dt
end
if self.tempplayer.timer > 1 then
  collision =false
  self.tempplayer.timer = 0
  self.tempplayer.count = 0
end
  if not love.keyboard.isDown('right') and not love.keyboard.isDown('left') then
    self.tempplayer:changeState('idle')
  end



  if love.keyboard.isDown('right')  then
    if not collision then
    self.x = self.x + self.walkspeed*dt
  else
    self.x = self.x - self.walkspeed*dt
end


    if skeletonFlag then
    if math.floor(skeletonBody:getX())  < math.floor(avtarBody:getX()) +17  then
      gSongs['avtarHit']:play()
      while(self.tempplayer.count < 7) do

        self.x = self.x - 40*dt
        avtarBody:setY(avtarBody:getY() - 100*dt)

          self.tempplayer.count = self.tempplayer.count + 1
    end
    self.tempplayer.currentHealth =  self.tempplayer.currentHealth - 1
    self.tempplayer.count = 0
    collision = true
    --avtarBody:setY(self.y)

    end
end



    avtar_direction = 'right'
  elseif love.keyboard.isDown('left')  then
    self.x = self.x - self.walkspeed*dt
    avtar_direction = 'left'
    avtarBody:setPosition(self.x,avtarBody:getY())
  end
  if love.keyboard.wasPressed('up') then
    self.tempplayer:changeState('jump')
  end

    --self.currentAnimation = self.tempplayer:changeAnimation('moving')

    avtarBody:setPosition(self.x,avtarBody:getY())


end


function PlayerWalkingState:render()
  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  25,35)
  --love.graphics.print(tostring(self.aya),avtarBody:getX(),virtual_height/2)
  self.tempplayer:renderHealth(self.tempplayer.currentHealth)


end
