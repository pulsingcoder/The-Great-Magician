require 'src/dependencies'
love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()
  gFonts = {
    ['MagicianFont'] = love.graphics.newFont('Fonts/TGM.otf', 64),
    ['small'] = love.graphics.newFont('Fonts/font.ttf',8),
    ['medium'] = love.graphics.newFont('Fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('Fonts/font.ttf',32),

  }
  love.window.setTitle("The Great Magician")
  love.graphics.setDefaultFilter('nearest', 'nearest')
  math.randomseed(os.time())
  push:setupScreen(virtual_width,virtual_height,window_width,window_height,{
    fullscreen = false,
    vsync = true,
    resizable = true,
    canvas = false
  })

  gStateMachine = StateMachine{
    ['play'] = function() return PlayState() end,
    ['battle'] = function() return FireMagicianState() end,
    ['start'] = function() return StartState() end
  }
  love.keyboard.keysPressed = {}



background = {
  ['back1'] = love.graphics.newImage("Graphics/plx-1.png"),
  ['back2'] = love.graphics.newImage("Graphics/plx-2.png"),
  ['back3'] = love.graphics.newImage("Graphics/plx-3.png"),
  ['back4'] = love.graphics.newImage("Graphics/plx-4.png"),
  ['back5'] = love.graphics.newImage("Graphics/plx-5.png")
}
tile2 = Tiles(world,mapi_battle.height,mapi_battle.width,mapi_battle.layers)
gStateMachine:change("battle")


end



function love.resize(w, h)
  push:resize(w,h)

end



function love.keypressed(key)

  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  return love.keyboard.keysPressed[key]
end



function love.update(dt)
world:update(dt)


gStateMachine:update(dt)
love.keyboard.keysPressed = {}

end


function love.draw()
  push:start()
love.graphics.setFont(gFonts['small'])
love.graphics.setLineWidth(2)

gStateMachine:render()
love.graphics.print(tostring(math.floor(avtarBody:getX())).." "..tostring(math.floor(avtarBody:getY())),virtual_width/2+10,virtual_height/2+50)


  push:finish()
end
