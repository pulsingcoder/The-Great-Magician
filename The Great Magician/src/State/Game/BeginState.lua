BeginState = Class{_includes = BaseState}

function BeginState:init()
  startlocal = love.graphics.newImage('Graphics/startback.png')

  self.transitionAlpha = 0
  self.transitionAlpha1 = 0
  self.transitionAlpha2 = 0
  self.transitionAlpha3 =0
  --backgroundHeight = gTextures['war']:getHeight()
  --backgroundWidth = gTextures['war']:getWidth()

  self.transitionAlpha4 =0
  self.transitionAlpha5 = 0
   self.labelY =  virtual_height/2+15
   self.background = math.random(3)
  Timer.tween(5,{
    [self] = {transitionAlpha = 1},


  }):finish(function() Timer.tween(5,{
    [self] = {transitionAlpha1 = 1}})
    :finish(function()

      Timer.tween(4,{[self] = {transitionAlpha1 = 0}})
      :finish( function() Timer.tween(2,{
        [self] = {transitionAlpha2=1}
      })
    :finish(function() Timer.tween(7,{
      [self]= {transitionAlpha2=0}
    })
    :finish(function() Timer.tween(3,{
      [self] = {transitionAlpha3 = 1}
    })
    :finish(function() Timer.tween(7,{
      [self] = {transitionAlpha3 = 0}
    }):
    finish(function() Timer.tween(3,{
      [self] = {transitionAlpha4 = 1}
    })
    :finish(function() Timer.tween(3,{
      [self] = {transitionAlpha5 = 1}
    }):finish(function() gStateMachine:change('start') end)
  end)
  end)
  end )
  end)
  end)
    end )


end
    )
  end
  )




end



function BeginState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('start')

  end
  if love.keyboard.wasPressed('p') then
    gStateMachine:change('start')
  end
  --if self.transitionAlpha5 == 1 then
  --  gStateMachine:change('start')
--  end
  Timer.update(dt)
end




  function BeginState:render()
    love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(1, 1, 1,1)
    --love.graphics.draw(gTextures['avtar'], gFrames['avtar'][4], 30, 60)

    love.graphics.setColor(1, 1, 1,self.transitionAlpha)
  --love.graphics.draw(gTextures['backgrounds'],gFrames['backgrounds'][self.background], 0, 0)
  --love.graphics.draw(gTextures['backgrounds'], gFrames['backgrounds'][self.background], 0,
    --gTextures['backgrounds']:getHeight() / 3 * 2, 0, 1, -1)
    love.graphics.draw(startlocal, 0, 0,0,1.6,0.752)

  love.graphics.setColor(0, 0, 1,self.transitionAlpha)
  love.graphics.rectangle('line', 0,self.labelY,  virtual_width, 60)
  love.graphics.setFont(gFonts['small'])



  love.graphics.setColor(1, 0, 0, self.transitionAlpha1)

  love.graphics.print("Master, the dark power is dominating over",50,self.labelY + 15)
  --love.graphics.draw(gTextures['avtar'], gFrames['avtar'][4], 30, 60)
  --love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(0.8, .4, .5, self.transitionAlpha2)
  --love.graphics.draw(gTextures['guru'], gFrames['guru'][1], virtual_width-30, 60)
  love.graphics.print("If this goes on, we gonna loose our territory..",25,self.labelY + 15)
  love.graphics.print("We use our full powers but we're unable to defeat him.. ",30,self.labelY + 25)
  love.graphics.print("Master....",31,self.labelY + 35)
  love.graphics.print("He is already born!!",40,self.labelY+45)
  --love.graphics.rectangle('fill', 0, 0, virtual_width, virtual_height)
  love.graphics.setColor(0.1, .4, .6, self.transitionAlpha3)
  --love.graphics.draw(gTextures['guru'], gFrames['guru'][1], virtual_width-30, 60)
  love.graphics.print("Who?",25,self.labelY + 15)
  love.graphics.print("The Great Magician!!!!",30,self.labelY + 25)
  --love.graphics.print("Remember my son dark magician can only defeat by the magical sword",31,self.labelY + 35)
  love.graphics.setColor(1, 0, 0, self.transitionAlpha4)
  --  love.graphics.draw(gTextures['avtar'], gFrames['avtar'][1], 30, 60)
  love.graphics.print("GO MY SON YOUR Journey starts with Dark Forest",50,self.labelY + 45)
  love.graphics.setColor(1, 1, 1, self.transitionAlpha5)
  love.graphics.rectangle('fill', 0, 0, virtual_width, virtual_height)
end
