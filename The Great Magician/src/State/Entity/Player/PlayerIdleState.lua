PlayerIdleState = Class{_includes = BaseState}
local tempcount = 0

function PlayerIdleState:init(player,parameter)
  self.tempplayer = player
  self.x = player.x
  self.y = player.y


  self.onParameter = parameter or true
  self.dy = 0
  self.currentAnimation = player:changeAnimation('idle')
  self.currentAnimation = player.currentAnimation
  ball = false


  --self.aya = false
  self.count = 0

end



function PlayerIdleState:update(dt)

  if skeletonFlag then
  if math.floor(skeletonBody:getX())   < math.floor(avtarBody:getX()) +17  then
    gSongs['avtarHit']:play()
    world:setGravity(0,100)
    while(self.count < 3) do
      avtarBody:applyForce(-100,-400)

        self.count = self.count + 1

  end

  self.tempplayer.currentHealth = self.tempplayer.currentHealth - 1
  self.count = 0

  end
  end

  if (love.keyboard.isDown('right') or love.keyboard.isDown('left')) and self.onParameter
   then

    self.tempplayer:changeState('walk')

  elseif love.keyboard.wasPressed('up')   then

    self.tempplayer.jumpCount = 'up'


    self.tempplayer:changeState('jump')
end
if love.keyboard.wasPressed('space') then
  self.tempplayer:changeState('attack')
end

world:update(dt)
end


function PlayerIdleState:render()
  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  25,35)
--  love.graphics.print(tostring(self.tempplayer.currentHealth),math.floor(avtarBody:getX()),virtual_height/2-30)
  --love.graphics.polygon('line',skeletonBody:getWorldPoints(skeletonShape:getPoints()))
 self.tempplayer:renderHealth(self.tempplayer.currentHealth)
--[[
if ball then

  love.graphics.print(tostring(math.floor(fireBody:getX())).." "..tostring(fireBody:getWorldPoints(fireShape:getPoints())),virtual_width/2,virtual_height/2)
  --love.graphics.rectangle('line', fireBody:getX(), fireBody:getY(), 3, 3)
 love.graphics.draw(fireball, math.floor(fireBody:getX()), math.floor(fireBody:getY()),0,0.25,0.35)
end
if ball then
--love.graphics.polygon('line',fireBody:getWorldPoints(fireShape:getPoints()))
end]]
end
