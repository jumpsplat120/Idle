Points = Sphere:extend()

function Points:new(x, y, mode, r, segments, color)
	Points.super.new(self, x, y, mode, r, segments, color)
	self.value = 2
	self.hp = self.value
end

function Points:update(dt)
	if dist(player.x, player.y, self.x, self.y) < player.r + self.r then return true end
	return false
end