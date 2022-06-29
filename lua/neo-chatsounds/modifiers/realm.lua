local MODIFIER = {}

MODIFIER.Name = "realm"
MODIFIER.DefaultValue = ""

function MODIFIER:ParseArgs(args)
	return args:Trim()
end

function MODIFIER:OnSelection(index, matching_sounds)
	if isfunction(self.ExpressionFn) or not self.Value or self.Value == "" then return index, matching_sounds end

	local ret = {}
	for _, matching_sound in ipairs(matching_sounds) do
		if self.Value == matching_sound.Realm then
			table.insert(ret, matching_sound)
		end
	end

	return index, ret
end

return MODIFIER