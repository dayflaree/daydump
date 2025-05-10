local PLUGIN = PLUGIN

PLUGIN.name = "Weapon Selection Wheel"
PLUGIN.description = "Ports the Combine Control Weapon Selection Wheel over to the Helix Framework."
PLUGIN.author = "Riggs"
PLUGIN.readme = [[This plugin ports the Combine Control Weapon Selection Wheel over to the Helix Framework. It allows players to select weapons in a more simple boxy format.]]

if ( SERVER ) then
    -- Unload default weapon selection
    ix.plugin.SetUnloaded("wepselect", true)

    -- Networking
    util.AddNetworkString("ixSelectWeapon")
    net.Receive("ixSelectWeapon", function(len, ply)
        if ( !IsValid(ply) ) then return end

        local char = ply:GetCharacter()
        if ( !char ) then return end

        if ( !ply:Alive() ) then return end

        local class = net.ReadString()
        if ( !ply:HasWeapon(class) ) then return end

        ply:SelectWeapon(class)
    end)

    -- Serverside not needed
    return
else
    -- Disable default weapon selection, but clientside
    if ( IsValid(ix.gui.pluginManager) ) then
        ix.gui.pluginManager:UpdatePlugin("wepselect", false)
    end
end

function PLUGIN:CharacterLoaded(char)
    char:GetPlayer().ixCharacterLoaded = true
end

local PLAYER = FindMetaTable("Player")

PLUGIN.WeaponSelectOpenTime = 4

PLUGIN.WeaponSelectRef = PLUGIN.WeaponSelectRef or PLUGIN.WeaponSelectOpenTime * -1
PLUGIN.WeaponSelectSlot = PLUGIN.WeaponSelectSlot or 1
PLUGIN.WeaponSelectSlotPos = PLUGIN.WeaponSelectSlotPos or 1

function PLUGIN:WeaponSelectOpen()
    return ( CurTime() - self.WeaponSelectRef < self.WeaponSelectOpenTime )
end

function PLAYER:GetWeaponsInSlot(n)
    if ( !IsValid(self) ) then return end

    local char = self:GetCharacter()
    if ( !char ) then return end

    if ( !self:Alive() ) then return end

    local w = self:GetWeapons()
    local t = {}

    for _, v in ipairs(w) do
        if ( PLUGIN:WeaponSelectGetSlot( v ) == n ) then
            t[PLUGIN:WeaponSelectGetSlotPos( v )] = v
        end
    end

    if ( table.Count( t ) > 0 ) then
        for i = 1, table.maxn( t ) do
            if ( !t[i] ) then
                t[i] = NULL
            end
        end
    end

    return t
end

function PLAYER:FindSlotsFromWeapon()
    if ( !IsValid(self) ) then return end

    local char = self:GetCharacter()
    if ( !char ) then return end

    if ( !self:Alive() ) then return end

    local wep = self:GetActiveWeapon()

    if ( wep != NULL ) then
        PLUGIN.WeaponSelectSlot = PLUGIN:WeaponSelectGetSlot(wep)
        PLUGIN.WeaponSelectSlotPos = PLUGIN:WeaponSelectGetSlotPos(wep)
    end
end

PLUGIN.OverrideSlots = {}

function PLUGIN:Tick()
    if ( self.nextTick and CurTime() < self.nextTick ) then return end

    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    local weps = ply:GetWeapons()
    if ( weps ) then
        for k, v in ipairs(weps) do
            self.OverrideSlots[v:GetClass()] = {2, k}
        end
    end

    self.OverrideSlots["weapon_physgun"] = {1, 1}
    self.OverrideSlots["gmod_tool"] = {1, 2}

    self.OverrideSlots["ix_hands"] = {3, 1}
    self.OverrideSlots["ix_keys"] = {3, 2}
    self.OverrideSlots["ix_rappel_gear"] = {3, 3}
    self.OverrideSlots["ix_property_register"] = {3, 4}
    self.OverrideSlots["ix_cmb_door_register"] = {3, 5}

    self.nextTick = CurTime() + 1
end

function PLUGIN:WeaponSelectGetPrintName(wep)
    if ( !IsValid(wep) ) then return end

    if ( wep.PrintName ) then
        return wep.PrintName
    end

    return language.GetPhrase(wep:GetClass())
end

function PLUGIN:WeaponSelectGetSlot(wep)
    if ( !IsValid(wep) ) then return end

    if ( self.OverrideSlots[wep:GetClass()] ) then
        return self.OverrideSlots[wep:GetClass()][1]
    end

    return 2
end

function PLUGIN:WeaponSelectGetSlotPos(wep)
    if ( !IsValid(wep) ) then return end

    if ( self.OverrideSlots[wep:GetClass()] ) then
        return self.OverrideSlots[wep:GetClass()][2]
    end

    return 1
end

function PLUGIN:WeaponSelectGetFirstPos()
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    local n = 1

    while ( ply:GetWeaponsInSlot(self.WeaponSelectSlot)[n] == NULL and n < #ply:GetWeaponsInSlot( self.WeaponSelectSlot ) ) do
        n = n + 1
    end

    return n
end

function PLUGIN:WeaponSelectNumber(n)
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    if ( #ply:GetWeapons() == 0 ) then return end
    if ( #ply:GetWeaponsInSlot(n) == 0 ) then return end

    ply:EmitSound("Minerva.Menu.Hover")

    if ( self:WeaponSelectOpen() ) then
        if ( self.WeaponSelectSlot == n ) then
            self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1

            while( ply:GetWeaponsInSlot( self.WeaponSelectSlot )[self.WeaponSelectSlotPos] == NULL and self.WeaponSelectSlotPos <= #ply:GetWeaponsInSlot( self.WeaponSelectSlot ) ) do
                self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1
            end

            while( self.WeaponSelectSlotPos > #ply:GetWeaponsInSlot( self.WeaponSelectSlot ) ) do
                self.WeaponSelectSlotPos = 1
            end

            self.WeaponSelectRef = CurTime()
        else
            self.WeaponSelectSlot = n
            self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
        end
    else
        self.WeaponSelectSlot = n
        self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
    end

    self.WeaponSelectRef = CurTime()
end

function PLUGIN:WeaponSelectScrollDown()
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    if ( #ply:GetWeapons() == 0 ) then return end

    ply:EmitSound("Minerva.Menu.Hover")

    if ( self:WeaponSelectOpen() ) then
        self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1

        while( ply:GetWeaponsInSlot( self.WeaponSelectSlot )[self.WeaponSelectSlotPos] == NULL and self.WeaponSelectSlotPos <= #ply:GetWeaponsInSlot( self.WeaponSelectSlot ) ) do
            self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1
        end

        while( self.WeaponSelectSlotPos > #ply:GetWeaponsInSlot( self.WeaponSelectSlot ) ) do

            self.WeaponSelectSlot = self.WeaponSelectSlot + 1
            self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
            if ( self.WeaponSelectSlot > 3 ) then
                self.WeaponSelectSlot = 1
                self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
            end
        end

        self.WeaponSelectRef = CurTime()
    else
        ply:FindSlotsFromWeapon()
        self.WeaponSelectRef = CurTime()
    end
end

function PLUGIN:WeaponSelectScrollUp()
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    if ( #ply:GetWeapons() == 0 ) then return end

    ply:EmitSound("Minerva.Menu.Hover")

    if ( self:WeaponSelectOpen() ) then
        self.WeaponSelectSlotPos = self.WeaponSelectSlotPos - 1

        while( ply:GetWeaponsInSlot( self.WeaponSelectSlot )[self.WeaponSelectSlotPos] == NULL and self.WeaponSelectSlotPos >= 1 ) do

            self.WeaponSelectSlotPos = self.WeaponSelectSlotPos - 1
        end

        while( self.WeaponSelectSlotPos < 1 or #ply:GetWeaponsInSlot( self.WeaponSelectSlot ) == 0 ) do
            self.WeaponSelectSlot = self.WeaponSelectSlot - 1
            self.WeaponSelectSlotPos = #ply:GetWeaponsInSlot( self.WeaponSelectSlot )

            if ( self.WeaponSelectSlot < 1 ) then
                self.WeaponSelectSlot = 3
                self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
            end
        end

        self.WeaponSelectRef = CurTime()
    else
        ply:FindSlotsFromWeapon()
        self.WeaponSelectRef = CurTime()
    end
end

function PLUGIN:WeaponSelectClick()
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    ply:EmitSound("Minerva.Menu.Press")

    self.WeaponSelectRef = 0

    if ( ply:GetWeaponsInSlot(self.WeaponSelectSlot)[self.WeaponSelectSlotPos] and IsValid(ply:GetWeaponsInSlot(self.WeaponSelectSlot)[self.WeaponSelectSlotPos]) ) then
        net.Start("ixSelectWeapon")
            net.WriteString( ply:GetWeaponsInSlot( self.WeaponSelectSlot )[self.WeaponSelectSlotPos]:GetClass() )
        net.SendToServer()
    end
end

PLUGIN.WeaponSelectWidth = 150

local a = 0
function PLUGIN:DrawWeaponSelect()
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    local ft = FrameTime()
    local time = ft * 10

    local d = CurTime() - self.WeaponSelectRef
    if ( d < self.WeaponSelectOpenTime - 1 ) then
        a = Lerp(time, a, 1 )
    elseif ( d < self.WeaponSelectOpenTime ) then
        a = Lerp(time, a, 1 - ( d - ( self.WeaponSelectOpenTime - 1 ) ) )
    else
        a = Lerp(time, a, 0 )
    end

    local configColor = ix.config.Get("color")
    if ( a > 0 ) then
        local basicWidth = ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth
        local weaponsWidth = ScrW() / 2 - self.WeaponSelectWidth / 2
        local miscWidth = ScrW() / 2 - self.WeaponSelectWidth / 2 + 20 + self.WeaponSelectWidth

        if ( self.WeaponSelectSlot == 1 ) then
            draw.RoundedBox(0, basicWidth, 20, self.WeaponSelectWidth, 30, ColorAlpha(configColor, 200 * a))
            draw.RoundedBox(0, weaponsWidth, 20, self.WeaponSelectWidth, 30, Color(40, 40, 40, 200 * a ))
            draw.RoundedBox(0, miscWidth, 20, self.WeaponSelectWidth, 30, Color(40, 40, 40, 200 * a ))

            draw.SimpleText("Building", "MinervaFont6", basicWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 255 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Combat", "MinervaFont6", weaponsWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 200 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Other", "MinervaFont6", miscWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 200 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        elseif ( self.WeaponSelectSlot == 2 ) then
            draw.RoundedBox(0, basicWidth, 20, self.WeaponSelectWidth, 30, Color(40, 40, 40, 200 * a))
            draw.RoundedBox(0, weaponsWidth, 20, self.WeaponSelectWidth, 30, ColorAlpha(configColor, 200 * a))
            draw.RoundedBox(0, miscWidth, 20, self.WeaponSelectWidth, 30, Color(40, 40, 40, 200 * a))

            draw.SimpleText("Building", "MinervaFont6", basicWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 200 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Combat", "MinervaFont6", weaponsWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 255 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Other", "MinervaFont6", miscWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 200 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.RoundedBox(0, basicWidth, 20, self.WeaponSelectWidth, 30, Color(40, 40, 40, 200 * a))
            draw.RoundedBox(0, weaponsWidth, 20, self.WeaponSelectWidth, 30, Color(40, 40, 40, 200 * a))
            draw.RoundedBox(0, miscWidth, 20, self.WeaponSelectWidth, 30, ColorAlpha(configColor, 200 * a))

            draw.SimpleText("Building", "MinervaFont6", basicWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 200 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Combat", "MinervaFont6", weaponsWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 200 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Other", "MinervaFont6", miscWidth + self.WeaponSelectWidth / 2, 35, Color(255, 255, 255, 255 * a), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        local y = 0
        for k, v in pairs(ply:GetWeaponsInSlot(self.WeaponSelectSlot)) do
            if ( v == NULL ) then continue end

            local c = Color(0, 0, 0, 200 * a )

            if ( self.WeaponSelectSlotPos == k ) then
                c = ColorAlpha( configColor, 200 * a )
            end

            local text = self:WeaponSelectGetPrintName( v )

            surface.SetFont("MinervaFont6")
            local w, h = surface.GetTextSize( text )

            draw.RoundedBox(0, weaponsWidth - 20 - self.WeaponSelectWidth, 70 + y, self.WeaponSelectWidth * 3 + 40, h + 20, c )
            draw.SimpleText(text, "MinervaFont6", weaponsWidth + self.WeaponSelectWidth / 2, 70 + y + 20, Color(255, 255, 255, 200 * a ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            y = y + h + 30
        end
    end
end

function PLUGIN:HUDPaint()
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    self:DrawWeaponSelect()
end

function PLUGIN:PlayerBindPress(client, bind, down)
    local ply = LocalPlayer()
    if ( !IsValid(ply) ) then return end

    local char = ply:GetCharacter()
    if ( !char ) then return end

    if ( !ply:Alive() ) then return end

    if ( down and string.find(bind, "invnext") and !ply:KeyDown(IN_ATTACK) and !ply:KeyDown(IN_ATTACK2) and !ply:InVehicle() and ply:Alive() ) then
        self:WeaponSelectScrollDown()
        return true
    end

    if ( down and string.find( bind, "invprev") and !ply:KeyDown(IN_ATTACK) and !ply:KeyDown(IN_ATTACK2) and !ply:InVehicle() and ply:Alive() ) then
        self:WeaponSelectScrollUp()
        return true
    end

    if ( down and string.find(bind, "attack") and self:WeaponSelectOpen() and !ply:KeyDown(IN_ATTACK) and !ply:KeyDown(IN_ATTACK2) and !ply:InVehicle() and ply:Alive() ) then
        self:WeaponSelectClick()
        return true
    end

    if ( down and string.find(bind, "slot") and !ply:InVehicle() and ply:Alive() ) then
        local a, _ = string.gsub(bind, "slot", "")
        local n = tonumber(a)

        if ( n == 1 or n == 2 or n == 3 ) then
            self:WeaponSelectNumber(n)
        end

        return true
    end
end