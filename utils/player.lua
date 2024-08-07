local Public = {}

---@param player_list LuaPlayer[]
---@return string[]
function Public.get_colored_player_list(player_list)
	local players_with_colors = {}
	for _, player in pairs(player_list) do
		table.insert(players_with_colors, string.format("[color=%.2f,%.2f,%.2f]%s[/color]", player.color.r * 0.6 + 0.4, player.color.g * 0.6 + 0.4, player.color.b * 0.6 + 0.4, player.name))
	end

	return players_with_colors
end

---@param player_list LuaPlayer[]
---@return string[]
function Public.get_sorted_colored_player_list(player_list)
	local players_with_sort_keys = {}
	for _, p in pairs(player_list) do
		table.insert(players_with_sort_keys, { player = p, sort_key = string.lower(p.name) })
	end
	table.sort(players_with_sort_keys, function(a, b) return a.sort_key < b.sort_key end)

	local sorted_player_list = {}
	for _, pair in ipairs(players_with_sort_keys) do
		table.insert(sorted_player_list, pair.player)
	end

	return Public.get_colored_player_list(sorted_player_list)
end

---@param names string[]
---@return LuaPlayer[]
function Public.get_lua_players_from_player_names(names)
	local players = {}
	for _, name in pairs(names) do
		table.insert(players, game.players[name])
	end
	return players
end

return Public