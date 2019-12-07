Player = Class{_includes = Entity}
function Player:init(def)
  Entity.init(self,def)
a = 'pur'
  self.fire = false
  self.maxHealth = 6
  self.hitParameter = true
  self.currentHealth = self.maxHealth
  self.timer = 0
  self.count = 0
  self.jumpCount = 'null'
  self.range = 70
end


function Player:update(dt)
  Entity.update(self,dt)

end


function Player:render()
  Entity.render(self)
--  love.graphics.print(a,self.x,25)
end


function Player:changeState(name)
  self.stateMachine:change(name)
end


function Player:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end




function Player:renderHealth(health)
  local heartX = virtual_width/2 - 200
  for i=1,health do
    love.graphics.draw(heartTexture,heart[1],math.floor(avtarBody:getX()+heartX),4)
    heartX = heartX + 11
  end

  for i=1,self.maxHealth - health do
    love.graphics.draw(heartTexture,heart[2],math.floor(avtarBody:getX() +heartX),4)
    heartX = heartX + 11
  end
end


function Player:drawText(x, yy,text,width)
  love.graphics.rectangle('line', x, yy, width, 10,3)
  love.graphics.setFont(gFonts['small'])
  love.graphics.print(text,x+5,yy+2)
end
