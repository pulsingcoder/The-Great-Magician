tilemap = Class{}

function tilemap:init(groundBodies,groundFixtures,edgeShapes)
  self.groundBodies = groundBodies
  self.groundFixtures = groundFixtures
  self.edgeShapes = edgeShapes
  self.count = 1
end



function tilemap:render()
  love.graphics.setLineWidth(2)
  love.graphics.print(tostring(self.count),virtual_width/2,virtual_height/2)


  for i=1,#self.groundBodies do


--     love.graphics.line(self.groundBodies[i]:getWorldPoints(self.edgeShapes[i]:getPoints()))
   end
 end
