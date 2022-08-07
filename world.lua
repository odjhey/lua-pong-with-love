local H = require('helpers')

World = {}

function World:load(ball, player1, player2, effects)
  self.ball = ball
  self.ball.x = love.graphics.getWidth() / 2
  self.ball.y = love.graphics.getHeight() / 2

  self.player1 = player1
  self.player2 = player2
  self.effects = effects
end

function World:update(dt)
  local ball = self.ball
  local p1 = self.player1
  local p2 = self.player2

  local function collide(orientation, player)
    ball.xVel = ball.speed * orientation
    local middleBall = ball.y + ball.height / 2
    local middlePlayer = player.y + player.height / 2
    local collisionPosition = middleBall - middlePlayer
    ball.yVel = collisionPosition * 5
  end

  if H.checkCollision(ball, p1) then
    collide(1, p1)
  end

  if H.checkCollision(ball, p2) then
    collide(-1, p2)
  end


  -- Top/Bottom bounce
  if ball.y < 0 then
    ball.y = 0
    ball.yVel = -ball.yVel
  elseif ball.y + ball.height > love.graphics.getHeight() then
    ball.y = love.graphics.getHeight() - ball.height
    ball.yVel = -ball.yVel
  end

  -- L/R bounds
  if ball.x < 0 then
    ball.x = love.graphics.getWidth() / 2 - ball.width / 2
    ball.y = love.graphics.getHeight() / 2 - ball.height / 2
    ball.yVel = 0
    ball.xVel = ball.speed
    self.effects.rightOutOfBoundsEffect()
  end

  if ball.x + ball.width > love.graphics.getWidth() then
    ball.x = love.graphics.getWidth() / 2 - ball.width / 2
    ball.y = love.graphics.getHeight() / 2 - ball.height / 2
    ball.yVel = 0
    ball.xVel = -ball.speed
    self.effects.leftOutOfBoundsEffect()
  end
end

function World:draw()
end
