PlayState = Class{_includes = BaseState}
skeletonFlag = true
collision = false
function PlayState:init()
  self.count = 0
  self.timer =0
  self.player = Player{
    animations = Entity_Data['player'].animations,
    walkspeed = Entity_Data['player'].walkspeed,
    jumpspeed = Entity_Data['player'].jumpspeed,


    x = avtarBody:getX(),
    y = avtarBody:getY(),


    dy = 0


  }



  self.player.stateMachine = StateMachine{
    ['walk'] = function() return PlayerWalkingState(self.player) end,
    ['idle'] = function() return PlayerIdleState(self.player) end,
    ['jump'] = function() return PlayerJumpState(self.player) end,
    ['attack'] = function() return PlayerAttackState(self.player) end
  }

  self.player:changeState('idle')
  if skeletonFlag then
  self.skeleton = Enemies{
    animations = Entity_Data['skeleton'].animations,
    walkspeed = Entity_Data['skeleton'].walkspeed,
    direction = Entity_Data['skeleton'].direction,
    x = skeletonBody:getX(),
    y = skeletonBody:getY(),
    dy = 0
  }
  self.skeleton.stateMachine = StateMachine{
    ['moving'] = function() return BadMovingState(self.skeleton,self.player,skeletonBody) end  }

  self.skeleton:changeState('moving')
end
self.flower = Enemies{
  animations = Entity_Data['flower'].animations,
  walkspeed = Entity_Data['skeleton'].walkspeed,
  direction = 'left',
  x = 200,
  y = 20,
  dy = 0
}
self.flower:changeAnimation('idle')
self.flowerFlag = true

  temporry = avtarBody:getY();
  self.camX = math.max(0,
  math.min(16*map.width-virtual_width,math.floor(self.player.x)-virtual_width/2-8) )
--  backx = backx%(130*(1.5*virtual_width)/background['back5']:getWidth())
  ball = false


end


function PlayState:update(dt)
  if self.player.currentHealth < 2 then
    gSongs['clock']:play()
  end
  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
  if self.count == 5 then
    self.timer = self.timer + dt
  end
  if self.timer >= 1 then
    self.count = 0
    self.timer = 0
    collision = false
  end
  self.player.x = avtarBody:getX()
  self.player.y = avtarBody:getY()
  gSongs['playLoop']:setLooping(true)
  gSongs['playLoop']:play()
  if self.flowerFlag then
    if avtarBody:getX() > 655 then
      self.flower:changeAnimation('attack')
    end
     self.flower.currentAnimation:update(dt)
     self:flowerCollide()

  end
  world:update(dt)

  if skeletonFlag then
  self.skeleton.x  = skeletonBody:getX()
  self.skeleton:update(dt)
end
self.player:update(dt)

  self.camX = math.max(0,
  math.min(16*map.width-virtual_width,math.floor(avtarBody:getX())-virtual_width/2-8) )
  --world:setGravity(0,1000)
--self.count =0
 if ball then
   if self.flowerFlag then
   self:avtarAttack()
 end
 end
 if avtarBody:getX() > 900 then
   tile2 = Tiles(world,mapi_battle.height,mapi_battle.width,mapi_battle.layers)

   avtarBody:setX(10)
   avtarBody:setY(0)
   gSongs['playLoop']:stop()
   gSongs['battle']:play()
   gStateMachine:change('battle')

 end

end


function PlayState:render()
  love.graphics.push()
  for key,back in pairs(background) do


    love.graphics.draw(back, 0, 0,0,(1.5*virtual_width)/background['back5']:getWidth(),virtual_height/background['back5']:getHeight())
  end
   --love.graphics.draw(background['back5'], -math.floor(backx), 0,0,(1.5*virtual_width)/background['back5']:getWidth(),virtual_height/background['back5']:getHeight())

    love.graphics.scale(1)

    love.graphics.translate(-math.floor(self.camX), 0)

    map:draw(math.floor(self.camX*5.45),0)


--self.player:renderHealth(self.player.currentHealth)

    self.player:render()
    if skeletonFlag then
    self.skeleton:render()
end
  --
 --love.graphics.polygon('line',skeletonBody:getWorldPoints(avtarShape:getPoints()))
--  love.graphics.polygon('line',avtarBody:getWorldPoints(avtarShape:getPoints()))



   --`love.graphics.print(tostring(math.floor(self.count)),math.floor(self.player.x),virtual_height/2+10)

    love.graphics.setLineWidth(2)
    tile:render()
    if self.flowerFlag then


      love.graphics.draw(flowersheet,flower[self.flower.currentAnimation:getCurrentFrame()],self.flower.currentAnimation:getCurrentFrame()==6 and 670 or 680,117-15,0,((factor:getWidth())/(virtual_width/1.5)),(factor:getHeight()/2)/(virtual_height))
      self.flower:drawPanel(680,115,self.flower.width,self.flowerFlag)

    end
    love.graphics.pop()
  end


  function PlayState:flowerCollide()
    local hitX = 675
    if self.flower.currentAnimation:getCurrentFrame() < 6 then
      hitX = 685
    end
    if math.floor(avtarBody:getX())+ 10 > hitX  then
      gSongs['avtarHit']:play()
      --self.player.currentHealth = self.player.currentHealth - 1

      while(self.count < 5) do

          avtarBody:applyForce(-100,-400)
          self.count = self.count + 1

    end

    collision = true

end
end

function PlayState:avtarAttack()

  if math.floor(fireBody:getX())+4 > 685 then
    self.flower.indicatorFlag = true
    if self.flower.width > 0 then
      self.flower.health = self.flower.health - 1
      self.flower.width = self.flower.width*(self.flower.health/5)
    else
      self.flowerFlag = false
    end
    fireBody:setY(-1)
    fireBody:release()
   ball = false
 end
end
