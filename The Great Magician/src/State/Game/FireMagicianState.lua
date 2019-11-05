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
  self.player.stateMachine = StateMachine{
    ['walk'] = function() return PlayerWalkingState(self.player) end,
    ['idle'] = function() return PlayerIdleState(self.player) end,
    ['jump'] = function() return PlayerJumpState(self.player) end,
    ['attack'] = function() return PlayerAttackState(self.player) end
  }

  self.player:changeState('idle')
 world:setGravity(0,1000)

 self.player:changeState('walk')


end


function FireMagicianState:update(dt)
  self.player.x = avtarBody:getX()
  self.player.y = avtarBody:getY()

 world:update(dt)
 self.player:update(dt)
end


function FireMagicianState:render()
 love.graphics.draw(fireback, 0, 0,0,2.0,0.55)
  battlemap:draw()
  --FireMagicianMap:draw()
  self.player:render()
  tile2:render()
end
