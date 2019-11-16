LocalizationManager:add_localized_strings({["hud_int_hold_grab_the_bag"] = "Hold $BTN_INTERACT to grab the $BAG"})

local _add_string_macros_original = BaseInteractionExt._add_string_macros
function BaseInteractionExt:_add_string_macros(macros, ...)
	_add_string_macros_original(self, macros, ...)
	macros.BTN_INTERACT = macros.BTN_INTERACT or managers.localization:get_default_macro("BTN_INTERACT") --Ascii ID for RB
	if self._unit:carry_data() then
		local carry_id = self._unit:carry_data():carry_id()
		macros.BAG = managers.localization:text(tweak_data.carry[carry_id].name_id)
	end
end
