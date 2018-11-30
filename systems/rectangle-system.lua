local createRectangle = require("../entities/rectangle")

local rectangleSystem = {
  rectangles = {}
}

function rectangleSystem.add(x, y, width, height)
  table.insert(rectangleSystem.rectangles, createRectangle(x, y, width, height))
end

function rectangleSystem.draw()
  for i = 1, #rectangleSystem.rectangles do
    local rect = rectangleSystem.rectangles[i]
    love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
  end
end

function rectangleSystem.hit(x, y)
  for i = #rectangleSystem.rectangles, 1, -1 do
    local rect = rectangleSystem.rectangles[i]
    if (
      x >= rect.x and
      x <= (rect.width + rect.x) and
      y >= rect.y and
      y <= (rect.height + rect.y)) then
      table.remove(rectangleSystem.rectangles, i)
    end
  end
end

return rectangleSystem
