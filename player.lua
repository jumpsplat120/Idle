Player = Sphere:extend()

function Player:new(x, y, mode, r, segments, color, speed)
	Player.super.new(self, x, y, mode, r, segments, color)
	self.speed = speed or 1000
	self.overlap = false
	--Finish positions. It lies around the edge of the circle, and follows the angle drawn by it from the center. It changes on each bounce.
	self.radian = 0
	self.points = 0
end

function Player:update(dt)

	if dist(cx, cy, self.x, self.y) > map.r - self.r then
		self.overlap = true
	end
	
	Player.move(self, dt)
end

function Player:load()
	local x = math.random(0, win.width)
	local y = math.random(0, win.height)

	self.radian = angle(cx, cy, x, y)

	local cos = math.cos(self.radian)
	local sin = math.sin(self.radian)

	self.x = self.x + (self.speed / 10) * cos
	self.y = self.y + (self.speed / 10) * sin
end

function Player:bounce(x1, y1, x2, y2)
	x1 = x1 or cx
	y1 = y1 or cy
	x2 = x2 or math.random(0, win.width)
	y2 = y2 or math.random(0, win.width)

	-- redo until dot is in within map
	while dist(cx, cy, x2, y2) > map.r - self.r do
		x2, y2 = math.random(0, win.width), math.random(0, win.height)
	end

	self.radian = angle(x1, y1, x2, y2)
end

function Player:move(dt)
	dt = dt or .015
	amt = amt or 1

	local cos = math.cos(self.radian)
	local sin = math.sin(self.radian)

	self.x = self.x + (self.speed / 10) * cos * dt
	self.y = self.y + (self.speed / 10) * sin * dt
end