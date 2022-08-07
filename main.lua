require('player')
require('ball')
require('ai')

function love.load()
  Player:load()
  Ball:load()
  Ai:load()

  Score = { player = 0, ai = 0 }
  Font = love.graphics.newFont(20)
end

function love.update(dt)
  Player:update(dt)
  Ball:update(dt)
  Ai:update(dt)

end

function love.draw()
  Player:draw()
  Ball:draw()
  Ai:draw()

  love.graphics.setFont(Font)
  love.graphics.print("Player: " .. Score.player, 50, 50)
  love.graphics.print("Ai: " .. Score.ai, 1000, 50)
end

Helpers = {}

function Helpers.checkCollision(a, b)

  if a.x + a.width > b.x and a.x < b.x + b.width then
    if a.y + a.height > b.y and a.y < b.y + b.height then
      return true
    end
  end
  return false

end
