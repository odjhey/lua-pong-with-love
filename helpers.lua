local M = {}

function M.checkCollision(a, b)
  if a.x + a.width > b.x and a.x < b.x + b.width then
    if a.y + a.height > b.y and a.y < b.y + b.height then
      return true
    end
  end
  return false
end

return M
