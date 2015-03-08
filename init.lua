inventory_plus = {}
inventory_plus.buttons = {}
inventory_plus.buttons[default] = {}
inventory_plus.default = minetest.setting_get("inventory_default") or "craft"
inventory_plus.num = 0
inventory_plus.players = {}
inventory_plus.plusplus = true

-- register_button
inventory_plus.register_button = function(player, name, label)
	if inventory_plus.buttons[default][name] == nil then
	print("Register Button")
	local img="inventory_plus_"..name..".png"
	unified_inventory.register_button(name, {
		action = function(player)
	
		end,
		type = "image",
		image = img,
		tooltip = label
	})
	unified_inventory.set_inventory_formspec(player, "craft")
	else
	print("NOT Register Button")
	end
end

-- set_inventory_formspec
inventory_plus.set_inventory_formspec = function(player,formspec2show)
	local num = inventory_plus.num
	inventory_plus.num = inventory_plus.num + 1

	if inventory_plus.players[player:get_player_name()] == nil then
		inventory_plus.players[player:get_player_name()] = num
	else
		num = inventory_plus.players[player:get_player_name()]
	end
	unified_inventory.pages["inventory_plus_"..num] = { get_formspec = function(play)
		return { formspec = formspec2show, draw_inventory = false, draw_item_list = false }
	end}
	unified_inventory.set_inventory_formspec(player, "inventory_plus_"..num)
end

-- get_formspec
inventory_plus.get_formspec = function(player,page)

end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	-- main
	if fields.main then
		unified_inventory.set_inventory_formspec(player, "craft")
	end
end)
