Hooks:PostHook(CrimeSpreeMissionButton, "update_info_text", "CSScaling_update_info_text", function(self, mission_data)
	mission_data = mission_data or self._mission_data

	local infamy_multiplier = managers.player:get_infamy_exp_multiplier()
	local text = self._info_text:text()
	text = text:gsub("%+%d+.+$", "")

	local text_len = utf8.len(text)
	text = text .. managers.localization:text("menu_cs_lobby_mission_inc", {
		inc = math.round(mission_data.add * infamy_multiplier)
	})

	self._info_text:set_text(text)
	self._info_text:set_range_color(text_len, utf8.len(text), tweak_data.screen_colors.crime_spree_risk)
end)