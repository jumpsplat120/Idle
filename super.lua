Super = Object:extend()

--Cause everything has a position
function Super:new(x, y)
	self.x, self.y = x or 0, y or 0
end