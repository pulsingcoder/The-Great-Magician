BadMovingState = Class{_includes = BaseState}
local countie = 0
function BadMovingState:init(BadGuy,player,body)
  self.tempGuy = BadGuy
  self.tempplayer = player
  self.body = body
  self.tempGuy.walkspeed = 20
  self.tempGuy.health = 5
  self.currentAnimation = BadGuy:changeAnimation('moving')
  self.currentAnimation = BadGuy.currentAnimation
  self.maxX = self.body:getX()
  self.minX = self.body:getX() - 55
  self.offset = 0
  self.indicatorTimer = 0
  self.x = self.body:getX()
  self.ayam = false
  countie = 0
  self.disable = false
  self.waitTimer = false
  self.indicator = false
  self.width = 25
  self:emitParticles()

end



function BadMovingState:update(dt)
  self.currentAnimation:update(dt)

  if math.floor(self.body:getX()) < self.minX then
    self.tempGuy.walkspeed = 20
    self.tempGuy.direction = 'right'

  end
  if math.floor(self.body:getX()) > self.maxX then
    self.tempGuy.walkspeed = -20
    self.tempGuy.direction = 'left'

  end
 --end

 if ball then
   if math.floor(fireBody:getX())+4 > math.floor(self.body:getX()) then

     self.indicator = true
     while(countie < 50) do
       if avtar_direction == 'right' then
       self.x = self.x + 30*dt
     end
     self.body:applyForce(0,-20)
     self.tempGuy.indicatorFlag = true

     countie = countie + 1

   end
   countie = 0
   if self.width > 0 then
     self.tempGuy.health = self.tempGuy.health - 1
     self.width = self.width*(self.tempGuy.health/5)
     fireBody:setY(-1)
     fireBody:release()
    ball = false
   end
  if self.width <=0 then
    self.tempGuy.timedKill = self.tempGuy.timedKill + 1
    self.tempGuy.tempX = self.body:getX()
    self.tempGuy.tempY = self.body:getY()
    self.ayam = true
    self.psystem:emit(1000)
    self.psystem:setEmissionRate(0.2)


    if self.tempGuy.timedKill == 1 then
      self.body:setX(455)
      self.body:setY(10)
      self.tempGuy:changeState('moving')

    elseif self.tempGuy.timedKill >= 2 then
    skeletonFlag = false
    self.body:setY(-1)
    self.body:setX(-1)
    self.body:release()
  end
  end



  self.disable = true

 end

end

  self.x = self.x + self.tempGuy.walkspeed*dt
 if self.tempGuy.direction == 'left' then
   self.offset = 8
 else
   self.offset = 58
 end

--
  self.psystem:update(dt)

if skeletonFlag then
  self.body:setX(self.x)
end
end

function BadMovingState:render()
  if self.disable or self.waitTimer then
  love.graphics.setColor(1, 1, 1, 0.1)
  if self.waitTimer then
    self.waitTimer = false
  end
  if self.disable then
    self.disable = false
     self.waitTimer = true
  end


end
   if skeletonFlag then
  love.graphics.draw(skeletonSprite,skeleton[self.currentAnimation:getCurrentFrame()], math.floor(self.body:getX())+8, math.floor(self.body:getY())-5,0,self.tempGuy.direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
  self.offset,8)
end

 self:renderParticles()
 --love.graphics.print(tostring(self.tempGuy.tempX),avtarself.body:getX(),50)

love.graphics.setColor(1, 1, 1,1)
self.tempGuy:drawPanel(math.floor(skeletonBody:getX()),math.floor(skeletonBody:getY()),self.width,skeletonFlag)
end




function BadMovingState:emitParticles()
  self.psystem = love.graphics.newParticleSystem(particles, 1000)
  self.psystem:setParticleLifetime(0.1,0.2)
  self.psystem:setLinearAcceleration(0,0,0,5)
  self.psystem:setEmissionArea('normal',0,5)
  self.psystem:setEmissionRate(1)
  self.psystem:setColors(
  1,0,0,1,0,1,0,0.3
)

end

function BadMovingState:renderParticles()
  love.graphics.draw(self.psystem, self.tempGuy.tempX + 16, self.tempGuy.tempY -5)
end
