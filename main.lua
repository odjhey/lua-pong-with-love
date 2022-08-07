require('objects/player')
require('objects/ball')
require('objects/ai')
require('world')

Score = {}

function love.load()

  Score = { player = 0, ai = 0 }

  local effects = {
    leftOutOfBoundsEffect = function() Score.player = Score.player + 1 end,
    rightOutOfBoundsEffect = function() Score.ai = Score.ai + 1 end,
  }

  Ball:load()
  Player:load()
  Ai:load()

  World:load(Ball, Player, Ai, effects)
  Font = love.graphics.newFont(20)
end

function love.update(dt)
  Player:update(dt)
  Ball:update(dt)
  Ai:update(dt)

  World:update(dt)
end

function love.draw()
  Player:draw()
  Ball:draw()
  Ai:draw()

  love.graphics.setFont(Font)
  love.graphics.print("Player: " .. Score.player, 50, 50)
  love.graphics.print("Ai: " .. Score.ai, 1000, 50)
end
