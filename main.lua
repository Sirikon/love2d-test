local pointer = require("pointer")
local rectangleSystem = require("systems/rectangle-system")

function love.load()
  -- Window initialization
  love.window.setMode(600, 400, { vsync=false, fullscreen=false })
  love.window.setTitle("love2d-test")
  love.graphics.setDefaultFilter("nearest", "nearest")

  -- Create physics world
  world = love.physics.newWorld(0, 9.81*64, true)

  -- Load pointer
  pointer.load()
  
  -- Load systems
  rectangleSystem.world = world
end

function love.update(dt)
  world:update(dt)
  pointer.update()
end

function love.draw()
  rectangleSystem.draw()
  pointer.draw()
end

function love.mousepressed(x, y, button, istouch)
  if (button == 1) then
    -- Left click
    rectangleSystem.hit(x, y)
  else
    -- Right click
    rectangleSystem.add(50, 50)
  end
end
