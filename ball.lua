local H = require('helpers')

Ball = {}


function Ball:load(effects)
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() / 2

  self.width = 20
  self.height = 20

  self.speed = 200

  self.xVel = -self.speed
  self.yVel = 0

  self.effects = effects
end

function Ball:update(dt)
  self:move(dt)
  self:collide()
end

function Ball:collide()

  if H.checkCollision(self, Player) then
    self.xVel = self.speed
    local middleBall = self.y + self.height / 2
    local middlePlayer = Player.y + Player.height / 2
    local collisionPosition = middleBall - middlePlayer
    self.yVel = collisionPosition * 5
  end

  if H.checkCollision(self, Ai) then
    self.xVel = -self.speed
    local middleBall = self.y + self.height / 2
    local middleAi = Ai.y + Ai.height / 2
    local collisionPosition = middleBall - middleAi
    self.yVel = collisionPosition * 5
  end

  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
    self.yVel = -self.yVel
  end

  if self.x < 0 then
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.yVel = 0
    self.xVel = self.speed
    self.effects.rightOutOfBoundsEffect()
  end

  if self.x + self.width > love.graphics.getWidth() then
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.yVel = 0
    self.xVel = -self.speed
    self.effects.leftOutOfBoundsEffect()
  end
end

function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end

function Ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
