Rectangle = {}
Rectangle.__index = Rectangle

function Rectangle:create(x, y, width, height, world)
  local rectangle = {}
  setmetatable(rectangle, Rectangle)
  
  rectangle.body = love.physics.newBody(world, x, y, "dynamic")
  rectangle.shape = love.physics.newRectangleShape(width/2, height/2, width, height, 0)
  rectangle.fixture = love.physics.newFixture(rectangle.body, rectangle.shape)
  
  return rectangle
end

function Rectangle:draw()
  love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end

function Rectangle:testPoint(x, y)
  return self.shape:testPoint(
    self.body:getX(),
    self.body:getY(),
    self.body:getAngle(), x, y)
end

return Rectangle
