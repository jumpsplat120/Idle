Sphere = Super:extend()

function Sphere:new(x, y, mode, r, segments, color)
	Sphere.super.new(self, x, y)
	self.mode = mode or "fill"
	self.r = r or 5
	self.segments = segments or 5
	self.color = color or {0,0,1,1}
end

function Sphere:draw()
	love.graphics.push()
		love.graphics.setColor(self.color)
		love.graphics.circle(self.mode, self.x, self.y, self.r, self.segments)
	love.graphics.pop()	
end