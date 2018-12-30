local Rectangle = require("../entities/rectangle")

local rectangleSystem = {
  rectangles = {},
  world = nil
}

function rectangleSystem.add(width, height)
  local newRect = Rectangle:create(50, 300, width, height, rectangleSystem.world)
  newRect.body:applyLinearImpulse(1000, -1000)
  table.insert(rectangleSystem.rectangles, newRect)
end

function rectangleSystem.draw()
  for i = 1, #rectangleSystem.rectangles do
    rectangleSystem.rectangles[i]:draw()
  end
end

function rectangleSystem.hit(x, y)
  for i = #rectangleSystem.rectangles, 1, -1 do
    local rect = rectangleSystem.rectangles[i]
    if (rect:testPoint(x, y)) then
      table.remove(rectangleSystem.rectangles, i)
    end
  end
end

return rectangleSystem
