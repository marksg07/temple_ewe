function perk_get_spawn_order()
	-- this function should return the same results no matter when or where during a run it is called.
	-- this function should have no side effects.
	local MIN_DISTANCE_BETWEEN_DUPLICATE_PERKS = 4
	local PERK_SPAWN_ORDER_LENGTH = 100
	local PERK_DUPLICATE_AVOIDANCE_TRIES = 200

	SetRandomSeed( 1, 2 ) 

	----
	local create_perk_pool = function()
		local result = {}

		for i,perk_data in ipairs(perk_list) do
			if ( perk_data.not_in_default_perk_pool == nil or perk_data.not_in_default_perk_pool == false ) then
				table.insert( result, perk_data )
			end
		end

		return result
	end

	----
	local perk_pool = create_perk_pool()

	local result = { }

    -- MOD: ADD E.W.E. TO BEGINNING
    local ewe_index = 1
    for i, v in ipairs(perk_pool) do
        if v.id == "EDIT_WANDS_EVERYWHERE" then
            ewe_index = i
            break
        end
    end
    table.insert(result, "EDIT_WANDS_EVERYWHERE")
    table.remove(perk_pool, ewe_index)

	for i=2,PERK_SPAWN_ORDER_LENGTH do
		local tries = 0
		local perk_data = nil

		while tries < PERK_DUPLICATE_AVOIDANCE_TRIES do
			local ok = true
			if #perk_pool == 0 then
				perk_pool = create_perk_pool()
			end

			local index_in_perk_pool = Random( 1, #perk_pool )
			perk_data = perk_pool[index_in_perk_pool]

			if perk_is_stackable( perk_data ) then --  ensure stackable perks are not spawned too close to each other
				for ri= #result-MIN_DISTANCE_BETWEEN_DUPLICATE_PERKS,#result do
					if ri >= 1 and result[ri] == perk_data.id then
						ok = false
						break
					end
				end
			else
				table.remove( perk_pool, index_in_perk_pool ) -- remove non-stackable perks from the pool
			end

			if ok then
				break
			end

			tries = tries + 1
		end

		table.insert( result, perk_data.id )
	end


	-- debug - print duplicates
	-- for i,id in ipairs(result) do
	-- 	for i2,id2 in ipairs(result) do
	-- 		if id == id2 and i ~= i2 then
	-- 			print(id .. " " .. tostring(i) .. " and " .. tostring(i2))
	-- 		end
	-- 	end
	-- end

	return result
end