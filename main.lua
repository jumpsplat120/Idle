Object = require "classic"

require "lib"
require "super"
require "sphere"
require "player"
require "point_balls"

win = {}
points = {}
--Store rando globals in state
state = {}

state.currentPoints = 1
state.totalPoints = state.currentPoints

win.width, win.height, win.flags = love.window.getMode()
cx, cy =  win.width/2, win.height/2

love.graphics.setBackgroundColor(1,1,1,1)
math.randomseed(os.time())

function love.load()
	player = Player(cx, cy, "fill", 10, 25, {1,0,0,1})
	map = Sphere(cx, cy, "fill", cx, 255, {0,0,0,1})

	spawnPoints(state.currentPoints)
	player:load()
end

function love.draw()
	map:draw()
	player:draw()
	for i = 1, state.currentPoints, 1 do
		points[i]:draw()
	end
end

function love.update(dt)
	player:update(dt)
	for i = 1, state.currentPoints, 1 do
		local bounce = points[i]:update(dt)
		if bounce then
			points[i].hp = points[i].hp - 1
			if points[i].hp == 0 then
				player:bounce(points[i].x, points[i].y)
				table.remove(points, i)
				player.points = player.points + 1
				state.currentPoints = state.currentPoints - 1
				if state.currentPoints == 0 then
					state.totalPoints = state.totalPoints + 1
					state.currentPoints = state.totalPoints
					spawnPoints(state.currentPoints)
				end
				break
			else
				player:bounce(points[i].x, points[i].y)
				break
			end
		end
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	player:bounce(player.x, player.y, x, y)
end

function spawnPoints(amt)
	for i = 1, amt, 1 do
		points[i] = Points(math.random(0, win.width), math.random(0, win.height), "fill", 5, 25, {0,1,0,1})
		while dist(cx, cy, points[i].x, points[i].y) > 400 do
			points[i] = Points(math.random(0, win.width), math.random(0, win.height), "fill", 5, 25, {0,1,0,1})
		end
	end
end