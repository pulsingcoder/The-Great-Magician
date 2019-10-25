StateMachine = Class{}


function StateMachine:init(states)
  self.empty = {
    render = function() end,
    update = function() end,
    exit = function() end,
    enter = function() end
  }
  self.states = states or {}
  self.current = self.empty
end



function StateMachine:change(state)
  assert(self.states[state])
  self.current =  self.states[state]()
end



function StateMachine:enterParams(params)
  self.current:enter(params)
end





function StateMachine:update(dt)
  self.current:update(dt)
end


function StateMachine:render()
  self.current:render()
end
