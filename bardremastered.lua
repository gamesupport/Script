local version = 0.94

if myHero.charName ~= "Bard" then return end

require "VPrediction"
vPred = VPrediction()
function CheckOrbwalk()
	 if _G.Reborn_Loaded and not _G.Reborn_Initialised then
        DelayAction(CheckOrbwalk, 1)
    elseif _G.Reborn_Initialised then
        sacused = true
		BardMenu.Orbwalking:addParam("info11","SAC Detected", SCRIPT_PARAM_INFO, "")
    elseif _G.MMA_Loaded then
		BardMenu.Orbwalking:addParam("info11","MMA Detected", SCRIPT_PARAM_INFO, "")
		mmaused = true
	else
		require "SxOrbWalk"
		SxOrb:LoadToMenu(BardMenu.Orbwalking, false) 
		sxorbused = true
		SxOrb:RegisterAfterAttackCallback(MyAfterAttack)
		DelayAction(function()		
			if SxOrb.Version < 2.3 then
				Print("Your SxOrbWalk library is outdated, please get the latest version!")
			end
		end, 5)
	end
end

assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("UHKJIPNKHMP") 



DelayAction(CheckOrbwalk, 4)
function Print(message) print("<font color=\"#FF0066\"><b>Bard Remastered:</font> </b><font color=\"#FFFFFF\">" .. message) end
	
	
Print("Version "..version.." loaded")

local sEnemies = GetEnemyHeroes()
local sAllies = GetAllyHeroes()
local lasttime={}
local lastTime = 0
local lastpos={}

function OnLoad()

	ItemNames				= {
		[3303]				= "ArchAngelsDummySpell",
		[3007]				= "ArchAngelsDummySpell",
		[3144]				= "BilgewaterCutlass",
		[3188]				= "ItemBlackfireTorch",
		[3153]				= "ItemSwordOfFeastAndFamine",
		[3405]				= "TrinketSweeperLvl1",
		[3411]				= "TrinketOrbLvl1",
		[3166]				= "TrinketTotemLvl1",
		[3450]				= "OdinTrinketRevive",
		[2041]				= "ItemCrystalFlask",
		[2054]				= "ItemKingPoroSnack",
		[2138]				= "ElixirOfIron",
		[2137]				= "ElixirOfRuin",
		[2139]				= "ElixirOfSorcery",
		[2140]				= "ElixirOfWrath",
		[3184]				= "OdinEntropicClaymore",
		[2050]				= "ItemMiniWard",
		[3401]				= "HealthBomb",
		[3363]				= "TrinketOrbLvl3",
		[3092]				= "ItemGlacialSpikeCast",
		[3460]				= "AscWarp",
		[3361]				= "TrinketTotemLvl3",
		[3362]				= "TrinketTotemLvl4",
		[3159]				= "HextechSweeper",
		[2051]				= "ItemHorn",
		--[2003]			= "RegenerationPotion",
		[3146]				= "HextechGunblade",
		[3187]				= "HextechSweeper",
		[3190]				= "IronStylus",
		[2004]				= "FlaskOfCrystalWater",
		[3139]				= "ItemMercurial",
		[3222]				= "ItemMorellosBane",
		[3042]				= "Muramana",
		[3043]				= "Muramana",
		[3180]				= "OdynsVeil",
		[3056]				= "ItemFaithShaker",
		[2047]				= "OracleExtractSight",
		[3364]				= "TrinketSweeperLvl3",
		[2052]				= "ItemPoroSnack",
		[3140]				= "QuicksilverSash",
		[3143]				= "RanduinsOmen",
		[3074]				= "ItemTiamatCleave",
		[3800]				= "ItemRighteousGlory",
		[2045]				= "ItemGhostWard",
		[3342]				= "TrinketOrbLvl1",
		[3040]				= "ItemSeraphsEmbrace",
		[3048]				= "ItemSeraphsEmbrace",
		[2049]				= "ItemGhostWard",
		[3345]				= "OdinTrinketRevive",
		[2044]				= "SightWard",
		[3341]				= "TrinketSweeperLvl1",
		[3069]				= "shurelyascrest",
		[3599]				= "KalistaPSpellCast",
		[3185]				= "HextechSweeper",
		[3077]				= "ItemTiamatCleave",
		[2009]				= "ItemMiniRegenPotion",
		[2010]				= "ItemMiniRegenPotion",
		[3023]				= "ItemWraithCollar",
		[3290]				= "ItemWraithCollar",
		[2043]				= "VisionWard",
		[3340]				= "TrinketTotemLvl1",
		[3090]				= "ZhonyasHourglass",
		[3154]				= "wrigglelantern",
		[3142]				= "YoumusBlade",
		[3157]				= "ZhonyasHourglass",
		[3512]				= "ItemVoidGate",
		[3131]				= "ItemSoTD",
		[3137]				= "ItemDervishBlade",
		[3352]				= "RelicSpotter",
		[3350]				= "TrinketTotemLvl2",
	}

	___GetInventorySlotItem	= rawget(_G, "GetInventorySlotItem")
	_G.GetInventorySlotItem	= GetSlotItem

	for _,c in pairs(GetEnemyHeroes()) do
		lastpos[ c.networkID ] = Vector(c)
	end
	
	Variables()
	Menu()
	
	--moveToCursor()
	--SendChat("/laugh")
end
--ICREATIVETABLE--


function Variables()
	SpellQ = {speed = 1100, range = 850, delay = 0.25, width = 108, ready = false}
	SpellW = {range = 1000, ready = false}
	SpellR = {range = 1500, ready = false}
	
	InterruptGame = {}
	InterruptComplete = {
		{ name = "Caitlyn"     , spell = "CaitlynAceintheHole"},
		{ name = "FiddleSticks", spell = "Crowstorm"},
		{ name = "FiddleSticks", spell = "DrainChannel"},
		{ name = "Galio"       , spell = "GalioIdolOfDurand"},
		{ name = "Karthus"     , spell = "FallenOne"},
		{ name = "Katarina"    , spell = "KatarinaR"},
		{ name = "Lucian"      , spell = "LucianR"},
		{ name = "Malzahar"    , spell = "AlZaharNetherGrasp"},
		{ name = "MissFortune" , spell = "MissFortuneBulletTime"},
		{ name = "Nunu"        , spell = "AbsoluteZero"},
		{ name = "Shen"        , spell = "ShenStandUnited"},
		{ name = "Urgot"       , spell = "UrgotSwap2"},
		{ name = "Varus"       , spell = "VarusQ"},
		{ name = "Velkoz"      , spell = "VelkozR"},
		{ name = "Warwick"     , spell = "InfiniteDuress"}
	}

	for i, enemy in pairs(GetEnemyHeroes()) do
		for j, champion in pairs(InterruptComplete) do
			if enemy.charName == champion.name then
				table.insert(InterruptGame, champion)
			end
		end
	end
	
	SpellStop = {"crowstorm","luxmalicecannon","absolutezero","alzaharnethergrasp","caitlynaceinthehole","drainchannel","galioidolofdurand","infiniteduress","katarinar","missfortunebullettime","pantheon_grandskyfall_jump","shenstandunited","urgotswap2","zhonyashourglass","velkozr","ezrealtrueshotbarrage"}
	Support = {"Alistar", "Blitzcrank", "Janna", "Karma", "Leona", "Lulu", "Nami", "Nunu", "Sona", "Soraka", "Taric", "Thresh", "Zilean", "Braum", "Bard"}
	if myHero:GetSpellData(4).name:find("exhaust") then
		exhaust = { slot = 4, key = "D", range =  650, ready = false }
	elseif myHero:GetSpellData(5).name:find("exhaust") then
		exhaust = { slot = 5, key = "F", range =  650, ready = false }
	end
	enemyMinions = minionManager(MINION_ENEMY, 1100, myHero)
end



function GetSlotItem(id, unit)
	unit = unit or myHero

	if (not ItemNames[id]) then
		return ___GetInventorySlotItem(id, unit)
	end

	local name	= ItemNames[id]
	
	for slot = ITEM_1, ITEM_7 do
		local item = unit:GetSpellData(slot).name
		if ((#item > 0) and (item:lower() == name:lower())) then
			return slot
		end
	end
end

function Menu()
BardMenu = scriptConfig("Bard Remastered", "BardLOL")
	BardMenu:addSubMenu("Combo Settings", "combo")
		BardMenu.combo:addParam("qMana", "Use Q combo if  mana is above", SCRIPT_PARAM_SLICE, 5, 0, 101, 0) 
		BardMenu.combo:addParam("bush", "Ward bush when they hide", SCRIPT_PARAM_ONOFF, true)
		
	BardMenu.combo:addSubMenu("W Settings", "wsettings")
			--BardMenu.combo.wsettings:addParam("healchase", "Give Ally Speed Boost", SCRIPT_PARAM_ONOFF, true)
			BardMenu.combo.wsettings:addParam("wsave", "Cast Heal on low health allys",4,0.7,0,1,2)


	BardMenu:addSubMenu("Harass Settings", "harass") 
		BardMenu.harass:addParam("qMana", "Use Q harass if  mana is above", SCRIPT_PARAM_SLICE, 35, 0, 101, 0) 
	
	
	BardMenu:addSubMenu("Interrupt Settings",  "interrupt")
		BardMenu.interrupt:addParam("interruptinterrupt", "interrupt Channeled spells", SCRIPT_PARAM_ONOFF, true)
		
	if #InterruptGame > 0 then
		BardMenu.interrupt:addParam("info8", "", SCRIPT_PARAM_INFO, "")
		for i, v in pairs(InterruptGame) do
			BardMenu.interrupt:addParam(v.spell, v.name.."-"..v.spell, SCRIPT_PARAM_ONOFF, true)
		end
	else
		BardMenu.interrupt:addParam("info1", "No supported spells found", SCRIPT_PARAM_INFO, "")
	end
		
	BardMenu:addSubMenu("General Settings", "sett")
		BardMenu.sett:addParam("sel", "   Focus Selected Target", SCRIPT_PARAM_ONOFF, true) 
		BardMenu.sett:addParam("Target", "   Target Mode:", SCRIPT_PARAM_LIST, 3, { "Less Cast", "Near Mouse", "Less Cast Priority" })
		BardMenu.sett:addParam("debug", "   Debug", SCRIPT_PARAM_ONOFF, false)
		
		BardMenu.sett:addSubMenu("   Draw Settings", "drawing") 
			BardMenu.sett.drawing:addParam("mDraw", "Disable All Range Draws", SCRIPT_PARAM_ONOFF, false) 
			BardMenu.sett.drawing:addParam("Target", "Draw Circle on Target", SCRIPT_PARAM_ONOFF, true)  
			BardMenu.sett.drawing:addParam("aaDraw", "Draw AA Range", SCRIPT_PARAM_ONOFF, true)
			BardMenu.sett.drawing:addParam("hitDraw", "Draw My Hitbox", SCRIPT_PARAM_ONOFF, true)
			BardMenu.sett.drawing:addParam("qDraw", "Draw (Q) Range", SCRIPT_PARAM_ONOFF, true) 
			
	BardMenu:addSubMenu("Orbwalking Settings", "Orbwalking") 	
		
	BardMenu:addSubMenu("Keybindings", "keys") 
		BardMenu.keys:addParam("comboKey", "Full Combo Key (SBTW)", SCRIPT_PARAM_ONKEYDOWN, false, 32) 
		BardMenu.keys:addParam("harassKey", "Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey("C")) 
		if exhaust then	
			BardMenu.keys:addParam("exh", "Exhaust Key", SCRIPT_PARAM_ONKEYDOWN, false, GetKey(exhaust.key)) 
		end

	TSex = TargetSelector(TARGET_PRIORITY, 600, DAMAGE_MAGIC)
		
	TargetSelector = TargetSelector(TARGET_LESS_CAST_PRIORITY, 1000, DAMAGE_MAGIC)
	TSex.name = "EX"
	TargetSelector.name = "Bard"
	
	BardMenu:addParam("info2", "Created by Ralphlol, Now Updated by Tivia", SCRIPT_PARAM_INFO, "")
	end


function OnTick()
	ComboKey			= BardMenu.keys.comboKey
	HarassKey			= BardMenu.keys.harassKey
	Debug               = BardMenu.sett.debug
	
	TickChecks()

	if ComboKey then
	CastW()
		if Target then 
			ComboMode(Target)
		end
		if  BardMenu.combo.bush then
			bushfind()
		end
	end
	if HarassKey and Target then
		HarassMode(Target)
	end


	if exhaust and BardMenu.keys.exh then 
		if exhaust.slot then
			exhaust.ready = (myHero:CanUseSpell(exhaust.slot) == 0)
		end
		if exhaust.ready then
			TSex:update()
			if ValidTarget(TSex.target) and TSex.target.type == myHero.type then
				exhFunction(TSex.target) 
			end
		end
	end
	for _,c in pairs(sEnemies) do		
		if c.visible then
			lastpos [ c.networkID ] = Vector(c) 
			lasttime[ c.networkID ] = os.clock() 
		end
	end
end
function exhFunction(unit)
	moveToCursor()
	CastSpell(exhaust.slot, unit)
end

function OnProcessSpell(unit, spell)
	if not unit or not unit.valid then return end
	
	if SpellQ.ready and spell.name:lower():find("deceive") and GetDistance(spell.endPos, myHero.pos) < SpellQ.range then
		local cPos = spell.endPos
		if Debug then Print("Casting Q on "..spell.name) end
		CastSpell(0, cPos.x, cPos.z)
	end

	if #InterruptGame > 0 then
		for i, v in pairs(InterruptGame) do
			if (spell.name == v.spell) and (unit.team ~= myHero.team) and BardMenu.interrupt[v.spell] then
				if GetDistance(unit) < 1500 and BardMenu.interrupt.interruptinterrupt then
					CastSpell(_R, unit.x, unit.z)
				end
			end
		end
	end
end
function TickChecks()

	myMana = (myHero.mana/myHero.maxMana )*100
	
	SpellQ.ready = (myHero:CanUseSpell(0) == 0)
	
	Target = GetCustomTarget()
	TargetSelectorMode()

end

function CastW()
if GetLowestAlly(1000).health/GetLowestAlly(1000).maxHealth <= BardMenu.combo.wsettings.wsave and not myHero.dead then
	CastSpell(_W, GetLowestAlly(1000).x, GetLowestAlly(1000).z)
end
end

function GetLowestAlly(range) --[[Tested function.. I love it! Always returns the lowest % ally in range.]]
	assert(range, "GetLowestAlly: Range returned nil. Cannot check valid ally in nil range")
	LowestAlly = nil
	for a = 1, heroManager.iCount do
		Ally = heroManager:GetHero(a)
		if Ally.team == myHero.team and not Ally.dead and GetDistance(myHero,Ally) <= range then
			if LowestAlly == nil then
				LowestAlly = Ally
			elseif not LowestAlly.dead and (Ally.health/Ally.maxHealth) < (LowestAlly.health/LowestAlly.maxHealth) then
				LowestAlly = Ally
			end
		end
	end
	return LowestAlly
end
function GetCustomTarget()
	if ValidTarget(SelectedTarget, 1000) and (Ignore == nil or (Ignore.networkID ~= SelectedTarget.networkID)) then
		return SelectedTarget
	end
	TargetSelector:update()	
	if ValidTarget(TargetSelector.target) and TargetSelector.target.type == myHero.type then
		return TargetSelector.target
	else
		return nil
	end
end

function OnDraw()
	if Debug then
		if vPred then
			local dp = GetDistance(myHero.pos, mousePos)
			if dp < SpellQ.range then
				local extend = SpellQ.range - dp 
				if extend > 1 then
					
					local extendedCollision = Vector(mousePos) + (Vector(mousePos) - Vector(myHero)):normalized() * (extend)
					for i, enemy in pairs(sEnemies) do
						if vPred:CheckCol(extendedCollision, enemy, mousePos, SpellQ.delay, SpellQ.width, SpellQ.range, SpellQ.speed, myHero) then
							DrawLine3D(mousePos.x, mousePos.y, mousePos.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,255,0,0))
							return
						end
					end
					local col = vPred:CheckMinionCollision(mousePos, extendedCollision, SpellQ.delay, SpellQ.width, extend, SpellQ.speed, mousePos, false, true)
					if col then
						DrawLine3D(mousePos.x, mousePos.y, mousePos.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,0,0,255))
						return
					end
					local amount = extend/10
					local count = 1
					while count <= 10 do
						local extendedWall = Vector(mousePos) + (Vector(mousePos) - Vector(myHero)):normalized() * (amount*count)
						local vec1 = D3DXVECTOR3(extendedWall.x, extendedWall.y,extendedWall.z)
						if IsWall(vec1) then
							DrawLine3D(mousePos.x, mousePos.y, mousePos.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,0,255,0))
							return
						end
						count = count + 1
					end
					DrawLine3D(mousePos.x, mousePos.y, mousePos.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,255,255,255))
				end
			end
			
			if Target then
				local dp = GetDistance(myHero.pos, Target)
				if dp < SpellQ.range then
					local extend = SpellQ.range - dp 
					if extend > 1 then
						local extendedCollision = Vector(Target) + (Vector(Target) - Vector(myHero)):normalized() * (extend)
						for i, enemy in pairs(sEnemies) do
							if enemy ~= Target then
								if vPred:CheckCol(extendedCollision, enemy, Target, SpellQ.delay, SpellQ.width, SpellQ.range, SpellQ.speed, myHero) then
									DrawLine3D(Target.x, Target.y, Target.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,255,0,0))
									return
								end
							end
						end
						local col = vPred:CheckMinionCollision(Target, extendedCollision, SpellQ.delay, SpellQ.width, extend, SpellQ.speed, Target, false, true)
				
						if col then
							DrawLine3D(Target.x, Target.y, Target.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,0,0,255))
							return
						end
						local amount = extend/10
						local count = 1
						while count <= 10 do
							local extendedWall = Vector(Target) + (Vector(Target) - Vector(myHero)):normalized() * (amount*count)
							local vec1 = D3DXVECTOR3(extendedWall.x, extendedWall.y,extendedWall.z)
							if IsWall(vec1) then
								DrawLine3D(Target.x, Target.y, Target.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,0,255,0))
								return
							end
							count = count + 1
						end
						DrawLine3D(Target.x, Target.y, Target.z, extendedCollision.x, myHero.y, extendedCollision.z, 2,ARGB(255,255,255,255))
					end
				end
			end
		end
	end
	
	if not myHero.dead then
		if not BardMenu.sett.drawing.mDraw then	
			if BardMenu.sett.drawing.aaDraw then 
				DrawCircle3D(myHero.x, myHero.y, myHero.z, myHero.boundingRadius + myHero.range, 4, ARGB(100, 57,255,20), 52)
			end
			if BardMenu.sett.drawing.hitDraw then 
				DrawCircle3D(myHero.x, myHero.y, myHero.z, myHero.boundingRadius, 4, ARGB(80, 0,255,100), 52)
			end
		
			if BardMenu.sett.drawing.qDraw and SpellQ.ready then
				DrawCircle3D(myHero.x, myHero.y, myHero.z, SpellQ.range, 2, ARGB(70, 233,133,253), 52)
			end
			if BardMenu.sett.drawing.Target and Target then
				DrawCircle3D(Target.x, Target.y, Target.z, Target.boundingRadius, 3, ARGB(211, 255, 20 , 147 ), 55)
			end
			if ValidTarget(SelectedTarget) then
				DrawCircle3D(SelectedTarget.x, SelectedTarget.y, SelectedTarget.z, 10, 20, ARGB(244, 255, 255 , 0 ), 55)
			end
		end
	end
end

function ComboMode(unit)	
	if myMana > BardMenu.combo.qMana then
		CastQ(unit)
	end
end
function HarassMode(unit)
	if myMana > BardMenu.harass.qMana then
		CastQ(unit)
	end
end
function CastQ(unit)
	if not SpellQ.ready or not ValidTarget(unit) then return end

	local CastPosition, Hitchance = vPred:GetLineCastPosition(unit, SpellQ.delay, SpellQ.width, SpellQ.range, SpellQ.speed, myHero, true)
	if CastPosition then 
		local dp = GetDistance(myHero.pos, CastPosition)
		if dp < SpellQ.range then
			local extend = SpellQ.range - dp - 20
			if extend > 1 then
				local extendedCollision = Vector(CastPosition) + (Vector(CastPosition) - Vector(myHero)):normalized() * (extend)
				if Hitchance >= 2 then
					for i, enemy in pairs(sEnemies) do
						if enemy ~= unit then
							if vPred:CheckCol(extendedCollision, enemy, CastPosition, SpellQ.delay, SpellQ.width, SpellQ.range, SpellQ.speed, myHero) then
								if Debug then print("hero coll castq") end
								CastSpell(0, CastPosition.x, CastPosition.z)
								return
							end
						end
					end
					local col = vPred:CheckMinionCollision(unit, extendedCollision, SpellQ.delay, SpellQ.width, extend, SpellQ.speed, CastPosition, false, true)
					if col then
						if Debug then print("minion behind coll castq") end
						CastSpell(0, CastPosition.x, CastPosition.z)
						return
					end
					local amount = extend/10
					local count = 1
					while count <= 10 do
						local extendedWall = Vector(CastPosition) + (Vector(CastPosition) - Vector(myHero)):normalized() * (amount*count)
						local vec1 = D3DXVECTOR3(extendedWall.x, extendedWall.y,extendedWall.z)
						if IsWall(vec1) then
							CastSpell(0, CastPosition.x, CastPosition.z)
							if Debug then print("wall coll castq") end
							return
						end
						count = count + 1
					end
				end
				local mBool, mTable = GetMinionCollision(myHero, CastPosition, unit)
				if mBool and #mTable == 1 then
					if Debug then print("minion or hero infront coll castq") end
					CastSpell(0, CastPosition.x, CastPosition.z)
					return
				end
			end
		end
	end
end

function OnWndMsg(Msg, Key)
--print(Msg)
--print(Key)
	if Msg == WM_LBUTTONUP then
		if Debug then
			--print(GetSpellData(_R).channelDuration)
		end
	end
	
	if Msg == WM_LBUTTONDOWN and BardMenu.sett.sel then  --From Honda
		local minD = 0
		local starget = nil
		for i, enemy in ipairs(sEnemies) do
			if ValidTarget(enemy) then
				if GetDistance(enemy, mousePos) <= minD or starget == nil then
					minD = GetDistance(enemy, mousePos)
					starget = enemy
				end
			end
		end

		if starget and minD < 115 then
			if SelectedTarget and starget.charName == SelectedTarget.charName then
				SelectedTarget = nil
			else
				SelectedTarget = starget
				Print("New target selected, "..starget.charName)
			end
		end
	end
end

function moveToCursor()
	local MouseMove = Vector(myHero) + (Vector(mousePos) - Vector(myHero)):normalized() * 500
	myHero:MoveTo(MouseMove.x, MouseMove.z)	
end


function TargetSelectorMode()
	if BardMenu.sett.Target == 1 then
		TargetSelector.mode = TARGET_LESS_CAST
	elseif BardMenu.sett.Target == 2 then
		TargetSelector.mode = TARGET_NEAR_MOUSE
	elseif BardMenu.sett.Target == 3 then
		TargetSelector.mode = TARGET_LESS_CAST_PRIORITY
	end
end

function bushfind()
	if lastTime +15 > os.clock() then return end
	for _,c in pairs(sEnemies) do		
		if not c.dead and not c.visible then
			local time=lasttime[ c.networkID ]  --last seen time
			local pos=lastpos [ c.networkID ]   --last seen pos
			local clock=os.clock()
			
			if time and pos and clock-time < 5 and GetDistanceSqr(pos)< 1005000 then
				local FoundBush = FindBush(pos.x,pos.y,pos.z,100)
		
				if FoundBush and GetDistanceSqr(FoundBush)<600*600 then
					local WardSlot = ItemS()
					
					if WardSlot then
						CastSpell(WardSlot,FoundBush.x,FoundBush.z)
						lastTime = os.clock()
						return
					end
				end
			end
		end
	end
end
function ItemS()
	local WardSlot = nil
	if GetInventorySlotItem(2045) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(2045)) == READY then
		WardSlot = GetInventorySlotItem(2045)
	elseif GetInventorySlotItem(2049) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(2049)) == READY then
		WardSlot = GetInventorySlotItem(2049)
	elseif GetInventorySlotItem(3340) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3340)) == READY or 
	GetInventorySlotItem(3350) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3350)) == READY or 
	GetInventorySlotItem(3361) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3361)) == READY or 
	GetInventorySlotItem(3363) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3363)) == READY or
	GetInventorySlotItem(3411) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3411)) == READY or
	GetInventorySlotItem(3342) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3342)) == READY or
	GetInventorySlotItem(3362) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(3362)) == READY  then
		WardSlot = 12
	elseif GetInventorySlotItem(2044) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(2044)) == READY then
		WardSlot = GetInventorySlotItem(2044)
	elseif GetInventorySlotItem(2043) ~= nil and myHero:CanUseSpell(GetInventorySlotItem(2043)) == READY then
		WardSlot = GetInventorySlotItem(2043)
	end

	return WardSlot
end
function FindBush(x0, y0, z0, maxRadius, precision) --returns the nearest non-wall-position of the given position(Credits to gReY)
    
    --Convert to vector
    local vec = D3DXVECTOR3(x0, y0, z0)
    
    --If the given position it a non-wall-position return it
	--if IsWallOfGrass(vec) then
	--	print("#1")
	--	return vec 
	--end
    
    --Optional arguments
    precision = precision or 50
    maxRadius = maxRadius and math.floor(maxRadius / precision) or math.huge
    
    --Round x, z
    x0, z0 = math.round(x0 / precision) * precision, math.round(z0 / precision) * precision

    --Init vars
    local radius = 2
    
    --Check if the given position is a non-wall position
    local function checkP(x, y) 
        vec.x, vec.z = x0 + x * precision, z0 + y * precision 
        return IsWallOfGrass(vec) 
    end
    
    --Loop through incremented radius until a non-wall-position is found or maxRadius is reached
    while radius <= maxRadius do
        --A lot of crazy math (ask gReY if you don't understand it. I don't)
        if checkP(0, radius) or checkP(radius, 0) or checkP(0, -radius) or checkP(-radius, 0) then 
			--print("#2:"..radius)
            return vec 
        end
        local f, x, y = 1 - radius, 0, radius
        while x < y - 1 do
            x = x + 1
            if f < 0 then 
                f = f + 1 + 2 * x
            else 
                y, f = y - 1, f + 1 + 2 * (x - y)
            end
            if checkP(x, y) or checkP(-x, y) or checkP(x, -y) or checkP(-x, -y) or 
               checkP(y, x) or checkP(-y, x) or checkP(y, -x) or checkP(-y, -x) then 
			--	print("#3:"..radius)
                return vec 
            end
        end
        --Increment radius every iteration
        radius = radius + 1
    end
end

-------------------------------------------
function getHitBoxRadius(target)
	return GetDistance(target, target.minBBox)/2
end

function GetMinionCollision(pStart, pEnd, unit) --From Collision 1.1.1 by Klokje
	enemyMinions:update()
	mCollision = {} 
		
	local distance =  GetDistance(pStart, pEnd)
	local prediction = VP
	if distance > SpellQ.range then
		distance = SpellQ.range
	end
 
	local V = Vector(pEnd) - Vector(pStart)
	local k = V:normalized()
    local P = V:perpendicular2():normalized()
 
    local t,i,u = k:unpack()
    local x,y,z = P:unpack()
 
    local startLeftX = pStart.x + (x *(SpellQ.width/2))
    local startLeftY = pStart.y + (y *(SpellQ.width/2))
    local startLeftZ = pStart.z + (z *(SpellQ.width/2))
    local endLeftX = pStart.x + (x * (SpellQ.width/2)) + (t * distance)
    local endLeftY = pStart.y + (y * (SpellQ.width/2)) + (i * distance)
    local endLeftZ = pStart.z + (z * (SpellQ.width/2)) + (u * distance)
     
    local startRightX = pStart.x - (x * (SpellQ.width/2 ))
    local startRightY = pStart.y - (y * (SpellQ.width/2 ))
    local startRightZ = pStart.z - (z * (SpellQ.width/2 ))
    local endRightX = pStart.x - (x * (SpellQ.width/2)) + (t * distance)
    local endRightY = pStart.y - (y * (SpellQ.width/2)) + (i * distance)
    local endRightZ = pStart.z - (z * (SpellQ.width/2)) + (u * distance)
 
    local startLeft = WorldToScreen(D3DXVECTOR3(startLeftX, startLeftY, startLeftZ))
    local startRight = WorldToScreen(D3DXVECTOR3(startRightX, startRightY, startRightZ))    local endLeft = WorldToScreen(D3DXVECTOR3(endLeftX, endLeftY, endLeftZ))

    local endRight = WorldToScreen(D3DXVECTOR3(endRightX, endRightY, endRightZ))
      
    local poly = Polygon(Point(startLeft.x, startLeft.y),  Point(endLeft.x, endLeft.y), Point(startRight.x, startRight.y),   Point(endRight.x, endRight.y))
 
    for index, minion in pairs(enemyMinions.objects) do
		if minion ~= nil and minion.valid and not minion.dead then
			if GetDistance(pStart, minion) < distance then
				
				local pos, t, vec = vPred:GetLineCastPosition(pEnd, SpellQ.delay, SpellQ.width, SpellQ.range, SpellQ.speed, myHero)	
                local lineSegmentLeft = LineSegment(Point(startLeftX,startLeftZ), Point(endLeftX, endLeftZ))
                local lineSegmentRight = LineSegment(Point(startRightX,startRightZ), Point(endRightX, endRightZ))
                local toScreen, toPoint
                if pos ~= nil then
					toScreen = WorldToScreen(D3DXVECTOR3(minion.x, minion.y, minion.z))
                    toPoint = Point(toScreen.x, toScreen.y)
                else
					toScreen = WorldToScreen(D3DXVECTOR3(minion.x, minion.y, minion.z))
                    toPoint = Point(toScreen.x, toScreen.y)
                end
 
 
                if poly:contains(toPoint) then
					table.insert(mCollision, minion)
                else
                    if pos ~= nil then
						distance1 = Point(pos.x, pos.z):distance(lineSegmentLeft)
                        distance2 = Point(pos.x, pos.z):distance(lineSegmentRight)
                    else
                        distance1 = Point(minion.x, minion.z):distance(lineSegmentLeft)
                        distance2 = Point(minion.x, minion.z):distance(lineSegmentRight)
                    end
                    if (distance1 < (getHitBoxRadius(minion)*2+10) or distance2 < (getHitBoxRadius(minion) *2+10)) then
                        table.insert(mCollision, minion)
                    end
				end
			end
		end
	end
	 for index, minion in pairs(sEnemies) do
		if minion ~= unit and minion ~= nil and minion.valid and not minion.dead then
			if GetDistance(pStart, minion) < distance then
				
				local pos, t, vec = vPred:GetLineCastPosition(pEnd, SpellQ.delay, SpellQ.width, SpellQ.range, SpellQ.speed, myHero)	
                local lineSegmentLeft = LineSegment(Point(startLeftX,startLeftZ), Point(endLeftX, endLeftZ))
                local lineSegmentRight = LineSegment(Point(startRightX,startRightZ), Point(endRightX, endRightZ))
                local toScreen, toPoint
                if pos ~= nil then
					toScreen = WorldToScreen(D3DXVECTOR3(minion.x, minion.y, minion.z))
                    toPoint = Point(toScreen.x, toScreen.y)
                else
					toScreen = WorldToScreen(D3DXVECTOR3(minion.x, minion.y, minion.z))
                    toPoint = Point(toScreen.x, toScreen.y)
                end
 
 
                if poly:contains(toPoint) then
					table.insert(mCollision, minion)
                else
                    if pos ~= nil then
						distance1 = Point(pos.x, pos.z):distance(lineSegmentLeft)
                        distance2 = Point(pos.x, pos.z):distance(lineSegmentRight)
                    else
                        distance1 = Point(minion.x, minion.z):distance(lineSegmentLeft)
                        distance2 = Point(minion.x, minion.z):distance(lineSegmentRight)
                    end
                    if (distance1 < (getHitBoxRadius(minion)*2+10) or distance2 < (getHitBoxRadius(minion) *2+10)) then
                        table.insert(mCollision, minion)
                    end
				end
			end
		end
	end
	if #mCollision == 0 then return false, mCollision else return true, mCollision end
end