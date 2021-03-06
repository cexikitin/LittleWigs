﻿-------------------------------------------------------------------------------
--  Module Declaration

local mod = BigWigs:NewBoss("Eadric the Pure", 542)
if not mod then return end
mod.partycontent = true
mod:RegisterEnableMob(35119)
mod.toggleOptions = {
	66935, -- Radiance
}

-------------------------------------------------------------------------------
--  Localization

local LCL = LibStub("AceLocale-3.0"):GetLocale("Little Wigs: Common")

local L = mod:NewLocale("enUS", true)
if L then
--@do-not-package@
L["defeat_trigger"] = "I yield! I submit. Excellent work. May I run away now?"
L["hammer_message_other"] = "%s has the hammer!"
L["hammer_message_you"] = "You have the hammer!"--@end-do-not-package@
--@localization(locale="enUS", namespace="Icecrown/Eadric_the_Pure", format="lua_additive_table", handle-unlocalized="ignore")@
end
L = mod:GetLocale()

-------------------------------------------------------------------------------
--  Initialization

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "radiance", 66935, 66862, 67681)

	self:Yell("Win", L["defeat_trigger"])
end

-------------------------------------------------------------------------------
--  Event Handlers

function mod:radiance(_, spellId, _, _, spellName)
	self:Message(66935, LCL["casting"]:format(spellName), "Urgent", spellId)
	self:Bar(66935, spellName, 3, spellId)
end
