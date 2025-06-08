Hooks:PostHook(HUDMissionBriefing, "init", "CSScaling_init", function(self)
	if managers.crime_spree:is_active() then
		local mission = managers.crime_spree:get_mission()
		local multiplier = managers.player:get_skill_exp_multiplier() + managers.player:get_infamy_exp_multiplier() - 1
		local job_text = self._foreground_layer_one:child("job_text")
		local text = job_text:text()
		text = text:gsub("%+%d+.+$", "")

		local text_len = utf8.len(text)
		text = text .. "+" .. managers.localization:text("menu_cs_level", {
			level = math.round((mission and mission.add or 0) * multiplier)
		})

		job_text:set_text(text)
		job_text:set_range_color(text_len, utf8.len(text), tweak_data.screen_colors.crime_spree_risk)
	end
end)