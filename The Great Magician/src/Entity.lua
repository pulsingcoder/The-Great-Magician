Entity = Class{}

function Entity:init(def)
  self.animations = {}

  for v,animationDef in pairs(def.animations) do
    self.animations[v] = Animation{
     frames = animationDef.frames,
     interval = animationDef.interval
    }

  end
  self.direction = def.direction or 'right'

  self.x =def.x
  self.y = def.y
  self.dy = def.dy or 0
  self.walkspeed = def.walkspeed
end



function Entity:changeState(name)
  self.stateMachine:change(name)
end


function Entity:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end



function Entity:update(dt)
  self.stateMachine:update(dt)
  if self.currentAnimation then
    self.currentAnimation:update(dt)
  end
end



function Entity:render()
  self.stateMachine:render()
end
