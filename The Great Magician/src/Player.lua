Player = Class{_includes = Entity}
function Player:init(def)
  Entity.init(self,def)

end


function Player:update(dt)
  Entity.update(self,dt)
  
end


function Player:render()
  Entity.render(self)
end


function Player:changeState(name)
  self.stateMachine:change(name)
end


function Player:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end
