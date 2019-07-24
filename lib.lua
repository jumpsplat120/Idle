-- calculates the distance between two points
function dist(x1,y1, x2, y2)
	local dist = (x1 - x2)^2 + (y1 - y2)^2
	return math.sqrt(dist)
end

--Points from x1,y1 to x2,y2 then returns raidans
function angle(x1, y1, x2, y2)
	return math.atan2(y2 - y1, x2 - x1)
end