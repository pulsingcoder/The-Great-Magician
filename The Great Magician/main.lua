love.graphics.setDefaultFilter('nearest', 'nearest')
local sti = require "lib/Simple-Tiled-Implementation-master/sti"
Class = require "lib/class"
require 'src/dependencies'
require 'src/tilemap'
require 'src/Tiles'
require 'src/Entity'
require 'src/StateMachine'
require 'src/Player'

require 'src/State/Game/BaseState'
require 'src/State/Entity/Player/PlayerIdleState'
require 'src/State/Entity/Player/PlayerWalkingState'
require 'src/State/Entity/Player/PlayerJumpState'
require "src/Animation"
require 'src/Entity_Data'
mapi = require 'map/jungle'


push = require "push"

map = sti("map/jungle.lua")
mapi = require "map/jungle"
require 'src/State/Game/PlayState'
--bump = require "Simple-Tiled-Implementation-master/sti/plugin/bump.lua"
function Tile(x,y,w,h,prop)
  local tile = {}
  tile.x = x
  tile.y = y
  tile.w = w
  tile.h =h
  tile.prop = prop

  return tile
end

function love.load()
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
    ['play'] = function() return PlayState() end
  }
  love.keyboard.keysPressed = {}


  some = love.graphics.newImage('Graphics/herosherlockp.png')
  love.keyboard.keysPressed = {}

  avtar = love.graphics.newImage("Graphics/herosherlock.png")
  factor = love.graphics.newImage("Graphics/hero6.png")

  world = love.physics.newWorld(0,1000)
  --groundBody = love.physics.newBody(world, 0, virtual_height-30, 'static')
  --edgeShape = love.physics.newEdgeShape(0, 0, window_width, 0)
--
  --groundFixture = love.physics.newFixture(groundBody, edgeShape)
  quad = love.graphics.newQuad
  sprite = {
    quad(0,0,46,70,avtar:getDimensions()),
    quad(0,75,50,67,avtar:getDimensions()),
    quad(0,146,49,68,avtar:getDimensions()),
    quad(0,130,47,59,avtar:getDimensions())


  }

tile =   Tiles(world,mapi.height,mapi.width,mapi.layers)
  --groundBodies = {}
  --groundFixtures = {}
  --edgeShapes ={}
  --[[
  for i=1,mapi.height do  tiles[i] = {} end

  for layer =1,#mapi.layers do
   data = mapi.layers[layer].data
     prop = mapi.layers[layer].properties
    for y=1,mapi.height do
      for x = 1,mapi.width do
        index = (y-1)*mapi.width + x
        if data[index] ~= 0 then
          tiles[y][x] = Tile(x*16,y*16,16,16,prop['Solid'])
          if tiles[y][x].prop == 1  then
            table.insert(groundBodies,love.physics.newBody(world, (x-1)*3,(y+1)*3, 'static'))
            table.insert(edgeShapes,love.physics.newEdgeShape(0, 0,16,0))
            table.insert(groundFixtures,love.physics.newFixture(groundBodies[count+1], edgeShapes[count+1]))
            count = count+1;

            ax = x;
            ay = y;

          end
        end
      end
    end
  end
--]]


  avtarBody = love.physics.newBody(world, 0, 0, 'dynamic')
  avtarShape =  love.physics.newRectangleShape(15,17)
  avtarFixture = love.physics.newFixture(avtarBody, avtarShape)
 avtarFixture:setRestitution(0)


background = {
  ['back1'] = love.graphics.newImage("Graphics/plx-1.png"),
  ['back2'] = love.graphics.newImage("Graphics/plx-2.png"),
  ['back3'] = love.graphics.newImage("Graphics/plx-3.png"),
  ['back4'] = love.graphics.newImage("Graphics/plx-4.png"),
  ['back5'] = love.graphics.newImage("Graphics/plx-5.png")
}

gStateMachine:change('play')




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

  --[[
if math.floor(Playerx) > 8 then
  Player_Walk_Speed = 30
else
  Player_Walk_Speed = 40
end
if love.keyboard.isDown('right') then
  Playerx = Playerx + Player_Walk_Speed*dt
currentAnimation = movingAnimation
avtar_direction = "right"
backx = backx + 30*dt
elseif love.keyboard.isDown('left') then
  Playerx = Playerx - Player_Walk_Speed*dt
  currentAnimation = movingAnimation
  avtar_direction = "left"
  backx = backx - 30*dt
else
  currentAnimation = idleAnimation
end



if (Playerdy~=0) and ccount == 0 then
  if(Playerdy < 0) then
    avtarBody:setY(avtarBody:getY() + Playerdy*dt)

  else
    Playerdy = 0
    ccount = 1
  end
end

currentAnimation:update(dt)

avtarBody:setPosition(Playerx,avtarBody:getY())


camX = math.max(0,
math.min(16*map.width-virtual_width,math.floor(Playerx)-virtual_width/2-8) )
camX1 = camX

backx = backx%(130*(1.5*virtual_width)/background['back5']:getWidth())

world:update(dt)
map:update(dt)

]]
gStateMachine:update(dt)
love.keyboard.keysPressed = {}

end


function love.draw()
  push:start()
  --[[
  love.graphics.push()
  for key,back in pairs(background) do


    love.graphics.draw(back, -math.floor(backx), 0,0,(1.5*virtual_width)/background['back5']:getWidth(),virtual_height/background['back5']:getHeight())
  end
   --love.graphics.draw(background['back5'], -math.floor(backx), 0,0,(1.5*virtual_width)/background['back5']:getWidth(),virtual_height/background['back5']:getHeight())

    love.graphics.scale(1)
    map:draw(camX*5.45,0)

    love.graphics.translate(-math.floor(camX), 0)


    love.graphics.draw(avtar,sprite[currentAnimation:getCurrentFrame()], math.floor(avtarBody:getX()), math.floor(avtarBody:getY()),0,avtar_direction == "left" and -((factor:getWidth())/(virtual_width/1.5)) or (factor:getWidth())/(virtual_width/1.5),(factor:getHeight()/2)/(virtual_height),
    -- lastly, the origin offsets relative to 0,0 on the sprite (set here to the sprite's center)
    25,35)
    love.graphics.print(tostring(math.floor(camX*5.47)).." "..tostring(math.floor(camX)),math.floor(Playerx),virtual_height/2+10)
    --love.graphics.polygon('line',avtarBody:getWorldPoints(avtarShape:getPoints()))
    love.graphics.setLineWidth(2)
    tile:render()

--[[
    for i=1,#tile do


       love.graphics.line(tile[i]:getWorldPoints(tile.edgeShapes[i]:getPoints()))
     end
    -- love.graphics.line(tile.groundBodies[1]:getWorldPoints(tile.edgeShapes[i]:getPoints()))

     --love.graphics.line(groundBody:getWorldPoints(edgeShape:getPoints()))




love.graphics.pop()]]

gStateMachine:render()
--love.graphics.print(tostring(math.floor(avtarBody:getY())),virtual_width/2+10,virtual_height/2+50)
  push:finish()
end
