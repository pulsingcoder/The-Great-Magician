Enemies = Class{_includes = Entity}

function Enemies:init(def)
  Entity.init(self,def)
  self.health = 5
  self.timedKill = 0
  self.tempX = 0
  self.tempY = 0
  self.indicatorTimer = 0
  self.indicatorFlag  = false
  self.width = 25
end


function Enemies:update(dt)
  Entity.update(self,dt)
end


function Enemies:render()
  Entity.render(self)
end


function Enemies:changeState(name)
  self.stateMachine:change(name)
end


function Enemies:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end



function Enemies:drawPanel(x,y,width,flag)
  if  self.indicatorFlag  then
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle('line', x, y-8,25, 1,3)
    love.graphics.setColor(1, 1, 1,1)
    love.graphics.rectangle('fill', x, y-8, 25, 1,3)
    love.graphics.setColor(1, 0.21, 0.21, 1)
    love.graphics.rectangle('fill', x, y-8, width, 1,3)

    love.graphics.setColor(1, 1, 1, 1)

    if self.indicatorTimer > 100 then

      self.indicatorFlag = false
      self.indicatorTimer = 0
  end
  self.indicatorTimer =  self.indicatorTimer + 1
end
--  love.graphics.polygon('line',self.body:getWorldPoints(skeletonShape:getPoints()))
end
