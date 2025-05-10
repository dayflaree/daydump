print("Loading sv_headcrab_takeover.lua")

util.AddNetworkString("manualdeathnotice")
util.AddNetworkString("setascustombonemerge")
util.AddNetworkString("customstoreplayercolor")
util.AddNetworkString("customstorebodygroups")
util.AddNetworkString("resetfastzombie")
util.AddNetworkString("customzombiegibbed")
util.AddNetworkString("createheadcrablone")
util.AddNetworkString("reapplydecalsrag")
util.AddNetworkString("applydecalstobonemerge")
util.PrecacheModel("models/zombie/zombie_soldier_torso.mdl")
util.PrecacheModel("models/zombie/zombie_soldier_legs.mdl")
util.PrecacheModel("models/Gibs/Fast_Zombie_Legs.mdl")
util.PrecacheModel("models/headcrabclassic.mdl")
util.PrecacheModel("models/zombie/classic_legs.mdl")
util.PrecacheModel("models/zombie/classic_torso.mdl")
util.PrecacheModel("models/zombie/fast_torso.mdl")
util.PrecacheModel("models/headcrab.mdl")
util.PrecacheModel("models/headcrabblack.mdl")
util.PrecacheModel("models/animations/headcrabtakeoveranimation.mdl")


if (!ConVarExists("headcrabtakeover_allowtakeover")) then
    CreateConVar("headcrabtakeover_allowtakeover", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowslump")) then
    CreateConVar("headcrabtakeover_allowslump", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowpoisonregeneratecrab")) then
    CreateConVar("headcrabtakeover_allowpoisonregeneratecrab", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowfastzombierotting")) then
    CreateConVar("headcrabtakeover_allowfastzombierotting", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowheadcrabinstakill")) then
    CreateConVar("headcrabtakeover_allowheadcrabinstakill", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_poisonzombiecrabregenerationmultiplier")) then
    CreateConVar("headcrabtakeover_poisonzombiecrabregenerationmultiplier", "1.00", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_fastzombierotspeedmultiplier")) then
    CreateConVar("headcrabtakeover_fastzombierotspeedmultiplier", "1.00", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_zombieslumpchancemultiplier")) then
    CreateConVar("headcrabtakeover_zombieslumpchancemultiplier", "1.00", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowanimation")) then
    CreateConVar("headcrabtakeover_allowanimation", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowanimationinteraction")) then
    CreateConVar("headcrabtakeover_allowanimationinteraction", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_animationwaittime")) then
    CreateConVar("headcrabtakeover_animationwaittime", "1.00", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowcustombonemerge")) then
    CreateConVar("headcrabtakeover_allowcustombonemerge", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowtakeoveranimationscreamsound")) then
    CreateConVar("headcrabtakeover_allowtakeoveranimationscreamsound", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowheadcrabinstakillwitharmor")) then
    CreateConVar("headcrabtakeover_allowheadcrabinstakillwitharmor", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowzombines")) then
    CreateConVar("headcrabtakeover_allowzombines", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowvjhl1compatibility")) then
    CreateConVar("headcrabtakeover_allowvjhl1compatibility", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowbmcecompatibility")) then
    CreateConVar("headcrabtakeover_allowbmcecompatibility", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowaffectplayers")) then
    CreateConVar("headcrabtakeover_allowaffectplayers", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowmorezombiedamage")) then
    CreateConVar("headcrabtakeover_allowmorezombiedamage", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_hlrbabyheadcrabgrowtime")) then
    CreateConVar("headcrabtakeover_hlrbabyheadcrabgrowtime", "1.00", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_hlrzombiegrowtime")) then
    CreateConVar("headcrabtakeover_hlrzombiegrowtime", "1.00", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_hlrgonomespawnheadcrab")) then
    CreateConVar("headcrabtakeover_hlrgonomespawnheadcrab", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowzombieheadbonemerge")) then
    CreateConVar("headcrabtakeover_allowzombieheadbonemerge", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_alwaysbonemerge")) then
    CreateConVar("headcrabtakeover_alwaysbonemerge", "0", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_takeoveranimationragdolls")) then
    CreateConVar("headcrabtakeover_takeoveranimationragdolls", "1", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_takeoverragdolls")) then
    CreateConVar("headcrabtakeover_takeoverragdolls", "0", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_allowheadcrabinstakillpercentage")) then
    CreateConVar("headcrabtakeover_allowheadcrabinstakillpercentage", "100", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

if (!ConVarExists("headcrabtakeover_zombieinfection")) then
    CreateConVar("headcrabtakeover_zombieinfection", "0", { FCVAR_REPLICATED, FCVAR_ARCHIVE } )
end

concommand.Add("headcrabtakeover_resetsettings", function(ply)
    if !ply:IsAdmin() then return end
    local allowtakeover = GetConVar("headcrabtakeover_allowtakeover")
    allowtakeover:SetInt(1)

    local allowslump = GetConVar("headcrabtakeover_allowslump")
    allowslump:SetInt(1)

    local allowpoisonregeneratecrab = GetConVar("headcrabtakeover_allowpoisonregeneratecrab")
    allowpoisonregeneratecrab:SetInt(1)

    local allowfastzombierotting = GetConVar("headcrabtakeover_allowfastzombierotting")
    allowfastzombierotting:SetInt(1)

    local allowheadcrabinstakill = GetConVar("headcrabtakeover_allowheadcrabinstakill")
    allowheadcrabinstakill:SetInt(1)

    local poisonzombiecrabregenerationmultiplier = GetConVar("headcrabtakeover_poisonzombiecrabregenerationmultiplier")
    poisonzombiecrabregenerationmultiplier:SetFloat(1.00)

    local fastzombierotspeedmultiplier = GetConVar("headcrabtakeover_fastzombierotspeedmultiplier")
    fastzombierotspeedmultiplier:SetFloat(1.00)

    local zombieslumpchancemultiplier = GetConVar("headcrabtakeover_zombieslumpchancemultiplier")
    zombieslumpchancemultiplier:SetFloat(1.00)

    local allowanimation = GetConVar("headcrabtakeover_allowanimation")
    allowanimation:SetInt(1)

    local allowanimationinteraction = GetConVar("headcrabtakeover_allowanimationinteraction")
    allowanimationinteraction:SetInt(1)

    local animationwaittime = GetConVar("headcrabtakeover_animationwaittime")
    animationwaittime:SetFloat(1.00)

    local allowcustombonemerge = GetConVar("headcrabtakeover_allowcustombonemerge")
    allowcustombonemerge:SetInt(1)

    local allowtakeoveranimationscreamsound = GetConVar("headcrabtakeover_allowtakeoveranimationscreamsound")
    allowtakeoveranimationscreamsound:SetInt(1)

    local allowheadcrabinstakillwitharmor = GetConVar("headcrabtakeover_allowheadcrabinstakillwitharmor")
    allowheadcrabinstakillwitharmor:SetInt(1)

    local allowzombines = GetConVar("headcrabtakeover_allowzombines")
    allowzombines:SetInt(1)

    local allowaffectplayers = GetConVar("headcrabtakeover_allowaffectplayers")
    allowaffectplayers:SetInt(1)

    local allowmorezombiedamage = GetConVar("headcrabtakeover_allowmorezombiedamage")
    allowmorezombiedamage:SetInt(1)

    local allowzombieheadbonemerge = GetConVar("headcrabtakeover_allowzombieheadbonemerge")
    allowzombieheadbonemerge:SetInt(1)

    local alwaysbonemerge = GetConVar("headcrabtakeover_alwaysbonemerge")
    alwaysbonemerge:SetInt(0)

    local takeoveranimationragdolls = GetConVar("headcrabtakeover_takeoveranimationragdolls")
    takeoveranimationragdolls:SetInt(1)

    local takeoverragdolls = GetConVar("headcrabtakeover_takeoverragdolls")
    takeoverragdolls:SetInt(0)

    local allowheadcrabinstakillpercentage = GetConVar("headcrabtakeover_allowheadcrabinstakillpercentage")
    allowheadcrabinstakillpercentage:SetInt(100)

    local zombieinfection = GetConVar("headcrabtakeover_zombieinfection")
    zombieinfection:SetInt(0)
end)

local function CreateZombineGrenade(attachmenttable, force, saw, grenadetimer)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.05, function()
        local grenade = ents.Create("npc_grenade_frag")
        grenade:Spawn()
        grenade:SetPos(attachmenttable.Pos)
        grenade:SetAngles(attachmenttable.Ang)
        grenade:SetSaveValue("m_flDamage", 200)
        grenade:Activate()
        local stringtimer = tostring(grenadetimer)
        grenade:Fire("SetTimer", stringtimer, 0)
        local multiplier = 0.05
        if saw then multiplier = 0.005 end
        grenade:GetPhysicsObject():SetVelocity(force * multiplier)
    end)
end

local function RestartFlinchSequence(target, seq)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    if !game.SinglePlayer() then
        timer.Simple(timescale*0.01, function()
            if target:IsValid() and target:Health() > 0 and target.isflinchingcustom then
                target.moddedflinchgesture = target:AddGestureSequence(seq)
                RestartFlinchSequence(target, seq)
            end
            if target:IsValid() and target:Health() > 0 and !target.isflinchingcustom then
                target.moddedflinchgesture = nil
                target:SetActivity(ACT_IDLE)
            end
        end)
    end
    if game.SinglePlayer() and target.moddedflinchgesture then
        if target:GetClass() == "npc_zombine" then
            timer.Simple(timescale*0.05, function()
                if target:IsValid() then
                    target:SetActivity(ACT_IDLE)
                end
            end)
        end
        target:SetLayerBlendOut(target.moddedflinchgesture, 0.4)
    end
end

local function IsHalfLife2Zombie(target)
    return target:GetClass() == "npc_zombie" or target:GetClass() == "npc_zombie_torso" or target:GetClass() == "npc_fastzombie" or target:GetClass() == "npc_fastzombie_torso" or target:GetClass() == "npc_poisonzombie" or target:GetClass() == "npc_zombine"
end

local function IsHalfLife2Headcrab(target)
    return target:GetClass() == "npc_headcrab" or target:GetClass() == "npc_headcrab_fast" or target:GetClass() == "npc_headcrab_black" or target:GetClass() == "npc_headcrab_poison"
end

local function ShouldUseSabreanSkin(targetmodel)
    if ConVarExists("poisonheadcrabzombieskins_cop") then
        if GetConVarNumber("headcrabtakeover_allowzombines") == 1 and file.Exists("models/zombie/zombie_soldier.mdl", "GAME") then
            return string.find(targetmodel, "humans/group0") != nil or string.find(targetmodel, "player/group0") != nil or targetmodel == "models/police.mdl" or string.find(targetmodel, "models/player/police") != nil or string.find(targetmodel, "civilprotection") != nil or string.find(targetmodel, "models/combine_") != nil or string.find(targetmodel, "models/player/combine_") != nil or string.find(targetmodel, "models/minerva/halflife2/combine/soldier.mdl") != nil or string.find(targetmodel, "models/minerva/halflife2/combine/elite.mdl") != nil
        else
            return string.find(targetmodel, "humans/group0") != nil or string.find(targetmodel, "player/group0") != nil or targetmodel == "models/police.mdl" or string.find(targetmodel, "civilprotection") != nil or string.find(targetmodel, "models/player/police") != nil
        end
    end
    return false
end

local function ShouldUseBMCEZombie(targetmodel)
    if GetConVarNumber("headcrabtakeover_allowbmcecompatibility") == 1 then
        if string.find(targetmodel, "marine_0") or string.find(targetmodel, "masked_marine")then
            return "npc_vj_bmce_zecu"
        end
        if string.find(targetmodel, "guard") then
            if string.find(targetmodel, "_0") or string.find(targetmodel, "female") or string.find(targetmodel, "hurt") or string.find(targetmodel, "otis") then
                return "npc_vj_bmce_secguard_zombie"
            end
        end
        if string.find(targetmodel, "cwork") then
            return 2
        end
        if string.find(targetmodel, "humans/engineer") then
            return 3
        end
        if string.find(targetmodel, "humans/custodian") then
            return 4
        end
        if string.find(targetmodel, "scientist") then
            if string.find(targetmodel, "casual") then return 1 end
            return 0
        end
        if string.find(targetmodel, "humans/cafeteria") or string.find(targetmodel, "humans/worker") then
            return 1
        end
    end
    return false
end

local function FixFastzombRag(ragdoll)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger1"), Angle(10, 25, -16.7), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger11"), Angle(-4, 76, -2), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger12"), Angle(0, 73, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger2"), Angle(7.6, 35, -12.6), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger21"), Angle(-4, 85, -3), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger22"), Angle(0, 86, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger3"), Angle(1, 47.8, -28), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger31"), Angle(-4, 99, -4), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_L_Finger32"), Angle(0, 81, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger1"), Angle(-1.9, 59.3, 1.8), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger11"), Angle(0, 76.6, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger12"), Angle(0, 73, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger2"), Angle(-1.1, 60.6, -0.5), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger21"), Angle(0, 77.7, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger22"), Angle(0, 74.1, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger3"), Angle(2.3, 50.6, -2.5), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger31"), Angle(0, 87.8, 0), true)
    ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.Bip01_R_Finger32"), Angle(0, 84.2, 0), true)
    if ragdoll:GetModel() == "models/zombie/fast.mdl" then
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BodyCube"), Angle(22, -1, -28.9), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_HeadCube"), Angle(-7.7, -10, -26.2), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLF"), Angle(37.4, 90.6, 119.3), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLF1"), Angle(0, -14.5, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRF"), Angle(153.2, 74.5, 37.5), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRF1"), Angle(0, 23, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLB"), Angle(15.1, -56, 0.8), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLB1"), Angle(0, 19, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLB2"), Angle(0, 13, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRB"), Angle(-42.3, -69.6, -2.5), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRB1"), Angle(0, 20.8, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRB2"), Angle(0, 13.5, 0), true)
    else
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BodyCube"), Angle(0, 0, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_HeadCube"), Angle(0, 0, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLF"), Angle(35.2, 39.8, 35.9), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLF1"), Angle(0, 2.1, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRF"), Angle(10.6, -34, -8), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRF1"), Angle(0, -10, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLB"), Angle(7.6, -51, -1.8), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLB1"), Angle(0, -4.2, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneLB2"), Angle(0, -3.3, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRB"), Angle(-19.3, -49.2, 3.2), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRB1"), Angle(0, -4.2, 0), true)
        ragdoll:ManipulateBoneAngles(ragdoll:LookupBone("ValveBiped.HC_BoneRB2"), Angle(0, -3.3, 0), true)
    end
end

local function GatherTTTThings(player) -- Did I stutter?
    if engine.ActiveGamemode() != "terrortown" then return end
    local headcrabtakeovertttplayerdata = {}

    headcrabtakeovertttplayerdata.playerent = player
    headcrabtakeovertttplayerdata.playerkills = table.Copy(player.kills)
    headcrabtakeovertttplayerdata.playercredits = player:GetCredits()
    headcrabtakeovertttplayerdata.playerequipment = player:GetEquipmentItems()
    headcrabtakeovertttplayerdata.playerrole = player:GetRole()
    headcrabtakeovertttplayerdata.bombdata = player.bomb_wire

    return headcrabtakeovertttplayerdata
end

local function StoreBodyGroups(ent)
    local storedbodygroupdata = {}
    for k, bodygroupdata in pairs(ent:GetBodyGroups()) do
        if bodygroupdata.num > 1 then
            local newdata = table.Copy(bodygroupdata)
            newdata.name = nil
            newdata.submodels = nil
            newdata.bodygroupvalue = ent:GetBodygroup(bodygroupdata.id)
            table.insert(storedbodygroupdata, newdata)
        end
    end
    return storedbodygroupdata
end

local function TryHitWorld(tracer, distancetotry, tryotherdirections)
    if !tracer:IsValid() then return end
    local slightlyup = 13
    local trace = util.TraceLine( { start = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup, endpos = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup + tracer:GetAngles():Forward() * distancetotry, collisiongroup = COLLISION_GROUP_WORLD} )
    if !trace.HitWorld and tryotherdirections then
        local traceleft = util.TraceLine( { start = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup, endpos = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup + tracer:GetAngles():Right() * -distancetotry, collisiongroup = COLLISION_GROUP_WORLD} )
        local traceright = util.TraceLine( { start = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup, endpos = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup + tracer:GetAngles():Right() * distancetotry, collisiongroup = COLLISION_GROUP_WORLD} )
        local tracebehind = util.TraceLine( { start = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup, endpos = tracer:GetPos() + tracer:GetAngles():Up() * slightlyup + tracer:GetAngles():Forward() * -distancetotry, collisiongroup = COLLISION_GROUP_WORLD} )
        if traceleft.HitWorld and traceright.HitWorld then
            if math.random(1,2) == 1 then
                return traceleft
            else
                return traceright
            end
        end
        if traceleft.HitWorld then return traceleft end
        if traceright.HitWorld then return traceright end
        if tracebehind.HitWorld then return tracebehind end
    end
    return trace
end

local function RandomInterruptWalk(zombie)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*(math.random(1,6)), function()
        if zombie:IsValid() then
            if zombie:GetCurrentSchedule() == SCHED_IDLE_WANDER then
                zombie:ClearSchedule()
            end
        end
    end)
end

local function PreventWallSlumpTimer(zombie)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*60, function()
        if zombie:IsValid() then
            zombie.PreventWallSlump = false
        end
    end)
end

local function TryHealEnemy(poisoncrab)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*4+(math.random(1,3)), function()
        if poisoncrab:IsValid() then
            if isentity(poisoncrab:GetEnemy()) then
                local enemy = poisoncrab:GetEnemy()
                if enemy:Health() == 1 then
                    enemy:SetHealth(2)
                end
            end
            TryHealEnemy(poisoncrab)
        end
    end)
end

local function RandomFastZombieSkin(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.1, function()
        if GetConVarNumber("headcrabtakeover_allowzombines") == 1 and target:IsValid() and !target.Norandomskin then
            if math.random(1,8) == 1 then
                target:SetSkin(1)
                target:SetBodygroup(4, 1)
            end
        end
    end)
end

local function Slicesoundandparticles(saw)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.1, function()
        local soundstring = "ambient/machines/slicer" .. math.random(1,4) .. ".wav"
        saw:EmitSound(soundstring, 100, math.random(95,105))
        for i = 6,1,-1 do
            local particleposition = saw:GetPos()
            PrecacheParticleSystem("blood_impact_yellow_01")
            ParticleEffect("blood_impact_yellow_01", particleposition, saw:GetAngles(), saw)
        end
    end)
end

local function ResetSawSpeed(saw, force)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.15, function()
        if saw:IsValid() then
            saw:GetPhysicsObject():EnableMotion(true)
            if saw:GetModel() != "models/props_junk/sawblade001a.mdl" then
                saw:GetPhysicsObject():SetVelocity(force * 0.022)
            else
                if saw.PuntSawVelocity then
                    saw:GetPhysicsObject():SetVelocity(saw.PuntSawVelocity)
                else
                    saw:GetPhysicsObject():SetVelocity(force * 0.02)
                end
                saw.StopCheckingSpeed = false
            end
        end
    end)
end

local function RemoveZombieDelayed(target, damageforce, saw)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.05, function()
        if target:IsValid() and target:Health() > 0 then
            if target:GetClass() == "npc_zombine" and IsValid(target:GetInternalVariable("m_hGrenade")) then
                if target:GetInternalVariable("m_hGrenade"):GetInternalVariable("m_flDetonateTime") > 0 then CreateZombineGrenade(target:GetAttachment(target:LookupAttachment("grenade_attachment")), damageforce, saw, target:GetInternalVariable("m_hGrenade"):GetInternalVariable("m_flDetonateTime")) end
            end
        end
    end)
    timer.Simple(timescale*0.1, function()
        if target:IsValid() then
            target:StopSound("npc/zombine/zombine_pain1.wav")
            target:StopSound("npc/zombine/zombine_pain2.wav")
            target:StopSound("npc/zombine/zombine_pain3.wav")
            target:StopSound("npc/zombine/zombine_pain4.wav")
            target:StopSound("npc/fast_zombie/breathe_loop1.wav")
            target:StopSound("npc/fast_zombie/gurgle_loop1.wav")
            target:StopSound("npc/zombie/zombie_pain1.wav")
            target:StopSound("npc/zombie/zombie_pain2.wav")
            target:StopSound("npc/zombie/zombie_pain3.wav")
            target:StopSound("npc/zombie/zombie_pain4.wav")
            target:StopSound("npc/zombie/zombie_pain5.wav")
            target:StopSound("npc/zombie/zombie_pain6.wav")
            target:Remove()
        end
    end)
end

local function CreateZombieOverlayBonemerge(zombie, ogbonemerge)
    if !IsValid(zombie) then return end
    local bonemergemodeltype = "models/animations/zombieclassiccut.mdl"
    if zombie:GetModel() == "models/zombie/zombie_soldier.mdl" then
        bonemergemodeltype = "models/animations/zombiesoldiercut.mdl"
    end
    if zombie:GetModel() == "models/zombie/zombie_soldier_torso.mdl" or zombie:GetSkin() >= 8 then
        bonemergemodeltype = "models/animations/zombiesoldiertorsocut.mdl"
    end
    if zombie:GetModel() == "models/zombie/fast.mdl" or zombie:GetModel() == "models/zombie/fast_torso.mdl"  then
        bonemergemodeltype = "models/animations/zombiefastcut.mdl"
    end
    if zombie:GetModel() == "models/zombie/poison.mdl" then
        bonemergemodeltype = "models/animations/zombiepoisoncut.mdl"
    end
    local bonemerge = ents.Create("headcrabbonemerge")
    bonemerge:SetParent(zombie)
    bonemerge:SetModel(bonemergemodeltype)
    bonemerge:Spawn()
    bonemerge:SetLightingOriginEntity(zombie)
    zombie:DeleteOnRemove(bonemerge)
    ogbonemerge:DeleteOnRemove(bonemerge)
    return bonemerge
end

local function CreateCustomHeadcrabBonemerge(zombie, model, skin)
    if !IsValid(zombie) then return end
    local bonemerge = ents.Create("headcrabbonemerge")
    bonemerge:SetParent(zombie)
    bonemerge:SetModel(model)
    bonemerge:SetSkin(skin)
    bonemerge:Spawn()
    bonemerge:SetLightingOriginEntity(zombie)
    zombie:DeleteOnRemove(bonemerge)
    bonemerge.istypecustomzombiebonemerge = true
    net.Start("setascustombonemerge")
    net.WriteEntity(bonemerge)
    net.WriteEntity(zombie)
    net.Broadcast()
    zombie.customzombiebonemerge = bonemerge
    zombie.iscustomheadcrabzombie = true
    CreateZombieOverlayBonemerge(zombie, bonemerge)
    return bonemerge
end

local function CreateHeadcrabBonemerge(zombie, model, skin)
    if !IsValid(zombie) then return end
    local bonemerge = ents.Create("headcrabbonemerge")
    bonemerge:SetParent(zombie)
    bonemerge:SetModel(model)
    bonemerge:SetSkin(skin)
    bonemerge:Spawn()
    bonemerge:SetLightingOriginEntity(zombie)
    zombie:DeleteOnRemove(bonemerge)
    return bonemerge
end

local function HandleFastZombieAbilities(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.15, function()
        if target:IsValid() then
            if target:GetClass() == "npc_fastzombie_torso" then return end
            if (target.customzombiebonemerge and GetConVarNumber("headcrabtakeover_allowfastzombierotting") == 1 and !target.headcrabtakeovertttplayerdata) or (IsValid(target.zombinegrenade) and target.zombinegrenade:GetMoveType() == MOVETYPE_NONE) then
                target:CapabilitiesRemove(CAP_MOVE_JUMP)
                target:CapabilitiesRemove(CAP_INNATE_RANGE_ATTACK1)
            else
                target:CapabilitiesAdd(CAP_MOVE_JUMP)
                target:CapabilitiesAdd(CAP_INNATE_RANGE_ATTACK1)
            end
        end
    end)
end

local function GoreSound(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.05, function()
        if IsValid(target) and target:Health() > 0 then
            for i = 0, target:GetBoneCount() - 1 do
                PrecacheParticleSystem("blood_impact_yellow_01")
                ParticleEffect("blood_impact_yellow_01", target:GetBoneMatrix(i):GetTranslation(), target:GetAngles(), target)
            end
            target:EmitSound( "physics/flesh/flesh_bloody_break.wav", 50, math.random(95,105))
        end
    end)
end

local function CreateFastZombineGrenade(target)
    if target:GetClass() == "npc_fastzombie" and target:GetSkin() == 1 then
        local timescale = game.GetTimeScale()
        if timescale == nil or timescale <= 0 then
            timescale = 1
        end
        local attachmenttable = target:GetAttachment(target:LookupAttachment("grenade_attachment"))
        local grenade = ents.Create("npc_grenade_frag")
        grenade:Spawn()
        grenade:SetMoveType(MOVETYPE_NONE)
        grenade:SetPos(attachmenttable.Pos)
        grenade:SetAngles(attachmenttable.Ang)
        grenade:SetParent(target, target:LookupAttachment("grenade_attachment"))
        grenade:SetOwner(target)
        grenade:SetSaveValue("m_flDamage", 200)
        grenade:Activate()
        grenade:Fire("SetTimer", "3", 0)
        grenade:SetCollisionGroup(COLLISION_GROUP_WORLD)
        grenade.punted = false
        grenade.PhysgunPickup = function()
            return false
        end
        grenade.GravGunPunt = function()
            grenade.punted = true
            return true
        end
        target.GravGunPickupAllowed = function(ent, ply)
            if ply:KeyDown(IN_ATTACK2) then
                if IsValid(grenade) and grenade:GetMoveType() == MOVETYPE_NONE and grenade:GetInternalVariable("m_flDetonateTime") > 0.2 and grenade:GetPos():DistToSqr(ply:GetPos()) <= 140000 then
                    ply:ConCommand("-attack2")
                    ply:ConCommand("+attack2")
                    grenade:SetParent(nil)
                    grenade:SetOwner(ply)
                    grenade:SetCollisionGroup(COLLISION_GROUP_WEAPON)
                    grenade:PhysicsInit(SOLID_VPHYSICS)
                    grenade:SetMoveType(MOVETYPE_VPHYSICS)
                    grenade:SetSolid(SOLID_VPHYSICS)
                    grenade:SetUseType(SIMPLE_USE)
                    grenade:SetPos(ply:GetShootPos() + ply:GetAimVector() * 35)
                    grenade:GetPhysicsObject():EnableMotion(true)
                    grenade:GetPhysicsObject():SetVelocity(ply:GetVelocity())
                    for i = 1, 50 do
                        timer.Simple(timescale*(0.01*i), function()
                            if IsValid(grenade) and IsValid(ply) and !grenade.punted then
                                grenade:SetPos(ply:GetShootPos() + ply:GetAimVector() * 35)
                            end
                        end)
                    end
                    timer.Simple(timescale*0.5, function()
                        if IsValid(ply) then
                            ply:ConCommand("-attack2")
                        end
                    end)
                    return true
                end
            end
            return false
        end
        target.zombinegrenade = grenade
    end
end

local function RestartFastSequence(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.01, function()
        if target:IsValid() and target:Health() > 0 then
            if !target.hasgrenade and !target.finishedpullinggrenade then
                target.moddedgrenadegesture = target:AddGestureSequence(target:LookupSequence("pullgrenade"), false)
            end
            if target.hasgrenade and target.finishedpullinggrenade then
                target.moddedgrenadegesture = target:AddGestureSequence(target:LookupSequence("grenade"), false)
            end
            if target.hasgrenade and (target.zombinegrenade == nil or IsValid(target.zombinegrenade) and target.zombinegrenade:GetMoveType() != MOVETYPE_NONE) then
                target.moddedgrenadegesture = nil
                target:RemoveAllGestures()
                return
            end
            RestartFastSequence(target)
        end
    end)
end

local function RestartCrouch(target, duration, starttime)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.01, function()
        if !game.SinglePlayer() then
            if target:IsValid() and target:Health() > 0 then
                if target.crouched then
                    target.moddedcrouchgesture = target:AddGestureSequence(target:LookupSequence("crouch"), false)
                    local progress = (CurTime() - starttime) / duration
                    local weight = math.min(math.sin(math.pi * progress), 0.5)
                    target:SetLayerWeight(target.moddedcrouchgesture, weight)
                end
                if !target.crouched then
                    target.moddedcrouchgesture = nil
                    target:RemoveAllGestures()
                    return
                end
            end
        end
        if target:IsValid() and target:Health() > 0 and target:GetEnemy() != nil and target.crouched then
            local angleyaw = (target:GetEnemy():GetPos() - target:GetPos()):GetNormalized():Angle().yaw
            local angle = target:GetAngles()
            angle.yaw = angleyaw
            target:SetAngles(angle)
        else
            return
        end
        RestartCrouch(target, duration, starttime)
    end)
end

local function DropFastZombGrenade(target, damage, saw)
    if target.zombinegrenade:GetInternalVariable("m_flDetonateTime") > 0 then
        local detonatetime = target.zombinegrenade:GetInternalVariable("m_flDetonateTime")
        target.zombinegrenade:Remove()
        target.zombinegrenade = nil
        CreateZombineGrenade(target:GetAttachment(target:LookupAttachment("grenade_attachment")), damage:GetDamageForce(), saw, detonatetime)
    end
end

local function FastZombCustomCheck(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.5, function()
        if IsValid(target) and target:Health() > 0 then
            if target:GetSequence() == target:LookupSequence("climbdismount") and target:IsSequenceFinished() then
                local previoushealth = target:Health()
                target:ClearSchedule()
                target:SetActivity(1)
                target:Spawn()
                HandleFastZombieAbilities(target)
                target:SetHealth(previoushealth)
            end
            if !target.crouched and target:LookupSequence("pullgrenade") != -1 and target:GetSkin() == 1 and (target:GetSequenceName(target:GetSequence()) == "idle" or target:GetSequenceName(target:GetSequence()) == "Run" or target:GetSequenceName(target:GetSequence()) == "walk_all") then
                if !target.hasusedgrenade and target:GetEnemy() != nil and target:GetPos():DistToSqr(target:GetEnemy():GetPos()) <= 100000 and math.random(1,10) == 1 and target.moddedgrenadegesture == nil then
                    target:CapabilitiesRemove(CAP_MOVE_JUMP)
                    target:CapabilitiesRemove(CAP_INNATE_RANGE_ATTACK1)
                    target.finishedpullinggrenade = false
                    target.hasusedgrenade = true
                    target.moddedgrenadegesture = target:AddGestureSequence(target:LookupSequence("pullgrenade"), false)
                    if !game.SinglePlayer() then
                        RestartFastSequence(target)
                    end
                    timer.Simple(timescale*0.3, function()
                        if IsValid(target) and target:Health() > 0 then
                            CreateFastZombineGrenade(target)
                            local number = math.random(1,2)
                            local pitch = math.random(95,105)
                            target:EmitSound("grenadescream" .. number .. ".wav", 85, pitch)
                            target:EmitSound("grenadescream" .. number .. ".wav", 85, pitch, 0.5)
                        end
                    end)
                    timer.Simple(timescale*0.7, function()
                        if IsValid(target) and target:Health() > 0 then
                            target.finishedpullinggrenade = true
                            target.hasgrenade = true
                            target.moddedgrenadegesture = nil
                            target:RemoveAllGestures()
                            target.moddedgrenadegesture = target:AddGestureSequence(target:LookupSequence("grenade"), false)
                        end
                    end)
                end
            end
            if target:LookupSequence("crouch") != -1 and (target:GetSequenceName(target:GetSequence()) == "idle" or target:GetSequenceName(target:GetSequence()) == "Run" or target:GetSequenceName(target:GetSequence()) == "walk_all") then
                if target.lasttimeattacked == nil then target.lasttimeattacked = CurTime() end
                if bit.band(target:CapabilitiesGet(), CAP_INNATE_RANGE_ATTACK1) != 0 and !target.crouched and target.moddedgrenadegesture == nil and target:GetEnemy() != nil and target:GetPos():DistToSqr(target:GetEnemy():GetPos()) <= 65000 and math.random(1,2) == 1 and CurTime() - target.lasttimeattacked >= 2 then
                    target:SetCondition(67)
                    local duration = math.Rand(0.5,0.8)
                    target.moddedcrouchgesture = target:AddGestureSequence(target:LookupSequence("crouch"))
                    target:SetLayerDuration(target.moddedcrouchgesture, duration)
                    target:SetLayerBlendIn(target.moddedcrouchgesture, 0.7)
                    target:SetLayerBlendOut(target.moddedcrouchgesture, 0.45)
                    target:SetLayerWeight(target.moddedcrouchgesture, 0.8)
                    target.crouched = true
                    local number = math.random(1,2)
                    local pitch = math.random(95,105)
                    target:EmitSound("crouched" .. number .. ".wav", 85, pitch)
                    target:EmitSound("crouched" .. number .. ".wav", 85, pitch, 0.5)
                    RestartCrouch(target, duration, CurTime())
                    timer.Simple(timescale*duration, function()
                        if IsValid(target) and target:Health() > 0 then
                            target:SetCondition(68)
                            target:RemoveAllGestures()
                            target.lasttimeattacked = CurTime()
                            target.crouched = false
                            target.moddedcrouchgesture = nil
                            if target:GetEnemy() != nil then
                                target:SetSchedule(SCHED_RANGE_ATTACK1)
                            end
                        end
                    end)
                end
            end
            if target:GetSequenceName(target:GetSequence()) == "BR2_Roar" or target:GetSequenceName(target:GetSequence()) == "LeapStrike" then
                target.lasttimeattacked = CurTime()
            end
            if target.hasgrenade and (target.zombinegrenade == nil or IsValid(target.zombinegrenade) and target.zombinegrenade:GetMoveType() != MOVETYPE_NONE) then
                target:RemoveAllGestures()
                target.moddedgrenadegesture = nil
                HandleFastZombieAbilities(target)
            end
            FastZombCustomCheck(target)
        end
        if IsValid(target) and target:Health() <= 0 then
            timer.Simple(timescale*1, function()
                if IsValid(target) and target:Health() <= 0 then
                    target:Remove()
                end
            end)
        end
    end)
end

local function RotFastZombie(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*math.max(math.random(200,400)*GetConVarNumber("headcrabtakeover_fastzombierotspeedmultiplier"), 5), function()
        if target:IsValid() then
            if !target.iscustomheadcrabzombie then return end
            if target.headcrabtakeovertttplayerdata then return end
            if target:Health() <= 0 then return end
            if GetConVarNumber("headcrabtakeover_allowzombines") == 1 and target.customzombiebonemerge and (target.customzombiebonemerge:GetModel() == "models/zombie/zombie_soldier.mdl" or target.customzombiebonemerge:GetModel() == "models/zombie/zombie_soldier_torso.mdl" or (string.find(target.customzombiebonemerge:GetModel(), "combine") and !string.find(target.customzombiebonemerge:GetModel(), "civilprotection"))) then
                target:SetSkin(1)
                target:SetBodygroup(4, 1)
            end
            if target.customzombiebonemerge then
                if !IsValid(target) then return end
                if target:Health() <= 0 then return end
                target.customzombiebonemerge:Remove()
                target.customzombiebonemerge = nil
                target.iscustomheadcrabzombie = false
                net.Start("resetfastzombie")
                net.WriteEntity(target)
                net.Broadcast()
                target:SetMaterial("")
            end
            GoreSound(target)
            HandleFastZombieAbilities(target)
        end
    end)
end

local function CreateServerTorsoGib(victim, force, crabsurvived)
    local torsomodeltype = "models/zombie/classic_torso.mdl"
    if victim:GetClass() == "npc_fastzombie" then
        torsomodeltype = "models/zombie/fast_torso.mdl"
    end
    if victim:GetClass() == "npc_zombine" then
        torsomodeltype = "models/zombie/zombie_soldier_torso.mdl"
    end
    local servertorso = ents.Create("prop_ragdoll")
    servertorso:SetModel(torsomodeltype)
    servertorso:SetPos(victim:GetPos() + Vector(0, 0, 5))
    servertorso:SetAngles(victim:GetAngles())
    servertorso:SetSkin(victim:GetSkin())
    servertorso:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
    servertorso:Spawn()
    servertorso:Activate()
    if victim.iscustomheadcrabzombie then
        servertorso.storedbodygroupdata = victim.storedbodygroupdata
        local modeltouse = victim.customzombiebonemerge:GetModel()
        if victim:GetClass() == "npc_fastzombie" and (victim.customzombiebonemerge:GetModel() == "models/zombie/classic.mdl" or victim.customzombiebonemerge:GetModel() == "models/zombie/zombie_soldier.mdl") then
            if victim.customzombiebonemerge:GetModel() == "models/zombie/classic.mdl" then
                modeltouse = "models/zombie/classic_torso.mdl"
                servertorso.dontscalebonemerge = true
            end
            if victim.customzombiebonemerge:GetModel() == "models/zombie/zombie_soldier.mdl" then
                modeltouse = "models/zombie/zombie_soldier_torso.mdl"
            end
        end
        local custombonemerge = CreateCustomHeadcrabBonemerge(servertorso, modeltouse, victim.customzombiebonemerge:GetSkin())
        custombonemerge.storedcustomplayercolor = victim.customzombiebonemerge.storedcustomplayercolor
        net.Start("customstorebodygroups")
        net.WriteEntity(servertorso)
        net.WriteTable(servertorso.storedbodygroupdata)
        net.Broadcast()
        net.Start("customstoreplayercolor")
        net.WriteEntity(custombonemerge)
        net.WriteVector(victim.customzombiebonemerge.storedcustomplayercolor)
        net.Broadcast()
    end
    if torsomodeltype == "models/zombie/fast_torso.mdl" then
        FixFastzombRag(servertorso)
    end
    if victim.headcrabtakeovertttplayerdata != nil then
        servertorso.headcrabtakeovertttplayerdata = victim.headcrabtakeovertttplayerdata
        servertorso:SetCollisionGroup(GetConVarNumber("ttt_ragdoll_collide") == 1 and COLLISION_GROUP_WEAPON or COLLISION_GROUP_DEBRIS_TRIGGER)

        servertorso.player_ragdoll = true
        servertorso.sid64 = servertorso.headcrabtakeovertttplayerdata.playerent:SteamID64()

        servertorso.sid = servertorso.headcrabtakeovertttplayerdata.playerent:SteamID()
        servertorso.uqid = servertorso.headcrabtakeovertttplayerdata.playerent:UniqueID()

        CORPSE.SetPlayerNick(servertorso, servertorso.headcrabtakeovertttplayerdata.playerent)
        CORPSE.SetFound(servertorso, false)
        CORPSE.SetCredits(servertorso, servertorso.headcrabtakeovertttplayerdata.playercredits)

        servertorso.equipment = servertorso.headcrabtakeovertttplayerdata.playerequipment
        servertorso.was_role = servertorso.headcrabtakeovertttplayerdata.playerrole
        servertorso.bomb_wire = servertorso.headcrabtakeovertttplayerdata.playerbombwire
        servertorso.kills = servertorso.headcrabtakeovertttplayerdata.playerkills
    end
    local torsoforce = force * 0.2
    torsoforce.z = torsoforce.z * 5
    for i = 0, servertorso:GetPhysicsObjectCount() - 1 do
        local bone = servertorso:GetPhysicsObjectNum(i)
        if (IsValid(bone)) then
            bone:ApplyForceCenter(torsoforce * math.random(0.1, 0.15))
        end
    end
    local headcrabattached = math.random(1, 2) == 1
    if !crabsurvived then
        if headcrabattached then
            local headcrabmodel = "models/headcrabclassic.mdl"
            if victim:GetClass() == "npc_fastzombie" then
                headcrabmodel = "models/headcrab.mdl"
            end
            timer.Simple(0.05, function()
                if IsValid(servertorso) then
                    net.Start("createheadcrablone")
                    net.WriteEntity(servertorso)
                    net.WriteVector(force)
                    net.WriteString(headcrabmodel)
                    net.Broadcast()
                end
            end)
        else
            servertorso:SetBodygroup(1, 1)
        end
    end
end

local function ManualDeathNotice(target, attacker, inflictor, targetplayerteam)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    local attackerteam = -1
    local targetteam = -1
    if attacker == nil then
        attacker = "worldspawn"
    end
    if inflictor == nil then
        inflictor = attacker
        if isentity(inflictor) and inflictor:GetActiveWeapon() != nil then
            inflictor = inflictor:GetActiveWeapon():GetClass()
        end
    else
        inflictor = inflictor:GetClass()
    end
    if attacker != "worldspawn" and attacker:IsPlayer() then
        attackerteam = math.BinToInt(util.TypeToString(attacker:Team()))
        attacker = attacker:GetName()
    else
        if attacker != "worldspawn" then
            attacker = attacker:GetClass()
        end
    end
    if target:IsPlayer() then
        target = util.TypeToString(target:GetName())
        targetteam = math.BinToInt(util.TypeToString(targetplayerteam))
    else
        target = util.TypeToString(target:GetClass())
    end
    attacker = util.TypeToString(attacker)
    inflictor = util.TypeToString(inflictor)
    attackerteam = util.TypeToString(attackerteam)
    targetteam = util.TypeToString(targetteam)
    timer.Simple(timescale*0.2, function()
        net.Start( "manualdeathnotice" )
        net.WriteString(target)
        net.WriteString(attacker)
        net.WriteString(inflictor)
        net.WriteString(attackerteam)
        net.WriteString(targetteam)
        net.Broadcast()
    end)
end

local function GetWakeSeq(zombie)
    for _, seq in ipairs(zombie:GetChildren()) do
        if seq:GetClass() == "scripted_sequence" then
            return seq
        end
    end
    return nil
end

local function CheckPlayer(man)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(0.8, function()
        if !IsValid(man) then return end
        if GetConVarNumber("ai_disabled") == 1 then man:Remove() return end
        local finish = false
        if man:GetPos() != Vector(-188.227737, 2350, -9343.968750) then
            man:Remove()
            return
        end
        for k, ent in pairs(ents.GetAll()) do
            if ent and IsValid(ent) and ent.AddEntityRelationship then
                ent:AddEntityRelationship(man, 4, 0)
                if ent.GetEnemy and ent:GetEnemy() == man then
                    ent:SetEnemy(nil)
                end
            end
        end
        for k, ent in pairs(ents.FindInSphere(man:GetPos(), 3500)) do
            if ent and IsValid(ent) then
                if ent:IsPlayer() and ent:GetMoveType() == 8 then
                    finish = true
                end
            end
        end
        for k, ent in pairs(ents.FindInSphere(man:GetPos(), 1300)) do
            if ent and IsValid(ent) then
                if ent:IsPlayer() and ent:GetMoveType() != 8 then
                    finish = true
                end
            end
        end
        for k, player in ipairs(ents.FindByClass("player")) do
            if player:GetPos().y > (man:GetPos().y - 400) then
                finish = true
            end
            if player:KeyDown(IN_ZOOM) and man:VisibleVec(player:GetPos()) then
                local chance = math.random(1,100)
                if chance >= 20 and math.acos(player:GetAimVector():Dot((Vector(-188.227737, 2350, -9343.968750) - player:EyePos()):GetNormalized())) * (180 / math.pi) <= 2 then finish = true end
                if !finish and math.acos(player:GetAimVector():Dot((Vector(-188.227737, 2350, -9343.968750) - player:EyePos()):GetNormalized())) * (180 / math.pi) <= 17 and chance >= 90 then finish = true end
            end
        end
        if !IsValid(man) then return end
        if finish == true then
            man:SetSaveValue("m_vecLastPosition", Vector(-348.936371, 2350, -9279.968750))
            man:SetSchedule(SCHED_FORCED_GO)
            timer.Simple(1.7, function()
                if man:IsValid() then
                    man:Remove()
                end
            end)
            return
        end
        CheckPlayer(man)
    end)
end

local function SpawnCrab(zombie, isonfire)
    local headcrabtype = "npc_headcrab"
    local upmodifier = 43
    local crabreleasecount = 1
    if zombie:GetClass() == "npc_poisonzombie" then
        headcrabtype = "npc_headcrab_poison"
        if zombie:GetBodygroup(2) == 1 and math.random(1,2) == 1 then
            zombie:SetBodygroup(2, 0)
            crabreleasecount = crabreleasecount + 1
        end
        if zombie:GetBodygroup(3) == 1 and math.random(1,2) == 1 then
            zombie:SetBodygroup(3, 0)
            crabreleasecount = crabreleasecount + 1
        end
        if zombie:GetBodygroup(4) == 1 and math.random(1,2) == 1 then
            zombie:SetBodygroup(4, 0)
            crabreleasecount = crabreleasecount + 1
        end
    end
    if zombie:GetClass() == "npc_fastzombie" or zombie:GetClass() == "npc_fastzombie_torso"  then
        headcrabtype = "npc_headcrab_fast"
    end
    if string.find(zombie:GetModel(), "torso") then
        upmodifier = 15
    end
    if string.find(zombie:GetModel(), "classic") and !string.find(zombie:GetModel(), "torso")then
        upmodifier = 50
    end
    for i = crabreleasecount,1,-1 do
        local position = zombie:GetPos() + zombie:GetAngles():Up() * upmodifier + zombie:GetAngles():Forward() * 2
        if headcrabtype == "npc_headcrab_poison" and crabreleasecount > 1 then
            position = position + Vector(0, 0, (i * 15)) + Vector(0, 0, -45)
        end
        local headcrab = ents.Create(headcrabtype)
        headcrab:SetKeyValue("Spawnflags", 1280)
        headcrab:SetPos(position)
        headcrab:SetAngles (zombie:GetAngles())
        headcrab:Spawn()
        headcrab:Activate()
        headcrab:SetColor(zombie:GetColor())
        headcrab:SetOwner(zombie)
        timer.Simple(0.03, function()
            if headcrab:IsValid() then
                headcrab:SetPos(position)
                if isonfire then
                    headcrab:Ignite(2)
                end
            end
        end)
    end
    return headcrab
end

local function KillZombie(zombie, spawncrab, attacker, inflictor)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    zombie:SetHealth(5000000)
    timer.Simple(timescale*0.02, function()
        if zombie:IsValid() then
            if spawncrab then
                zombie:SetBodygroup(1, 0)
                SpawnCrab(zombie, zombie:IsOnFire())
                zombie:SetShouldServerRagdoll(false)
                if zombie.headcrabtakeovertttplayerdata then
                    zombie:SetShouldServerRagdoll(true)
                end
                if GetConVarNumber("ai_serverragdolls") == 1 and !zombie.headcrabtakeovertttplayerdata then
                    zombie:SetShouldServerRagdoll(true)
                    zombie.nocollideragdoll = true
                end
            end
            if zombie:GetClass() == "npc_poisonzombie" then
                if zombie:GetBodygroup(5) == 1 then
                    timer.Simple(timescale*0.02, function()
                        if IsValid(zombie) then
                            net.Start("createheadcrablone")
                            net.WriteEntity(zombie)
                            net.WriteVector(Vector(math.Rand(-12, 12), math.Rand(-12, 12), math.Rand(-4, 12)) * math.random(5,15))
                            net.WriteString("models/headcrabblack.mdl")
                            net.Broadcast()
                        end
                    end)
                end
                if !spawncrab then
                    if math.random(1,2) == 1 then
                        zombie:SetBodygroup(1, 0)
                        timer.Simple(timescale*0.02, function()
                            if IsValid(zombie) then
                                net.Start("createheadcrablone")
                                net.WriteEntity(zombie)
                                net.WriteVector(Vector(math.Rand(-35, 35), math.Rand(-35, 35), math.Rand(5, 27)) * math.random(5,15))
                                net.WriteString("models/headcrabblack.mdl")
                                net.Broadcast()
                            end
                        end)
                    end
                end
            end
            timer.Simple(timescale*0.04, function()
                if IsValid(zombie) then
                    zombie:SetHealth(4)
                    zombie:TakeDamage(7, attacker, inflictor)
                end
            end)
        end
    end)
    timer.Simple(timescale*2, function()
        if zombie:IsValid() then
            zombie:Remove()
        end
    end)
end

local function ResetSkin(zombie, skin)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.1, function()
        if zombie:IsValid() then
            zombie:SetSkin(skin)
        end
    end)
end

local function GetZombieSkin(zombietype, victimmodel, victimskin)
    if zombietype == "npc_zombie" then
        if string.find(victimmodel, "group01") then return 1 end
        if string.find(victimmodel, "group02") then
            if string.find(victimmodel, "/female_02") or string.find(victimmodel, "/female_04") or string.find(victimmodel, "/female_07") then return 7 end
            if string.find(victimmodel, "/male_02") or string.find(victimmodel, "/male_04") or string.find(victimmodel, "/male_06") or string.find(victimmodel, "/male_08") then return 7 end
            return 1
        end
        if string.find(victimmodel, "group03/") then
            if string.find(victimmodel, "/female_01") or string.find(victimmodel, "/female_03") or string.find(victimmodel, "/female_06") or string.find(victimmodel, "/female_07") or string.find(victimmodel, "/female_07") then return 2 end
            if string.find(victimmodel, "/male_01") or string.find(victimmodel, "/male_04") or string.find(victimmodel, "/male_06") or string.find(victimmodel, "/male_08") or string.find(victimmodel, "/male_09") then return 2 end
            return 3
        end
        if string.find(victimmodel, "group03m/") then
            if string.find(victimmodel, "/female_01") or string.find(victimmodel, "/female_03") or string.find(victimmodel, "/female_07") then return 4 end
            if string.find(victimmodel, "/male_01") or string.find(victimmodel, "/male_03") or string.find(victimmodel, "/male_05") or string.find(victimmodel, "/male_07") or string.find(victimmodel, "/male_09") then return 4 end
            return 5
        end
        if string.find(victimmodel, "police") or string.find(victimmodel, "combine") or string.find(victimmodel, "civilprotection") then
            return 6
        end
        return 7
    end
    if zombietype == "npc_zombine" then
        if string.find(victimmodel, "minerva/halflife2/combine/soldier.mdl") or string.find(victimmodel, "minerva/halflife2/combine/elite.mdl") then
            // Non-dirty skins
            if victimskin == 0 or victimskin == 1 then return 0 end
            if victimskin == 2 or victimskin == 3 then return 1 end
            if victimskin == 4 or victimskin == 5 or victimskin == 6 or victimskin == 7 then return 2 end

            // Dirty skins
            if victimskin == 8 or victimskin == 9 then return 0 end
            if victimskin == 10 or victimskin == 11 then return 1 end
            if victimskin == 12 or victimskin == 13 or victimskin == 14 or victimskin == 15 then return 2 end
        end
        if string.find(victimmodel, "minerva/halflife2/combine/elite.mdl") then return 3 end
        if string.find(victimmodel, "prison") then return 2 end
        if victimskin == 1 then return 1 end
        if (string.find(victimmodel, "super") or string.find(victimmodel, "elite")) then return 3 end
        return 4
    end
    if zombietype == "npc_poisonzombie" then
        if string.find(victimmodel, "group01") or string.find(victimmodel, "group02") then return 4 end
        if string.find(victimmodel, "group03/") then return 1 end
        if string.find(victimmodel, "group03m/") then return 2 end
        if string.find(victimmodel, "police") or string.find(victimmodel, "civilprotection") then return 3 end
        if string.find(victimmodel, "minerva/halflife2/combine/soldier.mdl") then
            // Non-dirty skins
            if victimskin == 0 or victimskin == 1 then return 5 end
            if victimskin == 2 or victimskin == 3 then return 6 end
            if victimskin == 4 or victimskin == 5 or victimskin == 6 or victimskin == 7 then return 7 end

            // Dirty skins
            if victimskin == 8 or victimskin == 9 then return 5 end
            if victimskin == 10 or victimskin == 11 then return 6 end
            if victimskin == 12 or victimskin == 13 or victimskin == 14 or victimskin == 15 then return 7 end
        end
        if string.find(victimmodel, "minerva/halflife2/combine/elite.mdl") then return 8 end
        if string.find(victimmodel, "combine") then
            if string.find(victimmodel, "prison") then return 7 end
            if victimskin == 1 then return 6 end
            if (string.find(victimmodel, "super") or string.find(victimmodel, "elite")) then return 8 end
            return 9
        end
        return 4
    end
    return 0
end

local function CheckTarget(victim, ignoreconvar, checkisgeneralenemy)
    if GetConVarNumber("ai_disabled") == 1 then return end
    if GetConVarNumber("headcrabtakeover_allowtakeover") == 0 and !ignoreconvar then return false end
    if victim:GetClass() == "takeoverhitbox" or victim:GetClass() == "takeoveranimation" or victim:GetClass() == "headcrabbonemerge" or victim:GetClass() == "obj_vj_bullseye" then return false end
    local IsTargetablePlayer = victim:IsPlayer() and GetConVarNumber("ai_ignoreplayers") == 0 and victim:GetObserverMode() == 0 and victim:Alive()
    if !checkisgeneralenemy then
        return (victim:IsNPC() or victim:IsNextBot() or IsTargetablePlayer) and (string.find(victim:GetClass(), "antlion") == nil and string.find(victim:GetClass(), "headcrab") == nil and string.find(victim:GetClass(), "zomb") == nil and string.find(victim:GetClass(), "barnacle") == nil and string.find(victim:GetClass(), "rollermine") == nil and string.find(victim:GetClass(), "clawscanner") == nil and string.find(victim:GetClass(), "manhack") == nil and string.find(victim:GetClass(), "hunter") == nil and string.find(victim:GetClass(), "vortigaunt") == nil)
    else
        return (victim:IsNPC() or victim:IsNextBot() or IsTargetablePlayer) and (string.find(victim:GetClass(), "headcrab") == nil and string.find(victim:GetClass(), "zomb") == nil)
    end
end

local function SetSlumpAngle(seq, zombie, angle, sequencetype)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*0.1, function()
        if !seq:IsValid() then
            return
        end
        if !zombie:IsValid() then
            return
        end
        if seq:GetAngles() == angle and zombie:GetAngles() == angle  then
            return
        end
        local sequenceID = zombie:LookupSequence(sequencetype)
        if zombie:IsValid() and seq:IsValid() then
            if zombie:GetSequence() == sequenceID  then
                seq:SetAngles(angle)
                zombie:SetAngles(angle)
            end
        end
        SetSlumpAngle(seq, zombie, angle, sequencetype)
    end)
end

local function PreventWakeTimer(zombie)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    zombie.preventwake = true
    timer.Simple(3, function()
        if !zombie:IsValid() then return end
        zombie.preventwake = false
    end)
end

local function CheckForEnemiesSlump(seq, zombie, sequencetype, sequencerisetype)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*1, function()
        if !seq:IsValid() then
            return
        end
        if !IsValid(zombie) then
            zombie:Remove()
            return
        end
        local sequenceidleID = zombie:LookupSequence(sequencetype)
        local sequenceriseID = zombie:LookupSequence(sequencerisetype)
        if zombie:IsValid() and zombie:GetSequence() == sequenceidleID then
            if zombie:Health() < zombie:GetMaxHealth() then
                zombie:SetHealth(math.min(zombie:Health() + 1, zombie:GetMaxHealth()))
            end
        end
        if zombie:IsValid() and zombie:GetSequence() == sequenceriseID then
            if zombie:GetClass() == "npc_poisonzombie" and !zombie.playedalertsound then
                zombie:StopSound("npc/zombie_poison/pz_pain1.wav")
                zombie:StopSound("npc/zombie_poison/pz_pain2.wav")
                zombie:StopSound("npc/zombie_poison/pz_pain3.wav")
                if math.random(1,2) == 1 then
                    zombie:EmitSound( "npc/zombie_poison/pz_alert1.wav", 80, math.random(95,105))
                else
                    zombie:EmitSound( "npc/zombie_poison/pz_alert2.wav", 80, math.random(95,105))
                end
                zombie.playedalertsound = true
            end
            for k, ent in pairs(ents.FindInSphere(zombie:GetPos(), 350)) do
                if ent and IsValid(ent) then
                    local wakesequence = GetWakeSeq(ent)
                    if wakesequence and wakesequence:IsValid() then
                        if ent:GetSequence() != wakesequence:GetInternalVariable("m_iszPlay") and !ent.preventwake then
                            wakesequence:Fire( "BeginSequence", "", 0 )
                            zombie.VJ_NoTarget = false
                            local wakesequencezombie = wakesequence:GetParent()
                            if zombie:GetEnemy() != nil then
                                wakesequencezombie:UpdateEnemyMemory(zombie:GetEnemy(), zombie:GetEnemy():GetPos())
                            end
                            timer.Simple(timescale*1.8, function()
                                if !wakesequencezombie:IsValid() then return end
                                if wakesequencezombie:GetClass() != "npc_fastzombie" then return end
                                wakesequencezombie:SetNPCState(NPC_STATE_COMBAT)
                            end)
                        end
                    end
                end
            end
        end
        if zombie:IsValid() and seq:IsValid() and zombie:GetSequence() != sequenceriseID then
            zombie.VJ_NoTarget = true
            zombie:StopSound("npc/zombie_poison/pz_breathe_loop1.wav")
            zombie:StopSound("npc/zombie_poison/pz_breathe_loop2.wav")
            zombie:StopSound("npc/fast_zombie/breathe_loop1.wav")
            zombie:StopSound("npc/fast_zombie/gurgle_loop1.wav")
            local sequenceID = zombie:LookupSequence(sequencetype)
            if zombie:GetSequence() == sequenceID then
                zombie.playedalertsound = false
                for k, ent in pairs(ents.FindInSphere(zombie:GetPos(), 200)) do
                    if ent and IsValid(ent) then
                        if CheckTarget(ent, true, true) and !zombie.preventwake then
                            seq:Fire( "BeginSequence", "", 0 )
                            zombie.VJ_NoTarget = false
                            zombie:UpdateEnemyMemory(ent, ent:GetPos())
                            if zombie:GetClass() == "npc_poisonzombie" then
                                if math.random(1,2) == 1 then
                                    zombie:EmitSound( "npc/zombie_poison/pz_alert1.wav", 80, math.random(95,105))
                                else
                                    zombie:EmitSound( "npc/zombie_poison/pz_alert2.wav", 80, math.random(95,105))
                                end
                                zombie.playedalertsound = true
                            end
                            timer.Simple(timescale*1.8, function()
                                if !zombie:IsValid() then return end
                                if !zombie:GetClass() != "npc_fastzombie" then return end
                                zombie:SetNPCState(NPC_STATE_COMBAT)
                            end)
                        end
                    end
                end
            end
            CheckForEnemiesSlump(seq, zombie, sequencetype, sequencerisetype)
        end
    end)
end

local function HandlePoisonZombieThrowCapability(poisonzombie, increase, freshzombie, originalcrabcount)
    local poisoncrabcount = poisonzombie:GetInternalVariable("m_nCrabCount")
    if freshzombie then
        poisoncrabcount = 0
    end
    if originalcrabcount != nil then
        poisoncrabcount = originalcrabcount
    end
    if increase and poisonzombie:GetBodygroup(5) == 0 then
        poisoncrabcount = poisoncrabcount + 1
        GoreSound(poisonzombie)
    end
    if poisoncrabcount == 0 then
        poisonzombie:SetSaveValue("m_nCrabCount", 0)
        poisonzombie:CapabilitiesRemove(CAP_INNATE_RANGE_ATTACK1)
        poisonzombie:CapabilitiesRemove(CAP_INNATE_RANGE_ATTACK2)
        poisonzombie:SetBodygroup(2, 0)
        poisonzombie:SetBodygroup(3, 0)
        poisonzombie:SetBodygroup(4, 0)
    else
        poisonzombie:SetSaveValue("m_nCrabCount", poisoncrabcount)
        poisonzombie:CapabilitiesAdd(CAP_INNATE_RANGE_ATTACK1)
        poisonzombie:CapabilitiesAdd(CAP_INNATE_RANGE_ATTACK2)
        poisonzombie:SetBodygroup(2, 0)
        poisonzombie:SetBodygroup(3, 0)
        poisonzombie:SetBodygroup(4, 0)
        if poisoncrabcount == 1 then
            poisonzombie:SetBodygroup(3, 1)
            poisonzombie:SetSaveValue("m_bCrabs", {false, true, false})
        end
        if poisoncrabcount == 2 then
            poisonzombie:SetBodygroup(3, 1)
            if math.random(1,2) == 1 then
                poisonzombie:SetBodygroup(2, 1)
                poisonzombie:SetSaveValue("m_bCrabs", {true, true, false})
            else
                poisonzombie:SetBodygroup(4, 1)
                poisonzombie:SetSaveValue("m_bCrabs", {false, true, true})
            end
        end
        if poisoncrabcount == 3 then
            poisonzombie:SetBodygroup(3, 1)
            poisonzombie:SetBodygroup(4, 1)
            poisonzombie:SetBodygroup(2, 1)
            poisonzombie:SetSaveValue("m_bCrabs", {true, true, true})
        end
    end
end

local function DoSlump(zombie, sequencetype, sequencerisetype, angle, moveforwards)
    local wakesequence = GetWakeSeq(zombie)
    if wakesequence and wakesequence:IsValid() then
        return
    end
    local sequence = ents.Create( "scripted_sequence" )
    local zombiename = zombie:GetClass() .. zombie:EntIndex()
    local previoushealth = zombie:Health()
    local positiontoset = zombie:GetPos()
    local originalcrabcount = nil
    local originalgrenadecount = nil
    if !IsValid(zombie) or zombie:Health() == 0 then return end
    if moveforwards then
        positiontoset = positiontoset + (angle:Forward() * 10)
    end
    if(zombie:GetClass() == "npc_poisonzombie") then
        originalcrabcount = zombie:GetInternalVariable("m_nCrabCount")
    end
    if(zombie:GetClass() == "npc_zombine") then
        originalgrenadecount = zombie:GetInternalVariable("m_iGrenadeCount")
    end
    zombie:SetName(zombiename)
    zombie:Spawn()
    sequence:SetName(zombiename .. "_slump")
    sequence:SetKeyValue("spawnflags", "624")
    sequence:SetKeyValue("m_iszEntity", zombiename)
    sequence:SetKeyValue("m_iszIdle", sequencetype)
    sequence:SetKeyValue("m_fMoveTo", "4")
    sequence:SetKeyValue("m_iszPlay", sequencerisetype)
    sequence:SetPos(positiontoset)
    sequence:Spawn()
    sequence:Activate()
    sequence:SetParent(zombie)
    sequence:SetMoveParent(zombie)
    PreventWakeTimer(zombie)
    CheckForEnemiesSlump(sequence, zombie, sequencetype, sequencerisetype)
    SetSlumpAngle(sequence, zombie, angle, sequencetype)
    zombie:SetHealth(previoushealth)
    if originalcrabcount != nil then
        zombie:SetSaveValue("m_nCrabCount", originalcrabcount)
    end
    if originalgrenadecount != nil then
        zombie:SetSaveValue("m_iGrenadeCount", originalgrenadecount)
    end
    if(zombie:GetClass() == "npc_poisonzombie") then
        HandlePoisonZombieThrowCapability(zombie, false, false, originalcrabcount)
    end
    if(zombie:GetClass() == "npc_fastzombie") then
        HandleFastZombieAbilities(zombie)
    end
end

local function TryWallSlump (zombie, trace)
    if !zombie:IsValid() then return end
    zombie:SetSaveValue("m_vecLastPosition", trace.HitPos)
    zombie:SetSchedule(SCHED_FORCED_GO)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    local zombieangle = zombie:GetAngles()
    local sequencetype = "slump_a"
    local sequencerisetype = "slumprise_a"
    if zombie:GetClass() == "npc_fastzombie" then
        sequencetype = "slump_c"
        sequencerisetype = "slumprise_c"
        if zombie:LookupSequence("slump_c") == -1 then
            zombie:SetSchedule(SCHED_IDLE_WANDER)
            return
        end
    end
    timer.Simple(timescale*0.7, function()
        if zombie:IsValid() then
            zombieangle = zombie:GetAngles()
            zombieangle.yaw = trace.HitNormal:Angle().yaw + math.Rand(-4, 4)
            if TryHitWorld(zombie, 30, false).HitWorld then
                DoSlump(zombie, sequencetype, sequencerisetype, zombieangle, true)
                return
            end
        end
    end)
    timer.Simple(timescale*2.3, function()
        if zombie:IsValid() then
            zombieangle = zombie:GetAngles()
            zombieangle.yaw = trace.HitNormal:Angle().yaw + math.Rand(-4, 4)
            if TryHitWorld(zombie, 30, false).HitWorld then
                DoSlump(zombie, sequencetype, sequencerisetype, zombieangle, true)
                return
            end
        end
    end)
    timer.Simple(timescale*3.5, function()
        if zombie:IsValid() then
            zombieangle = zombie:GetAngles()
            zombieangle.yaw = trace.HitNormal:Angle().yaw + math.Rand(-4, 4)
            if TryHitWorld(zombie, 30, false).HitWorld then
                DoSlump(zombie, sequencetype, sequencerisetype, zombieangle, true)
                return
            end
        end
    end)
    timer.Simple(timescale*5, function()
        if zombie:IsValid() and zombie:GetClass() != "npc_poisonzombie" then
            local wakesequence = GetWakeSeq(zombie)
            if wakesequence and wakesequence:IsValid() then
                return
            end
            zombie:SetSchedule(SCHED_IDLE_WANDER)
        end
    end)
    timer.Simple(timescale*6, function()
        if zombie:IsValid() and zombie:GetClass() == "npc_poisonzombie" then
            zombieangle = zombie:GetAngles()
            zombieangle.yaw = trace.HitNormal:Angle().yaw + math.Rand(-4, 4)
            if TryHitWorld(zombie, 30, false).HitWorld then
                DoSlump(zombie, sequencetype, sequencerisetype, zombieangle, true)
                return
            end
        end
    end)
    timer.Simple(timescale*8, function()
        if zombie:IsValid() and zombie:GetClass() == "npc_poisonzombie" then
            zombieangle = zombie:GetAngles()
            zombieangle.yaw = trace.HitNormal:Angle().yaw + math.Rand(-4, 4)
            if TryHitWorld(zombie, 30, false).HitWorld then
                DoSlump(zombie, sequencetype, sequencerisetype, zombieangle, true)
                return
            end
        end
    end)
    timer.Simple(timescale*8.5, function()
        if zombie:IsValid() and zombie:GetClass() == "npc_poisonzombie" then
            local wakesequence = GetWakeSeq(zombie)
            if wakesequence and wakesequence:IsValid() then
                return
            end
            zombie:SetSchedule(SCHED_IDLE_WANDER)
        end
    end)
end

local function HandleSlump(zombie)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    local multiplier = 1
    if zombie.MultiplierSlumpTime != nil then
        multiplier = zombie.MultiplierSlumpTime
        zombie.MultiplierSlumpTime = 1
    end
    timer.Simple(timescale*math.random(10,30)*multiplier, function()
        if zombie:IsValid() then
            if GetConVarNumber("headcrabtakeover_allowslump") == 0 then return end
            if zombie:GetClass() == "npc_poisonzombie" then
                if zombie:LookupSequence("slump_a") == -1 then return end
            end
            if string.find(zombie:GetModel(), "torso") then return end
            if zombie:GetCurrentSchedule() == SCHED_FORCED_GO or zombie:GetCurrentSchedule() == SCHED_IDLE_WANDER then HandleSlump(zombie) return end
            local doingaction = false
            if (zombie:GetEnemy() == nil) or (CurTime() - zombie:GetEnemyLastTimeSeen(zombie:GetEnemy()) > 500) then
                local wakesequence = GetWakeSeq(zombie)
                if wakesequence and wakesequence:IsValid() then
                    zombie.MultiplierSlumpTime = 3
                    HandleSlump(zombie)
                    return
                end
                zombie.playedalertsound = false
                if math.random(1,math.max(math.floor(15*GetConVarNumber("headcrabtakeover_zombieslumpchancemultiplier")), 1)) == 1 and !zombie.PreventWallSlump then
                    local attemptrange = 130
                    if zombie:GetClass() == "npc_poisonzombie" then
                        attemptrange = 400
                    end
                    local trace = TryHitWorld(zombie, attemptrange, true)
                    if trace.HitWorld then
                        TryWallSlump(zombie, trace)
                        doingaction = true
                        PreventWallSlumpTimer(zombie)
                        zombie.PreventWallSlump = true
                    end
                end
                if !doingaction then
                    if math.random(1,math.max(math.floor(60*GetConVarNumber("headcrabtakeover_zombieslumpchancemultiplier")), 1)) == 1 then
                        local angle = zombie:GetAngles()
                        local sequencetype = "slump_b"
                        local sequencerisetype = "slumprise_b"
                        if zombie:GetClass() == "npc_fastzombie" then
                            if math.random(1,2) == 1 then
                                sequencetype = "slump_a"
                                sequencerisetype = "slumprise_a"
                            end
                        end
                        if zombie:GetClass() != "npc_poisonzombie" then
                            DoSlump(zombie, sequencetype, sequencerisetype, angle, false)
                            doingaction = true
                        end
                    end
                end
            end
            if !doingaction then
                if zombie:GetEnemy() == nil then
                    zombie:SetSchedule(SCHED_IDLE_WANDER)
                    RandomInterruptWalk(zombie)
                end
            end
            HandleSlump(zombie)
        end
    end)
end

local function AddHandleSlumpDelayed(entity)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*2*math.random(1,3), function()
        if entity:IsValid() and IsHalfLife2Zombie(entity) then
            if string.find(entity:GetModel(), "torso") then return end
            local map = game.GetMap()
            if (!string.find(map, "d1_") and !string.find(map, "d2_") and !string.find(map, "d3_") and !string.find(map, "ep1_") and !string.find(map, "ep2_")) or entity.Allowcampaignslump == true then
                HandleSlump(entity)
            end
        end
    end)
end

local function TryRegenerateCrab(zombie)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    local multiplier = 1
    if zombie.RegenCrabTime != nil then
        multiplier = zombie.RegenCrabTime
        zombie.RegenCrabTime = 1
    end
    timer.Simple(timescale*math.max(multiplier*math.random(50,200)*GetConVarNumber("headcrabtakeover_poisonzombiecrabregenerationmultiplier"), 10), function()
        if GetConVarNumber("headcrabtakeover_allowpoisonregeneratecrab") == 0 then return end
        if zombie:IsValid() then
            local crabcount = zombie:GetInternalVariable("m_nCrabCount")
            local successful = false
            if crabcount < 3 and zombie:GetBodygroup(5) == 0 and (zombie:GetSequenceName(zombie:GetSequence()) == "Walk" or zombie:GetSequenceName(zombie:GetSequence()) == "Run" or zombie:GetSequenceName(zombie:GetSequence()) == "Idle01" or zombie:GetSequenceName(zombie:GetSequence()) == "slump_a") and zombie:Health() > zombie:GetMaxHealth()/4 then
                zombie:CapabilitiesRemove(CAP_INNATE_RANGE_ATTACK1)
                zombie:CapabilitiesRemove(CAP_INNATE_RANGE_ATTACK2)
                HandlePoisonZombieThrowCapability(zombie, true, false)
                successful = true
            end
            if !successful and crabcount < 3 then
                zombie.RegenCrabTime = 0.2
            end
            if zombie:GetSequenceName(zombie:GetSequence()) == "slump_a" then
                zombie.RegenCrabTime = 0.4
            end
            TryRegenerateCrab(zombie)
        end
        if IsValid(zombie) and zombie:Health() <= 0 then
            zombie:Remove()
        end
    end)
end

local function GetUpRagdoll(ragdoll)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    local timeramount = timescale*math.max(math.random(5,35)*GetConVarNumber("headcrabtakeover_animationwaittime"), 5)
    ragdoll.waketime = CurTime() + timeramount
    ragdoll.wakeduration = ragdoll.waketime - CurTime()
    timer.Simple(timeramount, function()
        if !IsValid(ragdoll) then return end
        if !ragdoll.islivingragdoll then return end
        ragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
        local spinepos = ragdoll:GetBoneMatrix(ragdoll:LookupBone("ValveBiped.Bip01_Spine1")):GetTranslation()
        local headpos = ragdoll:GetBoneMatrix(ragdoll:LookupBone("ValveBiped.Bip01_Head1")):GetTranslation()
        local dotproduct = (headpos - spinepos):GetNormalized():Dot(Vector(0, 0, 1))
        local direction = 1
        if dotproduct > 0 then
            direction = 2
        elseif dotproduct < 0 then
            direction = 1
        else
            direction = 1
        end
        local angle = (headpos - spinepos):GetNormalized():Angle()
        angle.pitch = 0
        angle.roll = 0
        local animation = ents.Create("takeoveranimation")
        animation:SetPos(spinepos + Vector(0, 0, 5))
        animation:SetAngles(angle)
        animation.isontheground = true
        animation.grounddirection = direction
        animation:Spawn()
        animation.skintype = ragdoll.skintype
        animation.zombietype = ragdoll.zombietype
        animation.zombiespawnposition = ragdoll:GetPos()
        animation.zombieangles = angle
        local headcrabtype = 1
        if ragdoll.zombietype == "npc_fastzombie" then
            headcrabtype = 2
        end
        if ragdoll.zombietype == "npc_poisonzombie" then
            headcrabtype = 3
        end
        animation:SetBodygroup(1,headcrabtype)
        undo.ReplaceEntity(ragdoll, animation)
        cleanup.ReplaceEntity(ragdoll, animation)
        local animationbonemerge = CreateHeadcrabBonemerge(animation, ragdoll:GetModel(), ragdoll:GetSkin())
        animation.bonemergemodel = animationbonemerge
        animationbonemerge.storedcustomplayercolor = ragdoll.storedcustomplayercolor
        if animationbonemerge.storedcustomplayercolor then
            net.Start("customstoreplayercolor")
            net.WriteEntity(animationbonemerge)
            net.WriteVector(animationbonemerge.storedcustomplayercolor )
            net.Broadcast()
        end
        net.Start("customstorebodygroups")
        net.WriteEntity(animation)
        net.WriteTable(ragdoll.ragstoredbodygroupdata)
        net.Broadcast()
        animation.storedbodygroupdata = ragdoll.ragstoredbodygroupdata
        if ragdoll.headcrabtakeovertttplayerdata and engine.ActiveGamemode() == "terrortown" then
            animation.headcrabtakeovertttplayerdata = ragdoll.headcrabtakeovertttplayerdata
            animation.headcrabtakeovertttplayerdata.playercredits = CORPSE.GetCredits(ragdoll, 0)
        end
        timer.Simple(0.02, function()
            net.Start("reapplydecalsrag")
            net.WriteEntity(ragdoll)
            net.WriteEntity(animationbonemerge)
            net.Broadcast()
        end)
        undo.ReplaceEntity(ragdoll, animation)
        cleanup.ReplaceEntity(ragdoll, animation)
        timer.Simple(0.1, function()
            if IsValid(ragdoll) then
                ragdoll:Remove()
            end
        end)
    end)
end

local function GetUp(animation)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*math.max(math.random(5,35)*GetConVarNumber("headcrabtakeover_animationwaittime"), 5), function()
        if !IsValid(animation) then return end
        if GetConVarNumber("headcrabtakeover_takeoveranimationragdolls") == 0 then
            if animation.looping then
                animation.looping = false
                animation.getup = true
                return
            end
            GetUp(animation)
        end
    end)
end

local function TryTakeoverRagdoll(target)
    local timescale = game.GetTimeScale()
    if timescale == nil or timescale <= 0 then
        timescale = 1
    end
    timer.Simple(timescale*(math.random(4,7)), function()
        if !IsValid(target) or target:Health() <= 0 then return end
        if GetConVarNumber("headcrabtakeover_takeoverragdolls") == 0 then return end
        if IsValid(target) then
            if (target:GetEnemy() == nil) or (IsValid(target:GetEnemy()) and target:GetPos():DistToSqr(target:GetEnemy():GetPos()) > 70000) then
                for _,corpse in ipairs(ents.FindInSphere(target:GetPos(),350)) do
                    if hook.Run("headcrabtakeoverbeforecreatezombiehook", corpse) != false then
                        if IsValid(corpse) and corpse:GetClass() == "prop_ragdoll" and corpse:GetClass() != "prop_physics" and !target.movingtoragdoll and !corpse.beingtargeted and !corpse.deadheadcrabbed and !corpse.islivingragdoll and string.find(corpse:GetModel(), "zomb") == nil and corpse:LookupBone("ValveBiped.Bip01_Head1") != nil and corpse:LookupBone("ValveBiped.Bip01_R_Hand") != nil then
                            target:SetSaveValue("m_vecLastPosition", corpse:GetPos())
                            target:SetSchedule(SCHED_FORCED_GO)
                            target.movingtoragdoll = true
                            corpse.beingtargeted = true
                            corpse:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                            timer.Simple(timescale*2,function()
                                if IsValid(target) and IsValid(corpse) and target:Health() > 0 then
                                    for _,entities in ipairs(ents.FindInSphere(target:GetPos(),60)) do
                                        if entities == corpse and !entities.islivingragdoll then
                                            local bodygroupdata = StoreBodyGroups(corpse)
                                            local playercolor = Vector(0, 0, 0)
                                            local npczombietype = "npc_zombie"
                                            local skin = 0
                                            local norandomzombine = hook.Run("headcrabtakeovershouldntzombine", corpse, target) or false
                                            local forcezombine = hook.Run("headcrabtakeoverforcezombine", corpse, target) or false
                                            local forcezombie = hook.Run("headcrabtakeoverforcezombie", corpse, target) or false
                                            if !forcezombie and GetConVarNumber("headcrabtakeover_allowzombines") == 1 and file.Exists("models/zombie/zombie_soldier.mdl", "GAME") then
                                                if ((string.find(corpse:GetModel(), "combine") and !string.find(corpse:GetModel(), "civilprotection")) or forcezombine) and target:GetClass() == "npc_headcrab" then
                                                    npczombietype = "npc_zombine"
                                                end
                                                if !ShouldUseSabreanSkin(corpse:GetModel()) and !norandomzombine and target:GetClass() == "npc_headcrab" and math.random(1,10) == 1 then
                                                    npczombietype = "npc_zombine"
                                                end
                                            end
                                            if target:GetClass() == "npc_headcrab_fast" then
                                                npczombietype = "npc_fastzombie"
                                            end
                                            if target:GetClass() == "npc_headcrab_black" or target:GetClass() == "npc_headcrab_poison" then
                                                npczombietype = "npc_poisonzombie"
                                            end
                                            if ConVarExists("poisonheadcrabzombieskins_cop") and npczombietype != "npc_fastzombie" then
                                                skin = GetZombieSkin(npczombietype, corpse:GetModel(), corpse:GetSkin())
                                            end
                                            corpse.skintype = skin
                                            corpse.zombietype = npczombietype
                                            corpse.ragstoredbodygroupdata = bodygroupdata
                                            local headcrabtype = 1
                                            if npczombietype == "npc_fastzombie" then
                                                headcrabtype = 2
                                            end
                                            if npczombietype == "npc_poisonzombie" then
                                                headcrabtype = 3
                                            end
                                            if corpse.player_ragdoll and engine.ActiveGamemode() == "terrortown" then
                                                corpse.headcrabtakeovertttplayerdata = {}

                                                for _, ply in pairs(player.GetAll()) do
                                                    if ply:SteamID64() == corpse.sid64 then
                                                        corpse.headcrabtakeovertttplayerdata.playerent = ply
                                                        break
                                                    end
                                                end

                                                if corpse.headcrabtakeovertttplayerdata.playerent == nil or !IsValid(corpse.headcrabtakeovertttplayerdata.playerent) then
                                                    corpse.headcrabtakeovertttplayerdata = nil
                                                    corpse.player_ragdoll = false
                                                else
                                                    corpse.headcrabtakeovertttplayerdata.playerkills = table.Copy(corpse.kills)
                                                    corpse.headcrabtakeovertttplayerdata.playerequipment = corpse.equipment
                                                    corpse.headcrabtakeovertttplayerdata.playerrole = corpse.was_role
                                                    corpse.headcrabtakeovertttplayerdata.bombdata = corpse.bomb_wire
                                                    local playercolorTTT = corpse.headcrabtakeovertttplayerdata.playerent:GetPlayerColor()
                                                    corpse.GetPlayerColor = function()
                                                        return playercolorTTT
                                                    end
                                                end
                                            end
                                            local bonemerge = CreateHeadcrabBonemerge(corpse, "models/animations/headcrabtakeoveranimation.mdl", 0)
                                            corpse.headcrabbonemergeent = bonemerge

                                            bonemerge:SetBodygroup(1,headcrabtype)
                                            corpse:ManipulateBoneScale(corpse:LookupBone("ValveBiped.Bip01_Head1"), Vector(0.7, 0.7, 0.7))
                                            corpse.takedamagemintime = CurTime()
                                            corpse.islivingragdoll = true
                                            timer.Simple(0.05, function()
                                                net.Start("reapplydecalsrag")
                                                net.WriteEntity(corpse)
                                                net.WriteEntity(bonemerge)
                                                net.Broadcast()
                                            end)

                                            GetUpRagdoll(corpse)

                                            corpse:EmitSound("convertbackground.wav", 57, math.random(90, 110))

                                            for i = 0, corpse:GetBoneCount() - 1 do
                                                PrecacheParticleSystem("blood_impact_red_01")
                                                ParticleEffect("blood_impact_red_01", corpse:GetBoneMatrix(i):GetTranslation(), corpse:GetAngles(), corpse)
                                            end
                                            corpse:EmitSound( "physics/flesh/flesh_bloody_break.wav", 50, math.random(95,105))
                                            if corpse.GetPlayerColor then
                                                playercolor = corpse:GetPlayerColor()
                                            end
                                            corpse.storedcustomplayercolor = playercolor
                                            target:Remove()
                                            break
                                        end
                                    end
                                end
                            end)
                            timer.Simple(timescale*5,function()
                                if IsValid(target) then
                                    target.movingtoragdoll = false
                                end
                                if IsValid(corpse) then
                                    corpse.beingtargeted = false
                                end
                            end)
                        end
                    end
                end
            end
            TryTakeoverRagdoll(target)
        end
    end)
end

local function AfterCreateZombie(zombie, zombieskin, victimmodel, victimskin, customplayercolor)
    zombie.Allowcampaignslump = true
    if zombie:GetClass() == "npc_poisonzombie" then
        HandlePoisonZombieThrowCapability(zombie, false, true)
    end
    if zombie:GetClass() == "npc_fastzombie" then
        zombie.Norandomskin = true
        if string.find(victimmodel, "combine") then
            zombie:SetSkin(1)
        end
    end
    if zombie:GetClass() != "npc_fastzombie" then
        ResetSkin(zombie, zombieskin)
    end
    local shouldapplybonemerge = false
    if zombie.headcrabtakeovertttplayerdata then
        shouldapplybonemerge = true
    end
    if GetConVarNumber("headcrabtakeover_alwaysbonemerge") == 1 then
        shouldapplybonemerge = true
    end
    if zombie:GetClass() == "npc_fastzombie" and GetConVarNumber("headcrabtakeover_allowfastzombierotting") == 1 then shouldapplybonemerge = true end
    if zombie:GetClass() == "npc_fastzombie" and ShouldUseSabreanSkin(victimmodel) then shouldapplybonemerge = true end
    if GetConVarNumber("headcrabtakeover_allowcustombonemerge") == 1 or shouldapplybonemerge then
        if zombie:GetClass() == "npc_fastzombie" and !ShouldUseSabreanSkin(victimmodel) and GetConVarNumber("headcrabtakeover_allowfastzombierotting") == 1 and GetConVarNumber("headcrabtakeover_allowcustombonemerge") == 0 and GetConVarNumber("headcrabtakeover_alwaysbonemerge") == 0 then
            local zombiemodeltype = "models/Zombie/Classic.mdl"
            if file.Exists("models/zombie/zombie_soldier.mdl", "GAME") then
                if string.find(victimmodel, "combine") and !string.find(victimmodel, "civilprotection") then
                    zombiemodeltype = "models/zombie/zombie_soldier.mdl"
                end
            end
            victimmodel = zombiemodeltype
            victimskin = 0
        end
        if zombie:GetClass() == "npc_fastzombie" and ShouldUseSabreanSkin(victimmodel) and GetConVarNumber("headcrabtakeover_alwaysbonemerge") == 0 then
            local zombienpctype = "npc_zombie"
            local zombiemodeltype = "models/Zombie/Classic.mdl"
            if file.Exists("models/zombie/zombie_soldier.mdl", "GAME") then
                if string.find(victimmodel, "combine") and !string.find(victimmodel, "civilprotection") then
                    zombienpctype = "npc_zombine" zombiemodeltype = "models/zombie/zombie_soldier.mdl"
                end
            end
            local skintouse = GetZombieSkin(zombienpctype, victimmodel, victimskin)
            victimmodel = zombiemodeltype
            victimskin = skintouse
        end
        if !ShouldUseSabreanSkin(victimmodel) or zombie.headcrabtakeovertttplayerdata or GetConVarNumber("headcrabtakeover_alwaysbonemerge") == 1 then
            local custombonemerge = CreateCustomHeadcrabBonemerge(zombie, victimmodel, victimskin)
            custombonemerge.storedcustomplayercolor = customplayercolor
            net.Start("customstoreplayercolor")
            net.WriteEntity(custombonemerge)
            net.WriteVector(customplayercolor)
            net.Broadcast()
            ResetSkin(zombie, 0)
        end
        if zombie:GetClass() == "npc_fastzombie" and GetConVarNumber("headcrabtakeover_allowfastzombierotting") == 1 then
            RotFastZombie(zombie)
        end
        if GetConVarNumber("headcrabtakeover_allowzombines") == 1 and zombie:GetClass() == "npc_fastzombie" and (victimmodel == "models/zombie/zombie_soldier.mdl" or (string.find(victimmodel, "combine") and !string.find(victimmodel, "civilprotection"))) then
            ResetSkin(zombie, 1)
            if victimskin == 3 then
                zombie.hasusedgrenade = true
            end
        end
        hook.Run("headcrabtakeovercreatezombiehook", zombie, zombieskin, victimmodel, victimskin)
    end
end

local function CreateZombie(victim, attacker, bodygroupdatatoapply)
    local npczombietype = "npc_zombie"
    local skin = 0
    local norandomzombine = hook.Run("headcrabtakeovershouldntzombine", victim, attacker) or false
    local forcezombine = hook.Run("headcrabtakeoverforcezombine", victim, attacker) or false
    local forcezombie = hook.Run("headcrabtakeoverforcezombie", victim, attacker) or false
    if !forcezombie and GetConVarNumber("headcrabtakeover_allowzombines") == 1 and file.Exists("models/zombie/zombie_soldier.mdl", "GAME") then
        if ((string.find(victim:GetModel(), "combine") and !string.find(victim:GetModel(), "civilprotection")) or forcezombine) and (attacker:GetClass() == "npc_headcrab" or attacker:GetClass() == "npc_zombie" or attacker:GetClass() == "npc_zombie_torso") then
            npczombietype = "npc_zombine"
        end
        if !ShouldUseSabreanSkin(victim:GetModel()) and !norandomzombine and (attacker:GetClass() == "npc_headcrab" or attacker:GetClass() == "npc_zombie" or attacker:GetClass() == "npc_zombie_torso") and math.random(1,10) == 1 then
            npczombietype = "npc_zombine"
        end
    end
    if attacker:GetClass() == "npc_headcrab_fast" or attacker:GetClass() == "npc_fastzombie" or attacker:GetClass() == "npc_fastzombie_torso" then
        npczombietype = "npc_fastzombie"
    end
    if attacker:GetClass() == "npc_headcrab_black" or attacker:GetClass() == "npc_headcrab_poison" or attacker:GetClass() == "npc_poisonzombie" then
        npczombietype = "npc_poisonzombie"
    end
    if ConVarExists("poisonheadcrabzombieskins_cop") and npczombietype != "npc_fastzombie" then
        skin = GetZombieSkin(npczombietype, victim:GetModel(), victim:GetSkin())
    end
    local customplayercolor = Vector()
    if victim:IsPlayer() then
        customplayercolor = victim:GetPlayerColor()
    end
    local angle = victim:GetAngles()
    angle.pitch = 0
    angle.roll = 0
    local entitytoreplace = attacker
    if IsHalfLife2Zombie(attacker) then
        entitytoreplace = victim
    end
    if GetConVarNumber("headcrabtakeover_allowanimation") == 1 then
        local animation = ents.Create("takeoveranimation")
        animation:SetPos(victim:GetPos() + Vector(0, 0, 5))
        animation:SetAngles(angle)
        animation:Spawn()
        animation.skintype = skin
        animation.zombietype = npczombietype
        animation.zombiespawnposition = victim:GetPos() + Vector(0, 0, 5)
        animation.zombieangles = angle
        animation.isplayer = victim:IsPlayer()
        local headcrabtype = 1
        if npczombietype == "npc_fastzombie" then
            headcrabtype = 2
        end
        if npczombietype == "npc_poisonzombie" then
            headcrabtype = 3
        end
        animation:SetBodygroup(1,headcrabtype)
        undo.ReplaceEntity(entitytoreplace, animation)
        cleanup.ReplaceEntity(entitytoreplace, animation)
        GetUp(animation)
        local animationbonemerge = CreateHeadcrabBonemerge(animation, victim:GetModel(), victim:GetSkin())
        animation.bonemergemodel = animationbonemerge
        animationbonemerge.storedcustomplayercolor = Vector()
        if victim:IsPlayer() then
            local animationplayercolor = customplayercolor
            animationbonemerge.storedcustomplayercolor = customplayercolor
            net.Start("customstoreplayercolor")
            net.WriteEntity(animationbonemerge)
            net.WriteVector(animationplayercolor)
            net.Broadcast()
        end
        net.Start("customstorebodygroups")
        net.WriteEntity(animation)
        net.WriteTable(bodygroupdatatoapply)
        net.Broadcast()
        animation.storedbodygroupdata = bodygroupdatatoapply
        timer.Simple(0, function()
            net.Start("reapplydecalsrag")
            net.WriteEntity(victim)
            net.WriteEntity(animationbonemerge)
            net.Broadcast()
        end)
        if victim:IsPlayer() and engine.ActiveGamemode() == "terrortown" then
            animation.headcrabtakeovertttplayerdata = GatherTTTThings(victim)
        end
    else
        local zombie = ents.Create(npczombietype)
        zombie:SetKeyValue("Spawnflags", 1280)
        zombie:SetPos(victim:GetPos())
        zombie:SetAngles(angle)
        zombie:Spawn()
        zombie:SetSkin(skin)
        zombie:Activate()
        undo.ReplaceEntity(entitytoreplace, zombie)
        cleanup.ReplaceEntity(entitytoreplace, zombie)
        AfterCreateZombie(zombie, skin, victim:GetModel(), victim:GetSkin(), customplayercolor)
        net.Start("customstorebodygroups")
        net.WriteEntity(zombie)
        net.WriteTable(bodygroupdatatoapply)
        net.Broadcast()
        zombie.storedbodygroupdata = bodygroupdatatoapply
        zombie:EmitSound("physics/flesh/flesh_bloody_break.wav", 65, math.random(90,102))
        for i = 10,1,-1 do
            local particleposition = zombie:GetPos() + zombie:GetAngles():Up() * (math.random(25,55))
            PrecacheParticleSystem("blood_impact_yellow_01")
            ParticleEffect("blood_impact_yellow_01", particleposition, zombie:GetAngles(), zombie)
        end
        if victim:IsPlayer() and engine.ActiveGamemode() == "terrortown" then
            zombie.headcrabtakeovertttplayerdata = GatherTTTThings(victim)
        end
    end
    timer.Simple(0.5, function()
        if victim:IsPlayer() and !victim:Alive() then
            victim:SetPos(victim:GetPos() + victim:GetAngles():Up() * -200)
            timer.Simple(0.1, function()
                victim:SetPos(victim:GetPos() + victim:GetAngles():Up() * 200)
            end)
            victim.tobeturned = false
            if engine.ActiveGamemode() == "terrortown" and victim:IsPlayer() then
                victim:SetTeam(TEAM_SPEC)
            end
        end
    end)
end

local function HandleCustomZombieGibbing(zombie, damage, splitbysaw)
    local attacker = damage:GetAttacker()
    local inflictor = damage:GetInflictor()
    if !IsValid(zombie) then return end
    if zombie:Health() <= 0 then return end
    local chancetodie = math.random(1,7)
    if !ConVarExists("poisonheadcrabzombieskins_cop") and zombie:GetClass() == "npc_zombine" then
        chancetodie = 3
    end
    local playercolor = nil
    if zombie.iscustomheadcrabzombie then
        playercolor = zombie.customzombiebonemerge.storedcustomplayercolor
    end
    if zombie:GetClass() == "npc_fastzombie" and IsValid(zombie.zombinegrenade) and zombie.zombinegrenade:GetMoveType() == MOVETYPE_NONE and !splitbysaw then
        DropFastZombGrenade(zombie, damage, splitbysaw)
    end
    if chancetodie > 2 or splitbysaw then
        local cancrabsurvive = false
        local dontspawnclienttorso = false
        if zombie.headcrabtakeovertttplayerdata then
            dontspawnclienttorso = true
        end
        if splitbysaw then
            Slicesoundandparticles(inflictor)
            local saw = inflictor
            saw.StopCheckingSpeed = true
            saw:GetPhysicsObject():EnableMotion(false)
            ResetSawSpeed(saw, damage:GetDamageForce())
            if math.random(1, 4) == 1 then
                cancrabsurvive = true
                zombie:SetBodygroup(1, 0)
                SpawnCrab(zombie, zombie:IsOnFire())
            end
        end
        if zombie:GetClass() == "npc_zombine" then
            zombie:EmitSound( "npc/zombine/zombine_die" .. math.random(1,2) .. ".wav", 80, math.random(95,105))
        end
        if zombie:GetClass() == "npc_zombie" then
            zombie:EmitSound( "npc/zombie/zombie_die" .. math.random(1,3) .. ".wav", 80, math.random(95,105))
        end
        if zombie:GetClass() == "npc_fastzombie" then
            zombie:EmitSound( "npc/fast_zombie/wake1.wav", 80, math.random(95,105))
        end
        net.Start("customzombiegibbed")
        net.WriteEntity(zombie)
        net.WriteVector(damage:GetDamageForce())
        net.WriteBool(cancrabsurvive)
        net.WriteBool(dontspawnclienttorso)
        if playercolor then
            net.WriteVector(playercolor)
        end
        if !zombie.iscustomheadcrabzombie then
            net.WriteEntity(zombie)
        end
        if zombie.iscustomheadcrabzombie then
            net.WriteEntity(zombie.customzombiebonemerge)
        end
        net.Broadcast()
        if dontspawnclienttorso then
            CreateServerTorsoGib(zombie, damage:GetDamageForce(), cancrabsurvive)
        end
        ManualDeathNotice(zombie, attacker, inflictor)
        RemoveZombieDelayed(zombie, damage:GetDamageForce(), splitbysaw)
    else
        local torsotype = "npc_zombie_torso"
        if zombie:GetClass() == "npc_fastzombie" then
            torsotype = "npc_fastzombie_torso"
        end
        local zombietorso = ents.Create(torsotype)
        local torsoskin = 0
        if zombie:GetClass() == "npc_zombine" then
            torsoskin = 8
        end
        if !zombie.iscustomheadcrabzombie then
            torsoskin = zombie:GetSkin()
            if zombie:GetClass() == "npc_zombine" then
                torsoskin = zombie:GetSkin() + 8
            end
        end
        net.Start("customzombiegibbed")
        net.WriteEntity(zombie)
        net.WriteVector(damage:GetDamageForce())
        net.WriteBool(false)
        net.WriteBool(true)
        if playercolor then
            net.WriteVector(playercolor)
        end
        if !zombie.iscustomheadcrabzombie then
            net.WriteEntity(zombie)
        end
        if zombie.iscustomheadcrabzombie then
            net.WriteEntity(zombie.customzombiebonemerge)
        end
        net.Broadcast()
        zombietorso:SetKeyValue("Spawnflags", 1280)
        zombietorso:SetPos(zombie:GetPos())
        zombietorso:SetAngles(zombie:GetAngles())
        zombietorso:Spawn()
        zombietorso:SetSkin(torsoskin)
        zombietorso:Activate()
        if zombie.iscustomheadcrabzombie then
            zombietorso.storedbodygroupdata = zombie.storedbodygroupdata
            local modeltouse = zombie.customzombiebonemerge:GetModel()
            if zombie:GetClass() == "npc_fastzombie" and (zombie.customzombiebonemerge:GetModel() == "models/zombie/classic.mdl" or zombie.customzombiebonemerge:GetModel() == "models/zombie/zombie_soldier.mdl") then
                if zombie.customzombiebonemerge:GetModel() == "models/zombie/classic.mdl" then
                    modeltouse = "models/zombie/classic_torso.mdl"
                    zombietorso.dontscalebonemerge = true
                end
                if zombie.customzombiebonemerge:GetModel() == "models/zombie/zombie_soldier.mdl" then
                    modeltouse = "models/zombie/zombie_soldier_torso.mdl"
                end
            end
            local custombonemerge = CreateCustomHeadcrabBonemerge(zombietorso, modeltouse, zombie.customzombiebonemerge:GetSkin())
            custombonemerge.storedcustomplayercolor = zombie.customzombiebonemerge.storedcustomplayercolor
            net.Start("customstorebodygroups")
            net.WriteEntity(zombietorso)
            net.WriteTable(zombietorso.storedbodygroupdata)
            net.Broadcast()
            net.Start("customstoreplayercolor")
            net.WriteEntity(custombonemerge)
            net.WriteVector(zombie.customzombiebonemerge.storedcustomplayercolor)
            net.Broadcast()
        end
        undo.ReplaceEntity(zombie, zombietorso)
        cleanup.ReplaceEntity(zombie, zombietorso)
        zombietorso.Norandomskin = true
        ResetSkin(zombietorso, torsoskin)
        if zombie.headcrabtakeovertttplayerdata != nil then
            zombietorso.headcrabtakeovertttplayerdata = zombie.headcrabtakeovertttplayerdata
        end
        RemoveZombieDelayed(zombie, damage:GetDamageForce(), splitbysaw)
        if math.random(1,4) == 1 then
            zombietorso:Ignite(7)
        end
        if torsotype == "npc_fastzombie_torso" and GetConVarNumber("headcrabtakeover_allowfastzombierotting") == 1 then
            RotFastZombie(zombietorso)
        end
        if torsotype == "npc_fastzombie_torso" and torsoskin == 1 then
            zombietorso:SetBodygroup(4,1)
        end
        hook.Run("headcrabtakeovercreatezombietorsohook", zombietorso)
    end
end

hook.Add("EntityTakeDamage","handledamage", function(target, damage)
    local attacker = damage:GetAttacker()
    local inflictor = damage:GetInflictor()
    if !IsValid(target) then return end
    if target:Health() <= 0 then return end
    local wakesequence = GetWakeSeq(target)
    local originaldamage = damage:GetDamage()
    target:SetSaveValue("m_bHeadShot", 0)
    if inflictor.ShouldSawSlice then damage:SetDamageType(5) end
    if target:GetClass() == "npc_fastzombie" and target.iscustomheadcrabzombie and !target.headcrabtakeovertttplayerdata and GetConVarNumber("headcrabtakeover_allowfastzombierotting") == 1 then
        damage:ScaleDamage(0.6)
    end
    if target:GetClass() == "npc_poisonzombie" then
        target:SetSaveValue("m_fIsTorso", 1)
        damage:SetDamageType(DMG_GENERIC)
    end
    if target:GetClass() == "npc_poisonzombie" and damage:GetDamage() > target:Health() and !target.IsBeingKilled then
        target.IsBeingKilled = true
        damage:SetDamage(math.Clamp(damage:GetDamage(), 0.1, target:Health()-1))
        KillZombie(target, false, attacker, inflictor)
        return
    end
    if target:GetInternalVariable("m_fIsTorso") == false and ((wakesequence and wakesequence:IsValid()) or IsHalfLife2Zombie(target)) and (bit.band(damage:GetDamageType(), bit.bor(DMG_BLAST, DMG_CRUSH, DMG_SLASH)) != 0) then
        local splitbysaw = false
        if inflictor.ShouldSawSlice then splitbysaw = true end
        if bit.band(damage:GetDamageType(), bit.bor(DMG_CRUSH, DMG_SLASH)) == bit.bor(DMG_CRUSH, DMG_SLASH) then splitbysaw = true end
        if target:GetClass() == "npc_fastzombie" and IsValid(target.zombinegrenade) and target.zombinegrenade:GetMoveType() == MOVETYPE_NONE and splitbysaw then
            DropFastZombGrenade(target, damage, splitbysaw)
        end
        if splitbysaw and !target.customzombiebonemerge and !wakesequence then return end
        local exploded = false
        if damage:IsDamageType(64) then exploded = true end
        if exploded or splitbysaw or wakesequence then
            if math.random(1,4) == 1 then
                damage:SetDamageType(DMG_GENERIC)
            else
                damage:SetDamageType(DMG_SNIPER)
            end
        end
        if !wakesequence and (target.customzombiebonemerge or (target:GetClass() == "npc_fastzombie" or target:GetClass() == "npc_zombine" or target:GetClass() == "npc_zombie")) and !target.IsBeingKilled then
            if (math.random(1,2) == 1 and exploded and damage:GetDamage() > (target:Health() * 0.4)) or splitbysaw then
                target:SetHealth(5000000)
                target.IsBeingKilled = true
                HandleCustomZombieGibbing(target, damage, splitbysaw)
            end
        end
    end
    if damage:GetDamage() >= target:Health() then
        if target:GetClass() == "npc_fastzombie" and IsValid(target.zombinegrenade) and target.zombinegrenade:GetMoveType() == MOVETYPE_NONE then
            DropFastZombGrenade(target, damage, false)
        end
    end
    local healththresholdsurpassed = target:Health() <= target:GetMaxHealth() * 0.3
    if IsHalfLife2Zombie(target) and target:GetInternalVariable("m_fIsTorso") == true and target:GetClass() != "npc_poisonzombie" then
        healththresholdsurpassed = target:Health() <= target:GetMaxHealth() * 0.6
    end
    if IsHalfLife2Zombie(target) and (!wakesequence or !wakesequence:IsValid()) and !target.IsReleasingCrab and !target.IsBeingKilled and !damage:IsDamageType(64) and healththresholdsurpassed and damage:GetDamage() < target:Health() and math.random(1,5) == 1 and !target.headcrabtakeovertttplayerdata then
        target.IsReleasingCrab = true
        target.IsBeingKilled = true
        damage:SetDamage(math.Clamp(damage:GetDamage(), 0.1, target:Health()-1))
        KillZombie(target, true, attacker, inflictor)
    end
    if IsHalfLife2Zombie(target) and wakesequence and wakesequence:IsValid() and damage:GetDamage() < target:Health() and !target.preventwake then
        wakesequence:Fire( "BeginSequence", "", 0 )
        target.VJ_NoTarget = false
    end
end)

hook.Add("EntityTakeDamage","createzombie", function(target, damage)
    local attacker = damage:GetAttacker()
    local inflictor = damage:GetInflictor()
    if !IsValid(attacker) then return end
    if IsHalfLife2Headcrab(attacker) or (IsHalfLife2Zombie(attacker) and inflictor == attacker) then
        if attacker == nil then return end
        if target == nil then return end
        if target.tobeturned then return end
        if GetConVarNumber("headcrabtakeover_allowmorezombiedamage") == 1 then
            if IsHalfLife2Zombie(attacker) and attacker == inflictor then damage:SetDamage(damage:GetDamage() * 2.5)  end
            if (attacker:GetClass() == "npc_fastzombie" or attacker:GetClass() == "npc_fastzombie_torso") and attacker == inflictor then damage:SetDamage(damage:GetDamage() * 1.5) end
            if (attacker:GetClass() == "npc_headcrab" or attacker:GetClass() == "npc_headcrab_fast") then damage:SetDamage(damage:GetDamage() * 3) end
        end
        if GetConVarNumber("headcrabtakeover_zombieinfection") == 0 and IsHalfLife2Zombie(attacker) then return end
        if attacker:GetClass() == "npc_headcrab_black" or attacker:GetClass() == "npc_headcrab_poison" then
            if !target:IsPlayer() then
                target:SetHealth(target:Health() + 2)
            end
        end
        if (target:Health() / target:GetMaxHealth()) * 100 > GetConVarNumber("headcrabtakeover_allowheadcrabinstakillpercentage") then return end
        if target:LookupBone("ValveBiped.Bip01_R_Hand") == nil then return end
        if target:IsPlayer() and GetConVarNumber("headcrabtakeover_allowaffectplayers") == 0 then return end
        if (target:GetClass() == "npc_alyx" or target:GetClass() == "npc_barney") and GetConVarNumber("headcrabtakeover_allowaffectplayers") == 0 then return end
        if hook.Run("headcrabtakeoverbeforecreatezombiehook", target, damage) == false then return end
        local turned = false
        if GetConVarNumber("headcrabtakeover_allowheadcrabinstakill") == 1 and CheckTarget(target, false, false) then
            if GetConVarNumber("headcrabtakeover_allowheadcrabinstakillwitharmor") == 1 and target:IsPlayer() and target:Armor() > 0 then return end
            turned = true
            target.tobeturned = true
        end
        if attacker:GetClass() == "npc_headcrab_black" or attacker:GetClass() == "npc_headcrab_poison" then
            if GetConVarNumber("headcrabtakeover_allowheadcrabinstakillwitharmor") == 1 and target:IsPlayer() and target:Armor() > 0 then return end
            local chance = math.random(1,10)
            if target:Health() <= target:GetMaxHealth() then
                chance = math.random(1,5)
            end
            if chance == 1 and CheckTarget(target, false, false) then
                turned = true
                target.tobeturned = true
            end
        end
        if attacker:GetClass() == "npc_headcrab" or attacker:GetClass() == "npc_headcrab_fast" then
            if damage:GetDamage() >= target:Health() then
                if CheckTarget(target, false, false) then
                    turned = true
                    target.tobeturned = true
                end
            end
        end
        if turned then
            damage:SetDamage(0)
            target:SetHealth(5000000)
            if IsHalfLife2Headcrab(attacker) then
                attacker:SetHealth(5000000)
            end
            CreateZombie(target, attacker, StoreBodyGroups(target))
            local playerteam = nil
            if target:IsPlayer() then
                playerteam = target:Team()
            end
            if target.DropWeapon then
                target:DropWeapon()
            end
            if engine.ActiveGamemode() == "terrortown" and target:IsPlayer() and IsValid(target.hat) then
                target.hat:Drop()
            end
            target:SetNoDraw(true)
            timer.Simple(0.05, function()
                if target:IsPlayer() then
                    target:Kill()

                    local corpse = target.ixCorpse
                    if IsValid(corpse) then
                        corpse:Remove()
                    end
                else
                    target:Remove()
                end
            end)
            ManualDeathNotice(target, attacker, inflictor, playerteam)
            if IsHalfLife2Headcrab(attacker) then
                attacker:Remove()
            end
        end
    end
end)

hook.Add("EntityTakeDamage","killlivingragdolls", function(target, damage)
    local attacker = damage:GetAttacker()
    if !IsValid(target) then return end
    if target.islivingragdoll and target.takedamagemintime <= CurTime() then
        if target.livingragdolldamage == nil then target.livingragdolldamage = 0 end
        if attacker:GetClass() == "worldspawn" then damage:SetDamage(damage:GetDamage() * 0.1) end
        target.livingragdolldamage = target.livingragdolldamage + damage:GetDamage()
        local particlepositionred = damage:GetDamagePosition()
        PrecacheParticleSystem("blood_impact_red_01")
        ParticleEffect("blood_impact_red_01", particlepositionred, target:GetAngles(), target)
        if target.livingragdolldamage >= 60 then
            target:ManipulateBoneScale(target:LookupBone("ValveBiped.Bip01_Head1"), Vector(1, 1, 1))
            local headcrabmodel = "models/headcrabclassic.mdl"
            if target.zombietype == "npc_fastzombie" then
                headcrabmodel = "models/headcrab.mdl"
            end
            if target.zombietype == "npc_poisonzombie" then
                headcrabmodel = "models/headcrabblack.mdl"
            end
            target.islivingragdoll = false
            target.deadheadcrabbed = true
            net.Start("createheadcrablone")
            net.WriteEntity(target.headcrabbonemergeent)
            net.WriteVector(damage:GetDamageForce())
            net.WriteString(headcrabmodel)
            net.Broadcast()
            target.headcrabbonemergeent:SetBodygroup(1, 0)
            local particleposition = target:GetBonePosition(target:LookupBone("ValveBiped.Bip01_Head1"))
            PrecacheParticleSystem("blood_impact_yellow_01")
            ParticleEffect("blood_impact_yellow_01", particleposition, target:GetAngles(), target)
            local deathsound = "npc/headcrab/die"
            local number = math.random(1,2)
            if target.zombietype == "npc_poisonzombie" then
                deathsound = "npc/headcrab_poison/ph_rattle"
                number = math.random(1,3)
            end
            target:EmitSound(deathsound .. number .. ".wav", 75, math.random(98,102))
        end
    end
end)

hook.Add("InitPostEntity","fastzombietorsopreload", function(owner,ragdoll)
    timer.Simple(0.8, function()
        local fastzombietorso = ents.Create("npc_fastzombie_torso")
        fastzombietorso:SetPos (Vector(-300, -500, -300))
        fastzombietorso:Spawn()
        fastzombietorso:Activate()
        fastzombietorso:SetNoDraw(true)
        timer.Simple(0.2, function()
            if fastzombietorso:IsValid() then
                fastzombietorso:Remove()
            end
        end)
        local zombie = ents.Create("npc_zombie")
        zombie:SetPos (Vector(-300, -500, -300))
        zombie:Spawn()
        zombie:Activate()
        zombie:SetNoDraw(true)
        timer.Simple(0.2, function()
            if zombie:IsValid() then
                zombie:Remove()
            end
        end)
        local poisonzombie = ents.Create("npc_poisonzombie")
        poisonzombie:SetPos (Vector(-300, -500, -300))
        poisonzombie:Spawn()
        poisonzombie:Activate()
        poisonzombie:SetNoDraw(true)
        timer.Simple(0.2, function()
            if poisonzombie:IsValid() then
                poisonzombie:Remove()
            end
        end)
    end)
end)

hook.Add("OnEntityCreated","handleragdolltakeover", function(ragdoll)
    timer.Simple(0.2, function()
        if IsValid(ragdoll) and ragdoll.islivingragdoll then
            GetUpRagdoll(ragdoll)
        end
    end)
end)

hook.Add("OnEntityCreated","setpoisoncrabasfriendlyVJ", function(target)
    if !IsValid(target) then return end
    timer.Simple(0, function()
        if IsValid(target) and target:GetClass() == "npc_headcrab_poison" then
            target.VJ_NPC_Class = {"CLASS_ZOMBIE"}
        end
    end)
    timer.Simple(0.3, function()
        if IsValid(target) and target:GetClass() == "npc_headcrab_poison" and target.VJ_NPC_Class == nil then
            target.VJ_NPC_Class = {"CLASS_ZOMBIE"}
        end
    end)
    timer.Simple(0.8, function()
        if IsValid(target) and target:GetClass() == "npc_headcrab_poison" and target.VJ_NPC_Class == nil then
            target.VJ_NPC_Class = {"CLASS_ZOMBIE"}
        end
    end)
end)

hook.Add("CreateEntityRagdoll","handledeathcustombonemerge", function(owner,ragdoll)
    if string.find(owner:GetClass(), "zomb") then
        if owner.customzombiebonemerge != nil then
            ragdoll.storedbodygroupdata = owner.storedbodygroupdata
            local customdeathbonemerge = CreateCustomHeadcrabBonemerge(ragdoll, owner.customzombiebonemerge:GetModel(), owner.customzombiebonemerge:GetSkin())
            customdeathbonemerge.storedcustomplayercolor = owner.customzombiebonemerge.storedcustomplayercolor
            net.Start("customstoreplayercolor")
            net.WriteEntity(customdeathbonemerge)
            net.WriteVector(owner.customzombiebonemerge.storedcustomplayercolor)
            net.Broadcast()
            net.Start("customstorebodygroups")
            net.WriteEntity(ragdoll)
            net.WriteTable(owner.storedbodygroupdata)
            net.Broadcast()
            timer.Simple(0, function()
                net.Start("reapplydecalsrag")
                net.WriteEntity(owner.customzombiebonemerge)
                net.WriteEntity(ragdoll.customzombiebonemerge)
                net.Broadcast()
                timer.Simple(0.05, function()
                    owner.customzombiebonemerge:Remove()
                end)
            end)
        end
    end
end)

hook.Add("CreateEntityRagdoll","fixfastzombragdoll", function(owner,ragdoll)
    if ragdoll:GetModel() == "models/zombie/fast.mdl" or ragdoll:GetModel() == "models/zombie/fast_torso.mdl" then
        FixFastzombRag(ragdoll)
    end
end)

hook.Add("CreateEntityRagdoll","fixpoisonragdoll", function(owner,ragdoll)
    if ragdoll:GetModel() == "models/zombie/poison.mdl" then
        ragdoll:SetBodygroup(5, 0)
    end
end)

hook.Add("CreateEntityRagdoll","makeserverragdollnocollide", function(owner,ragdoll)
    if owner.nocollideragdoll then
        ragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
    end
end)

hook.Add("CreateEntityRagdoll","tttheadcrabtakeoverdatatransfer", function(owner,ragdoll)
    if engine.ActiveGamemode() == "terrortown" and owner.headcrabtakeovertttplayerdata then
        ragdoll:SetCollisionGroup(GetConVarNumber("ttt_ragdoll_collide") == 1 and COLLISION_GROUP_WEAPON or COLLISION_GROUP_DEBRIS_TRIGGER)

        ragdoll.player_ragdoll = true
        ragdoll.sid64 = owner.headcrabtakeovertttplayerdata.playerent:SteamID64()

        ragdoll.sid = owner.headcrabtakeovertttplayerdata.playerent:SteamID()
        ragdoll.uqid = owner.headcrabtakeovertttplayerdata.playerent:UniqueID()

        CORPSE.SetPlayerNick(ragdoll, owner.headcrabtakeovertttplayerdata.playerent)
        CORPSE.SetFound(ragdoll, false)
        CORPSE.SetCredits(ragdoll, owner.headcrabtakeovertttplayerdata.playercredits)

        ragdoll.equipment = owner.headcrabtakeovertttplayerdata.playerequipment
        ragdoll.was_role = owner.headcrabtakeovertttplayerdata.playerrole
        ragdoll.bomb_wire = owner.headcrabtakeovertttplayerdata.playerbombwire
        ragdoll.kills = owner.headcrabtakeovertttplayerdata.playerkills
    end
end)

hook.Add("OnEntityCreated", "poisonzombiehandlecrabs", function(entity)
    if GetConVarNumber("headcrabtakeover_allowpoisonregeneratecrab") == 0 then return end
    if entity:GetClass() == "npc_poisonzombie" then
        TryRegenerateCrab(entity)
    end
end)

hook.Add("OnEntityCreated", "poisonheadcrabhealplayer", function(entity)
    if GetConVarNumber("headcrabtakeover_allowtakeover") == 0 then return end
    if entity:GetClass() == "npc_headcrab_black" or entity:GetClass() == "npc_headcrab_poison" then
        TryHealEnemy(entity)
    end
end)

hook.Add("OnEntityCreated", "handletakeoverragdolls", function(entity)
    if GetConVarNumber("headcrabtakeover_allowtakeover") == 0 then return end
    if GetConVarNumber("headcrabtakeover_takeoverragdolls") == 0 then return end
    if IsHalfLife2Headcrab(entity) then
        TryTakeoverRagdoll(entity)
    end
end)

hook.Add("OnEntityCreated", "fastzombiehandleabilities", function(entity)
    if entity:GetClass() == "npc_fastzombie" then
        HandleFastZombieAbilities(entity)
        FastZombCustomCheck(entity)
        RandomFastZombieSkin(entity)
    end
    if entity:GetClass() == "npc_fastzombie_torso" then
        RandomFastZombieSkin(entity)
    end
end)

hook.Add("OnEntityCreated", "initiateslumpfunction", function(entity)
    if GetConVarNumber("headcrabtakeover_allowslump") == 0 then return end
    AddHandleSlumpDelayed(entity)
end)

local function CheckSawSpeed(saw, sawphysicsobject)
    if saw.StopCheckingSpeed == true then return end
    saw.PuntSawVelocity = sawphysicsobject:GetVelocity()
    if saw.PuntSawVelocity:LengthSqr() < 200000 then
        saw.StopCheckingSpeed = true
        saw.ShouldSawSlice = false
    else
        saw.ShouldSawSlice = true
    end
end

hook.Add("GravGunPunt", "handlesaw", function(ply, ent)
    if ent:GetModel() == "models/props_junk/sawblade001a.mdl" then
        ent.StopCheckingSpeed = false
        timer.Simple(0.01, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(0.05, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(0.1, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(0.3, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(0.5, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(1, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(1.5, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(2, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(2.5, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(3.3, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(4, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(7, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
        timer.Simple(10, function()
            if ent:IsValid() then
                CheckSawSpeed(ent, ent:GetPhysicsObject())
            end
        end)
    end
end)

hook.Add("headcrabtakeovershouldntzombine", "onspawnbmcezombie", function(victim, attacker)
    if ShouldUseBMCEZombie(victim:GetModel()) then return true end
end)

hook.Add("headcrabtakeovershouldntzombine", "citizenreskinnozombine", function(victim, attacker)
    if string.find(victim:GetModel(), "humans/group0") != nil then return true end
    if victim:GetClass() == "npc_citizen" then return true end
end)

hook.Add("headcrabtakeovercreatezombiehook", "spawnbmcezombie", function(zombie, zombieskin, victimmodel, victimskin)
    if zombie:GetClass() == "npc_zombie" and ShouldUseBMCEZombie(victimmodel) then
        local bmcezombietype = "npc_vj_bmce_zombie"
        local result = ShouldUseBMCEZombie(victimmodel)
        if !isnumber(result) then
            bmcezombietype = result
        end
        local bmcezombie = ents.Create(bmcezombietype)
        bmcezombie:SetPos(zombie:GetPos())
        bmcezombie:SetAngles(zombie:GetAngles())
        bmcezombie:Spawn()
        if isnumber(result) then
            bmcezombie:SetBodygroup(0,result)
        end
        bmcezombie:Activate()
        if zombie.headcrabtakeovertttplayerdata != nil then
            bmcezombie.headcrabtakeovertttplayerdata = zombie.headcrabtakeovertttplayerdata
            bmcezombie.AllowedToGib = false
        end
        undo.ReplaceEntity(zombie, bmcezombie)
        cleanup.ReplaceEntity(zombie, bmcezombie)
        zombie:Remove()
    end
end)


hook.Add( "ScaleNPCDamage", "CheckZombieFlinch", function(target, hitgroup, dmginfo)
    if IsValid(target) and target:Health() > 0 then
        if (target:GetClass() == "npc_zombie" or target:GetClass() == "npc_zombine") and target:GetInternalVariable("m_fIsTorso") == false then
            local timescale = game.GetTimeScale()
            if timescale == nil or timescale <= 0 then
                timescale = 1
            end
            if target.CanCustomFlinch == nil then
                target.CanCustomFlinch = true
            end
            if string.find(target:GetSequenceName(target:GetSequence()), "slump") != nil or target:GetActivity() == ACT_MELEE_ATTACK1 or target.isflinchingcustom then
                timer.Simple(timescale*0.01, function()
                    if IsValid(target) and target:Health() > 0 then
                        target:RemoveGesture(ACT_GESTURE_FLINCH_HEAD)
                        target:RemoveGesture(ACT_FLINCH_PHYSICS)
                    end
                end)
            end
            local hasflinchanims = target:LookupSequence("flinch_leftLeg") != -1
            if hasflinchanims and !target.isflinchingcustom and target:GetActivity() != ACT_MELEE_ATTACK1 and string.find(target:GetSequenceName(target:GetSequence()), "slump") == nil and target.CanCustomFlinch then
                local damagetosurpass = math.Rand(0.08,0.3)
                if bit.band(dmginfo:GetDamageType(), DMG_BUCKSHOT) != 0 then
                    damagetosurpass = math.Rand(0.02, 0.07)
                end
                if hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_HEAD then
                    damagetosurpass = math.max((damagetosurpass - math.Rand(0.05, 0.12)), 0.01)
                end
                if dmginfo:GetDamage() >= target:GetMaxHealth() * damagetosurpass then
                    if target:GetClass() == "npc_zombine" and (hitgroup != HITGROUP_LEFTLEG and hitgroup != HITGROUP_RIGHTLEG) then return end
                    local damageforce = dmginfo:GetDamageForce()
                    timer.Simple(timescale*0.04, function()
                        if IsValid(target) and target:Health() > 0 and target.isflinchingcustom then
                            target:RemoveGesture(ACT_GESTURE_FLINCH_HEAD)
                            target:RemoveGesture(ACT_FLINCH_PHYSICS)
                            if target:GetClass() == "npc_zombine" and IsValid(target:GetInternalVariable("m_hGrenade")) then
                                if target:GetInternalVariable("m_hGrenade"):GetInternalVariable("m_flDetonateTime") > 0 then
                                    local detonatetime = target:GetInternalVariable("m_hGrenade"):GetInternalVariable("m_flDetonateTime")
                                    target:GetInternalVariable("m_hGrenade"):Remove()
                                    target:SetSaveValue("m_hGrenade", nil)
                                    CreateZombineGrenade(target:GetAttachment(target:LookupAttachment("grenade_attachment")), damageforce, true, detonatetime)
                                end
                            end
                            if target:GetClass() == "npc_zombine" and target:GetInternalVariable("m_iGrenadeCount") == 1 then
                                target:SetSaveValue("m_iGrenadeCount", 0)
                                timer.Simple(timescale*3, function()
                                    if IsValid(target) and target:Health() > 0 then
                                        target:SetSaveValue("m_iGrenadeCount", 1)
                                    end
                                end)
                            end
                        end
                    end)
                    if !target.isflinchingcustom and hitgroup == HITGROUP_LEFTLEG then
                        target.moddedflinchgesture = target:AddGestureSequence(target:LookupSequence("flinch_leftLeg"))
                        target:SetCondition(67)
                        target.isflinchingcustom = true
                        RestartFlinchSequence(target, target:LookupSequence("flinch_leftLeg"))
                        timer.Simple(timescale*2.65, function()
                            if IsValid(target) and target:Health() > 0 then
                                target:SetCondition(68)
                                target.isflinchingcustom = false
                                target.moddedflinchgesture = nil
                                target:SetActivity(ACT_IDLE)
                            end
                        end)
                    end
                    if !target.isflinchingcustom and hitgroup == HITGROUP_RIGHTLEG then
                        target.moddedflinchgesture = target:AddGestureSequence(target:LookupSequence("flinch_rightleg"))
                        target:SetCondition(67)
                        target.isflinchingcustom = true
                        RestartFlinchSequence(target, target:LookupSequence("flinch_rightleg"))
                        timer.Simple(timescale*1.85, function()
                            if IsValid(target) and target:Health() > 0 then
                                target:SetCondition(68)
                                target.isflinchingcustom = false
                                target.moddedflinchgesture = nil
                                target:SetActivity(ACT_IDLE)
                            end
                        end)
                    end
                    if !target.isflinchingcustom and hitgroup == HITGROUP_LEFTARM then
                        target.moddedflinchgesture = target:AddGestureSequence(target:LookupSequence("flinch_leftarm"))
                        target.isflinchingcustom = true
                        RestartFlinchSequence(target, target:LookupSequence("flinch_leftarm"))
                        timer.Simple(timescale*1, function()
                            if IsValid(target) and target:Health() > 0 then
                                target.isflinchingcustom = false
                                target.moddedflinchgesture = nil
                            end
                        end)
                    end
                    if !target.isflinchingcustom and hitgroup == HITGROUP_RIGHTARM then
                        target.moddedflinchgesture = target:AddGestureSequence(target:LookupSequence("flinch_rightarm"))
                        target.isflinchingcustom = true
                        RestartFlinchSequence(target, target:LookupSequence("flinch_rightarm"))
                        timer.Simple(timescale*1, function()
                            if IsValid(target) and target:Health() > 0 then
                                target.isflinchingcustom = false
                                target.moddedflinchgesture = nil
                            end
                        end)
                    end
                    if !target.isflinchingcustom and hitgroup == HITGROUP_CHEST then
                        target.moddedflinchgesture = target:AddGestureSequence(target:LookupSequence("flinch_chest"))
                        target.isflinchingcustom = true
                        RestartFlinchSequence(target, target:LookupSequence("flinch_chest"))
                        timer.Simple(timescale*1, function()
                            if IsValid(target) and target:Health() > 0 then
                                target.isflinchingcustom = false
                                target.moddedflinchgesture = nil
                            end
                        end)
                    end
                    if !target.isflinchingcustom and hitgroup == HITGROUP_HEAD then
                        target.moddedflinchgesture = target:AddGestureSequence(target:LookupSequence("flinch_head"))
                        target.isflinchingcustom = true
                        RestartFlinchSequence(target, target:LookupSequence("flinch_head"))
                        timer.Simple(timescale*1, function()
                            if IsValid(target) and target:Health() > 0 then
                                target.isflinchingcustom = false
                                target.moddedflinchgesture = nil
                            end
                        end)
                    end
                    if target:GetClass() == "npc_zombine" then
                        target:SetSaveValue("m_flGrenadePullTime", 3)
                    end
                    target.CanCustomFlinch = false
                    timer.Simple(timescale*2.7, function()
                        if IsValid(target) and target:Health() > 0 then
                            target.CanCustomFlinch = true
                        end
                    end)
                end
            end
        end
    end
end)

function AfterZombie(zombie, skin, bonemergemodel, bonemergeskin, animation)
    AfterCreateZombie(zombie, skin, bonemergemodel, bonemergeskin, animation.bonemergemodel.storedcustomplayercolor)
    if animation.headcrabtakeovertttplayerdata != nil then
        zombie.headcrabtakeovertttplayerdata = animation.headcrabtakeovertttplayerdata
    end
    animation:StopSound(animation.zombietype .. "idle.wav")
    animation:Remove()
end