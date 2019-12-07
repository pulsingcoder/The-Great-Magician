FireMagicianState = Class{_includes = BaseState}


function FireMagicianState:init()
  self.player = Player{
    animations = Entity_Data['player'].animations,
    walkspeed = Entity_Data['player'].walkspeed,
    jumpspeed = Entity_Data['player'].jumpspeed,



    x = avtarBody:getX(),
    y = avtarBody:getY(),


    dy = 0


  }
  self.player.range = 180
   gSongs['battle']:play()
   gSongs['battle']:setVolume(0.3)
  self.player.stateMachine = StateMachine{
    ['walk'] = function() return PlayerWalkingState(self.player) end,
    ['idle'] = function() return PlayerIdleState(self.player) end,
    ['jump'] = function() return PlayerJumpState(self.player) end,
    ['attack'] = function() return PlayerAttackState(self.player) end
  }
  skeletonFlag = false

  self.player:changeState('idle')
 world:setGravity(0,1000)

 self.player:changeState('walk')
 self.wizard = Enemies{
   animations = Entity_Data['wizard'].animations,
   walkspeed = Entity_Data['wizard'].walkspeed,
   direction = Entity_Data['wizard'].direction,
   x = 215,
   y = 85,
   dy = 0
 }

 --self.skeleton.stateMachine = StateMachine{
   --['moving'] = function() return BadMovingState(self.skeleton,self.player,skeletonBody) end  }
 --self.skeleton:changeState('moving')
 self.startTimer = 0
 self.start = false
self.timer = 0
self.wizardVisible = false
self.wizard.entry = true
self.wizard.attack = false
self.ball = false
self.bally = self.wizard.y+3
self.ballx = virtual_width/2--self.wizard.x-10
self.wizard:changeAnimation("death")
self.collision = false
end


function FireMagicianState:update(dt)
  if not self.start then
    self.startTimer = self.startTimer +dt
    world:update(dt)

--    fireAnimation:update(dt)
    self.player:update(dt)

      self.player.x = avtarBody:getX()
      self.player.y = avtarBody:getY()

    if (self.startTimer > 3) then
      self.start = true
      self.wizardVisible = true
    end
  else
  if not self.ball then
    self.bally = self.wizard.y+3
    self.ballx = self.wizard.x-10
    self.collision = false
    self.ball = true
    self.wizardVisible = true
    self.wizard:changeAnimation('moving')
    self.wizard.attack = true
    self.timer = 0
  end

  self.timer = self.timer + dt
  if (self.timer > 1.5) then
    self.wizard:changeAnimation('idle')
    self.wizard.entry = false
    self.wizard.attack = false
  end

  self.player.x = avtarBody:getX()
  self.player.y = avtarBody:getY()
  self.wizard.currentAnimation:update(dt)
 world:update(dt)

 fireAnimation:update(dt)
 self.player:update(dt)
 if love.keyboard.wasPressed("escape") then
   love.event.quit(0)
 end
 if self.ball then
 self:ballupdate(dt)
 self:ballCollision(dt)
end
self:hit()
end
end
function FireMagicianState:ballCollision(dt)
  if not ball then
  if not self.collision then
  if math.floor(self.ballx)  < math.floor(avtarBody:getX()) +17 and math.floor(self.bally) < math.floor(avtarBody:getY()) + 17 then
    gSongs['avtarHit']:play()
    while(self.player.count < 7) do

      avtarBody:setX(self.player.x - 40*dt)
      avtarBody:setY(avtarBody:getY() - 100*dt)

        self.player.count = self.player.count + 1

  end

  avtarBody:applyForce(-100,-100)
  --self.player:changeState("jump")
  self.ball = false
  self.player.currentHealth =  self.player.currentHealth - 1
  self.player.count = 0
  self.collision = true
  --avtarBody:setY(self.y)
else
  if math.floor(self.ballx) +20 < math.floor(avtarBody:getX()) +17 then
    self.ball = false
  end
  end

end
else
self.collision = true

end
end

function FireMagicianState:hit()
  if ball then
    if math.floor(fireBody:getX())-10 > math.floor(self.wizard.x)  then
      if self.wizard.health > 0 then
      self.wizard.indicatorFlag = true


end
     if self.wizard.width > 0 then
       self.wizard.health = self.wizard.health - 1
       self.wizard.width = self.wizard.width*(self.wizard.health/5)
    else
      self.wizardVisible = false
    end
    fireBody:setY(-1)
    fireBody:release()
   ball = false

end
end

end
function FireMagicianState:ballupdate(dt)
  self.ballx = self.ballx - 50*dt
  if self.ballx < 0 then
    self.ball = false
  end

end


function FireMagicianState:render()
 love.graphics.draw(fireback, 0, 0,0,2.0,0.55)
   battlemap:draw()
  --FireMagicianMap:draw()
  self.player:render()
  if self.ball then
  love.graphics.draw(wizardfireball[2],self.ballx,self.bally,0,0.5,0.4)
end
if self.wizardVisible then

self.wizard:drawPanel(self.wizard.x,virtual_height/2+15,self.wizard.width,false)
  love.graphics.setColor(1, 0.3, 0.3, 1)

  if self.wizard.entry then
  love.graphics.draw(death_spriteSheets,death_sprite[self.wizard.currentAnimation:getCurrentFrame()],self.wizard.x,self.wizard.y-8,0,0.5,0.4)

elseif self.wizard.attack then
  love.graphics.draw(DarkMagician,darkattack[self.wizard.currentAnimation:getCurrentFrame()],self.wizard.x,self.wizard.y,0,0.5,0.4)

else
  love.graphics.draw(DarkMagician,darkSprites[self.wizard.currentAnimation:getCurrentFrame()],self.wizard.x,self.wizard.y,0,0.5,0.4)
end
end
love.graphics.print(tostring(self.player.count),5,50,80)
  love.graphics.setColor(1, 1, 1, 1)
  tile2:render()
  if  self.wizard.entry then
  self.wizard:drawText(math.floor(avtarBody:getX()),50,"I kNOW, YOU ARE HERE..",100)
end


end
