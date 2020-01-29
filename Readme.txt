If you want to start with additional perks, there is a code in init.lua file:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  local perks = { -- add perk ids (in double quotes) below to add new perks at the start of the game
--    "PROTECTION_FIRE",
--    "PROTECTION_RADIOACTIVITY",
--    "PROTECTION_EXPLOSION",
--    "PROTECTION_MELEE",
--    "PROTECTION_ELECTRICITY"
--    }
--  for i,p in ipairs( perk_list ) do
--    for j,r in ipairs( perks ) do
--      if (p.id == r) then
--        local p_entity = perk_spawn( x, y, p.id )
--        if ( p_entity ~= nil ) then
--          perk_pickup( p_entity, player_entity, EntityGetName( p_entity ), false, false )
--        end
--        break
--      end
--    end
--  end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Just remove double hyphens and you will uncomment it. The result will be like this:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local perks = { -- add perk ids (in double quotes) below to add new perks at the start of the game
    "PROTECTION_FIRE",
    "PROTECTION_RADIOACTIVITY",
    "PROTECTION_EXPLOSION",
    "PROTECTION_MELEE",
    "PROTECTION_ELECTRICITY"
  }
  for i,p in ipairs( perk_list ) do
    for j,r in ipairs( perks ) do
      if (p.id == r) then
        local p_entity = perk_spawn( x, y, p.id )
        if ( p_entity ~= nil ) then
          perk_pickup( p_entity, player_entity, EntityGetName( p_entity ), false, false )
        end
        break
      end
    end
  end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
And you can add/remove perk ids in this array:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local perks = { -- add perk ids (in double quotes) below to add new perks at the start of the game
    "PROTECTION_FIRE",
    "PROTECTION_RADIOACTIVITY",
    "PROTECTION_EXPLOSION",
    "PROTECTION_MELEE",
    "PROTECTION_ELECTRICITY"
}
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
For example:
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local perks = { -- add perk ids (in double quotes) below to add new perks at the start of the game
    "PROTECTION_EXPLOSION",
    "PROTECTION_MELEE",
    "EXTRA_MONEY",
    "EXTRA_MONEY_TRICK_KILL",
    "EXTRA_HP",
    "HEARTS_MORE_EXTRA_HP"
}
