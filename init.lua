-- Copyright 2020-2021 Mingming Cui
-- This file is part of Cyberpunk 2077 Open Sesame Mod.
-- Cyberpunk 2077 Open Sesame Mod is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- Cyberpunk 2077 Open Sesame Mod is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- You should have received a copy of the GNU General Public License
-- along with Foobar.  If not, see <https://www.gnu.org/licenses/>.

registerForEvent("onInit", function()
	HotKey = 0x70 -- Change Hotkey Here. You can find Key Codes at https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
	drawPopup = false
	getTime = 0
	print("************************************************")
	print("* Open Semame Mod Loaded...                    *")
	print("* Press F1 to open accessible locked doors     *")
	print("************************************************")
end)

registerForEvent("onUpdate", function()
	if (not ImGui.IsKeyDown(0x10) and ImGui.IsKeyPressed(HotKey, false)) then
		player = Game.GetPlayer()
		objLook = Game.GetTargetingSystem():GetLookAtObject(player,false,false)
		objType = objLook:ToString()
		
		-- Real door --
		if (objType == "Door") then
			objName = objType
			objLook:OpenDoor()
		end
	end
end)

function is_empty(t)
    for _,_ in pairs(t) do
        return false
    end
    return true
end
