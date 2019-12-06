
function Tile(x,y,w,h,prop)
  local tile = {}
  tile.x = x
  tile.y = y
  tile.w = w
  tile.h =h
  tile.prop = prop

  return tile
end
fireback = love.graphics.newImage('Graphics/back.png')
some = love.graphics.newImage('Graphics/herosherlockp.png')
avtar = love.graphics.newImage("Graphics/herothrill.png")
factor = love.graphics.newImage("Graphics/hero6.png")
DarkMagician = love.graphics.newImage("Graphics/wizard.png")

flowersheet = love.graphics.newImage("Graphics/flower.png")
world = love.physics.newWorld(0,1000)
      world:setCallbacks(beginContact)

--groundBody = love.physics.newBody(world, 0, virtual_height-30, 'static')
--edgeShape = love.physics.newEdgeShape(0, 0, window_width, 0)
--
--groundFixture = love.physics.newFixture(groundBody, edgeShape)
fireball = love.graphics.newImage('Graphics/fireball2.png')

quad = love.graphics.newQuad
sprite = {
  quad(0,0,46,70,avtar:getDimensions()),
  quad(0,80,50,78,avtar:getDimensions()),
  quad(0,165,49,75,avtar:getDimensions()),
  quad(0,235,60,68,avtar:getDimensions())


}
wizardfireball = {
  love.graphics.newImage("Graphics/fireball3.png"),
  love.graphics.newImage("Graphics/ffireball2.png"),
  love.graphics.newImage("Graphics/ffireball1.png")
}
fireAnimation = Animation{
  frames = {1,2,3},
  interval = 0.5
}
death_spriteSheets = love.graphics.newImage("Graphics/enemy-death.png")
death_sprite = {
  quad(0,0,60,60,death_spriteSheets:getDimensions()),
  quad(75,0,60,65,death_spriteSheets:getDimensions()),
  quad(165,0,60,65,death_spriteSheets:getDimensions()),
  quad(255,0,70,65,death_spriteSheets:getDimensions()),
  quad(330,0,70,65,death_spriteSheets:getDimensions()),
  quad(405,0,75,65,death_spriteSheets:getDimensions()),
  quad(490,0,75,65,death_spriteSheets:getDimensions()),
  quad(565,0,75,65,death_spriteSheets:getDimensions()),
  quad(565,0,75,65,death_spriteSheets:getDimensions())







}
darkSprites = {
  quad(0,22,58,42,DarkMagician:getDimensions()),
  quad(78,22,58,42,DarkMagician:getDimensions()),
  quad(165,22,58,42,DarkMagician:getDimensions()),
  quad(240,22,58,42,DarkMagician:getDimensions()),
  quad(400,22,58,42,DarkMagician:getDimensions()),



}
darkattack = {
quad(580,22,58,42,DarkMagician:getDimensions()),
quad(1050,22,58,42,DarkMagician:getDimensions()),
quad(970,22,58,42,DarkMagician:getDimensions()),
}

flower = {
  quad(50,0,90,95,flowersheet:getDimensions()),
  quad(50,100,90,95,flowersheet:getDimensions()),
  quad(50,195,90,95,flowersheet:getDimensions()),
  quad(50,290,90,95,flowersheet:getDimensions()),
  quad(50,385,90,95,flowersheet:getDimensions()),
  quad(5,480,110,95,flowersheet:getDimensions())

}
skeletonSprite = love.graphics.newImage("Graphics/skeletons.png")
skeleton = {
  quad(0,0,60,68,skeletonSprite:getDimensions()),
  quad(0,73,60,68,skeletonSprite:getDimensions()),
  quad(0,145,60,68,skeletonSprite:getDimensions()),
  quad(0,218,63,68,skeletonSprite:getDimensions()),
  quad(0,290,63,68,skeletonSprite:getDimensions()),
  quad(0,362,63,68,skeletonSprite:getDimensions()),
  quad(0,435,63,68,skeletonSprite:getDimensions()),
  quad(0,510,63,68,skeletonSprite:getDimensions())
}

skeletonBody = love.physics.newBody(world,280, 96, 'dynamic')
heartTexture = love.graphics.newImage('Graphics/heart.png')
particles = love.graphics.newImage('Graphics/particle.png')
heart = {
  quad(0,0,10,9,heartTexture:getDimensions()),
  quad(10,0,10,9,heartTexture:getDimensions())
}

--skeletonBody:setMass()
tile =   Tiles(world,mapi.height,mapi.width,mapi.layers)

--tile2 = Tiles(world,mapi_battle.height,mapi_battle.width,mapi_battle.layers)
avtarBody = love.physics.newBody(world, 10, 0, 'dynamic')
avtarShape =  love.physics.newRectangleShape(15,17)
skeletonShape =  love.physics.newRectangleShape(15,17)
avtarFixture = love.physics.newFixture(avtarBody, skeletonShape)
avtarFixture:setRestitution(0)
skeletonFixture = love.physics.newFixture(skeletonBody, avtarShape)
skeletonFixture:setRestitution(0)
