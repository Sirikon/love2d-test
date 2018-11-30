local pointer = require("pointer")
local rectangleSystem = require("systems/rectangle-system")

function love.load()
  love.window.setMode(600, 400, { vsync=false, fullscreen=false })
  love.graphics.setDefaultFilter("nearest", "nearest")
  pointer.load()
  
  rectangleSystem.add(20, 20, 200, 100)
end

function love.update()
  pointer.update()
end

function love.draw()
  rectangleSystem.draw()
  pointer.draw()
end

function love.mousepressed(x, y, button, istouch)
  if (button == 1) then
    rectangleSystem.hit(x, y)
  else
    rectangleSystem.add(x - 25, y - 25, 50, 50)
  end
end