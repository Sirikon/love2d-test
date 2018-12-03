local Rectangle = require("../entities/rectangle")

local rectangleSystem = {
  rectangles = {},
  world = nil
}

function rectangleSystem.add(x, y, width, height)
  table.insert(rectangleSystem.rectangles, Rectangle:create(x, y, width, height, rectangleSystem.world))
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
