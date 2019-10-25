Tiles = Class{}


function Tiles:init(worldd,height,width,layers)

  self.world = worldd
  self.map_height = height
  self.map_width = width
  self.map_layers = layers
  self.groundBodies = {}
  self.groundFixtures = {}
  self.edgeShapes ={}
    self.tiles = {}
  self.count = 0
  for i=1,self.map_height do  self.tiles[i] = {} end

  for layer =1,#self.map_layers do
   data = self.map_layers[layer].data
     prop = self.map_layers[layer].properties
    for y=1,self.map_height do
      for x = 1,self.map_width do
        index = (y-1)*self.map_width + x
        if data[index] ~= 0 then
          self.tiles[y][x] = Tile(x*16,y*16,16,16,prop['Solid'])
          if self.tiles[y][x].prop == 1  then
            table.insert(self.groundBodies,love.physics.newBody(self.world, (x-1)*3,(y+2)*3, 'static'))
            table.insert(self.edgeShapes,love.physics.newEdgeShape(0, 0,6,0))
            table.insert(self.groundFixtures,love.physics.newFixture(self.groundBodies[self.count+1], self.edgeShapes[self.count+1]))
            self.count  = self.count +1
          end
        end
      end
    end
  end





end





function Tiles:render()
  for i=1,#self.groundBodies do


    --  love.graphics.line(self.groundBodies[i]:getWorldPoints(self.edgeShapes[i]:getPoints()))
   end

end
