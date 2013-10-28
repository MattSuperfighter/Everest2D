--client
repeat wait() until _G.Import
_G.Import("Import")


do Level = {}
	_G.Level = Level
	Level.__index = Level
	
	function Level.new(width, height)
		local level = {}
		setmetatable(level, Level)
		
		level.width = width
		level.height = height
		level.tiles = {}
		level.entities = {}
		
		for x = 0, level.width do
			level.tiles[x] = {}
		end		
		
		return level
	end
	
	Import("Tile")	
	
	function Level:tick()
		for _, entity in pairs(self.entities) do
			entity:tick()
		end
		
	end	
	
	function Level:render()
		for _, entity in pairs(self.entities) do
			entity:render()
		end
	end
	
	function Level:testRandomGenerate()

		for x = 0, self.width do
			for y = 0, self.height do
				local rand = math.random(1, 30)
				if rand == 10 then
					self.tiles[x][y] = Tile.FLOWER1.id
				elseif rand == 20 then
					self.tiles[x][y] = Tile.FLOWER2.id
				else
					self.tiles[x][y] = Tile.GRASS.id
				end
			end
		end	
		
		self.ready = true
	end		
		
end
