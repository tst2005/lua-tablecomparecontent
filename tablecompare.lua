
local lowlevelcmptable

local function cmpdirect(a, b)
	return a == b -- TODO: use raweq ?
end
local function cmptable(t1, t2)
	local c = {}
	return lowlevelcmptable(t1, t2, c) and lowlevelcmptable(t2, t1, c)
end

local dispatchtype = {}
function lowlevelcmptable(t1, t2, cache)
	cache = cache or {}
	for k,v in pairs(t1) do
		if not cache[k] then
			if type(v) ~= type(t2[k]) then return false end -- if type are not the same
			local cmp = dispatchtype[type(v)] or cmpdirect
			if not cmp(v, t2[k]) then return false end
			cache[k]=true
		end
	end
	return true
end

dispatchtype.table = cmptable

return cmptable
