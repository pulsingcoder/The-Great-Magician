PlayerAttackState = Class{_includes = BaseState}
local tempcount = 0
ball = true
function PlayerAttackState:init(player)
  self.tempplayer = player
  self.x = player.x
  self.y = player.y

  self.dy = 0
  self.currentAnimation = player:changeAnimation('attack')
  self.currentAnimation = player.currentAnimation
  ball = true
  if avtar_direction == 'right' then
  fireBody = love.physics.newBody(world, math.floor(self.x)+10, math.floor(self.y), 'static')
else
  fireBody = love.physics.newBody(world, math.floor(self.x)-10, math.floor(self.y), 'static')
end

  fireShape = love.physics.newRectangleShape(5,5)
  fireFixture = love.physics.newFixture(fireBody, fireShape)
  gSongs['sword']:play()


end


function PlayerAttackState:update(dt)
  if ball then

  if tempcount <= 70 then
    tempcount = tempcount + 1
    if avtar_direction == 'right' then
    fireBody:setX(fireBody:getX() + 50*dt)
  else
    fireBody:setX(fireBody:getX() - 50*dt)
end

    --self.tempplayer:collide(fireBody,skeletonBody)
    self.tempplayer.fire = true

  end
    if tempcount > 10 then
    --  self.currentAnimation = self.tempplayer:changeAnimation('idle')
      --self.currentAnimation = self.tempplayer.currentAnimation
   end
   if tempcount > 70 then
     fireBody:setY(-10)
     fireBody:release()
     ball = false
      self.tempplayer.fire = false
     self.tempplayer:changeState('idle')
--     ball = false
     tempcount = 0


   end

elseif ball == false then
  self.tempplayer:changeState('idle')
end

end


function PlayerAttackState:render()

  love.graphics.draw(avtar,sprite[self.currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  25,35)

  self.tempplayer:renderHealth(self.tempplayer.currentHealth)


    --love.graphics.print(tostring(math.floor(fireBody:getX())).." "..tostring(fireBody:getWorldPoints(fireShape:getPoints())),virtual_width/2,virtual_height/2)
    --love.graphics.rectangle('line', fireBody:getX(), fireBody:getY(), 3, 3)
if ball then
   love.graphics.draw(fireball, math.floor(fireBody:getX()), math.floor(fireBody:getY()),0,avtar_direction == 'right'and  0.25 or -0.25,0.35)
end
end
