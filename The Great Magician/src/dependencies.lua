virtual_width = 256
virtual_height = 144
window_width = 1280
window_height = 720
Player_Walk_Speed = 20
Player_Jump_Speed = -150

gSongs = {
  ['playLoop'] = love.audio.newSource('Sounds/entry.wav','static'),
  ['startLoop'] =  love.audio.newSource('Sounds/music1.mp3','static'),
  ['avtarHit'] = love.audio.newSource('Sounds/avtarHit.wav', 'static'),
  ['sword'] = love.audio.newSource('Sounds/sword.wav', 'static'),
  ['clock'] = love.audio.newSource('Sounds/clock.wav', 'static'),
  ['battle'] = love.audio.newSource('Sounds/battle.mp3', 'static')
}




love.graphics.setDefaultFilter('nearest', 'nearest')
 sti = require "lib/Simple-Tiled-Implementation-master/sti"
Class = require "lib/class"
Timer = require "lib/knife.timer"

require 'src/tilemap'
require 'src/Tiles'
require 'src/Entity'
require 'src/StateMachine'
require 'src/Player'


require 'src/State/Game/BaseState'
require 'src/State/Entity/Player/PlayerIdleState'
require 'src/State/Entity/BadGuys/BadMovingState'
require 'src/State/Entity/Player/PlayerWalkingState'
require 'src/State/Entity/Player/PlayerAttackState'
require 'src/State/Entity/Player/PlayerJumpState'

require "src/Animation"
require 'src/Entity_Data'
mapi_battle = require "map/battle"
mapi = require 'map/jungle'
require 'src/utility'
require 'src/Enemies'
push = require "push"
require "src/Textbox"

map = sti("map/jungle.lua")
battlemap = sti("map/battle.lua")
mapi = require "map/jungle"
startmap = sti("map/start.lua")
require 'src/State/Game/BeginState'

require 'src/State/Game/StartState'

require 'src/State/Game/PlayState'
require 'src/State/Game/FireMagicianState'
