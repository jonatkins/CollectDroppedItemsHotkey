
local range = 90


function onHotkey(event)
	local player = event.player_index and game.players[event.player_index] or nil

	local surface = player.surface
	local pos = player.position
	local force = player.force

	local entities = surface.find_entities_filtered { area={{pos.x-range, pos.y-range}, {pos.x+range, pos.y+range}}, type="item-entity" }

	local count = 0
	for i, e in ipairs(entities) do
		if not e.to_be_deconstructed(force) then
			e.order_deconstruction(force)
			count = count+1
		end
	end

	player.print("Marked "..count.." dropped item(s) for deconstruction")
end





script.on_event("collect-dropped-items-hotkey", onHotkey)
