## READ THIS: Oh no! You wanted to jump in and there is a huge wall of text. Search for "intereresting stuff start here" to get to the good bits
$REGION = 'NA'

# crafting type consts
$CRAFTING_TYPE_ALCHEMY = 4 
$CRAFTING_TYPE_BLACKSMITHING = 1 
$CRAFTING_TYPE_CLOTHIER = 2 
$CRAFTING_TYPE_ENCHANTING = 3 
$CRAFTING_TYPE_JEWELRYCRAFTING = 7 
$CRAFTING_TYPE_PROVISIONING = 5 
$CRAFTING_TYPE_WOODWORKING = 6 
$crafting_type_descriptions = @{
    $CRAFTING_TYPE_ALCHEMY = "Alchemy"
    $CRAFTING_TYPE_BLACKSMITHING = "Blacksmithing"
    $CRAFTING_TYPE_CLOTHIER = "Clothier"
    $CRAFTING_TYPE_ENCHANTING = "Enchanting"
    $CRAFTING_TYPE_JEWELRYCRAFTING = "Jewelry"
    $CRAFTING_TYPE_PROVISIONING = "Provisioning"
    $CRAFTING_TYPE_WOODWORKING = "Woodworking"
}
# item trait constants
$ITEM_TRAIT_TYPE_ARMOR_DIVINES = 18 
$ITEM_TRAIT_TYPE_ARMOR_EXPLORATION = 17 
$ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE = 12 
$ITEM_TRAIT_TYPE_ARMOR_INFUSED = 16 
$ITEM_TRAIT_TYPE_ARMOR_INTRICATE = 20 
$ITEM_TRAIT_TYPE_ARMOR_NIRNHONED = 25 
$ITEM_TRAIT_TYPE_ARMOR_ORNATE = 19 
$ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS = 17 
$ITEM_TRAIT_TYPE_ARMOR_REINFORCED = 13 
$ITEM_TRAIT_TYPE_ARMOR_STURDY = 11 
$ITEM_TRAIT_TYPE_ARMOR_TRAINING = 15 
$ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED = 14 
$ITEM_TRAIT_TYPE_JEWELRY_ARCANE = 22 
$ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY = 31 
$ITEM_TRAIT_TYPE_JEWELRY_HARMONY = 29 
$ITEM_TRAIT_TYPE_JEWELRY_HEALTHY = 21 
$ITEM_TRAIT_TYPE_JEWELRY_INFUSED = 33 
$ITEM_TRAIT_TYPE_JEWELRY_INTRICATE = 27 
$ITEM_TRAIT_TYPE_JEWELRY_ORNATE = 24 
$ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE = 32 
$ITEM_TRAIT_TYPE_JEWELRY_ROBUST = 23 
$ITEM_TRAIT_TYPE_JEWELRY_SWIFT = 28 
$ITEM_TRAIT_TYPE_JEWELRY_TRIUNE = 30 
$ITEM_TRAIT_TYPE_WEAPON_CHARGED = 2 
$ITEM_TRAIT_TYPE_WEAPON_DECISIVE = 8 
$ITEM_TRAIT_TYPE_WEAPON_DEFENDING = 5 
$ITEM_TRAIT_TYPE_WEAPON_INFUSED = 4 
$ITEM_TRAIT_TYPE_WEAPON_INTRICATE = 9 
$ITEM_TRAIT_TYPE_WEAPON_NIRNHONED = 26 
$ITEM_TRAIT_TYPE_WEAPON_ORNATE = 10 
$ITEM_TRAIT_TYPE_WEAPON_POWERED = 1 
$ITEM_TRAIT_TYPE_WEAPON_PRECISE = 3 
$ITEM_TRAIT_TYPE_WEAPON_SHARPENED = 7 
$ITEM_TRAIT_TYPE_WEAPON_TRAINING = 6 
$ITEM_TRAIT_TYPE_WEAPON_WEIGHTED = 8
$item_trait_descriptions = @{
    $ITEM_TRAIT_TYPE_ARMOR_DIVINES = "Divines"
    $ITEM_TRAIT_TYPE_ARMOR_EXPLORATION = "Invigorating" # aka Exploration
    $ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE = "Impenetrable"
    $ITEM_TRAIT_TYPE_ARMOR_INFUSED = "Infused"
    $ITEM_TRAIT_TYPE_ARMOR_INTRICATE = "Intricate"
    $ITEM_TRAIT_TYPE_ARMOR_NIRNHONED = "Nirnhoned"
    $ITEM_TRAIT_TYPE_ARMOR_ORNATE = "Ornate"
    # $ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS = "Prosperous"
    $ITEM_TRAIT_TYPE_ARMOR_REINFORCED = "Reinforced"
    $ITEM_TRAIT_TYPE_ARMOR_STURDY = "Sturdy"
    $ITEM_TRAIT_TYPE_ARMOR_TRAINING = "Training"
    $ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED = "Well Fitted"
    $ITEM_TRAIT_TYPE_JEWELRY_ARCANE = "Arcane"
    $ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY = "Bloodthirsty" 
    $ITEM_TRAIT_TYPE_JEWELRY_HARMONY = "Harmony"
    $ITEM_TRAIT_TYPE_JEWELRY_HEALTHY = "Healthy"
    $ITEM_TRAIT_TYPE_JEWELRY_INFUSED = "Infused"
    $ITEM_TRAIT_TYPE_JEWELRY_INTRICATE = "Intricate"
    $ITEM_TRAIT_TYPE_JEWELRY_ORNATE = "Ornate"
    $ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE = "Protective"
    $ITEM_TRAIT_TYPE_JEWELRY_ROBUST = "Robust"
    $ITEM_TRAIT_TYPE_JEWELRY_SWIFT = "Swift"
    $ITEM_TRAIT_TYPE_JEWELRY_TRIUNE = "Triune"
    $ITEM_TRAIT_TYPE_WEAPON_CHARGED = "Charged"
    $ITEM_TRAIT_TYPE_WEAPON_DECISIVE = "Decisive"
    $ITEM_TRAIT_TYPE_WEAPON_DEFENDING = "Defending"
    $ITEM_TRAIT_TYPE_WEAPON_INFUSED = "Infused"
    $ITEM_TRAIT_TYPE_WEAPON_INTRICATE = "Intricate"
    $ITEM_TRAIT_TYPE_WEAPON_NIRNHONED = "Nirnhoned"
    $ITEM_TRAIT_TYPE_WEAPON_ORNATE = "Ornate"
    $ITEM_TRAIT_TYPE_WEAPON_POWERED = "Powered"
    $ITEM_TRAIT_TYPE_WEAPON_PRECISE = "Precise"
    $ITEM_TRAIT_TYPE_WEAPON_SHARPENED = "Sharpened"
    $ITEM_TRAIT_TYPE_WEAPON_TRAINING = "Training"
    # $ITEM_TRAIT_TYPE_WEAPON_WEIGHTED = "Weighted"

}

function Get-ItemTraitIdByIndex
{
    param (
        [Int] $craftingType,
        [Int] $researchLine,
        [Int] $index
    )
    if ($craftingType -eq 6) #woodworking
    {
        $out = $index
        if ($index -eq 9) { $out = 26 } # nirnhoned wep
        if ($researchLine -eq 6)
        {
            $out = $out + 10
            if ($index -eq 9) { $out = 25 } # #nirnhoned armor
        }
    }
    if ($craftingType -eq 7) # jewelrycrafting
    {
        # there is literally no rhyme or reason to the jewelry traits
        if ($index -eq 1) { $out = $ITEM_TRAIT_TYPE_JEWELRY_ARCANE }
        if ($index -eq 2) { $out = $ITEM_TRAIT_TYPE_JEWELRY_HEALTHY }
        if ($index -eq 3) { $out = $ITEM_TRAIT_TYPE_JEWELRY_ROBUST }
        if ($index -eq 4) { $out = $ITEM_TRAIT_TYPE_JEWELRY_TRIUNE }
        if ($index -eq 5) { $out = $ITEM_TRAIT_TYPE_JEWELRY_INFUSED }
        if ($index -eq 6) { $out = $ITEM_TRAIT_TYPE_JEWELRY_PROTEcTIVE }
        if ($index -eq 7) { $out = $ITEM_TRAIT_TYPE_JEWELRY_SWIFT }
        if ($index -eq 8) { $out = $ITEM_TRAIT_TYPE_JEWELRY_HARMONY }
        if ($index -eq 9) { $out = $ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY }
    }
    if ($craftingType -eq 1) # blacksmithing
    {
        $out = $index
        if ($index -eq 9) { $out = 26 }
        if ($researchLine -gt 7)
        {
            $out = $index + 10
            if ($index -eq 9) { $out = 25 }
        }
    }
    if ($craftingType -eq 2) #clothier
    {
        $out = $index + 10
        if ($index -eq 9) { $out = 25 }
    }
    return $out
}

# research line constants
# clothing
$RESEARCH_LINE_LIGHT_CHEST = 1 # robe & jerkin
$RESEARCH_LINE_LIGHT_FEET = 2 # shoes
$RESEARCH_LINE_LIGHT_HANDS = 3 # gloves
$RESEARCH_LINE_LIGHT_HEAD = 4 # hat
$RESEARCH_LINE_LIGHT_LEGS = 5 # breeches
$RESEARCH_LINE_LIGHT_SHOULDER = 6 # Epaulets
$RESEARCH_LINE_LIGHT_BELT = 7 # Sash
$RESEARCH_LINE_MEDIUM_CHEST = 8 # Jack
$RESEARCH_LINE_MEDIUM_FEET = 9 # Boots
$RESEARCH_LINE_MEDIUM_HANDS = 10 # Bracers
$RESEARCH_LINE_MEDIUM_HEAD = 11 # Helmet
$RESEARCH_LINE_MEDIUM_LEGS = 12 # Guards
$RESEARCH_LINE_MEDIUM_SHOULDER = 13 # Arm Cops
$RESEARCH_LINE_MEDIUM_BELT = 14 # Belt
# blacksmithing
# these do not align with the WEAPONTYPE constants
$RESEARCH_LINE_AXE = 1 # Axe
$RESEARCH_LINE_MACE = 2 # Mace
$RESEARCH_LINE_SWORD = 3 # Sword
$RESEARCH_LINE_BATTLEAXE = 4 # Battle Axe
$RESEARCH_LINE_MAUL = 5 # Maul
$RESEARCH_LINE_GREATSWORD = 6 # Greatsword
$RESEARCH_LINE_DAGGER = 7 # Dagger
$RESEARCH_LINE_HEAVY_CHEST = 8 # Cuirass
$RESEARCH_LINE_HEAVY_FEET = 9  # Sabatons
$RESEARCH_LINE_HEAVY_HANDS = 10 # Gauntlets
$RESEARCH_LINE_HEAVY_HEAD = 11 # Helm
$RESEARCH_LINE_HEAVY_LEGS = 12 # Greaves
$RESEARCH_LINE_HEAVY_SHOULDER = 13 # Pauldron
$RESEARCH_LINE_HEAVY_BELT = 14 # Girdle

# woodworking
$RESEARCH_LINE_BOW = 1 # bow
$RESEARCH_LINE_FIRE_STAFF = 2 # Inferno Staff
$RESEARCH_LINE_ICE_STAFF = 3 # Ice Staff
$RESEARCH_LINE_LIGHTNING_STAFF = 4 # Lightning Staff
$RESEARCH_LINE_HEALING_STAFF = 5 # Restoration Staff
$RESEARCH_LINE_SHIELD = 6 # Shield

# jewelry
$RESEARCH_LINE_NECKLACE = 1 # Necklace
$RESEARCH_LINE_RING = 2 # Ring

$research_line_descriptions = @{
    $CRAFTING_TYPE_CLOTHIER = @{
        $RESEARCH_LINE_LIGHT_CHEST = "Robe & Jerkin"
        $RESEARCH_LINE_LIGHT_FEET = "Shoes"
        $RESEARCH_LINE_LIGHT_HANDS = "Gloves"
        $RESEARCH_LINE_LIGHT_HEAD = "Hat"
        $RESEARCH_LINE_LIGHT_LEGS = "Breeches"
        $RESEARCH_LINE_LIGHT_SHOULDER = "Epaulets"
        $RESEARCH_LINE_LIGHT_BELT = "Sash"
        $RESEARCH_LINE_MEDIUM_CHEST = "Jack"
        $RESEARCH_LINE_MEDIUM_FEET = "Boots"
        $RESEARCH_LINE_MEDIUM_HANDS = "Bracers"
        $RESEARCH_LINE_MEDIUM_HEAD = "Helmet"
        $RESEARCH_LINE_MEDIUM_LEGS = "Guards"
        $RESEARCH_LINE_MEDIUM_SHOULDER = "Arm Cops"
        $RESEARCH_LINE_MEDIUM_BELT = "Belt"
    }
    $CRAFTING_TYPE_BLACKSMITHING = @{
        $RESEARCH_LINE_AXE = "Axe"
        $RESEARCH_LINE_MACE = "Mace"
        $RESEARCH_LINE_SWORD = "Sword"
        $RESEARCH_LINE_BATTLEAXE = "Battle Axe"
        $RESEARCH_LINE_MAUL = "Maul"
        $RESEARCH_LINE_GREATSWORD = "Greatsword"
        $RESEARCH_LINE_DAGGER = "Dagger"
        $RESEARCH_LINE_HEAVY_CHEST = "Cuirass"
        $RESEARCH_LINE_HEAVY_FEET = "Sabatons"
        $RESEARCH_LINE_HEAVY_HANDS = "Gauntlets"
        $RESEARCH_LINE_HEAVY_HEAD = "Helm"
        $RESEARCH_LINE_HEAVY_LEGS = "Greaves"
        $RESEARCH_LINE_HEAVY_SHOULDER = "Pauldron"
        $RESEARCH_LINE_HEAVY_BELT = "Girdle"
    
    }
    $CRAFTING_TYPE_WOODWORKING = @{
        $RESEARCH_LINE_BOW = "Bow"
        $RESEARCH_LINE_FIRE_STAFF = "Inferno Staff"
        $RESEARCH_LINE_ICE_STAFF = "Ice Staff"
        $RESEARCH_LINE_LIGHTNING_STAFF = "Lightning Staff"
        $RESEARCH_LINE_HEALING_STAFF = "Restoration Staff"
        $RESEARCH_LINE_SHIELD = "Shield"
    
    } 
    $CRAFTING_TYPE_JEWELRYCRAFTING = @{
        $RESEARCH_LINE_NECKLACE = "Necklace"
        $RESEARCH_LINE_RING = "Ring"
    
    }

}


function Get-EmptyResultTable()
{
    $out = @{1=@{}}

    foreach ($crafting_type in @(1,2,6,7))
    {
        $out[$crafting_type] = @{}
        
        if ($crafting_type -lt 3) # lazy, captures blacksmithing and clothing
        {
            foreach ($research_line in (1..14)) { $out[$crafting_type][$research_line] = @{} }

        }
        if ($crafting_type -eq 6)
        {
            foreach ($research_line in (1..6)) { $out[$crafting_type][$research_line] = @{} }

        }
        if ($crafting_type -eq 7)
        {
            foreach ($research_line in (1..2)) { $out[$crafting_type][$research_line] = @{} }

        }
        foreach ($research_line in $out[$crafting_type].Keys)
        { 
            foreach ($trait_id in (1..9)) { $out[$crafting_type][$research_line][$trait_id] = 0 }
        }
        

    }
    return $out
}

# "interesting stuff starts here"
Add-Type -Path "$($pwd.Path)\KeraLua.dll"
Add-Type -Path "$($pwd.Path)\NLua.dll"

$lua = [NLua.Lua]::new()
$lua.DoFile("C:\$($env:HOMEPATH)\Documents\Elder Scrolls Online\live\SavedVariables\TraitBuddy.lua")

$res = Get-EmptyResultTable
foreach ($account in $lua['TraitBuddySettings'][$REGION].Keys)
{
    $characters = $lua['TraitBuddySettings'][$REGION][$account]['$AccountWide']['characters'].Keys
    foreach ($id in $characters)
    {
        $character = $lua['TraitBuddySettings'][$REGION][$account]['$AccountWide']['characters'][$id]
        $name =  $character['name']

        foreach ($crafting_type in $character['research'].Keys)
        {
            foreach ($research_line in $character['research'][$crafting_type].Keys)
            {
                foreach ($trait in $character['research'][$crafting_type][$research_line].Keys)
                {
                    $status = $character['research'][$crafting_type][$research_line][$trait]
                    # if status is true its done, and if it's a lua table its researching and for our purposes that's the same thing
                    if ($status -ne $false)
                    { 
                        $res[[int]$crafting_type][[int]$research_line][[int]$trait]++ 
                    }
                }
            }
        }
    }
}
foreach ($crafting_type in $res.Keys)
{
    foreach ($research_line in $res[$crafting_type].Keys)
    {
        foreach ($trait in $res[$crafting_type][$research_line].Keys)
        {
            $traitId = Get-ItemTraitIdByIndex -craftingType $crafting_type -researchLine $research_line -index $trait
            Write-Output "type:$($crafting_type_descriptions[$crafting_type]),typeId:$($crafting_type),lineId:$($research_line),line:$($research_line_descriptions[$crafting_type][$research_line]),traitIndex:$($trait),traitId:$($traitId),trait:$($item_trait_descriptions[$traitId]),done:$($res[$crafting_type][$research_line][$trait])"
        }
    }

}
