local pointer = {}

function pointer.load()
  love.mouse.setVisible(false)
  pointer = love.graphics.newImage("pointer.png")
end

function pointer.update()
  mouse_pos_x, mouse_pos_y = love.mouse.getPosition()
end

function pointer.draw()
  love.graphics.draw(pointer, mouse_pos_x, mouse_pos_y, 0, 8, 8, 5.5, 5.5)
end

return pointer
