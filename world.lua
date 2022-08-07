local H = require('helpers')

World = {}

function World:load(ball, player1, player2)
  self.ball = ball
  self.player1 = player1
  self.player2 = player2
end

function World:update(dt)

  local ball = self.ball
  local p1 = self.player1
  local p2 = self.player2

  local function bounce(orientation, player)
    ball.xVel = ball.speed * orientation
    local middleBall = ball.y + ball.height / 2
    local middlePlayer = player.y + player.height / 2
    local collisionPosition = middleBall - middlePlayer
    ball.yVel = collisionPosition * 5
  end

  if H.checkCollision(ball, p1) then
    bounce(1, p1)
  end

  if H.checkCollision(ball, p2) then
    bounce(-1, p2)
  end

end

function World:draw()
end
