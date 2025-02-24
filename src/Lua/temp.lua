
-- quick kick thing if a non-admin says
-- something that has "can you add"
-- is that what this was supposed to b  done ???
-- -pac

-- TODO: finish this :P

addHook("PlayerMsg", function(p, mtype, _, message)
	--if (IsPlayerAdmin(p) or p == server) then return end
	
	local msg = message:lower()
	local _, canyouPos = msg:find("can you")
	
	if canyouPos == nil then
		_, canyouPos = msg:find("can't you") -- also include can't you!
	end
	
	if canyouPos == nil then return end -- if it didnt find "can you"
	
	local addPos = msg:find("add", canyouPos)
	local notPos = msg:find("not", canyouPos)
	
	if addPos == nil -- if it doesn't find "add"
	or (notPos ~= nil and notPos < addPos) then return end -- or there's a "not" before "add"
	
	if canyouPos == nil -- if it didnt find "can you"
	or not msg:find("add", canyouPos) then return end -- or it didnt find "add" after somewhere after "can you"
	
	print("no")
end)