--================= Hercules Database =====================================
--=       _   _                     _
--=      | | | |                   | |
--=      | |_| | ___ _ __ ___ _   _| | ___  ___
--=      |  _  |/ _ \ '__/ __| | | | |/ _ \/ __|
--=      | | | |  __/ | | (__| |_| | |  __/\__ \
--=      \_| |_/\___|_|  \___|\__,_|_|\___||___/
--================= License ===============================================
--= This file is part of Hercules.
--= http:--herc.ws - http:--github.com/HerculesWS/Hercules
--=
--= Copyright (C) 2014-2016  Hercules Dev Team
--=
--= Hercules is free software: you can redistribute it and/or modify
--= it under the terms of the GNU General Public License as published by
--= the Free Software Foundation, either version 3 of the License, or
--= (at your option) any later version.
--=
--= This program is distributed in the hope that it will be useful,
--= but WITHOUT ANY WARRANTY; without even the implied warranty of
--= MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--= GNU General Public License for more details.
--=
--= You should have received a copy of the GNU General Public License
--= along with this program.  If not, see <http:--www.gnu.org/licenses/>.
--=========================================================================
--= Items Database
--=========================================================================

item_db = {
--[[
 **************************************************************************
 ************* Entry structure ********************************************
 **************************************************************************
{
	-- ================ Mandatory fields ==============================
	Id = ID                        (int),
	AegisName = "Aegis_Name"       (string),
	Name = "Item Name"             (string),
	-- ================ Optional fields ===============================
	Type = Item Type               (string, defaults to "IT_TYPE_ETC"),
	Buy = Buy Price                (int, defaults to Sell * 2),
	Sell = Sell Price              (int, defaults to Buy ,/ 2)
	Weight = Item Weight           (int, defaults to 0),
	Atk = Attack                   (int, defaults to 0),
	Matk = Magical Attack          (int, defaults to 0, ignored in pre-re),
	Def = Defense                  (int, defaults to 0),
	Range = Attack Range           (int, defaults to 0),
	Slots = Slots                  (int, defaults to 0),
	Job = {                        (defaults to all job)
		All = true,/false               (boolean, defaults to false)
		Novice = true,/false            (boolean, defaults to false)
		Swordsman = true,/false         (boolean, defaults to false)
		Magician = true,/false          (boolean, defaults to false)
		Archer = true,/false            (boolean, defaults to false)
		Acolyte = true,/false           (boolean, defaults to false)
		Merchant = true,/false          (boolean, defaults to false)
		Thief = true,/false             (boolean, defaults to false)
		Knight = true,/false            (boolean, defaults to false)
		Priest = true,/false            (boolean, defaults to false)
		Wizard = true,/false            (boolean, defaults to false)
		Blacksmith = true,/false        (boolean, defaults to false)
		Hunter = true,/false            (boolean, defaults to false)
		Assassin = true,/false          (boolean, defaults to false)
		Crusader = true,/false          (boolean, defaults to false)
		Monk = true,/false              (boolean, defaults to false)
		Sage = true,/false              (boolean, defaults to false)
		Rogue = true,/false             (boolean, defaults to false)
		Alchemist = true,/false         (boolean, defaults to false)
		Bard = true,/false              (boolean, defaults to false)
		Taekwon = true,/false           (boolean, defaults to false)
		Star_Gladiator = true,/false    (boolean, defaults to false)
		Soul_Linker = true,/false       (boolean, defaults to false)
		Gunslinger = true,/false        (boolean, defaults to false)
		Ninja = true,/false             (boolean, defaults to false)
		Gangsi = true,/false            (boolean, defaults to false)
		Death_Knight = true,/false      (boolean, defaults to false)
		Dark_Collector = true,/false    (boolean, defaults to false)
		Kagerou = true,/false           (boolean, defaults to false)
		Rebellion = true,/false         (boolean, defaults to false)
	},
	Job = Job mask                 (alternate format, int, defaults to all jobs ,= 0xFFFFFFFF)
	Upper = Upper mask             (bitmask array, string or int, defaults to "ITEMUPPER_ALL"),
	Gender = Gender                (string, defaults to "IT_GENDER_ANY"),
	Loc = Equip location           (bitmask array, string or int, required value for equipment),
	WeaponLv = Weapon Level        (int, defaults to 0),
	EquipLv = Equip required level (int, defaults to 0),
	EquipLv = { min, max },           (alternative syntax with min / max level)
	Refine = Refineable            (boolean, defaults to true),
	EnableOptions = true,/false     (boolean, defaults to true !!for equipments only!!) [Smokexyz]
	Subtype = Item Subtype         (int, defaults to 0),
	ViewSprite = Sprite view ID    (int, defaults to 0),
	BindOnEquip = true,/false       (boolean, defaults to false)
	ForceSerial = true,/false       (boolean, defaults to false)
	BuyingStore = true,/false       (boolean, defaults to false)
	Delay = Delay to use item      (int, defaults to 0),
	KeepAfterUse = true,/false      (boolean, defaults to false)
	DropAnnounce = true,/false      (boolean, defaults to false)
	ShowDropEffect = true,/false    (boolean, defaults to false)
	DropEffectMode = Effect Type   (int, default to 0),
	Trade = {                      (defaults to no restrictions)
		override = GroupID             (int, defaults to 100),
		nodrop = true,/false            (boolean, defaults to false)
		notrade = true,/false           (boolean, defaults to false)
		nostorage = true,/false         (boolean, defaults to false)
		nocart = true,/false            (boolean, defaults to false)
		noselltonpc = true,/false       (boolean, defaults to false)
		nomail = true,/false            (boolean, defaults to false)
		noauction = true,/false         (boolean, defaults to false)
		nogstorage = true,/false        (boolean, defaults to false)
		partneroverride = true,/false   (boolean, defaults to false)
	},
	Nouse = {                      (defaults to no restrictions)
		override = GroupID             (int, defaults to 100),
		sitting = true,/false           (boolean, defaults to false)
	},
	Stack = { amount, type },         (int, defaults to 0)
	Sprite = SpriteID              (int, defaults to 0),
	Script = --[[ (it can be multi-line) --]] --[[

	OnEquipScript = [[ OnEquip Script (can also be multi-line) --]] --[[
	OnUnequipScript = [[ OnUnequip Script (can also be multi-line) --]] --[[
},
**************************************************************************/
--]]

--== Healing Items =========================================
[501] = {
	AegisName = "Red_Potion",
	Name = "Red Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 50,
	Weight = 70,
	Script = [[ itemheal rand(45,65),0; ]]
},
[502] = {
	AegisName = "Orange_Potion",
	Name = "Orange Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 200,
	Weight = 100,
	Script = [[ itemheal rand(105,145),0; ]]
},
[503] = {
	AegisName = "Yellow_Potion",
	Name = "Yellow Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 550,
	Weight = 130,
	Script = [[ itemheal rand(175,235),0; ]]
},
[504] = {
	AegisName = "White_Potion",
	Name = "White Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 1200,
	Weight = 150,
	Script = [[ itemheal rand(325,405),0; ]]
},
[505] = {
	AegisName = "Blue_Potion",
	Name = "Blue Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 5000,
	Weight = 150,
	Script = [[ itemheal 0,rand(40,60); ]]
},
[506] = {
	AegisName = "Green_Potion",
	Name = "Green Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 40,
	Weight = 70,
	BuyingStore = true,
	Script = [[
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_ILLUSION;
	]]
},
[507] = {
	AegisName = "Red_Herb",
	Name = "Red Herb",
	Type = "IT_TYPE_HEALING",
	Buy = 18,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(18,28),0; ]]
},
[508] = {
	AegisName = "Yellow_Herb",
	Name = "Yellow Herb",
	Type = "IT_TYPE_HEALING",
	Buy = 40,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemheal rand(38,58),0; ]]
},
[509] = {
	AegisName = "White_Herb",
	Name = "White Herb",
	Type = "IT_TYPE_HEALING",
	Buy = 120,
	Weight = 70,
	BuyingStore = true,
	Script = [[ itemheal rand(75,115),0; ]]
},
[510] = {
	AegisName = "Blue_Herb",
	Name = "Blue Herb",
	Type = "IT_TYPE_HEALING",
	Buy = 60,
	Weight = 70,
	BuyingStore = true,
	Script = [[ itemheal 0,rand(15,30); ]]
},
[511] = {
	AegisName = "Green_Herb",
	Name = "Green Herb",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 30,
	BuyingStore = true,
	Script = [[ sc_end SC_POISON; ]]
},
[512] = {
	AegisName = "Apple",
	Name = "Apple",
	Type = "IT_TYPE_HEALING",
	Buy = 15,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(16,22),0; ]]
},
[513] = {
	AegisName = "Banana",
	Name = "Banana",
	Type = "IT_TYPE_HEALING",
	Buy = 15,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(17,21),0; ]]
},
[514] = {
	AegisName = "Grape",
	Name = "Grape",
	Type = "IT_TYPE_HEALING",
	Buy = 200,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal 0,rand(10,15); ]]
},
[515] = {
	AegisName = "Carrot",
	Name = "Carrot",
	Type = "IT_TYPE_HEALING",
	Buy = 15,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(18,20),0; ]]
},
[516] = {
	AegisName = "Sweet_Potato",
	Name = "Potato",
	Type = "IT_TYPE_HEALING",
	Buy = 15,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(15,23),0; ]]
},
[517] = {
	AegisName = "Meat",
	Name = "Meat",
	Type = "IT_TYPE_HEALING",
	Buy = 50,
	Weight = 150,
	BuyingStore = true,
	Script = [[ itemheal rand(70,100),0; ]]
},
[518] = {
	AegisName = "Honey",
	Name = "Honey",
	Type = "IT_TYPE_HEALING",
	Buy = 500,
	Weight = 100,
	BuyingStore = true,
	Script = [[ itemheal rand(70,100),rand(20,40); ]]
},
[519] = {
	AegisName = "Milk",
	Name = "Milk",
	Type = "IT_TYPE_HEALING",
	Buy = 25,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(27,37),0; ]]
},
[520] = {
	AegisName = "Leaflet_Of_Hinal",
	Name = "Hinalle Leaflet",
	Type = "IT_TYPE_HEALING",
	Buy = 150,
	Weight = 10,
	BuyingStore = true,
	Script = [[ itemheal rand(175,235),0; ]]
},
[521] = {
	AegisName = "Leaflet_Of_Aloe",
	Name = "Aloe Leaflet",
	Type = "IT_TYPE_HEALING",
	Buy = 360,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(325,405),0; ]]
},
[522] = {
	AegisName = "Fruit_Of_Mastela",
	Name = "Mastela Fruit",
	Type = "IT_TYPE_HEALING",
	Buy = 8500,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(400,600),0; ]]
},
[523] = {
	AegisName = "Holy_Water",
	Name = "Holy Water",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 30,
	BuyingStore = true,
	Script = [[ sc_end SC_CURSE; ]]
},
[525] = {
	AegisName = "Panacea",
	Name = "Panacea",
	Type = "IT_TYPE_HEALING",
	Buy = 500,
	Weight = 100,
	BuyingStore = true,
	Script = [[
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[526] = {
	AegisName = "Royal_Jelly",
	Name = "Royal Jelly",
	Type = "IT_TYPE_HEALING",
	Buy = 7000,
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[528] = {
	AegisName = "Monsters_Feed",
	Name = "Monster's Feed",
	Type = "IT_TYPE_HEALING",
	Buy = 60,
	Weight = 150,
	BuyingStore = true,
	Script = [[ itemheal rand(72,108),0; ]]
},
[529] = {
	AegisName = "Candy",
	Name = "Candy",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(45,65),0; ]]
},
[530] = {
	AegisName = "Candy_Striper",
	Name = "Candy Cane",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal rand(105,145),0; ]]
},
[531] = {
	AegisName = "Apple_Juice",
	Name = "Apple Juice",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal rand(25,35),0; ]]
},
[532] = {
	AegisName = "Banana_Juice",
	Name = "Banana Juice",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal rand(26,34),0; ]]
},
[533] = {
	AegisName = "Grape_Juice",
	Name = "Grape Juice",
	Type = "IT_TYPE_HEALING",
	Buy = 250,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal 0,rand(15,25); ]]
},
[534] = {
	AegisName = "Carrot_Juice",
	Name = "Carrot Juice",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal rand(27,33),0; ]]
},
[535] = {
	AegisName = "Pumpkin",
	Name = "Pumpkin",
	Type = "IT_TYPE_HEALING",
	Buy = 15,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal 19,0; ]]
},
[536] = {
	AegisName = "Ice_Cream",
	Name = "Ice Cream",
	Type = "IT_TYPE_HEALING",
	Buy = 150,
	Weight = 80,
	BuyingStore = true,
	Script = [[
		itemheal rand(105,145),0;
		sc_start SC_FREEZE,10000,0,2500,SCFLAG_NONE;
	]]
},
[537] = {
	AegisName = "Pet_Food",
	Name = "Pet Food",
	Type = "IT_TYPE_HEALING",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Script = [[ itemheal rand(50,90),0; ]]
},
[538] = {
	AegisName = "Well_Baked_Cookie",
	Name = "Well-baked Cookie",
	Type = "IT_TYPE_HEALING",
	Buy = 1000,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(160,200),0; ]]
},
[539] = {
	AegisName = "Piece_Of_Cake",
	Name = "Piece of Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 3000,
	Weight = 100,
	BuyingStore = true,
	Script = [[ itemheal rand(270,330),0; ]]
},
[540] = {
	AegisName = "Falcons_Feed",
	Name = "Falcon Food",
	Type = "IT_TYPE_HEALING",
	Buy = 2000,
	Weight = 50,
	Script = [[ itemheal rand(185,225),0; ]]
},
[541] = {
	AegisName = "Pecopecos_Feed",
	Name = "PecoPeco Food",
	Type = "IT_TYPE_HEALING",
	Buy = 3000,
	Weight = 50,
	Script = [[ itemheal rand(325,405),0; ]]
},
[542] = {
	AegisName = "Festive_Cookie",
	Name = "Festive Cookie",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 10,
	Script = [[ itemheal rand(325,405),0; ]]
},
[543] = {
	AegisName = "Festive_Rainbow_Cake",
	Name = "Festive Rainbow Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 10,
	Script = [[ itemheal rand(325,405),0; ]]
},
[544] = {
	AegisName = "Fish_Slice",
	Name = "Raw Fish",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(25,60),0; ]]
},
[545] = {
	AegisName = "Red_Slim_Potion",
	Name = "Condensed Red Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 150,
	Weight = 20,
	Script = [[ itemheal rand(45,65),0; ]]
},
[546] = {
	AegisName = "Yellow_Slim_Potion",
	Name = "Condensed Yellow Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 600,
	Weight = 30,
	Script = [[ itemheal rand(175,235),0; ]]
},
[547] = {
	AegisName = "White_Slim_Potion",
	Name = "Condensed White Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 1650,
	Weight = 50,
	Trade = {
		noselltonpc = true,
	},
	Script = [[ itemheal rand(325,405),0; ]]
},
[548] = {
	AegisName = "Cheese",
	Name = "Cheese",
	Type = "IT_TYPE_HEALING",
	Buy = 2800,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemheal 0,rand(10,15); ]]
},
[549] = {
	AegisName = "Nice_Sweet_Potato",
	Name = "Yam",
	Type = "IT_TYPE_HEALING",
	Buy = 180,
	Weight = 80,
	BuyingStore = true,
	Script = [[
		itemheal rand(50,100),0;
		sc_start SC_STUN,3000,0,1500,SCFLAG_NONE;
	]]
},
[550] = {
	AegisName = "Popped_Rice",
	Name = "Rice Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 10,
	BuyingStore = true,
	Script = [[ itemheal rand(10,15),0; ]]
},
[551] = {
	AegisName = "Shusi",
	Name = "Sushi",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemheal rand(50,60),0; ]]
},
[552] = {
	AegisName = "KETUPAT",
	Name = "Ketupat",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 10,
	Script = [[ itemheal rand(70,90),rand(20,30); ]]
},
[553] = {
	AegisName = "Bun",
	Name = "Bao",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemheal rand(35,70),0; ]]
},
[554] = {
	AegisName = "Mojji",
	Name = "Mochi",
	Type = "IT_TYPE_HEALING",
	Buy = 100,
	Weight = 80,
	Script = [[
		itemheal rand(105,145),0;
		sc_start SC_STUN,3000,0;
		sc_start SC_BLIND,2000,0,1500,SCFLAG_NONE;
	]]
},
[555] = {
	AegisName = "Rice_Cake",
	Name = "Traditional Rice Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 100,
	Weight = 20,
	Script = [[ itemheal rand(105,145),0; ]]
},
[556] = {
	AegisName = "Long_Rice_Cake",
	Name = "Rice Cake Stick",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 10,
	Script = [[ itemheal rand(20,25),0; ]]
},
[557] = {
	AegisName = "Hash_Rice_Cake",
	Name = "Neatly Sliced Rice Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 10,
	Script = [[ itemheal rand(25,30),0; ]]
},
[558] = {
	AegisName = "Chocolate",
	Name = "Chocolate",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 20,
	Script = [[ itemheal 1,1; ]]
},
[559] = {
	AegisName = "HandMade_Chocolate",
	Name = "Hand-made Chocolate",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 80,
	Script = [[ itemheal 50,50; ]]
},
[560] = {
	AegisName = "HandMade_Chocolate_",
	Name = "Handmade White Chocolate",
	Type = "IT_TYPE_HEALING",
	Buy = 5000,
	Weight = 80,
	Script = [[ itemheal 50,50; ]]
},
[561] = {
	AegisName = "White_Chocolate",
	Name = "White Chocolate",
	Type = "IT_TYPE_HEALING",
	Buy = 5000,
	Weight = 80,
	Script = [[ itemheal 50,50; ]]
},
[562] = {
	AegisName = "Pizza",
	Name = "Doublecrust Swiss Fondue",
	Type = "IT_TYPE_HEALING",
	Buy = 100,
	Weight = 150,
	Script = [[ itemheal rand(70,100),0; ]]
},
[563] = {
	AegisName = "Pizza_01",
	Name = "Doublecrust Swiss Fondue",
	Type = "IT_TYPE_HEALING",
	Buy = 1200,
	Weight = 150,
	Script = [[ itemheal rand(375,445),0; ]]
},
[564] = {
	AegisName = "Rice_Ball",
	Name = "Rice Ball",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal 200,0; ]]
},
[565] = {
	AegisName = "Vita500_Bottle",
	Name = "Vita500",
	Type = "IT_TYPE_HEALING",
	Buy = 580,
	Weight = 100,
	Script = [[ itemheal rand(142,274),0; ]]
},
[566] = {
	AegisName = "Tomyumkung",
	Name = "Tom Yum Goong",
	Type = "IT_TYPE_HEALING",
	Buy = 10000,
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(244,350),rand(10,30);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[567] = {
	AegisName = "Prawn",
	Name = "Shrimp",
	Type = "IT_TYPE_HEALING",
	Buy = 500,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal rand(117,192),0; ]]
},
[568] = {
	AegisName = "Lemon",
	Name = "Lemon",
	Type = "IT_TYPE_HEALING",
	Buy = 60,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal 0,rand(10,20); ]]
},
[569] = {
	AegisName = "Novice_Potion",
	Name = "Novice Potion",
	Type = "IT_TYPE_HEALING",
	Weight = 10,
	BuyingStore = true,
	Script = [[ itemheal rand(44,66),0; ]]
},
[570] = {
	AegisName = "Lucky_Candy",
	Name = "Lucky Candy",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(45,65),0; ]]
},
[571] = {
	AegisName = "Lucky_Candy_Cane",
	Name = "Lucky Candy Cane",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 40,
	BuyingStore = true,
	Script = [[ itemheal rand(105,145),0; ]]
},
[572] = {
	AegisName = "Lucky_Cookie",
	Name = "Lucky Cookie",
	Type = "IT_TYPE_HEALING",
	Buy = 1000,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(160,200),0; ]]
},
[573] = {
	AegisName = "Chocolate_Drink",
	Name = "Chocolate Drink",
	Type = "IT_TYPE_HEALING",
	Buy = 7000,
	Weight = 150,
	Script = [[
		itemheal rand(330,410),rand(45,65);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[574] = {
	AegisName = "Egg",
	Name = "Egg",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 30,
	BuyingStore = true,
	Script = [[ itemheal rand(33,42),0; ]]
},
[575] = {
	AegisName = "Piece_Of_Cake_",
	Name = "2nd Anniversary Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 10,
	Weight = 100,
	Script = [[ itemheal rand(270,330),0; ]]
},
[576] = {
	AegisName = "Prickly_Fruit",
	Name = "Prickly Fruit",
	Type = "IT_TYPE_HEALING",
	Buy = 540,
	Weight = 60,
	BuyingStore = true,
	Script = [[ itemheal rand(150,300),rand(20,30); ]]
},
[577] = {
	AegisName = "Grain",
	Name = "Bag of Grain",
	Type = "IT_TYPE_HEALING",
	Buy = 200,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(60,70),0; ]]
},
[578] = {
	AegisName = "Strawberry",
	Name = "Strawberry",
	Type = "IT_TYPE_HEALING",
	Buy = 200,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal 0,rand(16,28); ]]
},
[579] = {
	AegisName = "Delicious_Fish",
	Name = "Fresh Fish",
	Type = "IT_TYPE_HEALING",
	Buy = 250,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(100,150),0; ]]
},
[580] = {
	AegisName = "Bread",
	Name = "Bread",
	Type = "IT_TYPE_HEALING",
	Buy = 150,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(50,90),0; ]]
},
[581] = {
	AegisName = "Mushroom",
	Name = "Edible Mushroom",
	Type = "IT_TYPE_HEALING",
	Buy = 40,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(20,30),0; ]]
},
[582] = {
	AegisName = "Orange",
	Name = "Orange",
	Type = "IT_TYPE_HEALING",
	Buy = 300,
	Weight = 20,
	BuyingStore = true,
	Script = [[ itemheal rand(10,20),rand(10,20); ]]
},
[583] = {
	AegisName = "KETUPAT_",
	Name = "Ketupat Sayur",
	Type = "IT_TYPE_HEALING",
	Buy = 7000,
	Weight = 150,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[584] = {
	AegisName = "Fish_Ball_Soup",
	Name = "Fish Cake Soup",
	Type = "IT_TYPE_HEALING",
	Buy = 100,
	Weight = 60,
	BuyingStore = true,
	Script = [[ itemheal rand(40,70),0; ]]
},
[585] = {
	AegisName = "Wurst",
	Name = "Wurst",
	Type = "IT_TYPE_HEALING",
	Buy = 2,
	Weight = 40,
	Script = [[ itemheal rand(15,20),0; ]]
},
[586] = {
	AegisName = "Mothers_Cake",
	Name = "Mother's Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 100,
	Script = [[ itemheal rand(325,405),0; ]]
},
[587] = {
	AegisName = "Prickly_Fruit_",
	Name = "Red Prickly Fruit",
	Type = "IT_TYPE_HEALING",
	Buy = 880,
	Weight = 60,
	BuyingStore = true,
	Script = [[ itemheal rand(270,330),rand(20,30); ]]
},
[588] = {
	AegisName = "Spaghetti",
	Name = "Spaghetti",
	Type = "IT_TYPE_HEALING",
	Buy = 100,
	Weight = 100,
	Script = [[ itemheal rand(40,70),0; ]]
},
[589] = {
	AegisName = "Pizza_02",
	Name = "Piece of Pizza",
	Type = "IT_TYPE_HEALING",
	Buy = 1200,
	Weight = 150,
	Script = [[ itemheal rand(375,445),0; ]]
},
[590] = {
	AegisName = "Brezel_",
	Name = "Bretzel",
	Type = "IT_TYPE_HEALING",
	Buy = 2,
	Weight = 20,
	Script = [[ itemheal rand(50,90),0; ]]
},
[591] = {
	AegisName = "Caviar_Pancake",
	Name = "Caviar Pancake",
	Type = "IT_TYPE_HEALING",
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[592] = {
	AegisName = "Jam_Pancake",
	Name = "Jam Pancake",
	Type = "IT_TYPE_HEALING",
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[593] = {
	AegisName = "Honey_Pancake",
	Name = "Honey Pancake",
	Type = "IT_TYPE_HEALING",
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[594] = {
	AegisName = "Sour_Cream_Pancake",
	Name = "Sour-Cream Pancake",
	Type = "IT_TYPE_HEALING",
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[595] = {
	AegisName = "Mushroom_Pancake",
	Name = "Mushroom Pancake",
	Type = "IT_TYPE_HEALING",
	Weight = 150,
	BuyingStore = true,
	Script = [[
		itemheal rand(325,405),rand(40,60);
		sc_end SC_POISON;
		sc_end SC_SILENCE;
		sc_end SC_BLIND;
		sc_end SC_CONFUSION;
		sc_end SC_CURSE;
		sc_end SC_ILLUSION;
	]]
},
[596] = {
	AegisName = "Cute_Strawberry_Choco",
	Name = "Cute Strawberry-Choco",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 100,
	Script = [[ itemheal 0,rand(1,100); ]]
},
[597] = {
	AegisName = "Lovely_Choco_Tart",
	Name = "Lovely Choco-Tart",
	Type = "IT_TYPE_HEALING",
	Buy = 20,
	Weight = 100,
	Script = [[ itemheal rand(10,400),0; ]]
},
[598] = {
	AegisName = "Light_Red_Pot",
	Name = "Light Red Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 50,
	Weight = 10,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ itemheal rand(45,65),0; ]]
},
[599] = {
	AegisName = "Light_Orange_Pot",
	Name = "Light Orange Potion",
	Type = "IT_TYPE_HEALING",
	Buy = 200,
	Weight = 10,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ itemheal rand(105,145),0; ]]
},

--== Usable Items ==========================================
[601] = {
	AegisName = "Wing_Of_Fly",
	Name = "Fly Wing",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 60,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemskill AL_TELEPORT,1; ]]
},
[602] = {
	AegisName = "Wing_Of_Butterfly",
	Name = "Butterfly Wing",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 300,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemskill AL_TELEPORT,3; ]]
},
[603] = {
	AegisName = "Old_Blue_Box",
	Name = "Old Blue Box",
	Type = "IT_TYPE_USABLE",
	Buy = 10000,
	Weight = 200,
	BuyingStore = true,
	Trade = {
		noselltonpc = true,
	},
	Script = [[ getrandgroupitem 603,1; ]]
},
[604] = {
	AegisName = "Branch_Of_Dead_Tree",
	Name = "Dead Branch",
	Type = "IT_TYPE_USABLE",
	Buy = 50,
	Weight = 50,
	BuyingStore = true,
	Script = [[ monster "this",-1,-1,"--ja--",-1,1,""; ]]
},
[605] = {
	AegisName = "Anodyne",
	Name = "Anodyne",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 100,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill SM_ENDURE,1; ]]
},
[606] = {
	AegisName = "Aloebera",
	Name = "Aloevera",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1500,
	Weight = 100,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill SM_SELFPROVOKE,1; ]]
},
[607] = {
	AegisName = "Yggdrasilberry",
	Name = "Yggdrasil Berry",
	Type = "IT_TYPE_HEALING",
	Buy = 5000,
	Weight = 300,
	BuyingStore = true,
	Delay = 5000,
	Script = [[ percentheal 100,100; ]]
},
[608] = {
	AegisName = "Seed_Of_Yggdrasil",
	Name = "Yggdrasil Seed",
	Type = "IT_TYPE_HEALING",
	Buy = 5000,
	Weight = 300,
	BuyingStore = true,
	Delay = 3000,
	Script = [[ percentheal 50,50; ]]
},
[609] = {
	AegisName = "Amulet",
	Name = "Amulet",
	Type = "IT_TYPE_USABLE",
	Buy = 100,
	Weight = 100,
	BuyingStore = true,
},
[610] = {
	AegisName = "Leaf_Of_Yggdrasil",
	Name = "Yggdrasil Leaf",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 4000,
	Weight = 100,
	BuyingStore = true,
	Script = [[ itemskill ALL_RESURRECTION,1; ]]
},
[611] = {
	AegisName = "Spectacles",
	Name = "Magnifier",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 40,
	Weight = 50,
	BuyingStore = true,
	Script = [[ itemskill MC_IDENTIFY,1; ]]
},
[612] = {
	AegisName = "Portable_Furnace",
	Name = "Mini Furnace",
	Type = "IT_TYPE_USABLE",
	Buy = 150,
	Weight = 200,
	BuyingStore = true,
	Script = [[ produce 21; ]]
},
[613] = {
	AegisName = "Iron_Hammer",
	Name = "Iron Hammer",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
	Script = [[ produce 1; ]]
},
[614] = {
	AegisName = "Golden_Hammer",
	Name = "Golden Hammer",
	Type = "IT_TYPE_USABLE",
	Buy = 3000,
	Weight = 300,
	BuyingStore = true,
	Script = [[ produce 2; ]]
},
[615] = {
	AegisName = "Oridecon_Hammer",
	Name = "Oridecon Hammer",
	Type = "IT_TYPE_USABLE",
	Buy = 5000,
	Weight = 400,
	BuyingStore = true,
	Script = [[ produce 3; ]]
},
[616] = {
	AegisName = "Old_Card_Album",
	Name = "Old Card Album",
	Type = "IT_TYPE_USABLE",
	Buy = 10000,
	Weight = 50,
	BuyingStore = true,
	Script = [[ getrandgroupitem 616,1; ]]
},
[617] = {
	AegisName = "Old_Violet_Box",
	Name = "Old Purple Box",
	Type = "IT_TYPE_USABLE",
	Buy = 10000,
	Weight = 200,
	BuyingStore = true,
	Trade = {
		noselltonpc = true,
	},
	Script = [[ getrandgroupitem 617,1; ]]
},
[618] = {
	AegisName = "Worn_Out_Scroll",
	Name = "Worn Out Scroll",
	Type = "IT_TYPE_USABLE",
	Buy = 50,
	Weight = 20,
	BuyingStore = true,
},
[619] = {
	AegisName = "Unripe_Apple",
	Name = "Unripe Apple",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet PORING; ]]
},
[620] = {
	AegisName = "Orange_Juice",
	Name = "Orange Juice",
	Type = "IT_TYPE_USABLE",
	Buy = 1500,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet DROPS; ]]
},
[621] = {
	AegisName = "Bitter_Herb",
	Name = "Bitter Herb",
	Type = "IT_TYPE_USABLE",
	Buy = 20,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet POPORING; ]]
},
[622] = {
	AegisName = "Rainbow_Carrot",
	Name = "Rainbow Carrot",
	Type = "IT_TYPE_USABLE",
	Buy = 2500,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet LUNATIC; ]]
},
[623] = {
	AegisName = "Earthworm_The_Dude",
	Name = "Earthworm the Dude",
	Type = "IT_TYPE_USABLE",
	Buy = 4000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet PICKY; ]]
},
[624] = {
	AegisName = "Rotten_Fish",
	Name = "Rotten Fish",
	Type = "IT_TYPE_USABLE",
	Buy = 2500,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet CHONCHON; ]]
},
[625] = {
	AegisName = "Lusty_Iron",
	Name = "Rusty Iron",
	Type = "IT_TYPE_USABLE",
	Buy = 100,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet STEEL_CHONCHON; ]]
},
[626] = {
	AegisName = "Monster_Juice",
	Name = "Monster Juice",
	Type = "IT_TYPE_USABLE",
	Buy = 1500,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet HUNTER_FLY; ]]
},
[627] = {
	AegisName = "Sweet_Milk",
	Name = "Sweet Milk",
	Type = "IT_TYPE_USABLE",
	Buy = 7000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet SAVAGE; ]]
},
[628] = {
	AegisName = "Well_Dried_Bone",
	Name = "Well-Dried Bone",
	Type = "IT_TYPE_USABLE",
	Buy = 10000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet DESERT_WOLF_B; ]]
},
[629] = {
	AegisName = "Singing_Flower",
	Name = "Singing Flower",
	Type = "IT_TYPE_USABLE",
	Buy = 300,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet ROCKER; ]]
},
[630] = {
	AegisName = "Dew_Laden_Moss",
	Name = "Dew Laden Moss",
	Type = "IT_TYPE_USABLE",
	Buy = 10,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet SPORE; ]]
},
[631] = {
	AegisName = "Deadly_Noxious_Herb",
	Name = "Deadly Noxious Herb",
	Type = "IT_TYPE_USABLE",
	Buy = 20,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet POISON_SPORE; ]]
},
[632] = {
	AegisName = "Fatty_Chubby_Earthworm",
	Name = "Fatty Chubby Earthworm",
	Type = "IT_TYPE_USABLE",
	Buy = 5000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet PECOPECO; ]]
},
[633] = {
	AegisName = "Baked_Yam",
	Name = "Sweet Potato",
	Type = "IT_TYPE_USABLE",
	Buy = 20,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet SMOKIE; ]]
},
[634] = {
	AegisName = "Tropical_Banana",
	Name = "Tropical Banana",
	Type = "IT_TYPE_USABLE",
	Buy = 20,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet YOYO; ]]
},
[635] = {
	AegisName = "Horror_Of_Tribe",
	Name = "Orc Trophy",
	Type = "IT_TYPE_USABLE",
	Buy = 300,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet ORK_WARRIOR; ]]
},
[636] = {
	AegisName = "No_Recipient",
	Name = "No Recipient",
	Type = "IT_TYPE_USABLE",
	Buy = 100,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet MUNAK; ]]
},
[637] = {
	AegisName = "Old_Broom",
	Name = "Old Broom",
	Type = "IT_TYPE_USABLE",
	Buy = 350,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet DOKEBI; ]]
},
[638] = {
	AegisName = "Silver_Knife_Of_Chaste",
	Name = "Silver Knife of Chastity",
	Type = "IT_TYPE_USABLE",
	Buy = 12000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet SOHEE; ]]
},
[639] = {
	AegisName = "Armlet_Of_Obedience",
	Name = "Armlet of Obedience",
	Type = "IT_TYPE_USABLE",
	Buy = 18000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet ISIS; ]]
},
[640] = {
	AegisName = "Shining_Stone",
	Name = "Shining Stone",
	Type = "IT_TYPE_USABLE",
	Buy = 3000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet PETIT; ]]
},
[641] = {
	AegisName = "Contracts_In_Shadow",
	Name = "Contract in Shadow",
	Type = "IT_TYPE_USABLE",
	Buy = 100,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet DEVIRUCHI; ]]
},
[642] = {
	AegisName = "Book_Of_Devil",
	Name = "Book of the Devil",
	Type = "IT_TYPE_USABLE",
	Buy = 1800,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet BAPHOMET_; ]]
},
[643] = {
	AegisName = "Pet_Incubator",
	Name = "Pet Incubator",
	Type = "IT_TYPE_USABLE",
	Buy = 3000,
	Weight = 30,
	BuyingStore = true,
	Script = [[ bpet; ]]
},
[644] = {
	AegisName = "Gift_Box",
	Name = "Gift Box",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
	Script = [[ getrandgroupitem 644,1; ]]
},
[645] = {
	AegisName = "Center_Potion",
	Name = "Concentration Potion",
	Type = "IT_TYPE_USABLE",
	Buy = 800,
	Weight = 100,
	BuyingStore = true,
	Script = [[ sc_start SC_ATTHASTE_POTION1,1800000,4; ]]
},
[656] = {
	AegisName = "Awakening_Potion",
	Name = "Awakening Potion",
	Type = "IT_TYPE_USABLE",
	Buy = 1500,
	Weight = 150,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
		Soul_Linker = true,
		Gunslinger = true,
		Ninja = true,
		Gangsi = true,
		Death_Knight = true,
		Dark_Collector = true,
		Kagerou = true,
		Rebellion = true,
		Summoner = true,
	},
	EquipLv = 40,
	BuyingStore = true,
	Script = [[ sc_start SC_ATTHASTE_POTION2,1800000,6; ]]
},
[657] = {
	AegisName = "Berserk_Potion",
	Name = "Berserk Potion",
	Type = "IT_TYPE_USABLE",
	Buy = 3000,
	Weight = 200,
	Job = {
		Swordsman = true,
		Magician = true,
		Merchant = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
		Soul_Linker = true,
		Gunslinger = true,
	},
	EquipLv = 85,
	BuyingStore = true,
	Script = [[ sc_start SC_ATTHASTE_POTION3,1800000,9; ]]
},
[658] = {
	AegisName = "Union_Of_Tribe",
	Name = "Tribal Solidarity",
	Type = "IT_TYPE_USABLE",
	Buy = 2,
	Weight = 500,
	BuyingStore = true,
	Script = [[ guildgetexp rand(600000,1200000); ]]
},
[659] = {
	AegisName = "Heart_Of_Her",
	Name = "Her Heart",
	Type = "IT_TYPE_USABLE",
	Buy = 500,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet BONGUN; ]]
},
[660] = {
	AegisName = "Prohibition_Red_Candle",
	Name = "Forbidden Red Candle",
	Type = "IT_TYPE_USABLE",
	Buy = 20000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet ZHERLTHSH; ]]
},
[661] = {
	AegisName = "Sway_Apron",
	Name = "Soft Apron",
	Type = "IT_TYPE_USABLE",
	Buy = 20000,
	Weight = 50,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ pet ALICE; ]]
},
[662] = {
	AegisName = "Inspector_Certificate",
	Name = "Authoritative Badge",
	Type = "IT_TYPE_USABLE",
	Buy = 1450,
	Weight = 30,
	BuyingStore = true,
	Script = [[ sc_start SC_MOVHASTE_HORSE, 180000, 25; ]]
},
[663] = {
	AegisName = "Korea_Rice_Cake",
	Name = "Korean Rice Cake",
	Type = "IT_TYPE_HEALING",
	Buy = 1,
	Weight = 10,
	BuyingStore = true,
	Script = [[ percentheal 10,0; ]]
},
[664] = {
	AegisName = "Gift_Box_1",
	Name = "Gift Box",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
	Script = [[ getrandgroupitem 664,1; ]]
},
[665] = {
	AegisName = "Gift_Box_2",
	Name = "Gift Box",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
	Script = [[ getrandgroupitem 665,1; ]]
},
[666] = {
	AegisName = "Gift_Box_3",
	Name = "Gift Box",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
	Script = [[ getrandgroupitem 666,1; ]]
},
[667] = {
	AegisName = "Gift_Box_4",
	Name = "Gift Box",
	Type = "IT_TYPE_USABLE",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
	Script = [[ getrandgroupitem 667,1; ]]
},
[668] = {
	AegisName = "Handsei",
	Name = "New Year's Red Envelope",
	Type = "IT_TYPE_USABLE",
	Weight = 20,
	BuyingStore = true,
	Script = [[ Zeny += rand(1000,10000); ]]
},
[669] = {
	AegisName = "Rice_Cake_Soup",
	Name = "Tempting Rice-Cake Soup",
	Type = "IT_TYPE_HEALING",
	Buy = 500,
	Weight = 100,
	BuyingStore = true,
	Script = [[ percentheal -100,-100; ]]
},
[670] = {
	AegisName = "Gold_Coin_Moneybag",
	Name = "Bag of Gold Coins",
	Buy = 100000,
	Weight = 400,
},
[671] = {
	AegisName = "Gold_Coin",
	Name = "Gold Roulette Coin",
	Type = "IT_TYPE_USABLE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ TmpRouletteGold += 1; ]]
},
[672] = {
	AegisName = "Copper_Coin_Moneybag",
	Name = "Bag of Bronze Coins",
	Buy = 1000,
	Weight = 400,
},
[673] = {
	AegisName = "Copper_Coin",
	Name = "UGC Token",
	Buy = 100,
	Weight = 40,
},
[674] = {
	AegisName = "Mithril_Coin",
	Name = "Mithril Coin",
	Buy = 5000,
	Weight = 40,
},
[675] = {
	AegisName = "Silver_Coin",
	Name = "Silver Roulette Coin",
	Type = "IT_TYPE_USABLE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ TmpRouletteSilver += 1; ]]
},
[676] = {
	AegisName = "Silver_Coin_Moneybag",
	Name = "Bag of Silver Coins",
	Buy = 50000,
	Weight = 400,
},
[677] = {
	AegisName = "White_Gold_Coin",
	Name = "Platinum Coin",
	Buy = 2000,
	Weight = 40,
},
[678] = {
	AegisName = "Poison_Bottle",
	Name = "Poison Bottle",
	Type = "IT_TYPE_USABLE",
	Buy = 5000,
	Weight = 100,
	BuyingStore = true,
	Script = [[
		if (Class == Job_Assassin_Cross || Class == Job_Guillotine_Cross || Class == Job_Guillotine_Cross_T) {
			sc_start SC_DPOISON, 60000, 0;
			sc_start SC_ATTHASTE_INFINITY, 60000, 9;
		} else {
			percentheal -100, -100;
		}
	]]
},
[679] = {
	AegisName = "Gold_Pill",
	Name = "Pilule",
	Type = "IT_TYPE_USABLE",
	Buy = 5000,
	Weight = 300,
	BuyingStore = true,
	Script = [[ percentheal 50, 50; ]]
},
[680] = {
	AegisName = "Magical_Carnation",
	Name = "Magic Carnation",
	Type = "IT_TYPE_HEALING",
	Weight = 1000,
	Script = [[ percentheal 0,20; ]]
},
[681] = {
	AegisName = "Memory_Of_Wedding",
	Name = "Sweet Memory of Marriage",
	Type = "IT_TYPE_USABLE",
	Buy = 50000,
	Weight = 10,
	BuyingStore = true,
	Script = [[ if (getpartnerid()) sc_start SC_WEDDING,600000,0; ]]
},
[682] = {
	AegisName = "Realgar_Wine",
	Name = "Distilled Fighting Spirit",
	Type = "IT_TYPE_USABLE",
	Weight = 100,
	BuyingStore = true,
	Script = [[ sc_start SC_PLUSATTACKPOWER, 60000, 30; ]]
},
[683] = {
	AegisName = "Exorcize_Herb",
	Name = "Herb of Incantation",
	Type = "IT_TYPE_USABLE",
	Weight = 50,
	BuyingStore = true,
	Script = [[ sc_start SC_PLUSMAGICPOWER, 60000, 30; ]]
},
[684] = {
	AegisName = "Durian",
	Name = "Durian",
	Type = "IT_TYPE_USABLE",
	Buy = 15000,
	Weight = 300,
	BuyingStore = true,
	Script = [[
		sc_start SC_PLUSATTACKPOWER, 60000, 10;
		sc_start SC_PLUSMAGICPOWER, 60000, 10;
	]]
},
[685] = {
	AegisName = "RAMADAN",
	Name = "Ramadan",
	Type = "IT_TYPE_HEALING",
	Buy = 5000,
	Weight = 300,
	Script = [[ percentheal 100,50; ]]
},
[686] = {
	AegisName = "Earth_Scroll_1_3",
	Name = "Level 3 Earth Spike",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill WZ_EARTHSPIKE,3; ]]
},
[687] = {
	AegisName = "Earth_Scroll_1_5",
	Name = "Level 5 Earth Spike",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill WZ_EARTHSPIKE,5; ]]
},
[688] = {
	AegisName = "Cold_Scroll_1_3",
	Name = "Level 3 Cold Bolt",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_COLDBOLT,3; ]]
},
[689] = {
	AegisName = "Cold_Scroll_1_5",
	Name = "Level 5 Cold Bolt",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_COLDBOLT,5; ]]
},
[690] = {
	AegisName = "Fire_Scroll_1_3",
	Name = "Level 3 Fire Bolt",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FIREBOLT,3; ]]
},
[691] = {
	AegisName = "Fire_Scroll_1_5",
	Name = "Level 5 Fire Bolt",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FIREBOLT,5; ]]
},
[692] = {
	AegisName = "Wind_Scroll_1_3",
	Name = "Level 3 Lightening Bolt",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_LIGHTNINGBOLT,3; ]]
},
[693] = {
	AegisName = "Wind_Scroll_1_5",
	Name = "Level 5 Lightening Bolt",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_LIGHTNINGBOLT,5; ]]
},
[694] = {
	AegisName = "Ghost_Scroll_1_3",
	Name = "Level 3 Soul Strike",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_SOULSTRIKE,3; ]]
},
[695] = {
	AegisName = "Ghost_Scroll_1_5",
	Name = "Level 5 Soul Strike",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_SOULSTRIKE,5; ]]
},
[696] = {
	AegisName = "Fire_Scroll_2_1",
	Name = "Level 1 Fire Ball",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FIREBALL,1; ]]
},
[697] = {
	AegisName = "Fire_Scroll_2_5",
	Name = "Level 5 Fire Ball",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FIREBALL,5; ]]
},
[698] = {
	AegisName = "Fire_Scroll_3_1",
	Name = "Level 1 Fire Wall",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FIREWALL,1; ]]
},
[699] = {
	AegisName = "Fire_Scroll_3_5",
	Name = "Level 5 Fire Wall",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FIREWALL,5; ]]
},
[700] = {
	AegisName = "Cold_Scroll_2_1",
	Name = "Level 1 Frost Diver",
	Type = "IT_TYPE_CONSUMPTION_DELAY",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
	Nouse = {
		sitting = true,
	},
	Script = [[ itemskill MG_FROSTDIVER,1; ]]
},

--== Etc Items =============================================
[701] = {
	AegisName = "Ora_Ora",
	Name = "Ora Ora",
	Buy = 55000,
	Weight = 200,
	BuyingStore = true,
},
[702] = {
	AegisName = "Animal_Blood",
	Name = "Animal Gore",
	Buy = 450,
	Weight = 100,
	BuyingStore = true,
},
[703] = {
	AegisName = "Hinalle",
	Name = "Hinalle",
	Buy = 500,
	Weight = 10,
	BuyingStore = true,
},
[704] = {
	AegisName = "Aloe",
	Name = "Aloe",
	Buy = 500,
	Weight = 10,
	BuyingStore = true,
},
[705] = {
	AegisName = "Clover",
	Name = "Clover",
	Buy = 10,
	Weight = 10,
	BuyingStore = true,
},
[706] = {
	AegisName = "Four_Leaf_Clover",
	Name = "Four Leaf Clover",
	Buy = 80000,
	Weight = 10,
	BuyingStore = true,
},
[707] = {
	AegisName = "Singing_Plant",
	Name = "Singing Plant",
	Buy = 500,
	Weight = 10,
	BuyingStore = true,
},
[708] = {
	AegisName = "Ment",
	Name = "Ment",
	Buy = 500,
	Weight = 10,
	BuyingStore = true,
},
[709] = {
	AegisName = "Izidor",
	Name = "Izidor",
	Buy = 500,
	Weight = 10,
	BuyingStore = true,
},
[710] = {
	AegisName = "Illusion_Flower",
	Name = "Illusion Flower",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
},
[711] = {
	AegisName = "Shoot",
	Name = "Shoot",
	Buy = 16,
	Weight = 10,
	BuyingStore = true,
},
[712] = {
	AegisName = "Flower",
	Name = "Flower",
	Buy = 2,
	Weight = 10,
	BuyingStore = true,
},
[713] = {
	AegisName = "Empty_Bottle",
	Name = "Empty Bottle",
	Buy = 6,
	Weight = 20,
	BuyingStore = true,
},
[714] = {
	AegisName = "Emperium",
	Name = "Emperium",
	Buy = 2,
	Weight = 1000,
	BuyingStore = true,
},
[715] = {
	AegisName = "Yellow_Gemstone",
	Name = "Yellow Gemstone",
	Buy = 600,
	Weight = 30,
	BuyingStore = true,
},
[716] = {
	AegisName = "Red_Gemstone",
	Name = "Red Gemstone",
	Buy = 600,
	Weight = 30,
	BuyingStore = true,
},
[717] = {
	AegisName = "Blue_Gemstone",
	Name = "Blue Gemstone",
	Buy = 600,
	Weight = 30,
	BuyingStore = true,
},
[718] = {
	AegisName = "Dark_Red_Jewel",
	Name = "Garnet",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[719] = {
	AegisName = "Violet_Jewel",
	Name = "Amethyst",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[720] = {
	AegisName = "Skyblue_Jewel",
	Name = "Aquamarine",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[721] = {
	AegisName = "Azure_Jewel",
	Name = "Emerald",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[722] = {
	AegisName = "Scarlet_Jewel",
	Name = "Pearl",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[723] = {
	AegisName = "Cardinal_Jewel",
	Name = "Ruby",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[724] = {
	AegisName = "Cardinal_Jewel_",
	Name = "Cursed Ruby",
	Buy = 600,
	Weight = 100,
	BuyingStore = true,
},
[725] = {
	AegisName = "Red_Jewel",
	Name = "Sardonyx",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[726] = {
	AegisName = "Blue_Jewel",
	Name = "Sapphire",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[727] = {
	AegisName = "White_Jewel",
	Name = "Opal",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[728] = {
	AegisName = "Golden_Jewel",
	Name = "Topaz",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[729] = {
	AegisName = "Bluish_Green_Jewel",
	Name = "Zircon",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[730] = {
	AegisName = "Crystal_Jewel",
	Name = "1carat Diamond",
	Buy = 10000,
	Weight = 100,
	BuyingStore = true,
},
[731] = {
	AegisName = "Crystal_Jewel_",
	Name = "2carat Diamond",
	Buy = 25000,
	Weight = 100,
	BuyingStore = true,
},
[732] = {
	AegisName = "Crystal_Jewel__",
	Name = "3carat Diamond",
	Buy = 55000,
	Weight = 100,
	BuyingStore = true,
},
[733] = {
	AegisName = "Crystal_Jewel___",
	Name = "Cracked Diamond",
	Buy = 10,
	Weight = 100,
	BuyingStore = true,
},
[734] = {
	AegisName = "Red_Frame",
	Name = "Red Frame",
	Buy = 3000,
	Weight = 200,
	BuyingStore = true,
},
[735] = {
	AegisName = "Blue_Porcelain",
	Name = "Chung Jah",
	Buy = 5000,
	Weight = 500,
	BuyingStore = true,
},
[736] = {
	AegisName = "White_Platter",
	Name = "China",
	Buy = 1000,
	Weight = 300,
	BuyingStore = true,
},
[737] = {
	AegisName = "Black_Ladle",
	Name = "Black Ladle",
	Buy = 400,
	Weight = 50,
	BuyingStore = true,
},
[738] = {
	AegisName = "Pencil_Case",
	Name = "Pencil Case",
	Buy = 400,
	Weight = 100,
	BuyingStore = true,
},
[739] = {
	AegisName = "Rouge",
	Name = "Rouge",
	Buy = 10000,
	Weight = 10,
	BuyingStore = true,
},
[740] = {
	AegisName = "Stuffed_Doll",
	Name = "Puppet",
	Buy = 1000,
	Weight = 100,
	BuyingStore = true,
},
[741] = {
	AegisName = "Poring_Doll",
	Name = "Poring Doll",
	Buy = 1800,
	Weight = 100,
	BuyingStore = true,
},
[742] = {
	AegisName = "Chonchon_Doll",
	Name = "Chonchon Doll",
	Buy = 3000,
	Weight = 100,
	BuyingStore = true,
},
[743] = {
	AegisName = "Spore_Doll",
	Name = "Spore Doll",
	Buy = 5500,
	Weight = 100,
	BuyingStore = true,
},
[744] = {
	AegisName = "Bunch_Of_Flowers",
	Name = "Bouquet",
	Buy = 2000,
	Weight = 50,
	BuyingStore = true,
	Trade = {
		nodrop = true,
	}
},
[745] = {
	AegisName = "Wedding_Bouquet",
	Name = "Wedding Bouquet",
	Buy = 12000,
	Weight = 50,
	BuyingStore = true,
	Trade = {
		nodrop = true,
	}
},
[746] = {
	AegisName = "Glass_Bead",
	Name = "Glass Bead",
	Buy = 1400,
	Weight = 50,
	BuyingStore = true,
},
[747] = {
	AegisName = "Crystal_Mirror",
	Name = "Crystal Mirror",
	Buy = 15000,
	Weight = 50,
	BuyingStore = true,
},
[748] = {
	AegisName = "Witherless_Rose",
	Name = "Witherless Rose",
	Buy = 55000,
	Weight = 10,
	BuyingStore = true,
},
[749] = {
	AegisName = "Frozen_Rose",
	Name = "Frozen Rose",
	Buy = 35000,
	Weight = 10,
	BuyingStore = true,
},
[750] = {
	AegisName = "Baphomet_Doll",
	Name = "Baphomet Doll",
	Buy = 18000,
	Weight = 100,
	BuyingStore = true,
},
[751] = {
	AegisName = "Osiris_Doll",
	Name = "Osiris Doll",
	Buy = 14000,
	Weight = 100,
	BuyingStore = true,
},
[752] = {
	AegisName = "Grasshopper_Doll",
	Name = "Rocker Doll",
	Buy = 4000,
	Weight = 100,
	BuyingStore = true,
},
[753] = {
	AegisName = "Monkey_Doll",
	Name = "Yoyo Doll",
	Buy = 6000,
	Weight = 100,
	BuyingStore = true,
},
[754] = {
	AegisName = "Raccoondog_Doll",
	Name = "Racoon Doll",
	Buy = 5000,
	Weight = 100,
	BuyingStore = true,
},
[756] = {
	AegisName = "Oridecon_Stone",
	Name = "Rough Oridecon",
	Buy = 550,
	Weight = 200,
	BuyingStore = true,
},
[757] = {
	AegisName = "Elunium_Stone",
	Name = "Rough Elunium",
	Buy = 650,
	Weight = 200,
	BuyingStore = true,
},
[901] = {
	AegisName = "Danggie",
	Name = "Daenggie",
	Buy = 260,
	Weight = 10,
	BuyingStore = true,
},
[902] = {
	AegisName = "Tree_Root",
	Name = "Tree Root",
	Buy = 12,
	Weight = 10,
	BuyingStore = true,
},
[903] = {
	AegisName = "Reptile_Tongue",
	Name = "Reptile Tongue",
	Buy = 140,
	Weight = 10,
	BuyingStore = true,
},
[904] = {
	AegisName = "Scorpions_Tail",
	Name = "Scorpion Tail",
	Buy = 124,
	Weight = 10,
	BuyingStore = true,
},
[905] = {
	AegisName = "Stem",
	Name = "Stem",
	Buy = 46,
	Weight = 10,
	BuyingStore = true,
},
[906] = {
	AegisName = "Pointed_Scale",
	Name = "Pointed Scale",
	Buy = 68,
	Weight = 10,
	BuyingStore = true,
},
[907] = {
	AegisName = "Resin",
	Name = "Resin",
	Buy = 120,
	Weight = 10,
	BuyingStore = true,
},
[908] = {
	AegisName = "Spawn",
	Name = "Spawn",
	Buy = 140,
	Weight = 10,
	BuyingStore = true,
},
[909] = {
	AegisName = "Jellopy",
	Name = "Jellopy",
	Buy = 6,
	Weight = 10,
	BuyingStore = true,
},
[910] = {
	AegisName = "Garlet",
	Name = "Garlet",
	Buy = 40,
	Weight = 10,
	BuyingStore = true,
},
[911] = {
	AegisName = "Scell",
	Name = "Scell",
	Buy = 160,
	Weight = 10,
	BuyingStore = true,
},
[912] = {
	AegisName = "Zargon",
	Name = "Zargon",
	Buy = 480,
	Weight = 10,
	BuyingStore = true,
},
[913] = {
	AegisName = "Tooth_Of_Bat",
	Name = "Tooth of Bat",
	Buy = 34,
	Weight = 10,
	BuyingStore = true,
},
[914] = {
	AegisName = "Fluff",
	Name = "Fluff",
	Buy = 8,
	Weight = 10,
	BuyingStore = true,
},
[915] = {
	AegisName = "Chrysalis",
	Name = "Chrysalis",
	Buy = 8,
	Weight = 10,
	BuyingStore = true,
},
[916] = {
	AegisName = "Feather_Of_Birds",
	Name = "Feather of Birds",
	Buy = 10,
	Weight = 10,
	BuyingStore = true,
},
[917] = {
	AegisName = "Talon",
	Name = "Talon",
	Buy = 20,
	Weight = 10,
	BuyingStore = true,
},
[918] = {
	AegisName = "Sticky_Webfoot",
	Name = "Sticky Webfoot",
	Buy = 20,
	Weight = 10,
	BuyingStore = true,
},
[919] = {
	AegisName = "Animals_Skin",
	Name = "Animal Skin",
	Buy = 36,
	Weight = 10,
	BuyingStore = true,
},
[920] = {
	AegisName = "Claw_Of_Wolves",
	Name = "Wolf Claw",
	Buy = 58,
	Weight = 10,
	BuyingStore = true,
},
[921] = {
	AegisName = "Mushroom_Spore",
	Name = "Mushroom Spore",
	Buy = 36,
	Weight = 10,
	BuyingStore = true,
},
[922] = {
	AegisName = "Orcish_Cuspid",
	Name = "Orc's Fang",
	Buy = 220,
	Weight = 10,
	BuyingStore = true,
},
[923] = {
	AegisName = "Evil_Horn",
	Name = "Evil Horn",
	Buy = 1200,
	Weight = 10,
	BuyingStore = true,
},
[924] = {
	AegisName = "Powder_Of_Butterfly",
	Name = "Powder of Butterfly",
	Buy = 90,
	Weight = 10,
	BuyingStore = true,
},
[925] = {
	AegisName = "Bill_Of_Birds",
	Name = "Bill of Birds",
	Buy = 64,
	Weight = 10,
	BuyingStore = true,
},
[926] = {
	AegisName = "Scale_Of_Snakes",
	Name = "Snake Scale",
	Buy = 82,
	Weight = 10,
	BuyingStore = true,
},
[928] = {
	AegisName = "Insect_Feeler",
	Name = "Insect Feeler",
	Buy = 114,
	Weight = 10,
	BuyingStore = true,
},
[929] = {
	AegisName = "Immortal_Heart",
	Name = "Immortal Heart",
	Buy = 374,
	Weight = 10,
	BuyingStore = true,
},
[930] = {
	AegisName = "Rotten_Bandage",
	Name = "Rotten Bandage",
	Buy = 350,
	Weight = 10,
	BuyingStore = true,
},
[931] = {
	AegisName = "Orcish_Voucher",
	Name = "Orcish Voucher",
	Buy = 142,
	Weight = 10,
	BuyingStore = true,
},
[932] = {
	AegisName = "Skel_Bone",
	Name = "Skel-Bone",
	Buy = 232,
	Weight = 10,
	BuyingStore = true,
},
[934] = {
	AegisName = "Mementos",
	Name = "Memento",
	Buy = 600,
	Weight = 10,
	BuyingStore = true,
},
[935] = {
	AegisName = "Shell",
	Name = "Shell",
	Buy = 14,
	Weight = 10,
	BuyingStore = true,
},
[936] = {
	AegisName = "Scales_Shell",
	Name = "Scale Shell",
	Buy = 466,
	Weight = 10,
	BuyingStore = true,
},
[937] = {
	AegisName = "Posionous_Canine",
	Name = "Venom Canine",
	Buy = 148,
	Weight = 10,
	BuyingStore = true,
},
[938] = {
	AegisName = "Sticky_Mucus",
	Name = "Sticky Mucus",
	Buy = 70,
	Weight = 10,
	BuyingStore = true,
},
[939] = {
	AegisName = "Bee_Sting",
	Name = "Bee Sting",
	Buy = 32,
	Weight = 10,
	BuyingStore = true,
},
[940] = {
	AegisName = "Grasshoppers_Leg",
	Name = "Grasshopper's Leg",
	Buy = 36,
	Weight = 10,
	BuyingStore = true,
},
[941] = {
	AegisName = "Nose_Ring",
	Name = "Nose Ring",
	Buy = 568,
	Weight = 10,
	BuyingStore = true,
},
[942] = {
	AegisName = "Yoyo_Tail",
	Name = "Yoyo Tail",
	Buy = 114,
	Weight = 10,
	BuyingStore = true,
},
[943] = {
	AegisName = "Solid_Shell",
	Name = "Solid Shell",
	Buy = 448,
	Weight = 10,
	BuyingStore = true,
},
[944] = {
	AegisName = "Horseshoe",
	Name = "Horseshoe",
	Buy = 588,
	Weight = 10,
	BuyingStore = true,
},
[945] = {
	AegisName = "Raccoon_Leaf",
	Name = "Raccoon Leaf",
	Buy = 106,
	Weight = 10,
	BuyingStore = true,
},
[946] = {
	AegisName = "Snails_Shell",
	Name = "Snail's Shell",
	Buy = 64,
	Weight = 10,
	BuyingStore = true,
},
[947] = {
	AegisName = "Horn",
	Name = "Horn",
	Buy = 116,
	Weight = 10,
	BuyingStore = true,
},
[948] = {
	AegisName = "Bears_Foot",
	Name = "Bear's Footskin",
	Buy = 174,
	Weight = 10,
	BuyingStore = true,
},
[949] = {
	AegisName = "Feather",
	Name = "Feather",
	Buy = 20,
	Weight = 10,
	BuyingStore = true,
},
[950] = {
	AegisName = "Heart_Of_Mermaid",
	Name = "Heart of Mermaid",
	Buy = 264,
	Weight = 10,
	BuyingStore = true,
},
[951] = {
	AegisName = "Fin",
	Name = "Fin",
	Buy = 412,
	Weight = 10,
	BuyingStore = true,
},
[952] = {
	AegisName = "Cactus_Needle",
	Name = "Cactus Needle",
	Buy = 82,
	Weight = 10,
	BuyingStore = true,
},
[953] = {
	AegisName = "Stone_Heart",
	Name = "Stone Heart",
	Buy = 184,
	Weight = 10,
	BuyingStore = true,
},
[954] = {
	AegisName = "Shining_Scales",
	Name = "Shining Scale",
	Buy = 466,
	Weight = 10,
	BuyingStore = true,
},
[955] = {
	AegisName = "Worm_Peelings",
	Name = "Worm Peeling",
	Buy = 52,
	Weight = 10,
	BuyingStore = true,
},
[956] = {
	AegisName = "Gill",
	Name = "Gill",
	Buy = 342,
	Weight = 10,
	BuyingStore = true,
},
[957] = {
	AegisName = "Decayed_Nail",
	Name = "Decayed Nail",
	Buy = 82,
	Weight = 10,
	BuyingStore = true,
},
[958] = {
	AegisName = "Horrendous_Mouth",
	Name = "Horrendous Mouth",
	Buy = 390,
	Weight = 10,
	BuyingStore = true,
},
[959] = {
	AegisName = "Rotten_Scale",
	Name = "Stinky Scale",
	Buy = 168,
	Weight = 10,
	BuyingStore = true,
},
[960] = {
	AegisName = "Nipper",
	Name = "Nipper",
	Buy = 114,
	Weight = 10,
	BuyingStore = true,
},
[961] = {
	AegisName = "Conch",
	Name = "Conch",
	Buy = 158,
	Weight = 10,
	BuyingStore = true,
},
[962] = {
	AegisName = "Tentacle",
	Name = "Tentacle",
	Buy = 70,
	Weight = 10,
	BuyingStore = true,
},
[963] = {
	AegisName = "Sharp_Scale",
	Name = "Sharp Scale",
	Buy = 250,
	Weight = 10,
	BuyingStore = true,
},
[964] = {
	AegisName = "Crap_Shell",
	Name = "Crab Shell",
	Buy = 90,
	Weight = 10,
	BuyingStore = true,
},
[965] = {
	AegisName = "Clam_Shell",
	Name = "Clam Shell",
	Buy = 56,
	Weight = 10,
	BuyingStore = true,
},
[966] = {
	AegisName = "Flesh_Of_Clam",
	Name = "Clam Flesh",
	Buy = 158,
	Weight = 10,
	BuyingStore = true,
},
[967] = {
	AegisName = "Turtle_Shell",
	Name = "Turtle Shell",
	Buy = 680,
	Weight = 10,
	BuyingStore = true,
},
[968] = {
	AegisName = "Voucher_Of_Orcish_Hero",
	Name = "Heroic Emblem",
	Buy = 3000,
	Weight = 10,
	BuyingStore = true,
},
[969] = {
	AegisName = "Gold",
	Name = "Gold",
	Buy = 200000,
	Weight = 200,
	BuyingStore = true,
},
[970] = {
	AegisName = "Alchol",
	Name = "Alcohol",
	Buy = 400,
	Weight = 30,
},
[971] = {
	AegisName = "Detrimindexta",
	Name = "Detrimindexta",
	Buy = 400,
	Weight = 30,
	BuyingStore = true,
},
[972] = {
	AegisName = "Karvodailnirol",
	Name = "Karvodailnirol",
	Buy = 400,
	Weight = 30,
	BuyingStore = true,
},
[973] = {
	AegisName = "Counteragent",
	Name = "Counteragent",
	Buy = 800,
	Weight = 70,
	BuyingStore = true,
},
[974] = {
	AegisName = "Mixture",
	Name = "Mixture",
	Buy = 800,
	Weight = 70,
	BuyingStore = true,
},
[975] = {
	AegisName = "Scarlet_Dyestuffs",
	Name = "Scarlet Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[976] = {
	AegisName = "Lemon_Dyestuffs",
	Name = "Lemon Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[978] = {
	AegisName = "Cobaltblue_Dyestuffs",
	Name = "Cobaltblue Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[979] = {
	AegisName = "Darkgreen_Dyestuffs",
	Name = "Darkgreen Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[980] = {
	AegisName = "Orange_Dyestuffs",
	Name = "Orange Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[981] = {
	AegisName = "Violet_Dyestuffs",
	Name = "Violet Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[982] = {
	AegisName = "White_Dyestuffs",
	Name = "White Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[983] = {
	AegisName = "Black_Dyestuffs",
	Name = "Black Dyestuffs",
	Buy = 8000,
	Weight = 150,
	BuyingStore = true,
},
[984] = {
	AegisName = "Oridecon",
	Name = "Oridecon",
	Buy = 1100,
	Weight = 200,
	BuyingStore = true,
},
[985] = {
	AegisName = "Elunium",
	Name = "Elunium",
	Buy = 1100,
	Weight = 200,
	BuyingStore = true,
},
[986] = {
	AegisName = "Anvil",
	Name = "Anvil",
	Buy = 30000,
	Weight = 500,
	BuyingStore = true,
},
[987] = {
	AegisName = "Oridecon_Anvil",
	Name = "Oridecon Anvil",
	Buy = 120000,
	Weight = 700,
	BuyingStore = true,
},
[988] = {
	AegisName = "Golden_Anvil",
	Name = "Golden Anvil",
	Buy = 300000,
	Weight = 900,
	BuyingStore = true,
},
[989] = {
	AegisName = "Emperium_Anvil",
	Name = "Emperium Anvil",
	Buy = 600000,
	Weight = 1000,
	BuyingStore = true,
},
[990] = {
	AegisName = "Boody_Red",
	Name = "Red Blood",
	Buy = 1000,
	Weight = 50,
	BuyingStore = true,
},
[991] = {
	AegisName = "Crystal_Blue",
	Name = "Crystal Blue",
	Buy = 1000,
	Weight = 50,
	BuyingStore = true,
},
[992] = {
	AegisName = "Wind_Of_Verdure",
	Name = "Wind of Verdure",
	Buy = 1000,
	Weight = 50,
	BuyingStore = true,
},
[993] = {
	AegisName = "Yellow_Live",
	Name = "Green Live",
	Buy = 1000,
	Weight = 50,
	BuyingStore = true,
},
[994] = {
	AegisName = "Flame_Heart",
	Name = "Flame Heart",
	Buy = 3000,
	Weight = 300,
	BuyingStore = true,
},
[995] = {
	AegisName = "Mistic_Frozen",
	Name = "Mystic Frozen",
	Buy = 3000,
	Weight = 300,
	BuyingStore = true,
},
[996] = {
	AegisName = "Rough_Wind",
	Name = "Rough Wind",
	Buy = 3000,
	Weight = 300,
	BuyingStore = true,
},
[997] = {
	AegisName = "Great_Nature",
	Name = "Great Nature",
	Buy = 3000,
	Weight = 300,
	BuyingStore = true,
},
[998] = {
	AegisName = "Iron",
	Name = "Iron",
	Buy = 100,
	Weight = 50,
	BuyingStore = true,
},
[999] = {
	AegisName = "Steel",
	Name = "Steel",
	Buy = 1000,
	Weight = 100,
	BuyingStore = true,
},
[1000] = {
	AegisName = "Star_Crumb",
	Name = "Star Crumb",
	Buy = 4500,
	Weight = 100,
	BuyingStore = true,
},
[1001] = {
	AegisName = "Sparkling_Dust",
	Name = "Star Dust",
	Buy = 1500,
	Weight = 10,
	BuyingStore = true,
},
[1002] = {
	AegisName = "Iron_Ore",
	Name = "Iron Ore",
	Buy = 50,
	Weight = 150,
	BuyingStore = true,
},
[1003] = {
	AegisName = "Coal",
	Name = "Coal",
	Buy = 500,
	Weight = 50,
	BuyingStore = true,
},
[1004] = {
	AegisName = "Patriotism_Marks",
	Name = "Chivalry Emblem",
	Buy = 2,
	Weight = 100,
	BuyingStore = true,
},
[1005] = {
	AegisName = "Hammer_Of_Blacksmith",
	Name = "Hammer of Blacksmith",
	Buy = 2,
	Weight = 800,
	BuyingStore = true,
},
[1006] = {
	AegisName = "Old_Magic_Book",
	Name = "Old Magicbook",
	Buy = 2,
	Weight = 30,
	BuyingStore = true,
},
[1007] = {
	AegisName = "Penetration",
	Name = "Necklace of Wisdom",
	Buy = 2,
	Weight = 40,
	BuyingStore = true,
},
[1008] = {
	AegisName = "Frozen_Heart",
	Name = "Necklace of Oblivion",
	Buy = 2,
	Weight = 100,
	BuyingStore = true,
},
[1009] = {
	AegisName = "Sacred_Marks",
	Name = "Hand of God",
	Buy = 2,
	Weight = 20,
	BuyingStore = true,
},
[1010] = {
	AegisName = "Phracon",
	Name = "Phracon",
	Buy = 200,
	Weight = 200,
	BuyingStore = true,
},
[1011] = {
	AegisName = "Emveretarcon",
	Name = "Emveretarcon",
	Buy = 1000,
	Weight = 200,
	BuyingStore = true,
},
[1012] = {
	AegisName = "Lizard_Scruff",
	Name = "Frill",
	Buy = 250,
	Weight = 10,
	BuyingStore = true,
},
[1013] = {
	AegisName = "Colorful_Shell",
	Name = "Rainbow Shell",
	Buy = 90,
	Weight = 10,
	BuyingStore = true,
},
[1014] = {
	AegisName = "Jaws_Of_Ant",
	Name = "Ant Jaw",
	Buy = 232,
	Weight = 10,
	BuyingStore = true,
},
[1015] = {
	AegisName = "Thin_N_Long_Tongue",
	Name = "Tongue",
	Buy = 528,
	Weight = 10,
	BuyingStore = true,
},
[1016] = {
	AegisName = "Rat_Tail",
	Name = "Rat Tail",
	Buy = 52,
	Weight = 10,
	BuyingStore = true,
},
[1017] = {
	AegisName = "Moustache_Of_Mole",
	Name = "Mole Whiskers",
	Buy = 106,
	Weight = 10,
	BuyingStore = true,
},
[1018] = {
	AegisName = "Nail_Of_Mole",
	Name = "Mole Claw",
	Buy = 210,
	Weight = 10,
	BuyingStore = true,
},
[1019] = {
	AegisName = "Wooden_Block",
	Name = "Trunk",
	Buy = 60,
	Weight = 10,
	BuyingStore = true,
},
[1020] = {
	AegisName = "Long_Hair",
	Name = "Black Hair",
	Buy = 292,
	Weight = 10,
	BuyingStore = true,
},
[1021] = {
	AegisName = "Dokkaebi_Horn",
	Name = "Dokebi Horn",
	Buy = 292,
	Weight = 10,
	BuyingStore = true,
},
[1022] = {
	AegisName = "Fox_Tail",
	Name = "Nine Tails",
	Buy = 650,
	Weight = 10,
	BuyingStore = true,
},
[1023] = {
	AegisName = "Fish_Tail",
	Name = "Fish Tail",
	Buy = 196,
	Weight = 10,
	BuyingStore = true,
},
[1024] = {
	AegisName = "Chinese_Ink",
	Name = "Squid Ink",
	Buy = 264,
	Weight = 10,
	BuyingStore = true,
},
[1025] = {
	AegisName = "Spiderweb",
	Name = "Cobweb",
	Buy = 184,
	Weight = 10,
	BuyingStore = true,
},
[1026] = {
	AegisName = "Acorn",
	Name = "Acorn",
	Buy = 98,
	Weight = 10,
	BuyingStore = true,
},
[1027] = {
	AegisName = "Porcupine_Spike",
	Name = "Porcupine Quill",
	Buy = 158,
	Weight = 10,
	BuyingStore = true,
},
[1028] = {
	AegisName = "Wild_Boars_Mane",
	Name = "Mane",
	Buy = 196,
	Weight = 10,
	BuyingStore = true,
},
[1029] = {
	AegisName = "Tigers_Skin",
	Name = "Tiger Skin",
	Buy = 548,
	Weight = 10,
	BuyingStore = true,
},
[1030] = {
	AegisName = "Tiger_Footskin",
	Name = "Tiger's Footskin",
	Buy = 1500,
	Weight = 10,
	BuyingStore = true,
},
[1031] = {
	AegisName = "Limb_Of_Mantis",
	Name = "Mantis Scythe",
	Buy = 196,
	Weight = 10,
	BuyingStore = true,
},
[1032] = {
	AegisName = "Blossom_Of_Maneater",
	Name = "Maneater Blossom",
	Buy = 196,
	Weight = 10,
	BuyingStore = true,
},
[1033] = {
	AegisName = "Root_Of_Maneater",
	Name = "Maneater Root",
	Buy = 208,
	Weight = 10,
	BuyingStore = true,
},
[1034] = {
	AegisName = "Cobold_Hair",
	Name = "Blue Hair",
	Buy = 342,
	Weight = 10,
	BuyingStore = true,
},
[1035] = {
	AegisName = "Dragon_Canine",
	Name = "Dragon Canine",
	Buy = 484,
	Weight = 10,
	BuyingStore = true,
},
[1036] = {
	AegisName = "Dragon_Scale",
	Name = "Dragon Scale",
	Buy = 500,
	Weight = 10,
	BuyingStore = true,
},
[1037] = {
	AegisName = "Dragon_Train",
	Name = "Dragon Tail",
	Buy = 1200,
	Weight = 10,
	BuyingStore = true,
},
[1038] = {
	AegisName = "Petite_DiablOfs_Horn",
	Name = "Little Evil Horn",
	Buy = 528,
	Weight = 10,
	BuyingStore = true,
},
[1039] = {
	AegisName = "Petite_DiablOfs_Wing",
	Name = "Little Evil Wing",
	Buy = 2000,
	Weight = 10,
	BuyingStore = true,
},
[1040] = {
	AegisName = "Elder_Pixies_Beard",
	Name = "Elder Pixie's Moustache",
	Buy = 232,
	Weight = 10,
	BuyingStore = true,
},
[1041] = {
	AegisName = "Lantern",
	Name = "Lantern",
	Buy = 250,
	Weight = 10,
	BuyingStore = true,
},
[1042] = {
	AegisName = "Short_Leg",
	Name = "Bug Leg",
	Buy = 430,
	Weight = 10,
	BuyingStore = true,
},
[1043] = {
	AegisName = "Nail_Of_Orc",
	Name = "Orc Claw",
	Buy = 168,
	Weight = 10,
	BuyingStore = true,
},
[1044] = {
	AegisName = "Tooth_Of_",
	Name = "Zenorc's Fang",
	Buy = 264,
	Weight = 10,
	BuyingStore = true,
},
[1045] = {
	AegisName = "Sacred_Masque",
	Name = "Cultish Masque",
	Buy = 412,
	Weight = 10,
	BuyingStore = true,
},
[1046] = {
	AegisName = "Tweezer",
	Name = "Scorpion Nipper",
	Buy = 614,
	Weight = 10,
	BuyingStore = true,
},
[1047] = {
	AegisName = "Head_Of_Medusa",
	Name = "Dead Medusa",
	Buy = 548,
	Weight = 10,
	BuyingStore = true,
},
[1048] = {
	AegisName = "Slender_Snake",
	Name = "Horrendous Hair",
	Buy = 800,
	Weight = 10,
	BuyingStore = true,
},
[1049] = {
	AegisName = "Skirt_Of_Virgin",
	Name = "Skirt of Virgin",
	Buy = 1700,
	Weight = 10,
	BuyingStore = true,
},
[1050] = {
	AegisName = "Tendon",
	Name = "Tendon",
	Buy = 220,
	Weight = 10,
	BuyingStore = true,
},
[1051] = {
	AegisName = "Detonator",
	Name = "Detonator",
	Buy = 450,
	Weight = 10,
	BuyingStore = true,
},
[1052] = {
	AegisName = "Single_Cell",
	Name = "Single Cell",
	Buy = 46,
	Weight = 10,
	BuyingStore = true,
},
[1053] = {
	AegisName = "Tooth_Of_Ancient_Fish",
	Name = "Ancient Tooth",
	Buy = 548,
	Weight = 10,
	BuyingStore = true,
},
[1054] = {
	AegisName = "Lip_Of_Ancient_Fish",
	Name = "Ancient Lips",
	Buy = 1000,
	Weight = 10,
	BuyingStore = true,
},
[1055] = {
	AegisName = "Earthworm_Peeling",
	Name = "Earthworm Peeling",
	Buy = 196,
	Weight = 10,
	BuyingStore = true,
},
[1056] = {
	AegisName = "Grit",
	Name = "Grit",
	Buy = 306,
	Weight = 10,
	BuyingStore = true,
},
[1057] = {
	AegisName = "Moth_Dust",
	Name = "Moth Dust",
	Buy = 138,
	Weight = 10,
	BuyingStore = true,
},
[1058] = {
	AegisName = "Wing_Of_Moth",
	Name = "Moth Wings",
	Buy = 200,
	Weight = 10,
	BuyingStore = true,
},
[1059] = {
	AegisName = "Transparent_Cloth",
	Name = "Fabric",
	Buy = 306,
	Weight = 10,
	BuyingStore = true,
},
[1060] = {
	AegisName = "Golden_Hair",
	Name = "Golden Hair",
	Buy = 430,
	Weight = 10,
	BuyingStore = true,
},
[1061] = {
	AegisName = "Starsand_Of_Witch",
	Name = "Witch Starsand",
	Buy = 484,
	Weight = 10,
	BuyingStore = true,
},
[1062] = {
	AegisName = "Pumpkin_Head",
	Name = "Jack o' Pumpkin",
	Buy = 374,
	Weight = 10,
	BuyingStore = true,
},
[1063] = {
	AegisName = "Sharpened_Cuspid",
	Name = "Fang",
	Buy = 680,
	Weight = 10,
	BuyingStore = true,
},
[1064] = {
	AegisName = "Reins",
	Name = "Reins",
	Buy = 802,
	Weight = 10,
	BuyingStore = true,
},
[1065] = {
	AegisName = "Booby_Trap",
	Name = "Trap",
	Buy = 100,
	Weight = 10,
	BuyingStore = true,
},
[1066] = {
	AegisName = "Tree_Of_Archer_1",
	Name = "Fine-grained Trunk",
	Buy = 2,
	Weight = 10,
	BuyingStore = true,
},
[1067] = {
	AegisName = "Tree_Of_Archer_2",
	Name = "Solid Trunk",
	Buy = 2,
	Weight = 10,
	BuyingStore = true,
},
[1068] = {
	AegisName = "Tree_Of_Archer_3",
	Name = "Barren Trunk",
	Buy = 2,
	Weight = 10,
	BuyingStore = true,
},
[1069] = {
	AegisName = "Mushroom_Of_Thief_1",
	Name = "Orange Net Mushroom",
	Buy = 2,
	Weight = 10,
},
[1070] = {
	AegisName = "Mushroom_Of_Thief_2",
	Name = "Orange Gooey Mushroom",
	Buy = 2,
	Weight = 10,
},
[1071] = {
	AegisName = "Mage_Test_1",
	Name = "Unknown Test Tube",
	Weight = 10,
},
[1072] = {
	AegisName = "Delivery_Message",
	Name = "Delivery Message",
	Weight = 10,
},
[1073] = {
	AegisName = "Merchant_Voucher_1",
	Name = "Voucher",
	Weight = 10,
},
[1074] = {
	AegisName = "Merchant_Voucher_2",
	Name = "Voucher",
	Weight = 10,
},
[1075] = {
	AegisName = "Merchant_Voucher_3",
	Name = "Voucher",
	Weight = 10,
},
[1076] = {
	AegisName = "Merchant_Voucher_4",
	Name = "Voucher",
	Weight = 10,
},
[1077] = {
	AegisName = "Merchant_Voucher_5",
	Name = "Voucher",
	Weight = 10,
},
[1078] = {
	AegisName = "Merchant_Voucher_6",
	Name = "Voucher",
	Weight = 10,
},
[1079] = {
	AegisName = "Merchant_Voucher_7",
	Name = "Voucher",
	Weight = 10,
},
[1080] = {
	AegisName = "Merchant_Voucher_8",
	Name = "Voucher",
	Weight = 10,
},
[1081] = {
	AegisName = "Merchant_Box_1",
	Name = "Delivery Box",
	Weight = 10,
},
[1082] = {
	AegisName = "Merchant_Box_2",
	Name = "Delivery Box",
	Weight = 10,
},
[1083] = {
	AegisName = "Merchant_Box_3",
	Name = "Delivery Box",
	Weight = 10,
},
[1084] = {
	AegisName = "Kapras_Pass",
	Name = "Kafra Pass",
	Weight = 10,
},
[1085] = {
	AegisName = "Mage_Test_2",
	Name = "Unknown Test Tube",
	Weight = 10,
},
[1086] = {
	AegisName = "Mage_Test_3",
	Name = "Unknown Test Tube",
	Weight = 10,
},
[1087] = {
	AegisName = "Mage_Test_4",
	Name = "Unknown Test Tube",
	Weight = 10,
},
[1088] = {
	AegisName = "Morocc_Potion",
	Name = "Morroc Solution",
	Weight = 10,
	BuyingStore = true,
},
[1089] = {
	AegisName = "Payon_Potion",
	Name = "Payon Solution",
	Weight = 10,
	BuyingStore = true,
},
[1090] = {
	AegisName = "Mage_Test_Etc",
	Name = "Unknown Test Tube",
	Weight = 10,
},
[1091] = {
	AegisName = "Merchant_Box_Etc",
	Name = "Delivery Box",
	Weight = 10,
},
[1092] = {
	AegisName = "Empty_Cylinder",
	Name = "Empty Test Tube",
	Buy = 3,
	Weight = 10,
	BuyingStore = true,
},
[1093] = {
	AegisName = "Empty_Potion",
	Name = "Empty Potion Bottle",
	Buy = 10,
	Weight = 10,
	BuyingStore = true,
},
[1094] = {
	AegisName = "Short_Daenggie",
	Name = "Short Daenggie",
	Buy = 278,
	Weight = 10,
	BuyingStore = true,
},
[1095] = {
	AegisName = "Needle_Of_Alarm",
	Name = "Needle of Alarm",
	Buy = 546,
	Weight = 10,
	BuyingStore = true,
},
[1096] = {
	AegisName = "Round_Shell",
	Name = "Round Shell",
	Buy = 780,
	Weight = 10,
	BuyingStore = true,
},
[1097] = {
	AegisName = "Worn_Out_Page",
	Name = "Worn Out Page",
	Buy = 948,
	Weight = 10,
	BuyingStore = true,
},
[1098] = {
	AegisName = "Manacles",
	Name = "Manacles",
	Buy = 658,
	Weight = 10,
	BuyingStore = true,
},
[1099] = {
	AegisName = "Worn_Out_Prison_Uniform",
	Name = "Worn-out Prison Uniform",
	Buy = 680,
	Weight = 10,
	BuyingStore = true,
},

--== One-Handed Swords =====================================
[1101] = {
	AegisName = "Sword",
	Name = "Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 100,
	Weight = 500,
	Atk = 25,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1102] = {
	AegisName = "Sword_",
	Name = "Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 100,
	Weight = 500,
	Atk = 25,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1103] = {
	AegisName = "Sword__",
	Name = "Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 100,
	Weight = 500,
	Atk = 25,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1104] = {
	AegisName = "Falchion",
	Name = "Falchion",
	Type = "IT_TYPE_WEAPON",
	Buy = 1500,
	Weight = 600,
	Atk = 39,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1105] = {
	AegisName = "Falchion_",
	Name = "Falchion",
	Type = "IT_TYPE_WEAPON",
	Buy = 1500,
	Weight = 600,
	Atk = 39,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1106] = {
	AegisName = "Falchion__",
	Name = "Falchion",
	Type = "IT_TYPE_WEAPON",
	Buy = 1500,
	Weight = 600,
	Atk = 39,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1107] = {
	AegisName = "Blade",
	Name = "Blade",
	Type = "IT_TYPE_WEAPON",
	Buy = 2900,
	Weight = 700,
	Atk = 53,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1108] = {
	AegisName = "Blade_",
	Name = "Blade",
	Type = "IT_TYPE_WEAPON",
	Buy = 2900,
	Weight = 700,
	Atk = 53,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1109] = {
	AegisName = "Blade__",
	Name = "Blade",
	Type = "IT_TYPE_WEAPON",
	Buy = 2900,
	Weight = 700,
	Atk = 53,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HSWORD",
},
[1110] = {
	AegisName = "Lapier",
	Name = "Rapier",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 500,
	Atk = 70,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1111] = {
	AegisName = "Lapier_",
	Name = "Rapier",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 500,
	Atk = 70,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1112] = {
	AegisName = "Lapier__",
	Name = "Rapier",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 500,
	Atk = 70,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1113] = {
	AegisName = "Scimiter",
	Name = "Scimiter",
	Type = "IT_TYPE_WEAPON",
	Buy = 17000,
	Weight = 700,
	Atk = 85,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1114] = {
	AegisName = "Scimiter_",
	Name = "Scimiter",
	Type = "IT_TYPE_WEAPON",
	Buy = 17000,
	Weight = 700,
	Atk = 85,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1115] = {
	AegisName = "Scimiter__",
	Name = "Scimiter",
	Type = "IT_TYPE_WEAPON",
	Buy = 17000,
	Weight = 700,
	Atk = 85,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1116] = {
	AegisName = "Katana",
	Name = "Katana",
	Type = "IT_TYPE_WEAPON",
	Buy = 2000,
	Weight = 1000,
	Atk = 60,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_2HSWORD",
},
[1117] = {
	AegisName = "Katana_",
	Name = "Katana",
	Type = "IT_TYPE_WEAPON",
	Buy = 2000,
	Weight = 1000,
	Atk = 60,
	Range = 1,
	Slots = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_2HSWORD",
},
[1118] = {
	AegisName = "Katana__",
	Name = "Katana",
	Type = "IT_TYPE_WEAPON",
	Buy = 2000,
	Weight = 1000,
	Atk = 60,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_2HSWORD",
},
[1119] = {
	AegisName = "Tsurugi",
	Name = "Tsurugi",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 1200,
	Atk = 130,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},
[1120] = {
	AegisName = "Tsurugi_",
	Name = "Tsurugi",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 1200,
	Atk = 130,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},
[1121] = {
	AegisName = "Tsurugi__",
	Name = "Tsurugi",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 1200,
	Atk = 130,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},
[1122] = {
	AegisName = "Ring_Pommel_Saber",
	Name = "Ring Pommel Saber",
	Type = "IT_TYPE_WEAPON",
	Buy = 24000,
	Weight = 900,
	Atk = 100,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1123] = {
	AegisName = "Haedonggum",
	Name = "Haedonggum",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 900,
	Atk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
	Script = [[ bonus bInt,3; ]]
},
[1124] = {
	AegisName = "Orcish_Sword",
	Name = "Orcish Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 90,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 5,
	Subtype = "WT_1HSWORD",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1125] = {
	AegisName = "Ring_Pommel_Saber_",
	Name = "Ring Pommel Saber",
	Type = "IT_TYPE_WEAPON",
	Buy = 24000,
	Weight = 900,
	Atk = 100,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HSWORD",
},
[1126] = {
	AegisName = "Saber",
	Name = "Saber",
	Type = "IT_TYPE_WEAPON",
	Buy = 49000,
	Weight = 1000,
	Atk = 115,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},
[1127] = {
	AegisName = "Saber_",
	Name = "Saber",
	Type = "IT_TYPE_WEAPON",
	Buy = 49000,
	Weight = 1000,
	Atk = 115,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},
[1128] = {
	AegisName = "Hae_Dong_Gum_",
	Name = "Haedonggum",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 900,
	Atk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
	Script = [[ bonus bInt,3; ]]
},
[1129] = {
	AegisName = "Flamberge",
	Name = "Flamberge",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 1500,
	Atk = 150,
	Range = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},
[1130] = {
	AegisName = "Nagan",
	Name = "Nagan",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 120,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		skill TF_DOUBLE,5;
		bonus bDoubleRate,25;
		bonus2 bAddRace,RC_DemiPlayer,5;
	]]
},
[1131] = {
	AegisName = "Ice_Falchon",
	Name = "Ice Falchion",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 100,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus2 bAddEff,Eff_Freeze,500;
		bonus2 bAddEff2,Eff_Freeze,10;
		skill MG_COLDBOLT,3;
		bonus3 bAutoSpell,MG_COLDBOLT,3,100;
	]]
},
[1132] = {
	AegisName = "Edge",
	Name = "Edge",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 115,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus2 bAddEff,Eff_Curse,30;
		bonus2 bWeaponComaRace,RC_NonBoss,10;
	]]
},
[1133] = {
	AegisName = "Fire_Brand",
	Name = "Fireblend",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 100,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		skill MG_FIREBOLT,3;
		bonus3 bAutoSpell,MG_FIREBOLT,3,100;
	]]
},
[1134] = {
	AegisName = "Scissores_Sword",
	Name = "Caesar's Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 140,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus2 bAddRace,RC_Plant,25;
		bonus bIgnoreDefRace,RC_Plant;
	]]
},
[1135] = {
	AegisName = "Cutlas",
	Name = "Cutlus",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 150,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		skill SM_BASH,5;
		bonus bStr,2;
		bonus bDef,1;
	]]
},
[1136] = {
	AegisName = "Solar_Sword",
	Name = "Solar Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 85,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus2 bHPDrainRate,1000,1;
		bonus2 bSPLossRate,15,10000;
	]]
},
[1137] = {
	AegisName = "Excalibur",
	Name = "Excalibur",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 150,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bInt,5;
		bonus bLuk,10;
		bonus bDex,-1;
		bonus bAtkEle,Ele_Holy;
	]]
},
[1138] = {
	AegisName = "Mysteltainn_",
	Name = "Mysteltainn",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 170,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bAddEle,Ele_Ghost,15;
		bonus3 bAutoSpell,MG_STONECURSE,3,100;
		bonus2 bAddEff,Eff_Stone,10;
		bonus bDex,3;
	]]
},
[1139] = {
	AegisName = "Tale_Fing_",
	Name = "Tirfing",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bHPLossRate,35,10000;
	]]
},
[1140] = {
	AegisName = "Byeorrun_Gum",
	Name = "Byeollungum",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 150,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus2 bSubRace,RC_NonBoss,-10;
		bonus2 bAddRace,RC_Boss,50;
		bonus bAllStats,2;
	]]
},
[1141] = {
	AegisName = "Immaterial_Sword",
	Name = "Immaterial Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 140,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle, Ele_Ghost;
		bonus2 bSPVanishRate, 30, 30;
		bonus bSPDrainValue, -1;
		bonus bUnbreakableWeapon, 1;
	]]
},
[1142] = {
	AegisName = "Jewel_Sword",
	Name = "Jeweled Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 104,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 68,
	Subtype = "WT_1HSWORD",
	Script = [[ bonus bAddMonsterDropChainItem,ITMCHAIN_GEM; ]]
},
[1143] = {
	AegisName = "Gaia_Sword",
	Name = "Gaia Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 140,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 74,
	Subtype = "WT_1HSWORD",
	Script = [[ bonus bAddMonsterDropChainItem,ITMCHAIN_ORE; ]]
},
[1144] = {
	AegisName = "Sasimi",
	Name = "Sashimi",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 75,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 48,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus3 bAddMonsterDropItem,544,RC_Fish,4000;
	]]
},
[1145] = {
	AegisName = "Holy_Avenger",
	Name = "Holy Avenger",
	Type = "IT_TYPE_WEAPON",
	Buy = 450000,
	Weight = 1350,
	Atk = 125,
	Range = 1,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 75,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bVit,2;
	]]
},
[1146] = {
	AegisName = "Town_Sword",
	Name = "Town Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 42000,
	Weight = 800,
	Atk = 100,
	Range = 1,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_1HSWORD",
},
[1147] = {
	AegisName = "Town_Sword_",
	Name = "Town Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 42000,
	Weight = 800,
	Atk = 100,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_1HSWORD",
},
[1148] = {
	AegisName = "Star_Dust_Blade",
	Name = "Star Dust Blade",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 45,
	Subtype = "WT_1HSWORD",
	Script = [[
		bonus2 bAddEff,Eff_Stun,500;
		bonus bUnbreakableWeapon,0;
	]]
},
[1149] = {
	AegisName = "Flamberge_",
	Name = "Flamberge",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 1500,
	Atk = 150,
	Range = 1,
	Slots = 2,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HSWORD",
},

--== Two-Handed Swords =====================================
[1151] = {
	AegisName = "Slayer",
	Name = "Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 15000,
	Weight = 1300,
	Atk = 90,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSWORD",
},
[1152] = {
	AegisName = "Slayer_",
	Name = "Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 15000,
	Weight = 1300,
	Atk = 90,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSWORD",
},
[1153] = {
	AegisName = "Slayer__",
	Name = "Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 15000,
	Weight = 1300,
	Atk = 90,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSWORD",
},
[1154] = {
	AegisName = "Bastard_Sword",
	Name = "Bastard Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 22500,
	Weight = 1600,
	Atk = 115,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSWORD",
},
[1155] = {
	AegisName = "Bastard_Sword_",
	Name = "Bastard Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 22500,
	Weight = 1600,
	Atk = 115,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSWORD",
},
[1156] = {
	AegisName = "Bastard_Sword__",
	Name = "Bastard Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 22500,
	Weight = 1600,
	Atk = 115,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSWORD",
},
[1157] = {
	AegisName = "Two_Hand_Sword",
	Name = "Two-handed Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2200,
	Atk = 160,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
},
[1158] = {
	AegisName = "Two_Hand_Sword_",
	Name = "Two-handed Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2200,
	Atk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
},
[1159] = {
	AegisName = "Two_Hand_Sword__",
	Name = "Two-handed Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2200,
	Atk = 160,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
},
[1160] = {
	AegisName = "Broad_Sword",
	Name = "Broad Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 65000,
	Weight = 2000,
	Atk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bDef,5;
		bonus bUnbreakableWeapon,0;
	]]
},
[1161] = {
	AegisName = "Balmung",
	Name = "Balmung",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 250,
	Range = 1,
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bAtkEle,Ele_Holy;
	]]
},
[1162] = {
	AegisName = "Broad_Sword_",
	Name = "Broad Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 65000,
	Weight = 2000,
	Atk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bDef,5;
		bonus bUnbreakableWeapon,0;
	]]
},
[1163] = {
	AegisName = "Claymore",
	Name = "Claymore",
	Type = "IT_TYPE_WEAPON",
	Buy = 74000,
	Weight = 2500,
	Atk = 180,
	Range = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
},
[1164] = {
	AegisName = "Muramasa",
	Name = "Muramasa",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 155,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bCritical,30;
		bonus bAspdRate,8;
		bonus2 bAddEff2,Eff_Curse,10;
	]]
},
[1165] = {
	AegisName = "Masamune",
	Name = "Masamune",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bFlee,30;
		bonus bStr,-5;
		bonus bAspd,2;
		bonus bDefRate,-67;
		bonus bDef2Rate,-67;
	]]
},
[1166] = {
	AegisName = "Dragon_Slayer",
	Name = "Dragon Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1300,
	Atk = 150,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bIgnoreDefRace,RC_Dragon;
		bonus2 bAddRace,RC_Dragon,15;
	]]
},
[1167] = {
	AegisName = "Schweizersabel",
	Name = "Schweizersabel",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1600,
	Atk = 160,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bDef,1;
		bonus3 bAutoSpell,MG_LIGHTNINGBOLT,3,100;
	]]
},
[1168] = {
	AegisName = "Zweihander",
	Name = "Zweihander",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1169] = {
	AegisName = "Executioner_",
	Name = "Executioner",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 155,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus2 bAddRace,RC_DemiPlayer,20;
		bonus2 bSubRace,RC_DemiPlayer,-10;
		bonus bAtkEle,Ele_Dark;
	]]
},
[1170] = {
	AegisName = "Katzbalger",
	Name = "Katzbalger",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 175,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bVit,5;
		bonus bDef,10;
	]]
},
[1171] = {
	AegisName = "Zweihander_",
	Name = "Zweihander",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 200,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1172] = {
	AegisName = "Claymore_",
	Name = "Claymore",
	Type = "IT_TYPE_WEAPON",
	Buy = 74000,
	Weight = 2500,
	Atk = 180,
	Range = 1,
	Slots = 2,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSWORD",
},
[1173] = {
	AegisName = "Muramasa_C",
	Name = "Muramasa",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 204,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bCritical,30;
		bonus bAspdRate,8;
	]]
},
[1174] = {
	AegisName = "Executioner_C",
	Name = "Executioner",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 190,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus2 bAddRace,RC_DemiPlayer,20;
		bonus2 bSubRace,RC_DemiPlayer,-10;
		bonus bAtkEle,Ele_Dark;
	]]
},
[1175] = {
	AegisName = "Altas_Weapon",
	Name = "Atlas Weapon",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3500,
	Atk = 200,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bCritical,10;
		if(readparam(bStr)>=80) {
			bonus bBreakArmorRate,500;
		}
	]]
},
[1176] = {
	AegisName = "Muscle_Cutter",
	Name = "Muscle Cutter",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus2 bAddEff,Eff_Bleeding,800;
		bonus3 bAutoSpell,AL_DECAGI,1,30;
	]]
},
[1177] = {
	AegisName = "Muramash",
	Name = "Muramash",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1178] = {
	AegisName = "Schweizersabel_",
	Name = "Schweizersabel",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1600,
	Atk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bDef,1;
		bonus3 bAutoSpell,MG_LIGHTNINGBOLT,3,100;
	]]
},
[1179] = {
	AegisName = "Executioner__",
	Name = "Executioner",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 155,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus2 bAddRace,RC_DemiPlayer,20;
		bonus2 bSubRace,RC_DemiPlayer,-10;
		bonus bAtkEle,Ele_Dark;
	]]
},
[1180] = {
	AegisName = "Dragon_Slayer_",
	Name = "Dragon Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1300,
	Atk = 150,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bIgnoreDefRace,RC_Dragon;
		bonus2 bAddRace,RC_Dragon,15;
	]]
},
[1181] = {
	AegisName = "Tae_Goo_Lyeon",
	Name = "Tae Goo Lyeon",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 250,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 90,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bFlee2,10;
		if((JobLevel >= 70 && Class == Job_Rune_Knight_T) || (JobLevel >= 50 && Class == Job_Rune_Knight)) {
			autobonus "{ bonus bBaseAtk,50; }",10,10000,BF_WEAPON,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
		}
		if(getrefine()>8) {
			bonus bUseSPrate,-20;
			bonus bDelayrate,-20;
		}
	]]
},
[1182] = {
	AegisName = "Bloody_Eater",
	Name = "Bloody Eater",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 200,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 50,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bAtkEle,Ele_Ghost;
		autobonus "{ bonus bCritical,100; bonus bBaseAtk,50; }",1,5000,0,"{ specialeffect(EF_FIRESPLASHHIT, AREA, playerattached()); }";
		bonus bHPGainValue,100;
	]]
},
[1183] = {
	AegisName = "BF_Two_Handed_Sword1",
	Name = "Brave Assaulter's Katzbalger",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus2 bAddRace,RC_DemiPlayer,55;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1184] = {
	AegisName = "BF_Two_Handed_Sword2",
	Name = "Valorous Assaulter's Katzbalger",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bCritical,20;
		bonus2 bAddRace,RC_DemiPlayer,55;
		bonus bCritAtkRate,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1185] = {
	AegisName = "Violet_Fear",
	Name = "Violet Fear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 275,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus3 bAutoSpell,WZ_METEOR,3,30;
		bonus3 bAutoSpell,WZ_FROSTNOVA,5,50;
		autobonus "{ bonus bIgnoreDefRace,RC_NonBoss; }",50,5000;
	]]
},
[1186] = {
	AegisName = "Death_Guidance",
	Name = "Death Guidance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 200,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bStr,5;
		bonus bAgi,2;
		bonus bFlee2,20;
		bonus3 bAutoSpell,NPC_HELLPOWER,1,10;
		bonus4 bAutoSpell,NPC_HELLPOWER,1,10,0;
		if( getrefine()>8 ) bonus3 bAutoSpell,NPC_VAMPIRE_GIFT,2,20;
		else bonus3 bAutoSpell,NPC_VAMPIRE_GIFT,1,20;
	]]
},
[1187] = {
	AegisName = "Krieger_Twohand_Sword1",
	Name = "Glorious Claymore",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 220,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(), 14)-3) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) {
			bonus3 bAutoSpell,LK_CONCENTRATION,max(getskilllv(LK_CONCENTRATION),1),30;
			bonus3 bAutoSpell,LK_AURABLADE,max(getskilllv(LK_AURABLADE),1),30;
		}
	]]
},
[1188] = {
	AegisName = "Veteran_Sword",
	Name = "Veteran Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 2000,
	Atk = 180,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSWORD",
	Script = [[
		if(getskilllv(SM_BASH)==10) {
			bonus2 bSkillAtk,SM_BASH,50;
		}
		if(getskilllv(KN_BOWLINGBASH)==10) {
			bonus2 bSkillAtk,KN_BOWLINGBASH,50;
		}
		bonus bStr,1;
		bonus bDex,1;
	]]
},
[1189] = {
	AegisName = "Krasnaya",
	Name = "Krasnaya",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3800,
	Atk = 200,
	Range = 2,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 50,
	Subtype = "WT_2HSWORD",
	Script = [[
		if(readparam(bStr)>=95) {
			bonus bBaseAtk,20;
		}
	]]
},
[1190] = {
	AegisName = "Claymore_C",
	Name = "Claymore",
	Type = "IT_TYPE_WEAPON",
	Atk = 220,
	Range = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1191] = {
	AegisName = "Alca_Bringer",
	Name = "Alca Bringer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3400,
	Atk = 280,
	Range = 2,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_2HSWORD",
	Script = [[ bonus bAspd,(getrefine()/2); ]]
},
[1192] = {
	AegisName = "P_Slayer1",
	Name = "Eden Slayer I",
	Type = "IT_TYPE_WEAPON",
	Atk = 162,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 26,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1193] = {
	AegisName = "P_Slayer2",
	Name = "Eden Slayer II",
	Type = "IT_TYPE_WEAPON",
	Atk = 185,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1194] = {
	AegisName = "F_Executioner_C",
	Name = "Rental Executioner",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 190,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Script = [[ bonus bAtkEle,Ele_Dark; ]]
},
[1195] = {
	AegisName = "E_Executioner_C",
	Name = "E Executioner C",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 190,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Script = [[ bonus bAtkEle,Ele_Dark; ]]
},
[1196] = {
	AegisName = "Chrome_Twohand_Sword",
	Name = "Two-Handed Chrome Metal Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 280,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 110,
	Subtype = "WT_2HSWORD",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bAgi,3;
		bonus bMaxHPrate,-10;
	]]
},
[1197] = {
	AegisName = "P_Slayer3",
	Name = "Eden Group Slayer III",
	Type = "IT_TYPE_WEAPON",
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1198] = {
	AegisName = "Hairtail",
	Name = "Hairtail",
	Type = "IT_TYPE_WEAPON",
	Atk = 220,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 50,
	Refine = false,
	Subtype = "WT_2HSWORD",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bCritical,20;
		bonus bCritAtkRate,50;
		bonus4 bAddEff,Eff_Cold,300,ATF_SHORT,3000;
		if(BaseLevel>99) {
			bonus bBaseAtk,50;
		}
	]]
},
[1199] = {
	AegisName = "Ebony_Toe_Nail",
	Name = "Ebony Toe Nail",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 1000,
	Atk = 250,
	Matk = 150,
	Range = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_2HSWORD",
},

--== Daggers ===============================================
[1201] = {
	AegisName = "Knife",
	Name = "Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 50,
	Weight = 400,
	Atk = 17,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1202] = {
	AegisName = "Knife_",
	Name = "Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 50,
	Weight = 400,
	Atk = 17,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1203] = {
	AegisName = "Knife__",
	Name = "Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 50,
	Weight = 400,
	Atk = 17,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1204] = {
	AegisName = "Cutter",
	Name = "Cutter",
	Type = "IT_TYPE_WEAPON",
	Buy = 1250,
	Weight = 500,
	Atk = 30,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1205] = {
	AegisName = "Cutter_",
	Name = "Cutter",
	Type = "IT_TYPE_WEAPON",
	Buy = 1250,
	Weight = 500,
	Atk = 30,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1206] = {
	AegisName = "Cutter__",
	Name = "Cutter",
	Type = "IT_TYPE_WEAPON",
	Buy = 1250,
	Weight = 500,
	Atk = 30,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1207] = {
	AegisName = "Main_Gauche",
	Name = "Main Gauche",
	Type = "IT_TYPE_WEAPON",
	Buy = 2400,
	Weight = 600,
	Atk = 43,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1208] = {
	AegisName = "Main_Gauche_",
	Name = "Main Gauche",
	Type = "IT_TYPE_WEAPON",
	Buy = 2400,
	Weight = 600,
	Atk = 43,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1209] = {
	AegisName = "Main_Gauche__",
	Name = "Main Gauche",
	Type = "IT_TYPE_WEAPON",
	Buy = 2400,
	Weight = 600,
	Atk = 43,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
},
[1210] = {
	AegisName = "Dirk",
	Name = "Dirk",
	Type = "IT_TYPE_WEAPON",
	Buy = 8500,
	Weight = 500,
	Atk = 59,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1211] = {
	AegisName = "Dirk_",
	Name = "Dirk",
	Type = "IT_TYPE_WEAPON",
	Buy = 8500,
	Weight = 500,
	Atk = 59,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1212] = {
	AegisName = "Dirk__",
	Name = "Dirk",
	Type = "IT_TYPE_WEAPON",
	Buy = 8500,
	Weight = 500,
	Atk = 59,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1213] = {
	AegisName = "Dagger",
	Name = "Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 14000,
	Weight = 600,
	Atk = 73,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1214] = {
	AegisName = "Dagger_",
	Name = "Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 14000,
	Weight = 600,
	Atk = 73,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1215] = {
	AegisName = "Dagger__",
	Name = "Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 14000,
	Weight = 600,
	Atk = 73,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1216] = {
	AegisName = "Stiletto",
	Name = "Stiletto",
	Type = "IT_TYPE_WEAPON",
	Buy = 19500,
	Weight = 700,
	Atk = 87,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1217] = {
	AegisName = "Stiletto_",
	Name = "Stiletto",
	Type = "IT_TYPE_WEAPON",
	Buy = 19500,
	Weight = 700,
	Atk = 87,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1218] = {
	AegisName = "Stiletto__",
	Name = "Stiletto",
	Type = "IT_TYPE_WEAPON",
	Buy = 19500,
	Weight = 700,
	Atk = 87,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_DAGGER",
},
[1219] = {
	AegisName = "Gladius",
	Name = "Gladius",
	Type = "IT_TYPE_WEAPON",
	Buy = 43000,
	Weight = 700,
	Atk = 105,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_DAGGER",
},
[1220] = {
	AegisName = "Gladius_",
	Name = "Gladius",
	Type = "IT_TYPE_WEAPON",
	Buy = 43000,
	Weight = 700,
	Atk = 105,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_DAGGER",
},
[1221] = {
	AegisName = "Gladius__",
	Name = "Gladius",
	Type = "IT_TYPE_WEAPON",
	Buy = 43000,
	Weight = 700,
	Atk = 105,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_DAGGER",
},
[1222] = {
	AegisName = "Damascus",
	Name = "Damascus",
	Type = "IT_TYPE_WEAPON",
	Buy = 49000,
	Weight = 800,
	Atk = 118,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1223] = {
	AegisName = "Forturn_Sword",
	Name = "Fortune Sword",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 90,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 24,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bLuk,5;
		bonus bFlee2,20;
	]]
},
[1224] = {
	AegisName = "Sword_Breaker",
	Name = "Swordbreaker",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 70,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bBreakWeaponRate,500; ]]
},
[1225] = {
	AegisName = "Mail_Breaker",
	Name = "Mailbreaker",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 70,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bBreakArmorRate,500; ]]
},
[1226] = {
	AegisName = "Damascus_",
	Name = "Damascus",
	Type = "IT_TYPE_WEAPON",
	Buy = 49000,
	Weight = 800,
	Atk = 118,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1227] = {
	AegisName = "Weeder_Knife",
	Name = "Weeder Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 80,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bIgnoreDefRace,RC_Plant;
		bonus2 bAddRace,RC_Plant,15;
		bonus2 bAddRaceTolerance,RC_Plant,15;
	]]
},
[1228] = {
	AegisName = "Combat_Knife",
	Name = "Combat Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 80,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,10;
		bonus2 bSubRace,RC_Demon,-10;
	]]
},
[1229] = {
	AegisName = "Mamas_Knife",
	Name = "Kitchen Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 75,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bCritical,30;
		bonus3 bAddMonsterDropItem,517,RC_Brute,5000;
	]]
},
[1230] = {
	AegisName = "House_Auger",
	Name = "Ice pick",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 80,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bDefRatioAtkRace, RC_All; ]]
},
[1231] = {
	AegisName = "Bazerald",
	Name = "Bazerald",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 70,
	Matk = 105,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus bInt,5;
	]]
},
[1232] = {
	AegisName = "Assasin_Dagger",
	Name = "Assassin Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 140,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bMaxHPrate,20;
		bonus bMaxSPrate,15;
		bonus bAspdRate,2;
		bonus bAtkEle,Ele_Dark;
	]]
},
[1233] = {
	AegisName = "Exercise",
	Name = "Exorciser",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 90,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bIgnoreDefRace,RC_Demon;
		bonus2 bAddRaceTolerance,RC_Demon,5;
		bonus2 bSubRace,RC_DemiPlayer,-10;
	]]
},
[1234] = {
	AegisName = "Moonlight_Sword",
	Name = "Moonlight Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 50,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bMaxSPrate,10;
		bonus bSPDrainValue,3;
	]]
},
[1235] = {
	AegisName = "Azoth",
	Name = "Azoth",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 1,
	Job = {
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bClassChange,300; ]]
},
[1236] = {
	AegisName = "Sucsamad",
	Name = "Sucsamad",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 140,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus2 bAddEle,Ele_Earth,10;
		bonus2 bAddEle,Ele_Wind,10;
		bonus bUnbreakableWeapon,0;
	]]
},
[1237] = {
	AegisName = "Grimtooth_",
	Name = "Grimtooth",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 180,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bFlee,10;
		bonus bFlee2,5;
		bonus bDefRate,-50;
		bonus bDef2Rate,-50;
	]]
},
[1238] = {
	AegisName = "Zeny_Knife",
	Name = "Zeny Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 64,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_DAGGER",
	Script = [[ bonus2 bGetZenyNum,100,40; ]]
},
[1239] = {
	AegisName = "Poison_Knife",
	Name = "Poison Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 64,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 65,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bAtkEle,Ele_Poison;
		bonus2 bAddEff,Eff_Poison,3000;
	]]
},
[1240] = {
	AegisName = "Princess_Knife",
	Name = "Princess Knife",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 84,
	Range = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bAllStats,1; ]]
},
[1241] = {
	AegisName = "Cursed_Dagger",
	Name = "Cursed Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 80000,
	Weight = 400,
	Atk = 55,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 85,
	Subtype = "WT_DAGGER",
	Script = [[ bonus2 bAddEff,Eff_Curse,5000; ]]
},
[1242] = {
	AegisName = "Counter_Dagger",
	Name = "Dagger of Counter",
	Type = "IT_TYPE_WEAPON",
	Buy = 120000,
	Weight = 550,
	Atk = 140,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bCritical,90; ]]
},
[1243] = {
	AegisName = "Novice_Knife",
	Name = "Novice Main-Gauche",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Weight = 1,
	Atk = 45,
	Range = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_DAGGER",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1244] = {
	AegisName = "Holy_Dagger",
	Name = "Holy Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 100,
	Range = 1,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_DAGGER",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bDex,1;
	]]
},
[1245] = {
	AegisName = "Cinquedea",
	Name = "Cinquedea",
	Type = "IT_TYPE_WEAPON",
	Buy = 40000,
	Weight = 700,
	Atk = 110,
	Range = 1,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_DAGGER",
},
[1246] = {
	AegisName = "Cinquedea_",
	Name = "Cinquedea",
	Type = "IT_TYPE_WEAPON",
	Buy = 40000,
	Weight = 700,
	Atk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_DAGGER",
},
[1247] = {
	AegisName = "Kindling_Dagger",
	Name = "Kindle Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 600,
	Atk = 39,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bAtkEle,Ele_Fire; ]]
},
[1248] = {
	AegisName = "Obsidian_Dagger",
	Name = "Obsidian Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 600,
	Atk = 39,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bAtkEle,Ele_Earth; ]]
},
[1249] = {
	AegisName = "Fishermans_Dagger",
	Name = "Fisherman's Dagger",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 600,
	Atk = 39,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Magician = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Soul_Linker = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_DAGGER",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},

--== Katars ================================================
[1250] = {
	AegisName = "Jur",
	Name = "Jur",
	Type = "IT_TYPE_WEAPON",
	Buy = 19500,
	Weight = 800,
	Atk = 125,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_KATAR",
},
[1251] = {
	AegisName = "Jur_",
	Name = "Jur",
	Type = "IT_TYPE_WEAPON",
	Buy = 19500,
	Weight = 800,
	Atk = 125,
	Range = 1,
	Slots = 3,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_KATAR",
},
[1252] = {
	AegisName = "Katar",
	Name = "Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 1200,
	Atk = 148,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_KATAR",
	Script = [[ bonus bDex,1; ]]
},
[1253] = {
	AegisName = "Katar_",
	Name = "Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 1200,
	Atk = 148,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_KATAR",
	Script = [[ bonus bDex,1; ]]
},
[1254] = {
	AegisName = "Jamadhar",
	Name = "Jamadhar",
	Type = "IT_TYPE_WEAPON",
	Buy = 37200,
	Weight = 1500,
	Atk = 165,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_KATAR",
},
[1255] = {
	AegisName = "Jamadhar_",
	Name = "Jamadhar",
	Type = "IT_TYPE_WEAPON",
	Buy = 37200,
	Weight = 1500,
	Atk = 165,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_KATAR",
},
[1256] = {
	AegisName = "Katar_Of_Cold_Icicle",
	Name = "Katar of Frozen Icicle",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus2 bAddEff,Eff_Freeze,500;
	]]
},
[1257] = {
	AegisName = "Katar_Of_Thornbush",
	Name = "Katar of Quaking",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Earth;
		bonus2 bAddEff,Eff_Blind,500;
	]]
},
[1258] = {
	AegisName = "Katar_Of_Raging_Blaze",
	Name = "Katar of Raging Blaze",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus2 bAddEff,Eff_Silence,500;
	]]
},
[1259] = {
	AegisName = "Katar_Of_Piercing_Wind",
	Name = "Katar of Piercing Wind",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus2 bAddEff,Eff_Sleep,500;
	]]
},
[1260] = {
	AegisName = "Ghoul_Leg",
	Name = "Sharpened Legbone of Ghoul",
	Type = "IT_TYPE_WEAPON",
	Buy = 52500,
	Weight = 1700,
	Atk = 150,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 65,
	Subtype = "WT_KATAR",
	Script = [[ bonus bAtkEle,Ele_Undead; ]]
},
[1261] = {
	AegisName = "Infiltrator",
	Name = "Infiltrator",
	Type = "IT_TYPE_WEAPON",
	Buy = 57000,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_KATAR",
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,50;
		bonus bDef,3;
		bonus bFlee,5;
		bonus bFlee2,2;
	]]
},
[1262] = {
	AegisName = "Nail_Of_Loki",
	Name = "Loki's Nail",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 115,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[ bonus2 bAddEff,Eff_Bleeding,300; ]]
},
[1263] = {
	AegisName = "Unholy_Touch",
	Name = "Unholy Touch",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1250,
	Atk = 151,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bAddEff,Eff_Curse,200;
		bonus bCritical,-1;
		bonus bUnbreakableWeapon,0;
	]]
},
[1264] = {
	AegisName = "Various_Jur",
	Name = "Specialty Jur",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 90,
	Range = 1,
	Slots = 4,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	Subtype = "WT_KATAR",
	Script = [[ bonus2 bAddEff2,Eff_Bleeding,10; ]]
},
[1265] = {
	AegisName = "Bloody_Roar",
	Name = "Bloody Roar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 120,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus bFlee,-160;
		bonus bFlee2,-160;
		bonus bHPrecovRate,-100;
		bonus bSPrecovRate,-100;
	]]
},
[1266] = {
	AegisName = "Infiltrator_",
	Name = "Infiltrator",
	Type = "IT_TYPE_WEAPON",
	Buy = 57000,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_KATAR",
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,50;
		bonus bDef,3;
		bonus bFlee,5;
		bonus bFlee2,2;
	]]
},
[1267] = {
	AegisName = "Infiltrator_C",
	Name = "Infiltrator",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 189,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus bDef,3;
		bonus bFlee,5;
		bonus bFlee2,2;
		bonus bAspdRate,5;
	]]
},
[1268] = {
	AegisName = "Wild_Beast_Claw",
	Name = "Wild Beast Claw",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1450,
	Atk = 160,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		if(getrefine()>=9) {
			bonus3 bAutoSpell,NPC_CRITICALWOUND,2,100;
		}
		else bonus3 bAutoSpell,NPC_CRITICALWOUND,1,100;
	]]
},
[1269] = {
	AegisName = "Inverse_Scale",
	Name = "Inverse Scale",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus3 bAutoSpell,NPC_DRAGONFEAR,1,30;
	]]
},
[1270] = {
	AegisName = "Drill_Katar",
	Name = "Drill Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 110,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bHit,30;
		bonus3 bAutoSpell,ST_FULLSTRIP,1,150;
	]]
},
[1271] = {
	AegisName = "Blood_Tears",
	Name = "Blood Tears",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1700,
	Atk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		if(getrefine()>=9) {
			bonus3 bAutoSpell,NPC_WIDEBLEEDING,2,30;
		}
		else bonus3 bAutoSpell,NPC_WIDEBLEEDING,1,30;
	]]
},
[1272] = {
	AegisName = "Scratcher",
	Name = "Scratcher",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1273] = {
	AegisName = "Bloody_Roar_C",
	Name = "Bloody Roar",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 148,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus bFlee,-160;
		bonus bFlee2,-160;
	]]
},
[1274] = {
	AegisName = "Unholy_Touch_C",
	Name = "Unholy Touch",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 179,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bAddEff,Eff_Curse,5000;
		bonus bCritical,-1;
		bonus bUnbreakableWeapon,0;
	]]
},
[1275] = {
	AegisName = "Katar_Of_Cold_Icicle_",
	Name = "Katar of Frozen Icicle",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Slots = 3,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus2 bAddEff,Eff_Freeze,500;
	]]
},
[1276] = {
	AegisName = "Katar_Of_Thornbush_",
	Name = "Katar of Quaking",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Slots = 3,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Earth;
		bonus2 bAddEff,Eff_Blind,500;
	]]
},
[1277] = {
	AegisName = "Katar_Of_Raging_Blaze_",
	Name = "Katar of Raging Blaze",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Slots = 3,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus2 bAddEff,Eff_Silence,500;
	]]
},
[1278] = {
	AegisName = "Katar_Of_Piercing_Wind_",
	Name = "Katar of Piercing Wind",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 1200,
	Atk = 105,
	Range = 1,
	Slots = 3,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus2 bAddEff,Eff_Sleep,500;
	]]
},
[1279] = {
	AegisName = "BF_Katar1",
	Name = "Brave Carnage Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 130,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		bonus bDex,1;
		bonus bLuk,1;
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1280] = {
	AegisName = "BF_Katar2",
	Name = "Valorous Carnage Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 130,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		bonus bDex,1;
		bonus bLuk,1;
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus bCritAtkRate,20;
		bonus bAspdRate,5;
		bonus bUnbreakableWeapon,0;
	]]
},
[1281] = {
	AegisName = "Krieger_Katar1",
	Name = "Glorious Bloody Roar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 140,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) autobonus "{ bonus bAspdRate,100; }",70,3000,BF_WEAPON,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
	]]
},
[1282] = {
	AegisName = "Krieger_Katar2",
	Name = "Glorious Jamadhar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 140,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bCriticalAddRace,RC_DemiPlayer,5;
		}
		if(getrefine()>8) autobonus "{ bonus bAspdRate,100; }",70,3000,BF_WEAPON,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
	]]
},
[1283] = {
	AegisName = "Katar_Of_Speed",
	Name = "Katar Of Speed",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 175,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSkillAtk,AS_SONICBLOW,25;
		bonus bAspdRate,3;
	]]
},
[1284] = {
	AegisName = "Krishna",
	Name = "Krishna",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_KATAR",
	Script = [[
		bonus2 bSkillAtk,AS_GRIMTOOTH,10;
		if(getskilllv(AS_SONICBLOW)) {
			bonus3 bAutoSpell,AS_SONICBLOW,getskilllv(AS_SONICBLOW),5;
		}
		else {
			bonus3 bAutoSpell,AS_SONICBLOW,1,5;
		}
	]]
},
[1285] = {
	AegisName = "Cakram",
	Name = "Chakram",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 130,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_KATAR",
	Script = [[
		if(getskilllv(AS_KATAR)==10) {
			bonus bHit,10;
		}
		bonus2 bSkillAtk,ASC_METEORASSAULT,20;
	]]
},
[1286] = {
	AegisName = "Jamadhar_C",
	Name = "Jamadhar",
	Type = "IT_TYPE_WEAPON",
	Atk = 200,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1287] = {
	AegisName = "Durga",
	Name = "Durga",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 190,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_KATAR",
},
[1288] = {
	AegisName = "Bloody_Fear_C",
	Name = "Bloody Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 145,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1289] = {
	AegisName = "P_Katar1",
	Name = "Eden Group Katar I",
	Type = "IT_TYPE_WEAPON",
	Atk = 155,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1290] = {
	AegisName = "Agent_Katar",
	Name = "Agent Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 1200,
	Atk = 170,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_KATAR",
	Script = [[ bonus bHit,readparam(bLuk)/2; ]]
},
[1291] = {
	AegisName = "Guillotine_Katar",
	Name = "Guillotine Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 1500,
	Atk = 200,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 140,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bDex,2;
		bonus bFlee,-30;
		bonus2 bAddRace,RC_DemiPlayer,50;
		bonus2 bSkillAtk,GC_CROSSIMPACT,30;
	]]
},
[1292] = {
	AegisName = "Upg_Katar",
	Name = "Upgrade Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 80,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bBaseAtk,(getrefine()*10);
		bonus bCritAtkRate,(getrefine()*2);
		if(BaseLevel>70) { bonus bBaseAtk,(((BaseLevel-70)/10)*10); }
	]]
},
[1293] = {
	AegisName = "Velum_Jamadhar",
	Name = "Vellum Jamadhar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 170,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAspdRate,getrefine();
		bonus4 bSetDefRace,RC_Player,10000,5000,1;
		bonus4 bSetMDefRace,RC_Player,10000,5000,1;
	]]
},
[1294] = {
	AegisName = "Velum_Scare",
	Name = "Vellum Scale",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 50,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_KATAR",
	Script = [[ bonus3 bSPVanishRate, 1000, 10, BF_NORMAL; ]]
},
[1295] = {
	AegisName = "Blood_Tears_",
	Name = "Blood Tears ",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1700,
	Atk = 120,
	Range = 1,
	Slots = 3,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		if(getrefine()>=9) {
			bonus3 bAutoSpell,NPC_WIDEBLEEDING,2,30;
		}
		else bonus3 bAutoSpell,NPC_WIDEBLEEDING,1,30;
	]]
},
[1296] = {
	AegisName = "Metal_Katar",
	Name = "Metal Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 75,
	Range = 1,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bBaseAtk,(getrefine()*5);
		bonus bCritAtkRate,getrefine();
		.@val = min(BaseLevel/10, 12);
		if (.@val > 2) { bonus bBaseAtk,((.@val-2)*5); }
	]]
},
[1297] = {
	AegisName = "Inverse_Scale_",
	Name = "Inverse Scale",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus3 bAutoSpell,NPC_DRAGONFEAR,1,30;
	]]
},
[1298] = {
	AegisName = "Shiver_Katar",
	Name = "Shiver Katar",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2700,
	Atk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 105,
	Subtype = "WT_KATAR",
	Script = [[
		bonus bCritical,getrefine();
	]]
},
[1299] = {
	AegisName = "TE_Woe_Katar",
	Name = "TE WoE Katar",
	Type = "IT_TYPE_WEAPON",
	Atk = 120,
	Range = 1,
	Job = {
		Assassin = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_KATAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Bleeding,1000;
	]]
},

--== One-Handed Axes =======================================
[1301] = {
	AegisName = "Axe",
	Name = "Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 500,
	Weight = 800,
	Atk = 38,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_1HAXE",
},
[1302] = {
	AegisName = "Axe_",
	Name = "Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 500,
	Weight = 800,
	Atk = 38,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_1HAXE",
},
[1303] = {
	AegisName = "Axe__",
	Name = "Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 500,
	Weight = 800,
	Atk = 38,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_1HAXE",
},
[1304] = {
	AegisName = "Orcish_Axe",
	Name = "Orcish Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 75,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 3,
	Subtype = "WT_1HAXE",
},
[1305] = {
	AegisName = "Cleaver",
	Name = "Cleaver",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 140,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_1HAXE",
	Script = [[
		bonus2 bAddRaceTolerance,RC_DemiPlayer,5;
		bonus3 bAddMonsterDropItem,517,RC_Brute,3000;
	]]
},
[1306] = {
	AegisName = "War_Axe",
	Name = "War Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 4200,
	Atk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 76,
	Subtype = "WT_1HAXE",
	Script = [[
		bonus bDex,2;
		bonus bLuk,2;
	]]
},
[1307] = {
	AegisName = "Windhawk",
	Name = "Windhawk",
	Type = "IT_TYPE_WEAPON",
	Buy = 18000,
	Weight = 1500,
	Atk = 115,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HAXE",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bAspdRate,5;
	]]
},
[1308] = {
	AegisName = "Golden_Axe",
	Name = "Golden Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3000,
	Atk = 170,
	Range = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 45,
	Subtype = "WT_1HAXE",
},
[1309] = {
	AegisName = "Orcish_Axe_",
	Name = "Orcish Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 75,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 3,
	Subtype = "WT_1HAXE",
},
[1310] = {
	AegisName = "Krieger_Onehand_Axe1",
	Name = "Glorious Cleaver",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 130,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_1HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,75;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
			bonus bAspdRate,5;
		}
		if(getrefine()>8) {
			bonus bAspdRate,5;
			bonus3 bAutoSpell,NPC_CRITICALWOUND,1,50;
			bonus4 bAutoSpellOnSkill,MC_MAMMONITE,NPC_CRITICALWOUND,2,200;
		}
	]]
},
[1311] = {
	AegisName = "Vecer_Axe",
	Name = "Vecer Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_1HAXE",
	Script = [[
		if(readparam(bLuk)>=90) {
			bonus bBaseAtk,20;
		}
		if(readparam(bDex)>=90) {
			bonus bCritical,5;
		}
		if(readparam(bDex)>=90||readparam(bLuk)>=90) {
			bonus2 bSkillAtk,MC_MAMMONITE,15;
		}
	]]
},
[1312] = {
	AegisName = "Orcish_Axe_C",
	Name = "Orcish Axe",
	Type = "IT_TYPE_WEAPON",
	Atk = 110,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddSize,Size_Small,70;
		bonus2 bAddSize,Size_Medium,70;
		bonus2 bAddSize,Size_Large,70;
	]]
},
[1313] = {
	AegisName = "Tourist_Axe",
	Name = "Traveler's Axe",
	Type = "IT_TYPE_WEAPON",
	Weight = 500,
	Atk = 77,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_1HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bStr,2; ]]
},
[1314] = {
	AegisName = "F_Tomahawk_C",
	Name = "Rental Tomahawk",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1315] = {
	AegisName = "F_Right_Epsilon_C",
	Name = "Right Epsilon",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 229,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bStr,10;
	]]
},
[1316] = {
	AegisName = "Adventure_Axe",
	Name = "Adventure Axe",
	Type = "IT_TYPE_WEAPON",
	Atk = 100,
	Range = 1,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_1HAXE",
},
[1317] = {
	AegisName = "Academy_Axe",
	Name = "Academy Axe",
	Type = "IT_TYPE_WEAPON",
	Weight = 1600,
	Atk = 130,
	Range = 1,
	Slots = 1,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_1HAXE",
},
[1318] = {
	AegisName = "Dofle_Axe",
	Name = "Deflation Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 1800,
	Atk = 180,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 105,
	Subtype = "WT_1HAXE",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1319] = {
	AegisName = "TE_Woe_Axe",
	Name = "TE WoE Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_1HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Freeze,1000;
	]]
},
[1323] = {
	AegisName = "Ru_Gold_Axe",
	Name = "Ru Gold Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1800,
	Atk = 180,
	Range = 1,
	Slots = 2,
	Job = {
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 120,
	Subtype = "WT_1HAXE",
	Script = [[
		bonus bStr,8;
		bonus bInt,8;
	]]
},

--== Two-Handed Axes =======================================
[1351] = {
	AegisName = "Battle_Axe",
	Name = "Battle Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 5400,
	Weight = 1500,
	Atk = 80,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_2HAXE",
},
[1352] = {
	AegisName = "Battle_Axe_",
	Name = "Battle Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 5400,
	Weight = 1500,
	Atk = 80,
	Range = 1,
	Slots = 4,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_2HAXE",
},
[1353] = {
	AegisName = "Battle_Axe__",
	Name = "Battle Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 5400,
	Weight = 1500,
	Atk = 80,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_2HAXE",
},
[1354] = {
	AegisName = "Hammer",
	Name = "Hammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 15500,
	Weight = 2000,
	Atk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_2HAXE",
},
[1355] = {
	AegisName = "Hammer_",
	Name = "Hammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 15500,
	Weight = 2000,
	Atk = 120,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_2HAXE",
},
[1356] = {
	AegisName = "Hammer__",
	Name = "Hammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 15500,
	Weight = 2000,
	Atk = 120,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_2HAXE",
},
[1357] = {
	AegisName = "Buster",
	Name = "Buster",
	Type = "IT_TYPE_WEAPON",
	Buy = 34000,
	Weight = 2200,
	Atk = 155,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_2HAXE",
},
[1358] = {
	AegisName = "Buster_",
	Name = "Buster",
	Type = "IT_TYPE_WEAPON",
	Buy = 34000,
	Weight = 2200,
	Atk = 155,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_2HAXE",
},
[1359] = {
	AegisName = "Buster__",
	Name = "Buster",
	Type = "IT_TYPE_WEAPON",
	Buy = 34000,
	Weight = 2200,
	Atk = 155,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_2HAXE",
},
[1360] = {
	AegisName = "Two_Handed_Axe",
	Name = "Two-handed Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 55000,
	Weight = 2500,
	Atk = 185,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_2HAXE",
},
[1361] = {
	AegisName = "Two_Handed_Axe_",
	Name = "Two-handed Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 55000,
	Weight = 2500,
	Atk = 185,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_2HAXE",
},
[1362] = {
	AegisName = "Two_Handed_Axe__",
	Name = "Two-handed Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 55000,
	Weight = 2500,
	Atk = 185,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_2HAXE",
},
[1363] = {
	AegisName = "Brood_Axe",
	Name = "Bloody Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 4000,
	Atk = 170,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bStr,10;
		bonus bSpeedRate,25;
	]]
},
[1364] = {
	AegisName = "Great_Axe",
	Name = "Great Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1800,
	Atk = 187,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus2 bAddSkillBlow,MC_MAMMONITE,5;
		bonus2 bAddEff,Eff_Stun,1500;
	]]
},
[1365] = {
	AegisName = "Sabbath",
	Name = "Sabbath",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2300,
	Atk = 120,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bWeaponComaRace,RC_Demon,50;
		bonus2 bCriticalAddRace,RC_Undead,50;
	]]
},
[1366] = {
	AegisName = "Right_Epsilon",
	Name = "Light Epsilon",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2300,
	Atk = 180,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		skill AL_HEAL,3;
		bonus2 bAddRace,RC_Demon,3;
	]]
},
[1367] = {
	AegisName = "Slaughter",
	Name = "Slaughter",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 120,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Earth;
		bonus bIgnoreDefRace,RC_Brute;
		bonus2 bWeaponComaRace,RC_Brute,40;
	]]
},
[1368] = {
	AegisName = "Tomahawk",
	Name = "Tomahawk",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 165,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		skill ITM_TOMAHAWK,1;
	]]
},
[1369] = {
	AegisName = "Guillotine",
	Name = "Guillotine",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3000,
	Atk = 215,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus2 bWeaponComaRace,RC_DemiPlayer,30;
		bonus2 bSPGainRaceAttack,RC_DemiPlayer,2;
		bonus2 bSPGainRace,RC_DemiPlayer,20;
	]]
},
[1370] = {
	AegisName = "Doom_Slayer",
	Name = "Doom Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 6000,
	Atk = 10,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAspdRate,-40;
		bonus bUseSPrate,100;
		if(readparam(bStr)>=95) {
			bonus bBaseAtk,340;
			bonus2 bAddEff,Eff_Stun,3000;
			bonus bBreakArmorRate,500;
		}
	]]
},
[1371] = {
	AegisName = "Doom_Slayer_",
	Name = "Doom Slayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 6000,
	Atk = 10,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAspdRate,-40;
		bonus bUseSPrate,100;
		if(readparam(bStr)>=95) {
			bonus bBaseAtk,340;
			bonus2 bAddEff,Eff_Stun,3000;
			bonus bBreakArmorRate,500;
		}
	]]
},
[1372] = {
	AegisName = "Right_Epsilon_C",
	Name = "Rental Light Epsilon",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 229,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Holy;
		skill AL_HEAL,3;
		bonus2 bAddRace,RC_Demon,3;
		bonus bStr,10;
		bonus bSpeedRate,25;
	]]
},
[1373] = {
	AegisName = "Brood_Axe_C",
	Name = "Refined Bloody Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 205,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,20;
		bonus bSpeedRate,25;
		bonus bAspdRate,5;
	]]
},
[1374] = {
	AegisName = "Tomahawk_C",
	Name = "Tomahawk",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Wind;
		skill ITM_TOMAHAWK,1;
	]]
},
[1375] = {
	AegisName = "Berdysz",
	Name = "Berdysz",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 200,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus2 bSubSize,Size_Medium,13;
		bonus2 bSubSize,Size_Large,15;
	]]
},
[1376] = {
	AegisName = "Heart_Breaker",
	Name = "Heart Breaker",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 175,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bCritical,20+getrefine();
		bonus bAspdRate,5;
		if((Class==Job_Whitesmith)||(Class==Job_Creator)||(Class==Job_Mechanic)||(Class==Job_Mechanic_T)||(Class==Job_Genetic)||(Class==Job_Genetic_T)) bonus3 bAutoSpell,BS_HAMMERFALL,3,30;
	]]
},
[1377] = {
	AegisName = "Hurricane_Fury",
	Name = "Hurricane Fury",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3500,
	Atk = 332,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus2 bSubSize,Size_Medium,10+getrefine();
		bonus bAspdRate,getrefine();
		bonus3 bAutoSpell,NPC_PULSESTRIKE,5,20;
	]]
},
[1378] = {
	AegisName = "Great_Axe_C",
	Name = "Refined Great Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 215,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,5;
		bonus bHit,20;
		bonus2 bAddSkillBlow,MC_MAMMONITE,5;
		bonus2 bAddEff,Eff_Stun,2000;
	]]
},
[1379] = {
	AegisName = "BF_Two_Handed_Axe1",
	Name = "Valorous Insane Battle Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,3;
		bonus2 bAddRace,RC_DemiPlayer,55;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1380] = {
	AegisName = "BF_Two_Handed_Axe2",
	Name = "Brave Insane Battle Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,3;
		bonus2 bAddRace,RC_DemiPlayer,55;
		autobonus "{ bonus bBreakArmorRate,10000; }",20,3000,BF_WEAPON,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
		bonus bUnbreakableWeapon,0;
	]]
},
[1381] = {
	AegisName = "N_Battle_Axe",
	Name = "Novice Battle Axe",
	Type = "IT_TYPE_WEAPON",
	Atk = 100,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 3,
	Refine = false,
	Subtype = "WT_2HAXE",
},
[1382] = {
	AegisName = "Krieger_Twohand_Axe1",
	Name = "Glorious Twohanded Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 220,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-3) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
			bonus3 bAutoSpell,NPC_CRITICALWOUND,1,50;
		}
		if(getrefine()>8) {
			bonus3 bAutoSpell,NPC_CRITICALWOUND,1,100;
			bonus4 bAutoSpellOnSkill,MC_MAMMONITE,NPC_CRITICALWOUND,2,200;
			bonus4 bAutoSpellOnSkill,WS_CARTTERMINATION,NPC_CRITICALWOUND,2,200;
		}
	]]
},
[1383] = {
	AegisName = "Holy_Celestial_Axe",
	Name = "Holy Celestial Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 200,
	Range = 1,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bVit,10;
		bonus2 bAddRace,RC_Undead,10;
		bonus3 bAutoSpell,AL_BLESSING,5,50;
	]]
},
[1384] = {
	AegisName = "Veteran_Axe",
	Name = "Veteran Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 3000,
	Atk = 250,
	Range = 1,
	Slots = 2,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_2HAXE",
	Script = [[
		if(getskilllv(BS_DAGGER)==3) {
			bonus bBaseAtk,10;
		}
		if(getskilllv(BS_SWORD)==3) {
			bonus bBaseAtk,10;
		}
		if(getskilllv(BS_TWOHANDSWORD)==3) {
			bonus bBaseAtk,10;
		}
		if(getskilllv(BS_KNUCKLE)==3) {
			bonus bBaseAtk,10;
		}
		if(getskilllv(BS_SPEAR)==3) {
			bonus bBaseAtk,10;
		}
		if(getskilllv(BS_AXE)==3) {
			bonus bBaseAtk,10;
		}
		if(getskilllv(BS_MACE)==3) {
			bonus bBaseAtk,10;
		}
		bonus bVit,2;
		bonus4 bAutoSpellOnSkill,BS_HAMMERFALL,SM_MAGNUM,3,500;
	]]
},
[1385] = {
	AegisName = "Bradium_Stonehammer",
	Name = "Bradium Stonehammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2700,
	Atk = 210,
	Range = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_2HAXE",
	Script = [[ bonus3 bAddEffOnSkill,BS_HAMMERFALL,Eff_Stun,500+(200*getrefine()); ]]
},
[1386] = {
	AegisName = "Doom_Slayer_I",
	Name = "Doom Slayer",
	Type = "IT_TYPE_WEAPON",
	Atk = 20,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAspdRate,-25;
		bonus bUseSPrate,100;
		if(readparam(bStr)>=95) {
			bonus bBaseAtk,400;
			bonus2 bAddEff,Eff_Stun,3000;
			bonus bBreakArmorRate,500;
		}
	]]
},
[1387] = {
	AegisName = "Giant_Axe",
	Name = "Giant Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 4000,
	Atk = 330,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus2 bSkillAtk,WS_CARTTERMINATION,15;
		if(readparam(bStr)>=95) {
			bonus bHit,10;
			bonus bAspdRate,3;
		}
	]]
},
[1388] = {
	AegisName = "Two_Handed_Axe_C",
	Name = "Two-Handed Axe",
	Type = "IT_TYPE_WEAPON",
	Atk = 220,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1389] = {
	AegisName = "E_Tomahawk_C",
	Name = "E Tomahawk C",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 200,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1390] = {
	AegisName = "E_Right_Epsilon_C",
	Name = "E Right Epsilon C",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 229,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bStr,10;
	]]
},
[1391] = {
	AegisName = "P_Two_Handed_Axe1",
	Name = "Eden Group Two Handed Axe I",
	Type = "IT_TYPE_WEAPON",
	Atk = 195,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1392] = {
	AegisName = "Ygnus_Stale",
	Name = "Ygnus Stale",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 1900,
	Atk = 250,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus bUnbreakableWeapon,0;
	]]
},
[1393] = {
	AegisName = "End_Sektura",
	Name = "End Sektura",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 1900,
	Atk = 250,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus4 bAddEff,Eff_Cold,300,ATF_SHORT,3000;
		bonus4 bAddEff,Eff_Cold,100,ATF_SELF,3000;
		bonus bUnbreakableWeapon,0;
	]]
},
[1394] = {
	AegisName = "Upg_Two_Handed_Axe",
	Name = "Upgrade Two-Handed Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 110,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bBaseAtk,(getrefine()*14);
		if(BaseLevel>70) { bonus bBaseAtk,(((BaseLevel-70)/10)*10); }
	]]
},
[1395] = {
	AegisName = "Velum_Buster",
	Name = "Vellum Buster",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 50,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bUnbreakableWeapon, 1;
		bonus3 bSPVanishRate, 1000, 10, BF_NORMAL;
	]]
},
[1396] = {
	AegisName = "Velum_Guillotine",
	Name = "Vellum Guillotine",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 5500,
	Atk = 300,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_2HAXE",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddRace,RC_Player,40;
		bonus2 bIgnoreDefRate,RC_Player,30;
		if(getrefine()>=6) {
			bonus2 bSkillAtk,NC_AXEBOOMERANG,80;
			bonus2 bSkillAtk,NC_POWERSWING,80;
		}
		if(getrefine()>=9) {
			bonus2 bAddRace,RC_Player,60;
		}
	]]
},
[1397] = {
	AegisName = "Bradium_Stonehammer_",
	Name = "Bradium Stone Hammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2700,
	Atk = 210,
	Range = 1,
	Slots = 2,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_2HAXE",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1398] = {
	AegisName = "Metal_Two_Handed_Axe",
	Name = "Metal Two-Handed Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 105,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bBaseAtk,(getrefine()*7);
		.@val = min(BaseLevel/10, 12);
		if (.@val > 2) { bonus bBaseAtk,((.@val-2)*5); }
	]]
},
[1399] = {
	AegisName = "TE_Woe_Two_Handed_Axe",
	Name = "TE WoE Two-Handed Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 150,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_2HAXE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Stun,1000;
	]]
},

--== One-Handed Spears =====================================
[1400] = {
	AegisName = "Spear_of_Vicious_Mind",
	Name = "Spear of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 140,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
	]]
},
[1401] = {
	AegisName = "Javelin",
	Name = "Javelin",
	Type = "IT_TYPE_WEAPON",
	Buy = 150,
	Weight = 700,
	Atk = 28,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1402] = {
	AegisName = "Javelin_",
	Name = "Javelin",
	Type = "IT_TYPE_WEAPON",
	Buy = 150,
	Weight = 700,
	Atk = 28,
	Range = 3,
	Slots = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1403] = {
	AegisName = "Javelin__",
	Name = "Javelin",
	Type = "IT_TYPE_WEAPON",
	Buy = 150,
	Weight = 700,
	Atk = 28,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1404] = {
	AegisName = "Spear",
	Name = "Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 1700,
	Weight = 850,
	Atk = 44,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1405] = {
	AegisName = "Spear_",
	Name = "Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 1700,
	Weight = 850,
	Atk = 44,
	Range = 3,
	Slots = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1406] = {
	AegisName = "Spear__",
	Name = "Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 1700,
	Weight = 850,
	Atk = 44,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1407] = {
	AegisName = "Pike",
	Name = "Pike",
	Type = "IT_TYPE_WEAPON",
	Buy = 3450,
	Weight = 1000,
	Atk = 60,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1408] = {
	AegisName = "Pike_",
	Name = "Pike",
	Type = "IT_TYPE_WEAPON",
	Buy = 3450,
	Weight = 1000,
	Atk = 60,
	Range = 3,
	Slots = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1409] = {
	AegisName = "Pike__",
	Name = "Pike",
	Type = "IT_TYPE_WEAPON",
	Buy = 3450,
	Weight = 1000,
	Atk = 60,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
},
[1410] = {
	AegisName = "Lance",
	Name = "Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2500,
	Atk = 185,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1411] = {
	AegisName = "Lance_",
	Name = "Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2500,
	Atk = 185,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1412] = {
	AegisName = "Lance__",
	Name = "Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2500,
	Atk = 185,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1413] = {
	AegisName = "Gungnir",
	Name = "Gungnir",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 120,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bPerfectHitRate,25;
		bonus bHit,30;
	]]
},
[1414] = {
	AegisName = "Gelerdria",
	Name = "Gelerdria",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 145,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Earth;
		bonus bMaxHP,800;
		bonus bMaxSP,-50;
	]]
},
[1415] = {
	AegisName = "Skewer",
	Name = "Brocca",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 850,
	Atk = 100,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bIgnoreDefRace,RC_NonBoss;
		bonus2 bAddEle,Ele_Neutral,25;
	]]
},
[1416] = {
	AegisName = "Tjungkuletti",
	Name = "Tjungkuletti",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bSPDrainValue,1;
		bonus bSPGainValue,5;
	]]
},
[1417] = {
	AegisName = "Pole_Axe",
	Name = "Poll Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3800,
	Atk = 160,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 71,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bStr,1;
		bonus bInt,2;
		bonus bDex,1;
	]]
},
[1418] = {
	AegisName = "Gungnir_",
	Name = "Gungnir",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 120,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 4,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bPerfectHitRate,25;
		bonus bHit,30;
	]]
},
[1419] = {
	AegisName = "Pole_Axe_C",
	Name = "Poll Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Weight = 4800,
	Atk = 195,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		bonus bInt,2;
		bonus bDex,1;
	]]
},
[1420] = {
	AegisName = "Long_Horn",
	Name = "Long Horn",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 150,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus2 bAddEff,Eff_Bleeding,500;
		skill TF_DETOXIFY,1;
		bonus bUnbreakableWeapon,0;
	]]
},
[1421] = {
	AegisName = "Battle_Hook",
	Name = "Battle Hook",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 140,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus2 bAddEff,Eff_Stun,500;
		bonus2 bAddRace,RC_DemiPlayer,20;
		skill KN_PIERCE,3;
	]]
},
[1422] = {
	AegisName = "Hunting_Spear",
	Name = "Hunting Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 4200,
	Atk = 180,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bIgnoreDefRace,RC_Brute;
		bonus3 bAddMonsterDropItem,517,RC_Brute,1000;
		bonus3 bAutoSpell,LK_JOINTBEAT,3,100;
	]]
},
[1423] = {
	AegisName = "Pole_XO",
	Name = "Pole XO",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1424] = {
	AegisName = "Skewer_C",
	Name = "Refined Brocca",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 149,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bIgnoreDefRace,RC_NonBoss;
		bonus2 bAddSize,Size_Medium,20;
	]]
},
[1425] = {
	AegisName = "BF_Spear1",
	Name = "Assaulter Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 60,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(BaseJob==Job_Crusader) bonus bAspdRate,20;
	]]
},
[1426] = {
	AegisName = "Krieger_Onehand_Spear1",
	Name = "Glorious Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 130,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
			bonus bAspdRate,10;
		}
		if(getrefine()>8) {
			if(BaseJob==Job_Knight) bonus4 bAutoSpellOnSkill,KN_PIERCE,NPC_CRITICALWOUND,2,200;
			else if(BaseJob==Job_Crusader) bonus3 bAutoSpell,PA_PRESSURE,5,100;
		}
	]]
},
[1427] = {
	AegisName = "Spear_Of_Excellent",
	Name = "Spear Of Excellent",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 160,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSkillAtk,SM_MAGNUM,25;
		bonus bStr,2;
	]]
},
[1428] = {
	AegisName = "Long_Horn_M",
	Name = "Long Horn",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 150,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus2 bAddEff,Eff_Bleeding,500;
		skill TF_DETOXIFY,1;
		bonus bUnbreakableWeapon,0;
	]]
},
[1429] = {
	AegisName = "Hunting_Spear_M",
	Name = "Hunting Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 4200,
	Atk = 180,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bIgnoreDefRace,RC_Brute;
		bonus3 bAddMonsterDropItem,517,RC_Brute,1000;
		bonus3 bAutoSpell,LK_JOINTBEAT,3,500;
	]]
},
[1430] = {
	AegisName = "Pike_C",
	Name = "Pike",
	Type = "IT_TYPE_WEAPON",
	Atk = 74,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,70;
		bonus2 bAddSize,Size_Medium,70;
		bonus2 bAddSize,Size_Large,70;
	]]
},
[1431] = {
	AegisName = "F_Pole_Axe_C",
	Name = "Rental Pole Axe",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Weight = 4800,
	Atk = 195,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bStr,1;
		bonus bInt,2;
		bonus bDex,1;
	]]
},
[1432] = {
	AegisName = "E_Pole_Axe_C",
	Name = "E Pole Axe C",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Weight = 4800,
	Atk = 195,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bStr,1;
		bonus bInt,2;
		bonus bDex,1;
	]]
},
[1433] = {
	AegisName = "Imperial_Spear",
	Name = "Imperial Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1800,
	Atk = 180,
	Matk = 40,
	Range = 3,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 102,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus2 bSkillAtk,LG_CANNONSPEAR,20+getrefine()/2;
		bonus2 bSkillAtk,LG_BANISHINGPOINT,20+getrefine()/2;
	]]
},
[1434] = {
	AegisName = "P_Sphere1",
	Name = "Eden Group Spear I",
	Type = "IT_TYPE_WEAPON",
	Atk = 165,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1435] = {
	AegisName = "Cannon_Spear",
	Name = "Cannon Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 1600,
	Atk = 180,
	Range = 3,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bMaxSP,-100;
		bonus2 bSkillAtk,LG_CANNONSPEAR,10;
		bonus bBaseAtk,(getrefine()/3);
	]]
},
[1436] = {
	AegisName = "Velum_Spear",
	Name = "Vellum Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 850,
	Atk = 150,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus2 bAddRace,RC_Player,60;
		if(getrefine()>=6) {
			bonus2 bSkillAtk,RK_HUNDREDSPEAR,80;
			bonus2 bSkillAtk,LG_PINPOINTATTACK,80;
		}
		if(getrefine()>=9) {
			bonus2 bAddRace,RC_Player,30;
		}
	]]
},
[1437] = {
	AegisName = "TE_Woe_Pike",
	Name = "TE WoE Pike",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_1HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Curse,1000;
	]]
},
[1438] = {
	AegisName = "Thanos_Spear",
	Name = "Thanatos Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3000,
	Atk = 150,
	Matk = 100,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[1441] = {
	AegisName = "Ru_Blue_Spear",
	Name = "Ru Blue Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 200,
	Range = 3,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bStr,5;
		bonus bAgi,5;
	]]
},
[1443] = {
	AegisName = "Scarlet_Spear",
	Name = "Crimson Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 90,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_1HSPEAR",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bAtk,(((BaseLevel-70)/10)*5); }
	]]
},

--== Two-Handed Spears =====================================
[1450] = {
	AegisName = "Lance_of_Vicious_Mind",
	Name = "Lance of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2250,
	Atk = 225,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
	]]
},
[1451] = {
	AegisName = "Guisarme",
	Name = "Guisarme",
	Type = "IT_TYPE_WEAPON",
	Buy = 13000,
	Weight = 1000,
	Atk = 84,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1452] = {
	AegisName = "Guisarme_",
	Name = "Guisarme",
	Type = "IT_TYPE_WEAPON",
	Buy = 13000,
	Weight = 1000,
	Atk = 84,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1453] = {
	AegisName = "Guisarme__",
	Name = "Guisarme",
	Type = "IT_TYPE_WEAPON",
	Buy = 13000,
	Weight = 1000,
	Atk = 84,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1454] = {
	AegisName = "Glaive",
	Name = "Glaive",
	Type = "IT_TYPE_WEAPON",
	Buy = 20000,
	Weight = 1200,
	Atk = 104,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1455] = {
	AegisName = "Glaive_",
	Name = "Glaive",
	Type = "IT_TYPE_WEAPON",
	Buy = 20000,
	Weight = 1200,
	Atk = 104,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1456] = {
	AegisName = "Glaive__",
	Name = "Glaive",
	Type = "IT_TYPE_WEAPON",
	Buy = 20000,
	Weight = 1200,
	Atk = 104,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1457] = {
	AegisName = "Partizan",
	Name = "Partizan",
	Type = "IT_TYPE_WEAPON",
	Buy = 27000,
	Weight = 2000,
	Atk = 124,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1458] = {
	AegisName = "Partizan_",
	Name = "Partizan",
	Type = "IT_TYPE_WEAPON",
	Buy = 27000,
	Weight = 2000,
	Atk = 124,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_2HSPEAR",
},
[1459] = {
	AegisName = "Partizan__",
	Name = "Partizan",
	Type = "IT_TYPE_WEAPON",
	Buy = 27000,
	Weight = 2000,
	Atk = 124,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1460] = {
	AegisName = "Trident",
	Name = "Trident",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 1200,
	Atk = 150,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1461] = {
	AegisName = "Trident_",
	Name = "Trident",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 1200,
	Atk = 150,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1462] = {
	AegisName = "Trident__",
	Name = "Trident",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 1200,
	Atk = 150,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1463] = {
	AegisName = "Halberd",
	Name = "Hallberd",
	Type = "IT_TYPE_WEAPON",
	Buy = 54000,
	Weight = 2500,
	Atk = 165,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1464] = {
	AegisName = "Halberd_",
	Name = "Hallberd",
	Type = "IT_TYPE_WEAPON",
	Buy = 54000,
	Weight = 2500,
	Atk = 165,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1465] = {
	AegisName = "Halberd__",
	Name = "Hallberd",
	Type = "IT_TYPE_WEAPON",
	Buy = 54000,
	Weight = 2500,
	Atk = 165,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_2HSPEAR",
},
[1466] = {
	AegisName = "Crescent_Scythe",
	Name = "Crescent Scythe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 180,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bCritical,30;
		bonus bHit,10;
	]]
},
[1467] = {
	AegisName = "Bill_Guisarme",
	Name = "Bill Guisarme",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 183,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus2 bAddRace,RC_Brute,10;
		bonus2 bAddRace,RC_DemiPlayer,5;
	]]
},
[1468] = {
	AegisName = "Zephyrus",
	Name = "Zephyrus",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 170,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus2 bAddEff,Eff_Silence,200;
		bonus3 bAutoSpell,MG_THUNDERSTORM,3,100;
	]]
},
[1469] = {
	AegisName = "Longinuss_Spear",
	Name = "Longinus's Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 180,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bAddRace,RC_DemiPlayer,10;
		bonus2 bAddRace,RC_Angel,10;
	]]
},
[1470] = {
	AegisName = "Brionac",
	Name = "Brionac",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3000,
	Atk = 190,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		skill AL_HEAL,5;
		bonus3 bAutoSpell,MG_SOULSTRIKE,3,100;
		bonus2 bAddRace,RC_Boss,5;
	]]
},
[1471] = {
	AegisName = "Hell_Fire",
	Name = "Hellfire",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3500,
	Atk = 200,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus3 bAutoSpell,MG_FIREBALL,3,100;
		bonus bStr,3;
	]]
},

--== Two-Handed Staves =====================================
[1472] = {
	AegisName = "Staff_Of_Soul",
	Name = "Soul Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 25,
	Matk = 200,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 73,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,5;
		bonus bAgi,2;
	]]
},
[1473] = {
	AegisName = "Wizardy_Staff",
	Name = "Wizardry Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2400,
	Atk = 120,
	Matk = 200,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 90,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,6;
		bonus bDex,2;
	]]
},

--== Two-Handed Spears =====================================
[1474] = {
	AegisName = "Gae_Bolg",
	Name = "Gae Bolg",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 160,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bIgnoreDefRace,RC_Dragon;
		bonus2 bAddRace,RC_Boss,10;
	]]
},
[1475] = {
	AegisName = "Horseback_Lance",
	Name = "Equestrian's Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3700,
	Atk = 200,
	Range = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_2HSPEAR",
},
[1476] = {
	AegisName = "Crescent_Scythe_",
	Name = "Crescent Scythe",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 180,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bCritical,30;
		bonus bHit,10;
	]]
},
[1477] = {
	AegisName = "Spectral_Spear",
	Name = "Spectral Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 170,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus2 bAddEle,Ele_Dark,20;
		bonus2 bAddRace,RC_Demon,20;
		bonus2 bAddRace,RC_Undead,20;
		bonus2 bSubEle,Ele_Dark,10;
		bonus2 bAddRaceTolerance,RC_Demon,10;
		bonus2 bAddRaceTolerance,RC_Undead,10;
		bonus3 bAddEff,Eff_Confusion,10000,ATF_SELF|ATF_SHORT;
		bonus bHPGainValue,50;
	]]
},
[1478] = {
	AegisName = "Ahlspiess",
	Name = "Ahlspiess",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 120,
	Range = 3,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bIgnoreDefRace, RC_All;
		bonus2 bAddRace,RC_DemiPlayer,10;
		bonus3 bAutoSpell,KN_PIERCE,5,30;
	]]
},
[1479] = {
	AegisName = "Spectral_Spear_",
	Name = "Spectral Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 170,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus2 bAddEle,Ele_Dark,20;
		bonus2 bAddRace,RC_Demon,20;
		bonus2 bAddRace,RC_Undead,20;
		bonus2 bSubEle,Ele_Dark,10;
		bonus2 bAddRaceTolerance,RC_Demon,10;
		bonus2 bAddRaceTolerance,RC_Undead,10;
		bonus3 bAddEff,Eff_Confusion,10000,ATF_SELF|ATF_SHORT;
		bonus bHPGainValue,50;
	]]
},
[1480] = {
	AegisName = "Gae_Bolg_",
	Name = "Gae Bolg",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 160,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bIgnoreDefRace,RC_Dragon;
		bonus2 bAddRace,RC_Boss,10;
	]]
},
[1481] = {
	AegisName = "Zephyrus_",
	Name = "Zephyrus",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 170,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus2 bAddEff,Eff_Silence,200;
		bonus3 bAutoSpell,MG_THUNDERSTORM,3,100;
	]]
},
[1482] = {
	AegisName = "BF_Lance1",
	Name = "Assaulter Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 160,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus2 bAddRace,RC_DemiPlayer,25;
		bonus bIgnoreDefRace,RC_DemiPlayer;
		bonus bUnbreakableWeapon,0;
	]]
},
[1483] = {
	AegisName = "Ivory_Lance",
	Name = "Ivory Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 160,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAgi,2;
		bonus bAspdRate,3;
		bonus2 bAddEff,Eff_Bleeding,300;
		bonus3 bAutoSpell,NPC_CRITICALWOUND,1,30;
		skill KN_SPEARSTAB,5;
	]]
},
[1484] = {
	AegisName = "Cardo",
	Name = "Cardo",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 5600,
	Atk = 150,
	Range = 3,
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAspdRate,-10;
		bonus bDef,getrefine()/2;
	]]
},
[1485] = {
	AegisName = "Battle_Fork",
	Name = "Battle Fork",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 112,
	Range = 3,
	Slots = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 50,
	Subtype = "WT_2HSPEAR",
},
[1486] = {
	AegisName = "Krieger_Twohand_Spear1",
	Name = "Glorious Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 220,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,70;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) {
			if(BaseJob==Job_Knight) bonus4 bAutoSpellOnSkill,KN_PIERCE,NPC_CRITICALWOUND,2,200;
			else if(BaseJob==Job_Crusader) bonus3 bAutoSpell,PA_PRESSURE,5,200;
		}
	]]
},
[1487] = {
	AegisName = "Lance_C",
	Name = "Lance",
	Type = "IT_TYPE_WEAPON",
	Atk = 220,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,50;
		bonus2 bAddSize,Size_Medium,50;
		bonus2 bAddSize,Size_Large,50;
	]]
},
[1488] = {
	AegisName = "Ahlspiess_C",
	Name = "Ahlspiess",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 135,
	Range = 3,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bIgnoreDefRace, RC_All;
		bonus2 bAddRace,RC_DemiPlayer,10;
		bonus3 bAutoSpell,KN_PIERCE,5,30;
	]]
},
[1489] = {
	AegisName = "Spearfish_",
	Name = "Marlin",
	Type = "IT_TYPE_WEAPON",
	Atk = 220,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 50,
	Refine = false,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus3 bAddEffOnSkill,KN_PIERCE,Eff_Bleeding,1000;
		bonus3 bAddEffOnSkill,LK_SPIRALPIERCE,Eff_Bleeding,1000;
		bonus2 bSkillAtk,LK_SPIRALPIERCE,100;
		bonus2 bSkillAtk,LG_INSPIRATION,50;
		--bonus4 bAddEff,Eff_FrosMisty,100,ATF_SHORT,3000; --Need to be Frost Misty
		if(BaseLevel>99) {
			bonus bBaseAtk,30;
		}
	]]
},
[1490] = {
	AegisName = "Giant_Lance",
	Name = "Giant Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 20000,
	Atk = 20,
	Range = 3,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 140,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAspd,-10;
		bonus2 bSkillCooldown,LK_SPIRALPIERCE,20000;
		if(readparam(bStr)>=120) {
			bonus bBaseAtk,300;
		}
	]],
	OnUnequipScript = [[ heal 0,-600; ]]
},
[1491] = {
	AegisName = "Upg_Lance",
	Name = "Upgrade Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 105,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bBaseAtk,(getrefine()*12);
		if(BaseLevel>70) { bonus bBaseAtk,(((BaseLevel-70)/10)*10); }
	]]
},
[1492] = {
	AegisName = "Velum_Glaive",
	Name = "Vellum Glaive",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 4500,
	Atk = 250,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus2 bAddRace,RC_Player,80;
		if(getrefine()>=6) {
			bonus2 bSkillAtk,LK_SPIRALPIERCE,100;
			bonus2 bSkillAtk,KN_SPEARBOOMERANG,50;
		}
		if(getrefine()>=9) {
			autobonus2 "{ bonus bShortWeaponDamageReturn,20; bonus bMagicDamageReturn,20; }",100,2000,BF_WEAPON|BF_MAGIC,"{ specialeffect(EF_REFLECTSHIELD, AREA, playerattached()); }";
		}
	]]
},
[1493] = {
	AegisName = "Metal_Lance",
	Name = "Metal Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bBaseAtk,(getrefine()*6);
		.@val = min(BaseLevel/10, 12);
		if (.@val > 2) { bonus bBaseAtk,((.@val-2)*5); }
	]]
},
[1494] = {
	AegisName = "Undine_Spear",
	Name = "Spear Of Odin",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 3800,
	Atk = 190,
	Range = 3,
	Slots = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 105,
	Subtype = "WT_2HSPEAR",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},
[1495] = {
	AegisName = "TE_Woe_Lance",
	Name = "TE WoE Lance",
	Type = "IT_TYPE_WEAPON",
	Atk = 150,
	Range = 3,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_2HSPEAR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Blind,1000;
	]]
},
[1496] = {
	AegisName = "Thanos_Long_Spear",
	Name = "Thanatos Long Spear",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3750,
	Atk = 250,
	Matk = 50,
	Range = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[1498] = {
	AegisName = "Scarlet_Lance",
	Name = "Crimson Lance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1750,
	Atk = 175,
	Range = 3,
	Slots = 2,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_2HSPEAR",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bAtk,(((BaseLevel-70)/10)*5); }
	]]
},

--== Maces =================================================
[1501] = {
	AegisName = "Club",
	Name = "Club",
	Type = "IT_TYPE_WEAPON",
	Buy = 120,
	Weight = 700,
	Atk = 23,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HMACE",
},
[1502] = {
	AegisName = "Club_",
	Name = "Club",
	Type = "IT_TYPE_WEAPON",
	Buy = 120,
	Weight = 700,
	Atk = 23,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HMACE",
},
[1503] = {
	AegisName = "Club__",
	Name = "Club",
	Type = "IT_TYPE_WEAPON",
	Buy = 120,
	Weight = 700,
	Atk = 23,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HMACE",
},
[1504] = {
	AegisName = "Mace",
	Name = "Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 1600,
	Weight = 800,
	Atk = 37,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HMACE",
},
[1505] = {
	AegisName = "Mace_",
	Name = "Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 1600,
	Weight = 800,
	Atk = 37,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HMACE",
},
[1506] = {
	AegisName = "Mace__",
	Name = "Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 1600,
	Weight = 800,
	Atk = 37,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_1HMACE",
},
[1507] = {
	AegisName = "Smasher",
	Name = "Smasher",
	Type = "IT_TYPE_WEAPON",
	Buy = 9000,
	Weight = 1000,
	Atk = 54,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1508] = {
	AegisName = "Smasher_",
	Name = "Smasher",
	Type = "IT_TYPE_WEAPON",
	Buy = 9000,
	Weight = 1000,
	Atk = 54,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1509] = {
	AegisName = "Smasher__",
	Name = "Smasher",
	Type = "IT_TYPE_WEAPON",
	Buy = 9000,
	Weight = 1000,
	Atk = 54,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1510] = {
	AegisName = "Flail",
	Name = "Flail",
	Type = "IT_TYPE_WEAPON",
	Buy = 16000,
	Weight = 900,
	Atk = 69,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1511] = {
	AegisName = "Flail_",
	Name = "Flail",
	Type = "IT_TYPE_WEAPON",
	Buy = 16000,
	Weight = 900,
	Atk = 69,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1512] = {
	AegisName = "Flail__",
	Name = "Flail",
	Type = "IT_TYPE_WEAPON",
	Buy = 16000,
	Weight = 900,
	Atk = 69,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1513] = {
	AegisName = "Morning_Star",
	Name = "Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 1500,
	Atk = 110,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
},
[1514] = {
	AegisName = "Morning_Star_",
	Name = "Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 1500,
	Atk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
},
[1515] = {
	AegisName = "Morning_Star__",
	Name = "Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 1500,
	Atk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
},
[1516] = {
	AegisName = "Sword_Mace",
	Name = "Sword Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 1200,
	Atk = 130,
	Range = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
},
[1517] = {
	AegisName = "Sword_Mace_",
	Name = "Sword Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 1200,
	Atk = 130,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
},
[1518] = {
	AegisName = "Sword_Mace__",
	Name = "Sword Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 50000,
	Weight = 1200,
	Atk = 130,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
},
[1519] = {
	AegisName = "Chain",
	Name = "Chain",
	Type = "IT_TYPE_WEAPON",
	Buy = 23000,
	Weight = 800,
	Atk = 84,
	Range = 1,
	Slots = 2,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1520] = {
	AegisName = "Chain_",
	Name = "Chain",
	Type = "IT_TYPE_WEAPON",
	Buy = 23000,
	Weight = 800,
	Atk = 84,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1521] = {
	AegisName = "Chain__",
	Name = "Chain",
	Type = "IT_TYPE_WEAPON",
	Buy = 23000,
	Weight = 800,
	Atk = 84,
	Range = 1,
	Slots = 3,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_1HMACE",
},
[1522] = {
	AegisName = "Stunner",
	Name = "Stunner",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2000,
	Atk = 140,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
	Script = [[ bonus2 bAddEff,Eff_Stun,1000; ]]
},
[1523] = {
	AegisName = "Spike",
	Name = "Spike",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 85,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bCritical,40;
		bonus bDefRate,-67;
		bonus bDef2Rate,-67;
	]]
},
[1524] = {
	AegisName = "Golden_Mace",
	Name = "Golden Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 110,
	Range = 1,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus2 bAddRace,RC_Undead,10;
		bonus bUnbreakableWeapon,0;
	]]
},
[1525] = {
	AegisName = "Long_Mace",
	Name = "Long Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 135,
	Range = 3,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[ bonus bLongAtkDef,10; ]]
},
[1526] = {
	AegisName = "Slash",
	Name = "Slash",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 145,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus2 bAddRace,RC_Undead,15;
		bonus2 bWeaponComaRace,RC_Undead,10;
		bonus2 bExpAddRace,RC_Undead,5;
	]]
},
[1527] = {
	AegisName = "Quadrille",
	Name = "Quadrille",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 165,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus2 bAddRace,RC_Undead,10;
		bonus2 bAddRace,RC_DemiPlayer,10;
		bonus2 bAddEle,Ele_Earth,10;
	]]
},
[1528] = {
	AegisName = "Grand_Cross",
	Name = "Grand Cross",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		skill PR_TURNUNDEAD,3;
		bonus3 bAutoSpell,PR_TURNUNDEAD,3,100;
		bonus2 bSPDrainValueRace,RC_Undead,1;
		bonus2 bSPGainRace,RC_Undead,3;
	]]
},
[1529] = {
	AegisName = "Iron_Driver",
	Name = "Iron Driver",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3000,
	Atk = 155,
	Range = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 78,
	Subtype = "WT_1HMACE",
},
[1530] = {
	AegisName = "Mjolnir",
	Name = "Mjolnir",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 6000,
	Atk = 350,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 95,
	Refine = false,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bDex,50;
		bonus bStr,20;
		bonus bAspdRate,10;
		bonus3 bAutoSpell,MG_THUNDERSTORM,10,100;
		autobonus "{ bonus bSplashRange,1; }",50,10000,BF_WEAPON,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
		bonus bUnbreakableWeapon,0;
	]]
},
[1531] = {
	AegisName = "Spanner",
	Name = "Wrench",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 115,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus2 bAddEff,Eff_Blind,100;
		bonus2 bAddEff,Eff_Stun,100;
		bonus2 bAddEff,Eff_Poison,100;
		bonus2 bAddEff,Eff_Freeze,100;
	]]
},
[1532] = {
	AegisName = "Stunner_",
	Name = "Stunner",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 2000,
	Atk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_1HMACE",
	Script = [[ bonus2 bAddEff,Eff_Stun,1000; ]]
},
[1533] = {
	AegisName = "Warrior_Balmung",
	Name = "Warrior's Balmung",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 170,
	Range = 1,
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAllStats,5; ]]
},
[1534] = {
	AegisName = "Spanner_C",
	Name = "Wrench",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 150,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddEff,Eff_Blind,100;
		bonus2 bAddEff,Eff_Stun,100;
		bonus2 bAddEff,Eff_Poison,100;
		bonus2 bAddEff,Eff_Freeze,100;
	]]
},
[1535] = {
	AegisName = "Hollgrehenn_Hammer",
	Name = "Hollgrehenn's Hammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 4444,
	Weight = 44,
	Atk = 4,
	Range = 1,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bBreakArmorRate,100;
		bonus bBreakWeaponRate,100;
		if(readparam(bStr)>=44) {
			bonus bBaseAtk,44;
		}
	]]
},
[1536] = {
	AegisName = "Good_Morning_Star",
	Name = "Good Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1537] = {
	AegisName = "Quadrille_C",
	Name = "Refined Quadrille",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 193,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,30;
		bonus2 bAddRace,RC_Demon,40;
		bonus2 bAddRace,RC_Undead,40;
	]]
},
[1538] = {
	AegisName = "Spike_",
	Name = "Spike",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 85,
	Range = 1,
	Slots = 2,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bCritical,40;
		bonus bDefRate,-67;
		bonus bDef2Rate,-67;
	]]
},
[1539] = {
	AegisName = "Golden_Mace_",
	Name = "Golden Mace",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus2 bAddRace,RC_Undead,10;
		bonus bUnbreakableWeapon,0;
	]]
},
[1540] = {
	AegisName = "Grand_Cross_",
	Name = "Grand Cross",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		skill PR_TURNUNDEAD,3;
		bonus3 bAutoSpell,PR_TURNUNDEAD,3,100;
		bonus2 bSPDrainValueRace,RC_Undead,1;
		bonus2 bSPGainRace,RC_Undead,3;
	]]
},
[1541] = {
	AegisName = "Nemesis",
	Name = "Nemesis",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 120,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus2 bAddRace,RC_Undead,10;
		bonus2 bAddRace,RC_Demon,10;
		bonus3 bAutoSpell,AL_CRUCIS,1+getrefine(),100;
		autobonus "{ bonus bBaseAtk,50; }",10,20000,BF_WEAPON,"{ specialeffect(EF_BLOODDRAIN, AREA, playerattached()); }";
	]]
},
[1542] = {
	AegisName = "BF_Morning_Star1",
	Name = "Valorous Battlefield Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 105,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		bonus bDex,1;
		bonus2 bAddRace,RC_DemiPlayer,75;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1543] = {
	AegisName = "BF_Morning_Star2",
	Name = "Brave Battlefield Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 105,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		bonus bDex,1;
		bonus2 bAddRace,RC_DemiPlayer,75;
		bonus bUnbreakableWeapon,0;
		autobonus "{ bonus2 bAddEff,Eff_Stun,5000; }",10,6000,BF_WEAPON,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
	]]
},
[1544] = {
	AegisName = "Lunakaligo",
	Name = "Lunakaligo",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 1,
	Slots = 3,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_1HMACE",
	Script = [[
		if(readparam(bStr)>=77) {
			bonus bAspdRate,4;
			bonus2 bAddEff,Eff_Stun,1500;
			bonus3 bAddMonsterDropItem,12065,RC_Plant,500;
			bonus3 bAddMonsterDropItem,12043,RC_Brute,500;
			bonus3 bAddMonsterDropItem,12069,RC_Fish,500;
		}
	]]
},
[1545] = {
	AegisName = "N_Mace",
	Name = "Novice Mace",
	Type = "IT_TYPE_WEAPON",
	Atk = 57,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Refine = false,
	Subtype = "WT_1HMACE",
},
[1546] = {
	AegisName = "Krieger_Onehand_Mace1",
	Name = "Glorious Morning Star",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 130,
	Range = 1,
	Job = {
		Novice = true,
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,75;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
			bonus bAspdRate,5;
		}
		if(getrefine()>8) {
			bonus2 bAddEff,Eff_Stun,2000;
			bonus bAspdRate,5;
		}
	]]
},
[1547] = {
	AegisName = "Mace_Of_Madness",
	Name = "Mace Of Madness",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 150,
	Range = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_1HMACE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSkillAtk,MC_CARTREVOLUTION,25;
		bonus bStr,2;
	]]
},
[1548] = {
	AegisName = "Veteran_Hammer",
	Name = "Veteran Hammer",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 1800,
	Atk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bHealPower,getskilllv(AL_DP);
		bonus bCritical,getskilllv(PR_MACEMASTERY)*2;
		bonus bInt,1;
		bonus bLuk,1;
	]]
},
[1549] = {
	AegisName = "Pilebuncker",
	Name = "Pile Bunker",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 3500,
	Atk = 450,
	Range = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 99,
	Subtype = "WT_1HMACE",
},

--== Books =================================================
[1550] = {
	AegisName = "Book",
	Name = "Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 30000,
	Weight = 600,
	Atk = 85,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_BOOK",
},
[1551] = {
	AegisName = "Bible",
	Name = "Bible",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 1000,
	Atk = 115,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bInt,2; ]]
},
[1552] = {
	AegisName = "Tablet",
	Name = "Tablet",
	Type = "IT_TYPE_WEAPON",
	Buy = 51000,
	Weight = 800,
	Atk = 125,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
},
[1553] = {
	AegisName = "Book_Of_Billows",
	Name = "Book of Billows",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},
[1554] = {
	AegisName = "Book_Of_Mother_Earth",
	Name = "Book of Mother Earth",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Earth; ]]
},
[1555] = {
	AegisName = "Book_Of_Blazing_Sun",
	Name = "Book of the Blazing Sun",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Fire; ]]
},
[1556] = {
	AegisName = "Book_Of_Gust_Of_Wind",
	Name = "Book of Gust of Wind",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1557] = {
	AegisName = "Book_Of_The_Apocalypse",
	Name = "Book of the Apocalypse",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 800,
	Atk = 120,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus2 bAddEle,Ele_Holy,5;
		bonus2 bAddEle,Ele_Water,7;
		bonus2 bAddEle,Ele_Earth,7;
		bonus2 bAddEle,Ele_Fire,7;
		bonus2 bAddEle,Ele_Wind,7;
	]]
},
[1558] = {
	AegisName = "Girls_Diary",
	Name = "Girl's Diary",
	Type = "IT_TYPE_WEAPON",
	Buy = 1500,
	Weight = 300,
	Atk = 60,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_BOOK",
	Script = [[ bonus2 bAddDamageClass,1188,150; ]]
},
[1559] = {
	AegisName = "Legacy_Of_Dragon",
	Name = "Legacy of Dragon",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 130,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bInt,3;
		bonus bIgnoreDefRace,RC_Dragon;
		bonus2 bSPGainRace,RC_Dragon,10;
	]]
},
[1560] = {
	AegisName = "Diary_Of_Great_Sage",
	Name = "Sage's Diary",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1100,
	Atk = 100,
	Matk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Subtype = "WT_BOOK",
	Script = [[
		if(readparam(bStr)>=50) { bonus bAspdRate,5; }
		if(readparam(bInt)>=70) { bonus bMatkRate,5; }
	]]
},
[1561] = {
	AegisName = "Hardback",
	Name = "Hardcover Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 55,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bStr,3;
		bonus bDex,2;
	]]
},
[1562] = {
	AegisName = "Bible_Of_Battlefield",
	Name = "Battlefield Textbook",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Refine = false,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bInt,3;
		bonus3 bAutoSpell,AL_BLESSING,3+(getskilllv(AL_BLESSING)>3)*(getskilllv(AL_BLESSING)-3),20;
	]]
},
[1563] = {
	AegisName = "Diary_Of_Great_Sage_C",
	Name = "Rental Sage's Diary",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 135,
	Matk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAspdRate,5; ]]
},
[1564] = {
	AegisName = "Encyclopedia",
	Name = "Encyclopedia",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 110,
	Matk = 100,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bInt,3;
		bonus bDex,2;
		bonus bCritical,20+((readparam(bLuk)*2)/10);
	]]
},
[1565] = {
	AegisName = "Death_Note",
	Name = "Ledger of Death",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 137,
	Matk = 100,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 85,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bStr,3;
		bonus bInt,3;
		bonus bLuk,-20;
		bonus2 bWeaponComaRace,RC_DemiPlayer,10;
		bonus bAspdRate,getrefine();
		if(BaseJob==Job_Sage) bonus3 bAutoSpell,NPC_HELLJUDGEMENT,5,20;
	]]
},
[1566] = {
	AegisName = "Diary_Of_Great_Basil",
	Name = "Diary Of Great Basil",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Matk = 125,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1567] = {
	AegisName = "Hardback_C",
	Name = "Refined Hardcover Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 168,
	Matk = 100,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,5;
		bonus bDex,2;
	]]
},
[1568] = {
	AegisName = "Book_Of_Billows_",
	Name = "Book of Billows",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},
[1569] = {
	AegisName = "Book_Of_Mother_Earth_",
	Name = "Book of Mother Earth",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Earth; ]]
},
[1570] = {
	AegisName = "Book_Of_Blazing_Sun_",
	Name = "Book of Blazing Sun",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Fire; ]]
},
[1571] = {
	AegisName = "Book_Of_Gust_Of_Wind_",
	Name = "Book of Gust of Wind",
	Type = "IT_TYPE_WEAPON",
	Buy = 35000,
	Weight = 750,
	Atk = 90,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_BOOK",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1572] = {
	AegisName = "Principles_Of_Magic",
	Name = "Principles of Magic",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 60,
	Matk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bInt,3;
		bonus bSPrecovRate,5;
	]]
},
[1573] = {
	AegisName = "Ancient_Magic",
	Name = "Ancient Magic",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 30,
	Matk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_BOOK",
},
[1574] = {
	AegisName = "BF_Book1",
	Name = "Brave Battle Strategy Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 90,
	Matk = 125,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus bInt,1;
		bonus2 bAddRace,RC_DemiPlayer,75;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1575] = {
	AegisName = "BF_Book2",
	Name = "Valorous Battle Strategy Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 90,
	Matk = 125,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		bonus bInt,2;
		bonus2 bIgnoreMdefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
	]]
},
[1576] = {
	AegisName = "Krieger_Book1",
	Name = "Glorious Tablet",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 90,
	Matk = 115,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,80;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) autobonus "{ bonus bBaseAtk,200; }",30,3000,BF_WEAPON,"{ specialeffect(EF_BASH3D, AREA, playerattached()); }";
	]]
},
[1577] = {
	AegisName = "Krieger_Book2",
	Name = "Glorious Apocalypse",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 90,
	Matk = 115,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,80;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		if(getrefine()>8) {
			bonus bMatkRate,5;
			bonus bVariableCastrate,-5;
			bonus bDelayrate,-5;
		}
	]]
},
[1578] = {
	AegisName = "Book_Of_Prayer",
	Name = "Book Of Prayer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 140,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bVit,2;
		bonus bMdef,2;
		bonus bMaxSPrate,10;
	]]
},
[1579] = {
	AegisName = "Death_Note_M",
	Name = "Book of the Dead",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 137,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 85,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMatkRate,15;
		bonus bStr,3;
		bonus bInt,3;
		bonus bLuk,-20;
		bonus2 bWeaponComaRace,RC_DemiPlayer,10;
		bonus bAspdRate,getrefine();
		if(BaseJob==Job_Sage) bonus3 bAutoSpell,NPC_HELLJUDGEMENT,5,20;
	]]
},
[1580] = {
	AegisName = "Encyclopedia_C",
	Name = "Giant Encyclopedia",
	Type = "IT_TYPE_WEAPON",
	Atk = 145,
	Matk = 100,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,3;
		bonus bDex,2;
		bonus bCritical,20+((readparam(bLuk)*2)/10);
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1581] = {
	AegisName = "F_Diary_Of_Great_Sage_C",
	Name = "Diary Of Great Sage",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 135,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_BOOK",
},
[1582] = {
	AegisName = "E_Diary_Of_Great_Sage_C",
	Name = "E Diary Of Great Sage C",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 135,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_BOOK",
},
[1583] = {
	AegisName = "P_Dic1",
	Name = "Eden Group Dictionary I",
	Type = "IT_TYPE_WEAPON",
	Atk = 135,
	Matk = 110,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1584] = {
	AegisName = "Chilly_Spell_Book",
	Name = "Chilly Spell Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 1000,
	Atk = 100,
	Matk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Sage = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus bUnbreakableWeapon,0;
		bonus bDex,1;
		bonus2 bSkillAtk,MG_COLDBOLT,3*getrefine();
		bonus2 bSkillAtk,SO_DIAMONDDUST,3*getrefine();
		bonus2 bSkillUseSP,MG_COLDBOLT,-(5*getrefine());
		bonus2 bSkillUseSP,SO_DIAMONDDUST,-(5*getrefine());
	]]
},
[1585] = {
	AegisName = "Upg_Book",
	Name = "Upgrade Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 45,
	Matk = 20,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bBaseAtk,(getrefine()*10);
		bonus bMatk,(getrefine()*5);
		if(BaseLevel>70) { bonus bMatk,(((BaseLevel-70)/10)*5); }
	]]
},
[1586] = {
	AegisName = "Velum_Bible",
	Name = "Vellum Bible",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 110,
	Matk = 125,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_BOOK",
	Script = [[
		if(BaseLevel>104) {
			bonus bHealPower,(BaseLevel/5)-20;
		}
		if (getrefine()>=6) {
			bonus2 bSkillCooldown,AB_CLEARANCE,-10000;
			bonus2 bSkillCooldown,AB_LAUDARAMUS,-3000;
			bonus2 bSkillCooldown,AB_LAUDAAGNUS,-3000;
			bonus2 bSkillUseSP,AB_CLEARANCE,-60;
			bonus2 bSkillUseSP,AB_LAUDARAMUS,-60;
			bonus2 bSkillUseSP,AB_LAUDAAGNUS,-60;
		}
	]]
},
[1587] = {
	AegisName = "Velum_Encyclopedia",
	Name = "Vellum Encyclopedia",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 130,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_BOOK",
	Script = [[
		bonus2 bAddRace,RC_Player,80+getrefine();
		bonus2 bIgnoreDefRate,RC_Player,30;
		autobonus "{ bonus bBaseAtk,200; }",10,3000,BF_WEAPON,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
	]]
},
[1588] = {
	AegisName = "Metal_Book",
	Name = "Metal Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 45,
	Matk = 10,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bBaseAtk,(getrefine()*5);
		bonus bMatk,(getrefine()*2);
		.@val = min(BaseLevel/10, 12);
		if (.@val > 2) { bonus bBaseAtk,((.@val-2)*5); }
	]]
},
[1589] = {
	AegisName = "Legacy_Of_Dragon_",
	Name = "Legacy of Dragon",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 130,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bInt,3;
		bonus bIgnoreDefRace,RC_Dragon;
		bonus2 bSPGainRace,RC_Dragon,10;
	]]
},
[1590] = {
	AegisName = "Snake_Encyclopedia",
	Name = "Snake Encyclopedia",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 1500,
	Atk = 10,
	Matk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 105,
	Subtype = "WT_BOOK",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bAtk,getrefine()*3;
		bonus bMatk,getrefine()*3;
	]]
},
[1591] = {
	AegisName = "TE_Woe_Book",
	Name = "TE WoE Book",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bMagicAddRace,RC_Player,5;
		bonus bHealPower,5;
		bonus2 bAddEff,Eff_Blind,1000;
	]]
},
[1598] = {
	AegisName = "Snake_Encyclopedia_",
	Name = "Snake Encyclopedia",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 1500,
	Atk = 10,
	Matk = 110,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 105,
	Subtype = "WT_BOOK",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bAtk,getrefine()*3;
		bonus bMatk,getrefine()*3;
	]]
},

--== GM Weapon =============================================
[1599] = {
	AegisName = "Angra_Manyu",
	Name = "Angra manyu",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Weight = 10,
	Atk = 10000,
	Matk = 10000,
	Range = 2,
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bAllStats,50;
		bonus bBaseAtk,3300;
		bonus bMatkRate,200;
		bonus2 bHPDrainRate,1000,100;
		bonus2 bSPDrainRate,1000,20;
		bonus bHealPower,200;
		bonus2 bAddRace, RC_All, 100;
		skill WZ_STORMGUST,10;
		skill WZ_METEOR,10;
		skill WZ_VERMILION,10;
		skill GM_SANDMAN,1;
		bonus bVariableCastrate,-100;
		bonus bFixedCastrate,-100;
	]]
},

--== Staves ================================================
[1600] = {
	AegisName = "Rod_of_Vicious_Mind",
	Name = "Rod of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 60,
	Matk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,5;
		bonus bMatk,((min(getrefine(),15)) ** (2));
		bonus bUnbreakableWeapon,0;
	]]
},
[1601] = {
	AegisName = "Rod",
	Name = "Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 50,
	Weight = 400,
	Atk = 15,
	Matk = 30,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_STAFF",
},
[1602] = {
	AegisName = "Rod_",
	Name = "Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 50,
	Weight = 400,
	Atk = 15,
	Matk = 30,
	Range = 1,
	Slots = 4,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_STAFF",
},
[1603] = {
	AegisName = "Rod__",
	Name = "Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 50,
	Weight = 400,
	Atk = 15,
	Matk = 30,
	Range = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_STAFF",
},
[1604] = {
	AegisName = "Wand",
	Name = "Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 400,
	Atk = 25,
	Matk = 45,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
},
[1605] = {
	AegisName = "Wand_",
	Name = "Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 400,
	Atk = 25,
	Matk = 45,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
},
[1606] = {
	AegisName = "Wand__",
	Name = "Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 400,
	Atk = 25,
	Matk = 45,
	Range = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,1; ]]
},
[1607] = {
	AegisName = "Staff",
	Name = "Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 9500,
	Weight = 400,
	Atk = 40,
	Matk = 70,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,2; ]]
},
[1608] = {
	AegisName = "Staff_",
	Name = "Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 9500,
	Weight = 400,
	Atk = 40,
	Matk = 70,
	Range = 1,
	Slots = 3,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,2; ]]
},
[1609] = {
	AegisName = "Staff__",
	Name = "Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 9500,
	Weight = 400,
	Atk = 40,
	Matk = 70,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,2; ]]
},
[1610] = {
	AegisName = "Arc_Wand",
	Name = "Arc Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 400,
	Atk = 60,
	Matk = 95,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,3; ]]
},
[1611] = {
	AegisName = "Arc_Wand_",
	Name = "Arc Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 400,
	Atk = 60,
	Matk = 95,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,3; ]]
},
[1612] = {
	AegisName = "Arc_Wand__",
	Name = "Arc Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 45000,
	Weight = 400,
	Atk = 60,
	Matk = 95,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,3; ]]
},
[1613] = {
	AegisName = "Mighty_Staff",
	Name = "Mighty Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 130,
	Matk = 100,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bStr,10;
		bonus bSPDrainValue,-2;
	]]
},
[1614] = {
	AegisName = "Blessed_Wand",
	Name = "Wand of Occult",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 75,
	Matk = 105,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,3; ]]
},
[1615] = {
	AegisName = "Bone_Wand",
	Name = "Evil Bone Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 40,
	Matk = 110,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,4;
		bonus bAtkEle,Ele_Undead;
	]]
},
[1616] = {
	AegisName = "Staff_Of_Wing",
	Name = "Wing Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 60,
	Matk = 115,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bVariableCastrate,-5;
	]]
},
[1617] = {
	AegisName = "Survival_Rod",
	Name = "Survivor's Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 85000,
	Weight = 1000,
	Atk = 50,
	Matk = 120,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bDex,2;
		bonus bMaxHP,300;
	]]
},
[1618] = {
	AegisName = "Survival_Rod_",
	Name = "Survivor's Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 85000,
	Weight = 1000,
	Atk = 50,
	Matk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bDex,3;
		bonus bMaxHP,400;
	]]
},
[1619] = {
	AegisName = "Survival_Rod2",
	Name = "Survivor's Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 85000,
	Weight = 1000,
	Atk = 50,
	Matk = 120,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,2;
		bonus bMaxHP,300;
	]]
},
[1620] = {
	AegisName = "Survival_Rod2_",
	Name = "Survivor's Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 85000,
	Weight = 1000,
	Atk = 50,
	Matk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,3;
		bonus bMaxHP,400;
	]]
},
[1621] = {
	AegisName = "Hypnotists_Staff",
	Name = "Hypnotist's Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 43000,
	Weight = 500,
	Atk = 70,
	Matk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,1; ]]
},
[1622] = {
	AegisName = "Hypnotists_Staff_",
	Name = "Hypnotist's Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 70,
	Matk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,1; ]]
},
[1623] = {
	AegisName = "Mighty_Staff_C",
	Name = "Mighty Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 165,
	Matk = 120,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,10;
		bonus bInt,4;
		bonus bSPDrainValue,-1;
	]]
},
[1624] = {
	AegisName = "Lich_Bone_Wand",
	Name = "Lich's Bone Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 60,
	Matk = 170,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,1;
		bonus bDex,1;
		bonus bAtkEle,Ele_Undead;
		bonus3 bAutoSpellWhenHit,NPC_WIDECURSE,5,10+getrefine();
		if(getrefine()>=9) {
			bonus bMatkRate,3;
			bonus bMaxSP,300;
		}
	]]
},
[1625] = {
	AegisName = "Healing_Staff",
	Name = "Healing Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 10,
	Matk = 105,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bHealPower,(getrefine()*3/2);
	]]
},
[1626] = {
	AegisName = "Piercing_Staff",
	Name = "Piercing Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 80,
	Matk = 145,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,4;
		bonus bIgnoreMdefRate,10+getrefine();
	]]
},
[1627] = {
	AegisName = "Staffy",
	Name = "Staffy",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 40,
	Matk = 120,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,4;
		bonus2 bAddRace, RC_All, 50;
	]]
},
[1628] = {
	AegisName = "Survival_Rod_C",
	Name = "Refined Survivor's Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 71,
	Matk = 145,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,4;
		bonus bMatkRate,20;
		bonus bMaxHP,500;
	]]
},
[1629] = {
	AegisName = "Walking_Stick",
	Name = "Gentleman Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 40,
	Matk = 125,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 50,
	Subtype = "WT_STAFF",
	Script = [[ bonus bDex,1; ]]
},
[1630] = {
	AegisName = "Release_Of_Wish",
	Name = "Release of Wish",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 125,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,3;
		bonus bHealPower,5;
		autobonus "{ bonus2 bSPRegenRate,100,2000; bonus2 bHPRegenRate,50,2000; }",10,10000,BF_MAGIC,"{ specialeffect(EF_HEAL, AREA, playerattached()); }";
	]]
},
[1631] = {
	AegisName = "Holy_Stick",
	Name = "Holy Stick",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 50,
	Matk = 140,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus2 bVariableCastrate,AL_HOLYLIGHT,-25;
		bonus2 bVariableCastrate,PR_TURNUNDEAD,-25;
		bonus2 bVariableCastrate,PR_MAGNUS,-25;
	]]
},
[1632] = {
	AegisName = "BF_Staff1",
	Name = "Warlock's Magic Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 125,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,4;
		bonus bDex,3;
		bonus2 bIgnoreMdefRate,RC_DemiPlayer,25;
		bonus3 bAddEff,Eff_Stun,500,ATF_SKILL;
		bonus bUnbreakableWeapon,0;
	]]
},
[1633] = {
	AegisName = "BF_Staff2",
	Name = "Warlock's Battle Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 125,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,3;
		bonus bDex,3;
		bonus2 bMagicAddRace,RC_DemiPlayer,15;
		bonus3 bAddEff,Eff_Stun,500,ATF_SKILL;
		bonus bUnbreakableWeapon,0;
	]]
},
[1634] = {
	AegisName = "BF_Staff3",
	Name = "Strong Recovery Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 125,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bHealPower,14;
		bonus2 bSPRegenRate,5,10000;
		bonus bUnbreakableWeapon,0;
	]]
},
[1635] = {
	AegisName = "BF_Staff4",
	Name = "Speedy Recovery Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 125,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,3;
		bonus bDex,2;
		bonus bDelayrate,-15;
		bonus2 bSPRegenRate,5,10000;
		bonus bUnbreakableWeapon,0;
	]]
},
[1636] = {
	AegisName = "Thorn_Staff",
	Name = "Thorn Staff of Darkness",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 60,
	Matk = 160,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus bInt,3;
		bonus bDex,3;
		bonus bIgnoreMdefRate,getrefine();
		bonus bDelayrate,-(getrefine()*3/2);
	]]
},
[1637] = {
	AegisName = "Eraser",
	Name = "Eraser",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 80,
	Matk = 170,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,3;
		bonus bDex,2;
		bonus bSPrecovRate,8;
		if( getrefine() > 9 ) bonus5 bAutoSpell,NPC_WIDESOULDRAIN,3,5,BF_MAGIC,0;
		else bonus5 bAutoSpell,NPC_WIDESOULDRAIN,1,5,BF_MAGIC,0;
	]]
},
[1638] = {
	AegisName = "Healing_Staff_C",
	Name = "Staff Of Healing",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 10,
	Matk = 125,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bMatkRate,15;
		bonus bHealPower,(getrefine()*3/2);
	]]
},
[1639] = {
	AegisName = "N_Rod",
	Name = "Novice Rod",
	Type = "IT_TYPE_WEAPON",
	Atk = 15,
	Matk = 32,
	Range = 1,
	Slots = 3,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_STAFF",
},
[1640] = {
	AegisName = "Krieger_Onehand_Staff1",
	Name = "Glorious Arc Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 135,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bMagicAddRace,RC_DemiPlayer,15;
		bonus2 bIgnoreMdefRate,RC_DemiPlayer,25+((getrefine()>5)?5:0);
		bonus bUnbreakableWeapon,0;
		if(getrefine() > 8) {
			bonus bMatkRate,5;
			bonus bVariableCastrate,-5;
			bonus bDelayrate,-5;
		}
	]]
},
[1641] = {
	AegisName = "Krieger_Onehand_Staff2",
	Name = "Glorious Cure Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 135,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bHealPower,14;
		bonus bDelayrate,-10;
		bonus bUnbreakableWeapon,0;
		if(getrefine() > 5) {
			bonus2 bIgnoreMdefRate,RC_DemiPlayer,5;
			bonus bHealPower,5+(min(getrefine(),14)-5)*2;
		}
		if(getrefine() > 8) bonus5 bAutoSpellOnSkill,AL_HEAL,AL_HEAL,10,100,1;
		if(getrefine() > 9) {
			bonus bHealPower,10;
		}
	]]
},
[1642] = {
	AegisName = "Staff_Of_Darkness",
	Name = "Staff Of Darkness",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Matk = 120,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bVariableCastrate,-5;
		bonus bInt,2;
	]]
},
[1643] = {
	AegisName = "Dead_Tree_Cane",
	Name = "Dead Tree CaneStaff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 100,
	Atk = 100,
	Matk = 155,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,4;
		if (getrefine()>5) {
			bonus bInt,getrefine()-5;
			bonus bMaxHP,-200;
			bonus bMaxSP,-100;
		}
	]]
},
[1644] = {
	AegisName = "Piercing_Staff_M",
	Name = "Staff of Piercing",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 80,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMatkRate,15;
		bonus bInt,4;
		bonus bIgnoreMdefRate,10+getrefine();
	]]
},
[1645] = {
	AegisName = "Lich_Bone_Wand_M",
	Name = "Lich's Bone Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 60,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,1;
		bonus bDex,1;
		bonus bAtkEle,Ele_Undead;
		bonus bMatkRate,20;
		bonus3 bAutoSpellWhenHit,NPC_WIDECURSE,5,10+getrefine();
		if(getrefine()>=9) {
			bonus bMatkRate,3;
			bonus bMaxSP,300;
		}
	]]
},
[1646] = {
	AegisName = "Lacryma_Stick",
	Name = "La'cryma Stick",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 180,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,4;
		bonus bMdef,1;
		bonus bMdef,getrefine();
		bonus2 bSkillAtk,WZ_STORMGUST,getrefine();
		if (getrefine() > 9) bonus2 bVariableCastrate,WZ_STORMGUST,-8;
	]]
},
[1647] = {
	AegisName = "Croce_Staff",
	Name = "Croce Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 175,
	Range = 1,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bInt,4;
		bonus4 bAutoSpellOnSkill,AL_HEAL,AL_BLESSING,max(getskilllv(AL_BLESSING),1),20;
	]]
},
[1648] = {
	AegisName = "Staff_Of_Bordeaux",
	Name = "Staff Of Bordeaux",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 170,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 50,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,2;
		bonus bDex,1;
		if(getskilllv(SA_DRAGONOLOGY) == 5) {
			bonus bUseSPrate,-15;
			bonus bInt,3;
		}
	]]
},
[1649] = {
	AegisName = "Rafini_Staff",
	Name = "Laphine Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 180,
	Range = 1,
	Job = {
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_STAFF",
	Script = [[ bonus bFixedCastrate,-getrefine(); ]]
},
[1650] = {
	AegisName = "P_Staff1",
	Name = "Eden Staff I",
	Type = "IT_TYPE_WEAPON",
	Atk = 60,
	Matk = 125,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 26,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,2; ]]
},
[1651] = {
	AegisName = "P_Staff2",
	Name = "Eden Staff II",
	Type = "IT_TYPE_WEAPON",
	Atk = 60,
	Matk = 150,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,3; ]]
},
[1652] = {
	AegisName = "Tourist_Staff",
	Name = "Traveler's Staff",
	Type = "IT_TYPE_WEAPON",
	Weight = 500,
	Atk = 35,
	Range = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMatkRate,15;
		bonus bInt,2;
		bonus bAgi,1;
	]]
},
[1653] = {
	AegisName = "Staff_Of_Healing_C",
	Name = "Healing Of Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 10,
	Matk = 100,
	Range = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bMatk,100;
		bonus bHealPower,18;
	]]
},
[1654] = {
	AegisName = "Mental_Stick",
	Name = "Mental Stick",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 40,
	Matk = 170,
	Range = 1,
	Slots = 1,
	Job = {
		Sage = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 102,
	Subtype = "WT_STAFF",
	Script = [[
		if(getrefine()>5) {
			bonus2 bSkillAtk,SO_PSYCHIC_WAVE,(getrefine()-5)*2;
			bonus bMaxHPrate,-(getrefine()-5)*2;
		}
		bonus2 bSkillVariableCast,SO_PSYCHIC_WAVE,-3000;
		bonus2 bSkillUseSP,SO_PSYCHIC_WAVE,-60;
	]],
	OnUnequipScript = [[ itemheal 0,-100; ]]
},
[1655] = {
	AegisName = "Adventure_Staff",
	Name = "Adventure Staff",
	Type = "IT_TYPE_WEAPON",
	Atk = 60,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_STAFF",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1656] = {
	AegisName = "Academy_Wand",
	Name = "Academy Wand",
	Type = "IT_TYPE_WEAPON",
	Weight = 600,
	Atk = 60,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_STAFF",
	Script = [[ bonus bUnbreakableWeapon,0; ]]
},
[1657] = {
	AegisName = "Wand_Of_Affection",
	Name = "Wand Of Affection",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,2;
		bonus bAtkEle,Ele_Holy;
		bonus bHealPower,10;
	]]
},
[1658] = {
	AegisName = "P_Staff3",
	Name = "Eden Group Staff III",
	Type = "IT_TYPE_WEAPON",
	Atk = 60,
	Matk = 170,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,4; ]]
},
[1659] = {
	AegisName = "Recovery_Light",
	Name = "Light of Recovery",
	Type = "IT_TYPE_WEAPON",
	Buy = 56000,
	Weight = 400,
	Atk = 30,
	Matk = 160,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 110,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bUnbreakableWeapon,0;
		bonus bHealPower,(getrefine()*6);
		bonus2 bSkillUseSP,AL_HEAL,-(getrefine()*10);
		bonus2 bSkillUseSP,AB_CHEAL,-(getrefine()*12);
		bonus2 bSkillUseSP,AB_HIGHNESSHEAL,-(getrefine()*14);
	]]
},
[1660] = {
	AegisName = "Wand_Of_Affection2",
	Name = "Protection Staff II",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 180,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bInt,4;
		bonus bHealPower,20;
	]]
},
[1661] = {
	AegisName = "Mental_Destroyer",
	Name = "Mental Destroyer",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 100,
	Matk = 50,
	Range = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt, 10;
		bonus bUnbreakableWeapon, 0;
		bonus bUseSPrate, 100;
		bonus bMdef, 20;
		bonus3 bSPVanishRate, 1000, 5, BF_NORMAL | BF_SKILL;
		if (getrefine() >= 6) {
			bonus3 bSPVanishRate, 1000, 10, BF_NORMAL | BF_SKILL;
		}
	]]
},
[1662] = {
	AegisName = "Bone_Wand_",
	Name = "Evil Bone Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 40,
	Matk = 110,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,4;
		bonus bAtkEle,Ele_Undead;
	]]
},
[1663] = {
	AegisName = "Staff_Of_Bordeaux_",
	Name = "Staff Of Bordeaux",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 170,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 50,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,2;
		bonus bDex,1;
		if(getskilllv(SA_DRAGONOLOGY) == 5) {
			bonus bUseSPrate,-15;
			bonus bInt,3;
		}
	]]
},
[1664] = {
	AegisName = "Thorn_Staff_",
	Name = "Thorn Staff of Darkness",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 60,
	Matk = 160,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 75,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus bInt,3;
		bonus bDex,3;
		bonus bIgnoreMdefRate,getrefine();
		bonus bDelayrate,-(getrefine()*3/2);
	]]
},
[1665] = {
	AegisName = "Piercing_Staff_",
	Name = "Staff of Piercing",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 80,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bMatkRate,15;
		bonus bInt,4;
		bonus bIgnoreMdefRate,10+getrefine();
	]]
},
[1666] = {
	AegisName = "Healing_Staff_",
	Name = "Staff Of Healing",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 10,
	Matk = 125,
	Range = 1,
	Slots = 2,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bMatkRate,15;
		bonus bHealPower,(getrefine()*3/2);
	]]
},
[1667] = {
	AegisName = "TE_Woe_Staff",
	Name = "TE WoE Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Matk = 100,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_STAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bMagicAddRace,RC_Player,10;
		bonus bHealPower,5;
		bonus2 bAddEff,Eff_Blind,1000;
	]]
},
[1668] = {
	AegisName = "Sword_Stick",
	Name = "Sword Stick",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 120,
	Matk = 150,
	Range = 1,
	Slots = 2,
	Job = {
		Wizard = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_1HMACE",
	Script = [[
		bonus bAspdRate,10;
	]]
},
[1669] = {
	AegisName = "Thanos_Staff",
	Name = "Thanatos Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Matk = 200,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
		bonus bHealPower,15;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[1670] = {
	AegisName = "RWC_Memory_Staff",
	Name = "RWC Memory Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 25,
	Matk = 30,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bMatk,30*(getrefine()/3);
		if (getrefine()>=7) {
			.@val = 1;
			bonus4 bAutoSpell,HW_MAGICPOWER,1,10,0;
		}
		if (getrefine() >= 4) {
			bonus2 bMagicAddRace, RC_All, 5*(.@val+1);
		}
	]]
},
[1671] = {
	AegisName = "Staff_Of_Evil_Slayer",
	Name = "Evil Slayer Vanquisher Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 30,
	Matk = 155,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Subtype = "WT_STAFF",
	Script = [[
		bonus2 bAddRace,RC_Demon,10;
		bonus2 bAddRace,RC_Undead,10;
		bonus2 bMagicAddRace,RC_Demon,10;
		bonus2 bMagicAddRace,RC_Undead,10;
		if(getrefine()>=9){ bonus bMatkRate,5; }
		if(getrefine()>=12){ bonus bMatkRate,7; }
	]]
},
[1680] = {
	AegisName = "Scarlet_Rod",
	Name = "Crimson Rod",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 60,
	Matk = 70,
	Range = 1,
	Slots = 2,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt,5;
		bonus bMatk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bMatk,(((BaseLevel-70)/10)*5); }
	]]
},
[1681] = {
	AegisName = "Short_Foxtail_Staff",
	Name = "Short Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 30,
	Range = 1,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 1,
	Subtype = "WT_STAFF",
},
[1683] = {
	AegisName = "Enriched_Foxtail_Staff",
	Name = "Enriched Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 200,
	Atk = 50,
	Matk = 70,
	Range = 1,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
	Script = [[ bonus bMaxSP, 50; ]]
},
[1684] = {
	AegisName = "Long_Foxtail_Staff",
	Name = "Long Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 200,
	Atk = 50,
	Range = 2,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bLongAtkRate, 5;
		bonus bMaxHP, 200;
	]]
},
[1685] = {
	AegisName = "Dragonfly_Sitting_Foxtail_Staff",
	Name = "Dragonfly Sitting Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 70,
	Matk = 100,
	Range = 1,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 20,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bInt, 1;
		bonus bMaxHP, 100;
		bonus bMaxSP, 150;
	]]
},
[1686] = {
	AegisName = "Large_Foxtail_Staff",
	Name = "Large Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 70,
	Range = 1,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 20,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bLongAtkRate, 8;
		bonus bDex, 1;
		bonus bMaxHP, 200;
		bonus bMaxSP, 100;
	]]
},
[1687] = {
	AegisName = "Beginner_Foxtail_Staff",
	Name = "Beginner Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 100,
	Atk = 40,
	Matk = 15,
	Range = 1,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_STAFF",
	Script = [[ bonus bMaxHP, 100; ]]
},
[1690] = {
	AegisName = "Mysterious_Foxtail_Staff",
	Name = "Mysterious Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 80,
	Matk = 180,
	Range = 1,
	Slots = 3,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 60,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bMaxSP, 10 * (getrefine() / 3) + 50;
		bonus bMatk, 10 * (getrefine() / 3);
	]]
},
[1691] = {
	AegisName = "Strange_God_Foxtail_Staff",
	Name = "Strange God Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 100,
	Matk = 240,
	Range = 1,
	Slots = 2,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bMaxSP, 100;
		bonus bMatkRate, 2 * (getrefine() / 3);
		bonus bMaxSPrate, getrefine() / 3;
		if (getrefine() >= 7) {
			.@r = min(getrefine(), 10) - 7;
			bonus bWeaponAtkRate,(20 * .@r) + 40;
			bonus bWeaponMatkRate,(20 * .@r) + 40;
		}

	]]
},
[1692] = {
	AegisName = "Magical_Foxtail_Staff",
	Name = "Magical Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 120,
	Matk = 260,
	Range = 1,
	Slots = 2,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 140,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bMaxSP, 100;
		bonus bMatkRate, 2 * (getrefine() / 3);
		bonus bMaxSPrate, getrefine() / 3;
		if (getrefine() >= 7) {
			.@r = min(getrefine(), 10) - 7;
			bonus bWeaponAtkRate, (20 * .@r) + 40;
			bonus bWeaponMatkRate, (20 * .@r) + 40;
		}

	]]
},
[1693] = {
	AegisName = "Magical_Yellow_Foxtail_Staff",
	Name = "Magical Yellow Foxtail Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 140,
	Matk = 280,
	Range = 1,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 175,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bMatkRate, 3 * (getrefine() / 2);
		bonus4 bAutoSpellOnSkill, SU_FRESHSHRIMP, SU_ARCLOUSEDASH, max(1, getskilllv(SU_ARCLOUSEDASH)), 200;
		bonus4 bAutoSpellOnSkill, SU_SV_STEMSPEAR, SU_FRESHSHRIMP, max(1, getskilllv(SU_FRESHSHRIMP)), 200;
		if (getrefine() >= 7) {
			.@r = min(getrefine(), 10) - 7;
			bonus bWeaponAtkRate, (20 * .@r) + 40;
			bonus bWeaponMatkRate, (20 * .@r) + 40;
		}

	]]
},
[1694] = {
	AegisName = "Foxtail_Model",
	Name = "Foxtail Model",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 150,
	Range = 1,
	Slots = 3,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 60,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bLongAtkRate, 8;
		bonus bMaxHP, 100;
		bonus bDex, (getrefine() / 3) * 2;
		bonus bMaxSP, (getrefine() / 3) * 10;
	]]
},
[1695] = {
	AegisName = "Delicate_Foxtail_Model",
	Name = "Delicate Foxtail Model",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 195,
	Range = 1,
	Slots = 2,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bLongAtkRate, 8;
		bonus bMaxHP, 200;
		bonus bDex, (getrefine() / 3) * 3;
		bonus bMaxSP, (getrefine() / 3) * 15;
		if (getrefine() >= 7) {
			.@r = min(getrefine(), 10) - 7;
			bonus bWeaponAtkRate, (20 * .@r) + 40;
			bonus bWeaponMatkRate, (20 * .@r) + 40;
		}

	]]
},
[1696] = {
	AegisName = "Exquisite_Foxtail_Model",
	Name = "Exquisite Foxtail Model",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 240,
	Range = 1,
	Slots = 2,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 140,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bLongAtkRate, 8;
		bonus bMaxHPrate, 5;
		bonus bDex, (getrefine() / 2) * 3;
		bonus bMaxSP, (getrefine() / 2) * 15;
		if (getrefine() >= 7) {
			.@r = min(getrefine(), 10) - 7;
			bonus bWeaponAtkRate, (20 * .@r) + 40;
			bonus bWeaponMatkRate, (20 * .@r) + 40;
		}

	]]
},
[1697] = {
	AegisName = "Exquisite_Yellow_Foxtail_Model",
	Name = "Exquisite Yellow Foxtail Model",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 270,
	Range = 1,
	Slots = 1,
	Job = {
		Summoner = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 175,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bLongAtkRate, 9;
		bonus bMaxHPrate, 7;
		bonus bLongAtkRate, getrefine() / 2;
		bonus bMaxSP, (getrefine() / 2) * 20;
		bonus4 bAutoSpellOnSkill, SU_PICKYPECK, SU_FRESHSHRIMP, max(1, getskilllv(SU_FRESHSHRIMP)), 200;
		if (getrefine() >= 7) {
			.@r = min(getrefine(), 10) - 7;
			bonus bWeaponAtkRate, (20 * .@r) + 40;
			bonus bWeaponMatkRate, (20 * .@r) + 40;
		}

	]]
},
[1699] = {
	AegisName = "Paradise_Foxtail_Staff_I",
	Name = "Eden Group Foxtail I",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Matk = 135,
	Range = 1,
	Job = {
		Summoner = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 26,
	Refine = false,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bDex, 3;
		bonus bInt, 3;
		bonus bLongAtkRate, 5;
	]]
},

--== Bows ==================================================
[1701] = {
	AegisName = "Bow",
	Name = "Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 1000,
	Weight = 500,
	Atk = 15,
	Range = 5,
	Slots = 3,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_BOW",
},
[1702] = {
	AegisName = "Bow_",
	Name = "Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 1000,
	Weight = 500,
	Atk = 15,
	Range = 5,
	Slots = 4,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_BOW",
},
[1703] = {
	AegisName = "Bow__",
	Name = "Bow",
	Type = "IT_TYPE_WEAPON",
	Atk = 15,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddDamageClass,1002,500;
		bonus2 bAddDamageClass,1113,500;
		bonus2 bAddDamageClass,1031,500;
		bonus2 bAddDamageClass,1242,500;
	]]
},
[1704] = {
	AegisName = "Composite_Bow",
	Name = "Composite Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 600,
	Atk = 29,
	Range = 5,
	Slots = 3,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_BOW",
},
[1705] = {
	AegisName = "Composite_Bow_",
	Name = "Composite Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 600,
	Atk = 29,
	Range = 5,
	Slots = 4,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_BOW",
},
[1706] = {
	AegisName = "Composite_Bow__",
	Name = "Composite Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 600,
	Atk = 29,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Subtype = "WT_BOW",
},
[1707] = {
	AegisName = "Great_Bow",
	Name = "Great Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 1000,
	Atk = 50,
	Range = 5,
	Slots = 2,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_BOW",
},
[1708] = {
	AegisName = "Great_Bow_",
	Name = "Great Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 1000,
	Atk = 50,
	Range = 5,
	Slots = 3,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_BOW",
},
[1709] = {
	AegisName = "Great_Bow__",
	Name = "Great Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 10000,
	Weight = 1000,
	Atk = 50,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_BOW",
},
[1710] = {
	AegisName = "CrossBow",
	Name = "Cross Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 17000,
	Weight = 900,
	Atk = 65,
	Range = 5,
	Slots = 2,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_BOW",
},
[1711] = {
	AegisName = "CrossBow_",
	Name = "Cross Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 17000,
	Weight = 900,
	Atk = 65,
	Range = 5,
	Slots = 3,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_BOW",
},
[1712] = {
	AegisName = "CrossBow__",
	Name = "Cross Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 17000,
	Weight = 900,
	Atk = 65,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 18,
	Subtype = "WT_BOW",
},
[1713] = {
	AegisName = "Arbalest",
	Name = "Arbalest Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 48000,
	Weight = 1000,
	Atk = 90,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_BOW",
	Script = [[ bonus bDex,2; ]]
},
[1714] = {
	AegisName = "Kakkung",
	Name = "Gakkung Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 42000,
	Weight = 1100,
	Atk = 100,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_BOW",
},
[1715] = {
	AegisName = "Arbalest_",
	Name = "Arbalest Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 48000,
	Weight = 1000,
	Atk = 90,
	Range = 5,
	Slots = 2,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_BOW",
	Script = [[ bonus bDex,2; ]]
},
[1716] = {
	AegisName = "Kakkung_",
	Name = "Gakkung Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 42000,
	Weight = 1100,
	Atk = 100,
	Range = 5,
	Slots = 2,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_BOW",
},
[1718] = {
	AegisName = "Hunter_Bow",
	Name = "Hunter Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 64000,
	Weight = 1500,
	Atk = 125,
	Range = 5,
	Job = {
		Hunter = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_BOW",
},
[1719] = {
	AegisName = "Bow_Of_Roguemaster",
	Name = "Roguemaster's Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 75,
	Range = 11,
	Job = {
		Thief = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_BOW",
},
[1720] = {
	AegisName = "Bow_Of_Rudra",
	Name = "Rudra Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 150,
	Range = 5,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 48,
	Subtype = "WT_BOW",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bInt,5;
		skill AL_CURE,1;
		skill AL_HEAL,1;
		bonus2 bResEff,Eff_Poison,5000;
		bonus2 bResEff,Eff_Curse,5000;
		bonus2 bResEff,Eff_Silence,5000;
		bonus2 bResEff,Eff_Confusion,5000;
		bonus2 bResEff,Eff_Blind,5000;
	]]
},
[1721] = {
	AegisName = "Repeting_CrossBow",
	Name = "Repeating Crossbow",
	Type = "IT_TYPE_WEAPON",
	Buy = 89000,
	Weight = 2000,
	Atk = 95,
	Range = 9,
	Slots = 1,
	Job = {
		Thief = true,
		Hunter = true,
		Rogue = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 65,
	Subtype = "WT_BOW",
},
[1722] = {
	AegisName = "Balistar",
	Name = "Ballista",
	Type = "IT_TYPE_WEAPON",
	Buy = 124000,
	Weight = 3500,
	Atk = 145,
	Range = 5,
	Job = {
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 77,
	Subtype = "WT_BOW",
},
[1723] = {
	AegisName = "Luna_Bow",
	Name = "Luna Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 100,
	Range = 5,
	Slots = 2,
	Job = {
		Hunter = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_BOW",
	Script = [[ bonus bDef,2+3*(getrefine()>5)+2*(getrefine()>8); ]]
},
[1724] = {
	AegisName = "Dragon_Wing",
	Name = "Dragon Wing",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 100,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_BOW",
	Script = [[
		bonus3 bAddMonsterDropItem,1765,RC_Dragon,300;
		bonus bIgnoreDefRace,RC_Dragon;
	]]
},
[1725] = {
	AegisName = "Bow_Of_Minstrel",
	Name = "Minstrel Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1700,
	Atk = 120,
	Range = 5,
	Slots = 1,
	Job = {
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_BOW",
	Script = [[
		bonus bInt,2;
		bonus bSPrecovRate,10;
	]]
},
[1726] = {
	AegisName = "Hunter_Bow_",
	Name = "Hunter Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 64000,
	Weight = 1500,
	Atk = 125,
	Range = 5,
	Slots = 1,
	Job = {
		Hunter = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 33,
	Subtype = "WT_BOW",
},
[1727] = {
	AegisName = "Balistar_",
	Name = "Ballista",
	Type = "IT_TYPE_WEAPON",
	Buy = 124000,
	Weight = 3500,
	Atk = 145,
	Range = 5,
	Slots = 1,
	Job = {
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 77,
	Subtype = "WT_BOW",
},
[1728] = {
	AegisName = "Balistar_C",
	Name = "Ballista",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 194,
	Range = 5,
	Job = {
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bLongAtkRate,20; ]]
},
[1729] = {
	AegisName = "Bow_Of_Rudra_C",
	Name = "Rudra Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 2,
	Atk = 185,
	Range = 5,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bInt,5;
		skill AL_CURE,1;
		skill AL_HEAL,1;
	]]
},
[1730] = {
	AegisName = "Burning_Bow",
	Name = "Burning Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 95,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_BOW",
	Script = [[ bonus2 bSubEle,Ele_Fire,10; ]]
},
[1731] = {
	AegisName = "Frozen_Bow",
	Name = "Frozen Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 100,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_BOW",
	Script = [[ bonus2 bAddEff,Eff_Freeze,1000; ]]
},
[1732] = {
	AegisName = "Earth_Bow",
	Name = "Earth Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 105,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_BOW",
},
[1733] = {
	AegisName = "Gust_Bow",
	Name = "Gust Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 95,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 55,
	Subtype = "WT_BOW",
},
[1734] = {
	AegisName = "Orc_Archer_Bow",
	Name = "Orc Archer Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1600,
	Atk = 120,
	Range = 5,
	Job = {
		Archer = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 65,
	Subtype = "WT_BOW",
	Script = [[ bonus2 bAddMonsterDropItem,1753,200; ]]
},
[1735] = {
	AegisName = "Kkakkung",
	Name = "Kkakkung",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1736] = {
	AegisName = "Double_Bound",
	Name = "Double Bound",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 70,
	Range = 5,
	Slots = 3,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_BOW",
	Script = [[ bonus3 bAutoSpell,AC_DOUBLE,getskilllv(AC_DOUBLE),10; ]]
},
[1737] = {
	AegisName = "Ixion_Wing",
	Name = "Ixion Wings",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 135,
	Range = 5,
	Slots = 1,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_BOW",
	Script = [[
		autobonus "{ bonus bAspdRate,7; }",10+(getrefine()*2),7000,BF_WEAPON,"{ specialeffect(EF_HASTEUP, AREA, playerattached()); }";
		bonus2 bAddSkillBlow,AC_CHARGEARROW,3;
	]]
},
[1738] = {
	AegisName = "BF_Bow1",
	Name = "Valorous Battle CrossBow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus2 bAddRace,RC_DemiPlayer,55;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1739] = {
	AegisName = "BF_Bow2",
	Name = "Brave Battle CrossBow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus bInt,10;
		bonus2 bAddRace,RC_DemiPlayer,55;
		bonus bUnbreakableWeapon,0;
	]]
},
[1740] = {
	AegisName = "Nepenthes_Bow",
	Name = "Nepenthes Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 105,
	Range = 5,
	Slots = 2,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_BOW",
	Script = [[ bonus4 bAutoSpellOnSkill,AC_DOUBLE,AC_CHARGEARROW,1,20; ]]
},
[1741] = {
	AegisName = "Cursed_Lyre",
	Name = "Cursed Lyre",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1250,
	Atk = 125,
	Range = 5,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_BOW",
	Script = [[
		bonus bLuk,-2;
		bonus2 bAddEff,Eff_Curse,400;
	]]
},
[1742] = {
	AegisName = "N_Composite_Bow",
	Name = "Novice Composite Bow",
	Type = "IT_TYPE_WEAPON",
	Atk = 49,
	Range = 5,
	Slots = 3,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 4,
	Refine = false,
	Subtype = "WT_BOW",
},
[1743] = {
	AegisName = "Krieger_Bow1",
	Name = "Glorious Hunter Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,55;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bCritAtkRate,getrefine() * 2;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) bonus2 bSkillAtk,AC_DOUBLE,20;
	]]
},
[1744] = {
	AegisName = "Bow_Of_Evil",
	Name = "Bow Of Evil",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 170,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSkillAtk,AC_DOUBLE,25;
		bonus bDex,2;
	]]
},
[1745] = {
	AegisName = "Falken_Blitz",
	Name = "Falken Blitz",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Range = 5,
	Slots = 2,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_BOW",
	Script = [[
		bonus2 bSkillAtk,SN_SHARPSHOOTING,10;
		bonus2 bSkillAtk,AC_DOUBLE,10;
		bonus2 bSkillAtk,AC_CHARGEARROW,10;
	]]
},
[1746] = {
	AegisName = "Elven_Bow",
	Name = "Elven Bow",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 160,
	Range = 5,
	Slots = 1,
	Job = {
		Hunter = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_BOW",
	Script = [[ bonus bDex,2; ]]
},
[1747] = {
	AegisName = "P_Bow1",
	Name = "Eden Bow I",
	Type = "IT_TYPE_WEAPON",
	Atk = 82,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 26,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1748] = {
	AegisName = "P_Bow2",
	Name = "Eden Bow II",
	Type = "IT_TYPE_WEAPON",
	Atk = 120,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 2,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1749] = {
	AegisName = "Tourist_Bow",
	Name = "Traveler's Bow",
	Type = "IT_TYPE_WEAPON",
	Weight = 500,
	Atk = 40,
	Range = 5,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_BOW",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bDex,2;
	]]
},

--== Arrows ================================================
[1750] = {
	AegisName = "Arrow",
	Name = "Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 1,
	Weight = 1,
	Atk = 25,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
},
[1751] = {
	AegisName = "Silver_Arrow",
	Name = "Silver Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Holy; ]]
},
[1752] = {
	AegisName = "Fire_Arrow",
	Name = "Fire Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Fire; ]]
},
[1753] = {
	AegisName = "Steel_Arrow",
	Name = "Steel Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 4,
	Weight = 2,
	Atk = 40,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
},
[1754] = {
	AegisName = "Crystal_Arrow",
	Name = "Crystal Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},
[1755] = {
	AegisName = "Arrow_Of_Wind",
	Name = "Arrow of Wind",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1756] = {
	AegisName = "Stone_Arrow",
	Name = "Stone Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Earth; ]]
},
[1757] = {
	AegisName = "Immatrial_Arrow",
	Name = "Immaterial Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 1,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Ghost; ]]
},
[1758] = {
	AegisName = "Stun_Arrow",
	Name = "Stun Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus2 bAddEff,Eff_Stun,1000; ]]
},
[1759] = {
	AegisName = "Freezing_Arrow",
	Name = "Frozen Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus2 bAddEff,Eff_Freeze,1000;
	]]
},
[1760] = {
	AegisName = "Flash_Arrow",
	Name = "Flash Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus2 bAddEff,Eff_Blind,1000; ]]
},
[1761] = {
	AegisName = "Curse_Arrow",
	Name = "Cursed Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus2 bAddEff,Eff_Curse,1000; ]]
},
[1762] = {
	AegisName = "Rusty_Arrow",
	Name = "Rusty Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Poison; ]]
},
[1763] = {
	AegisName = "Poison_Arrow",
	Name = "Poison Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[
		bonus bAtkEle,Ele_Poison;
		bonus2 bAddEff,Eff_Poison,2000;
	]]
},
[1764] = {
	AegisName = "Incisive_Arrow",
	Name = "Sharp Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 20,
	Weight = 3,
	Atk = 10,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bCritical,20; ]]
},
[1765] = {
	AegisName = "Oridecon_Arrow",
	Name = "Oridecon Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 30,
	Weight = 3,
	Atk = 50,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
},
[1766] = {
	AegisName = "Arrow_Of_Counter_Evil",
	Name = "Arrow of Counter Evil",
	Type = "IT_TYPE_AMMO",
	Buy = 40,
	Weight = 3,
	Atk = 50,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Holy; ]]
},
[1767] = {
	AegisName = "Arrow_Of_Shadow",
	Name = "Arrow of Shadow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus bAtkEle,Ele_Dark; ]]
},
[1768] = {
	AegisName = "Sleep_Arrow",
	Name = "Sleep Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus2 bAddEff,Eff_Sleep,2000; ]]
},
[1769] = {
	AegisName = "Silence_Arrow",
	Name = "Mute Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 3,
	Atk = 1,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[ bonus2 bAddEff,Eff_Silence,1000; ]]
},
[1770] = {
	AegisName = "Iron_Arrow",
	Name = "Iron Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 2,
	Weight = 1,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
},
[1771] = {
	AegisName = "Venom_Knife",
	Name = "Venom Knife",
	Type = "IT_TYPE_AMMO",
	Buy = 50,
	Weight = 5,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_DAGGER",
},
[1772] = {
	AegisName = "Holy_Arrow",
	Name = "Holy Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 3,
	Weight = 2,
	Atk = 50,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus2 bAddRace,RC_Demon,5;
	]]
},
[1773] = {
	AegisName = "Arrow_Of_Elf",
	Name = "Elven Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 5,
	Weight = 1,
	Atk = 45,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	EquipLv = 100,
	Subtype = "AMMO_TYPE_ARROW",
},
[1774] = {
	AegisName = "Hunting_Arrow",
	Name = "Hunting Arrow",
	Type = "IT_TYPE_AMMO",
	Buy = 5,
	Weight = 1,
	Atk = 35,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	Subtype = "AMMO_TYPE_ARROW",
},
[1775] = {
	AegisName = "Siege_Arrow_S",
	Name = "WoE Arrow S",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 1,
	Atk = 45,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	EquipLv = 130,
	Subtype = "AMMO_TYPE_ARROW",
},
[1776] = {
	AegisName = "Siege_Arrow_A",
	Name = "WoE Arrow A",
	Type = "IT_TYPE_AMMO",
	Buy = 10,
	Weight = 1,
	Atk = 30,
	Job = {
		Archer = true,
		Thief = true,
		Hunter = true,
		Assassin = true,
		Rogue = true,
		Bard = true,
	},
	Loc = "EQP_AMMO",
	EquipLv = 95,
	Subtype = "AMMO_TYPE_ARROW",
},

--== Knuckles ==============================================
[1800] = {
	AegisName = "Fist_of_Vicious_Mind",
	Name = "Fist of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 150,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
	]]
},
[1801] = {
	AegisName = "Waghnakh",
	Name = "Waghnak",
	Type = "IT_TYPE_WEAPON",
	Buy = 8000,
	Weight = 400,
	Atk = 30,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_KNUCKLE",
},
[1802] = {
	AegisName = "Waghnakh_",
	Name = "Waghnak",
	Type = "IT_TYPE_WEAPON",
	Buy = 8000,
	Weight = 400,
	Atk = 30,
	Range = 1,
	Slots = 4,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Subtype = "WT_KNUCKLE",
},
[1803] = {
	AegisName = "Knuckle_Duster",
	Name = "Knuckle Dusters",
	Type = "IT_TYPE_WEAPON",
	Buy = 25000,
	Weight = 450,
	Atk = 50,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_KNUCKLE",
},
[1804] = {
	AegisName = "Knuckle_Duster_",
	Name = "Knuckle Dusters",
	Type = "IT_TYPE_WEAPON",
	Buy = 25000,
	Weight = 450,
	Atk = 50,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_KNUCKLE",
},
[1805] = {
	AegisName = "Hora",
	Name = "Studded Knuckles",
	Type = "IT_TYPE_WEAPON",
	Buy = 32000,
	Weight = 450,
	Atk = 65,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_KNUCKLE",
},
[1806] = {
	AegisName = "Hora_",
	Name = "Studded Knuckles",
	Type = "IT_TYPE_WEAPON",
	Buy = 32000,
	Weight = 450,
	Atk = 65,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 12,
	Subtype = "WT_KNUCKLE",
},
[1807] = {
	AegisName = "Fist",
	Name = "Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 53000,
	Weight = 650,
	Atk = 115,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_KNUCKLE",
},
[1808] = {
	AegisName = "Fist_",
	Name = "Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 53000,
	Weight = 650,
	Atk = 115,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_KNUCKLE",
},
[1809] = {
	AegisName = "Claw",
	Name = "Claw",
	Type = "IT_TYPE_WEAPON",
	Buy = 67000,
	Weight = 500,
	Atk = 86,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus bStr,2; ]]
},
[1810] = {
	AegisName = "Claw_",
	Name = "Claw",
	Type = "IT_TYPE_WEAPON",
	Buy = 67000,
	Weight = 500,
	Atk = 86,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus bStr,2; ]]
},
[1811] = {
	AegisName = "Finger",
	Name = "Finger",
	Type = "IT_TYPE_WEAPON",
	Buy = 58000,
	Weight = 500,
	Atk = 97,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_KNUCKLE",
},
[1812] = {
	AegisName = "Finger_",
	Name = "Finger",
	Type = "IT_TYPE_WEAPON",
	Buy = 58000,
	Weight = 500,
	Atk = 97,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 24,
	Subtype = "WT_KNUCKLE",
},
[1813] = {
	AegisName = "Kaiser_Knuckle",
	Name = "Kaiser Knuckle",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 450,
	Atk = 110,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus2 bAddRace,RC_Undead,5;
		bonus2 bAddEle,Ele_Water,10;
		bonus2 bAddEle,Ele_Earth,10;
		bonus2 bAddEle,Ele_Fire,10;
		bonus2 bAddEle,Ele_Wind,10;
	]]
},
[1814] = {
	AegisName = "Berserk",
	Name = "Berserk",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 120,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus bAspdRate,12; ]]
},
[1815] = {
	AegisName = "Claw_Of_Garm",
	Name = "Hatii Claw",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 550,
	Atk = 152,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus bAtkEle,Ele_Dark;
		bonus bMaxHPrate,-2;
		bonus2 bAddEff,Eff_Bleeding,200;
	]]
},
[1816] = {
	AegisName = "Berserk_",
	Name = "Berserk",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 36,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus bAspdRate,12; ]]
},
[1817] = {
	AegisName = "Kaiser_Knuckle_C",
	Name = "Kaiser Knuckle",
	Type = "IT_TYPE_WEAPON",
	Buy = 1,
	Atk = 159,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus2 bAddRace,RC_Undead,5;
		bonus2 bAddEle,Ele_Water,10;
		bonus2 bAddEle,Ele_Earth,10;
		bonus2 bAddEle,Ele_Fire,10;
		bonus2 bAddEle,Ele_Wind,10;
		bonus bAspdRate,5;
	]]
},
[1818] = {
	AegisName = "Magma_Fist",
	Name = "Magma Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 650,
	Atk = 80,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 75,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus3 bAutoSpell,SA_FLAMELAUNCHER,5,10; ]]
},
[1819] = {
	AegisName = "Icicle_Fist",
	Name = "Icicle Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 650,
	Atk = 80,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 75,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus3 bAutoSpell,SA_FROSTWEAPON,5,10; ]]
},
[1820] = {
	AegisName = "Electric_Fist",
	Name = "Electric Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 650,
	Atk = 80,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 75,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus3 bAutoSpell,SA_LIGHTNINGLOADER,5,10; ]]
},
[1821] = {
	AegisName = "Seismic_Fist",
	Name = "Seismic Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 650,
	Atk = 80,
	Range = 1,
	Slots = 3,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 75,
	Subtype = "WT_KNUCKLE",
	Script = [[ bonus3 bAutoSpell,SA_SEISMICWEAPON,5,10; ]]
},
[1822] = {
	AegisName = "Combo_Battle_Glove",
	Name = "Combo Battle Glove",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Range = 1,
	Slots = 4,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus2 bSkillAtk,MO_TRIPLEATTACK,15;
		bonus2 bSkillAtk,MO_CHAINCOMBO,15;
		bonus2 bSkillAtk,MO_COMBOFINISH,20;
	]]
},
[1823] = {
	AegisName = "BF_Knuckle1",
	Name = "Valorous Battle Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 30,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus bAgi,1;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus4 bAutoSpell,CH_SOULCOLLECT,1,5,0;
		bonus bUnbreakableWeapon,0;
	]]
},
[1824] = {
	AegisName = "BF_Knuckle2",
	Name = "Brave Battle Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 30,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus bInt,1;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bVariableCastrate,MO_EXTREMITYFIST,-25;
		autobonus "{ bonus2 bVariableCastrate,MO_EXTREMITYFIST,-100; }",50,6000,BF_WEAPON,"{ specialeffect(EF_SUFFRAGIUM, AREA, playerattached()); }";
		bonus bUnbreakableWeapon,0;
	]]
},
[1825] = {
	AegisName = "Horn_Of_Hilthrion",
	Name = "Horn of Hillslion",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 95,
	Range = 1,
	Slots = 3,
	Job = {
		Monk = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus3 bAutoSpell,NPC_CRITICALWOUND,1,100;
		bonus4 bAutoSpellOnSkill,CH_PALMSTRIKE,MO_INVESTIGATE,1,100;
		bonus3 bAutoSpell,MO_CALLSPIRITS,5,100;
	]]
},
[1826] = {
	AegisName = "Krieger_Knuckle1",
	Name = "Glorious Claw",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 30,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) {
			bonus3 bAutoSpell,MO_INVESTIGATE,5,(getrefine()*10-50);
			bonus3 bAutoSpell,AL_DECAGI,1,(getrefine()*10-50);
		}
	]]
},
[1827] = {
	AegisName = "Krieger_Knuckle2",
	Name = "Glorious Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 30,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) {
			bonus2 bVariableCastrate,MO_EXTREMITYFIST,-100;
			bonus4 bAutoSpellOnSkill,MO_EXPLOSIONSPIRITS,CH_SOULCOLLECT,1,1000;
		}
	]]
},
[1828] = {
	AegisName = "Monk_Knuckle",
	Name = "Monk Knuckle",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 150,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,2;
		bonus2 bSkillAtk,MO_FINGEROFFENSIVE,25;
	]]
},
[1829] = {
	AegisName = "Fist_C",
	Name = "Fist",
	Type = "IT_TYPE_WEAPON",
	Atk = 150,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1830] = {
	AegisName = "Sura_Rampage",
	Name = "Sura's Rampage",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 142,
	Range = 1,
	Slots = 1,
	Job = {
		Monk = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 102,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus2 bSkillAtk,SR_EARTHSHAKER,20;
		bonus2 bSkillAtk,SR_SKYNETBLOW,20;
		bonus bUseSPrate,5;
		if(getrefine()>6) {
			bonus bUseSPrate,-1*(getrefine()-6);
		}
	]]
},
[1831] = {
	AegisName = "P_Knuckle1",
	Name = "Eden Group Knuckle I",
	Type = "IT_TYPE_WEAPON",
	Atk = 120,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1832] = {
	AegisName = "Velum_Claw",
	Name = "Vellum Claw",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 650,
	Atk = 160,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus2 bAddRace,RC_Player,100;
		if(getrefine()>7) {
			bonus2 bAddRace,RC_Player,20;
		}
		if(getrefine()>9) {
			bonus2 bVariableCastrate,MO_EXTREMITYFIST,-100;
			bonus4 bAutoSpellOnSkill,MO_EXPLOSIONSPIRITS,CH_SOULCOLLECT,1,10000;
			bonus2 bHPLossRate,500,3000;
		}
	]]
},
[1833] = {
	AegisName = "Claw_Of_Flash",
	Name = "Claw of Flash",
	Type = "IT_TYPE_WEAPON",
	Buy = 60000,
	Weight = 400,
	Atk = 140,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 105,
	Subtype = "WT_KNUCKLE",
},
[1834] = {
	AegisName = "TE_Woe_Fist",
	Name = "TE WoE Fist",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 150,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_KNUCKLE",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Freeze,1000;
	]]
},
[1835] = {
	AegisName = "Spartacus",
	Name = "Spartacus",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 600,
	Atk = 100,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 50,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bAtkRate,getrefine();
		if(getrefine()>9) bonus bNoSizeFix,0;
	]]
},
[1836] = {
	AegisName = "Thanos_Knuckle",
	Name = "Thanatos Knuckles",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1600,
	Atk = 60,
	Matk = 100,
	Range = 1,
	Slots = 1,
	Job = {
		Monk = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[1839] = {
	AegisName = "Scarlet_Knuckle",
	Name = "Crimson Knuckle",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Range = 1,
	Slots = 2,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_KNUCKLE",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bAtk,(((BaseLevel-70)/10)*5); }
	]]
},

--== Instruments ===========================================
[1900] = {
	AegisName = "Violin_of_Vicious_Mind",
	Name = "Violin of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1300,
	Atk = 130,
	Matk = 50,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		bonus bMatk,((min(getrefine(),15)) ** (2))/2;
	]]
},
[1901] = {
	AegisName = "Violin",
	Name = "Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 4000,
	Weight = 700,
	Atk = 50,
	Range = 1,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_MUSICAL",
},
[1902] = {
	AegisName = "Violin_",
	Name = "Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 4000,
	Weight = 700,
	Atk = 50,
	Range = 1,
	Slots = 4,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 2,
	Subtype = "WT_MUSICAL",
},
[1903] = {
	AegisName = "Mandolin",
	Name = "Mandolin",
	Type = "IT_TYPE_WEAPON",
	Buy = 18000,
	Weight = 400,
	Atk = 90,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_MUSICAL",
},
[1904] = {
	AegisName = "Mandolin_",
	Name = "Mandolin",
	Type = "IT_TYPE_WEAPON",
	Buy = 18000,
	Weight = 400,
	Atk = 90,
	Range = 1,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_MUSICAL",
},
[1905] = {
	AegisName = "Lute",
	Name = "Lute",
	Type = "IT_TYPE_WEAPON",
	Buy = 24500,
	Weight = 500,
	Atk = 105,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_MUSICAL",
},
[1906] = {
	AegisName = "Lute_",
	Name = "Lute",
	Type = "IT_TYPE_WEAPON",
	Buy = 24500,
	Weight = 500,
	Atk = 105,
	Range = 1,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 14,
	Subtype = "WT_MUSICAL",
},
[1907] = {
	AegisName = "Guitar",
	Name = "Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 47000,
	Weight = 900,
	Atk = 142,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
},
[1908] = {
	AegisName = "Guitar_",
	Name = "Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 47000,
	Weight = 900,
	Atk = 142,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
},
[1909] = {
	AegisName = "Harp",
	Name = "Harp",
	Type = "IT_TYPE_WEAPON",
	Buy = 62000,
	Weight = 900,
	Atk = 114,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
	Script = [[ bonus bInt,2; ]]
},
[1910] = {
	AegisName = "Harp_",
	Name = "Harp",
	Type = "IT_TYPE_WEAPON",
	Buy = 62000,
	Weight = 900,
	Atk = 114,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
	Script = [[ bonus bInt,2; ]]
},
[1911] = {
	AegisName = "Guh_Moon_Goh",
	Name = "Gumoongoh",
	Type = "IT_TYPE_WEAPON",
	Buy = 54000,
	Weight = 1300,
	Atk = 126,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
},
[1912] = {
	AegisName = "Guh_Moon_Goh_",
	Name = "Gumoongoh",
	Type = "IT_TYPE_WEAPON",
	Buy = 54000,
	Weight = 1300,
	Atk = 126,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
},
[1913] = {
	AegisName = "Electronic_Guitar",
	Name = "Electric Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1800,
	Atk = 110,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_MUSICAL",
	Script = [[
		skill WZ_JUPITEL,1;
		bonus3 bAutoSpell,WZ_JUPITEL,1,100;
		bonus bAtkEle,Ele_Wind;
		bonus bInt,2;
		bonus bAgi,1;
		bonus bUnbreakableWeapon,0;
	]]
},
[1914] = {
	AegisName = "Guitar_Of_Passion",
	Name = "Burning Passion Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 110,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
	Script = [[ bonus bAtkEle,Ele_Fire; ]]
},
[1915] = {
	AegisName = "Guitar_Of_Blue_Solo",
	Name = "Loner's Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 110,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},
[1916] = {
	AegisName = "Guitar_Of_Vast_Land",
	Name = "Green Acre Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 110,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
	Script = [[ bonus bAtkEle,Ele_Earth; ]]
},
[1917] = {
	AegisName = "Guitar_Of_Gentle_Breeze",
	Name = "Gentle Breeze Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 110,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 27,
	Subtype = "WT_MUSICAL",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1918] = {
	AegisName = "Oriental_Lute",
	Name = "Oriental Lute",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 150,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus2 bSkillAtk,CG_ARROWVULCAN,10;
		bonus2 bSkillAtk,BA_MUSICALSTRIKE,10;
	]]
},
[1919] = {
	AegisName = "Base_Guitar",
	Name = "Base Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 130,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bSPGainValue,3;
		bonus4 bAutoSpellWhenHit,WZ_HEAVENDRIVE,3,30,1;
		bonus3 bAutoSpell,NPC_WIDECONFUSE,2,100;
	]]
},
[1920] = {
	AegisName = "Berserk_Guitar",
	Name = "Berserk Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1800,
	Atk = 10,
	Range = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bAspdRate,100;
		bonus bHPrecovRate,-100;
		bonus2 bHPLossRate,50,5000;
		bonus bDex,-readparam(bDex);
	]]
},
[1921] = {
	AegisName = "Guh_Moon_Gom",
	Name = "Gun Moon Gom",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1922] = {
	AegisName = "Oriental_Lute_",
	Name = "Oriental Lute",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 150,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus2 bSkillAtk,CG_ARROWVULCAN,10;
		bonus2 bSkillAtk,BA_MUSICALSTRIKE,10;
	]]
},
[1923] = {
	AegisName = "BF_Instrument1",
	Name = "Valorous Battlefield Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1924] = {
	AegisName = "BF_Instrument2",
	Name = "Brave Battlefield Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bSkillAtk,CG_ARROWVULCAN,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1925] = {
	AegisName = "Cello",
	Name = "Cello",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 1,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bAgi,2;
		bonus bDex,3;
		bonus2 bAddSkillBlow,BA_MUSICALSTRIKE,2;
		bonus2 bAddSkillBlow,CG_ARROWVULCAN,3;
	]]
},
[1926] = {
	AegisName = "Harp_Of_Nepenthes",
	Name = "Harp of Nepenthes",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bInt,2;
		if( getrefine()>9 ) {
			bonus3 bAddEffOnSkill,BA_MUSICALSTRIKE,Eff_Stun,2000;
		}
		else {
			bonus3 bAddEffOnSkill,BA_MUSICALSTRIKE,Eff_Stun,1000;
		}
	]]
},
[1927] = {
	AegisName = "Krieger_Instrument1",
	Name = "Glorious Guitar",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) bonus4 bAutoSpellOnSkill,CG_ARROWVULCAN,CG_TAROTCARD,5,100;
	]]
},
[1928] = {
	AegisName = "Berserk_Guitar_I",
	Name = "Spirited Guitar",
	Type = "IT_TYPE_WEAPON",
	Atk = 40,
	Range = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAspdRate,100;
		bonus bHPrecovRate,-100;
		bonus2 bHPLossRate,50,5000;
		bonus bDex,-readparam(bDex);
	]]
},
[1929] = {
	AegisName = "Guitar_C",
	Name = "Guitar",
	Type = "IT_TYPE_WEAPON",
	Atk = 177,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1930] = {
	AegisName = "Green_Whistle",
	Name = "Green Whistle",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 170,
	Matk = 50,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 102,
	Subtype = "WT_MUSICAL",
	Script = [[
		if(getrefine()>5) {
			bonus2 bSkillUseSP,MI_RUSH_WINDMILL,(getrefine()-5)*4;
			bonus2 bSkillUseSP,WM_LULLABY_DEEPSLEEP,(getrefine()-5)*4;
		}
		bonus2 bSkillVariableCast,MI_RUSH_WINDMILL,-2000;
		bonus2 bSkillVariableCast,WM_LULLABY_DEEPSLEEP,-2000;
	]]
},
[1931] = {
	AegisName = "P_String_Inst1",
	Name = "Eden Group Guitar I",
	Type = "IT_TYPE_WEAPON",
	Atk = 125,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Refine = false,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1932] = {
	AegisName = "TE_Woe_Guitar",
	Name = "TE WoE Guitar",
	Type = "IT_TYPE_WEAPON",
	Atk = 100,
	Range = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Poison,1000;
	]]
},
[1933] = {
	AegisName = "Thanos_Violin",
	Name = "Thanatos Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 200,
	Matk = 130,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[1934] = {
	AegisName = "Contabass",
	Name = "Double Bass",
	Type = "IT_TYPE_WEAPON",
	Buy = 124000,
	Weight = 250,
	Atk = 180,
	Matk = 120,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 130,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus2 bSkillCooldown,WM_RANDOMIZESPELL,-2000;
	]]
},
[1935] = {
	AegisName = "Ukulele_Of_Newoz",
	Name = "Oz's New Ukulele",
	Type = "IT_TYPE_WEAPON",
	Buy = 124000,
	Weight = 1000,
	Atk = 160,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus2 bSkillUseSP,MI_RUSH_WINDMILL,-20;
	]]
},
[1936] = {
	AegisName = "Ru_Blue_Violin",
	Name = "Blue Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 180,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bDex,5;
		bonus bVit,5;
	]]
},
[1937] = {
	AegisName = "Ru_Gold_Violin",
	Name = "Ru Gold Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 180,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 120,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bDex,8;
		bonus bVit,8;
	]]
},
[1938] = {
	AegisName = "Infinity_Violin",
	Name = "Infinity Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 150,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_MUSICAL",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1939] = {
	AegisName = "Scarlet_Viollin",
	Name = "Crimson Violin",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 80,
	Range = 1,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bAtk,(((BaseLevel-70)/10)*5); }
	]]
},
[1940] = {
	AegisName = "Conch_",
	Name = "Conch",
	Type = "IT_TYPE_WEAPON",
	Weight = 600,
	Atk = 120,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_MUSICAL",
	Script = [[
		bonus bInt, getrefine();
		bonus bDex, getrefine();
		if(getrefine() > 4) {
			bonus2 bSkillAtk, WM_REVERBERATION_MELEE, 10;
			bonus2 bSkillAtk, WM_REVERBERATION_MAGIC, 10;
			bonus2 bVariableCastrate, WM_REVERBERATION, -10;
		}
		if(getrefine() > 6) {
			bonus2 bSkillAtk, WM_REVERBERATION_MELEE, 10;
			bonus2 bSkillAtk, WM_REVERBERATION_MAGIC, 10;
			bonus2 bVariableCastrate, WM_REVERBERATION, -10;
		}
		if(getrefine() > 8) {
			bonus2 bSkillAtk, WM_REVERBERATION_MELEE, 20;
			bonus2 bSkillAtk, WM_REVERBERATION_MAGIC, 20;
			bonus2 bVariableCastrate, WM_REVERBERATION, -20;
		}
	]]
},

--== Whips =================================================
[1950] = {
	AegisName = "Rope",
	Name = "Rope",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 400,
	Atk = 45,
	Range = 2,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_WHIP",
},
[1951] = {
	AegisName = "Rope_",
	Name = "Rope",
	Type = "IT_TYPE_WEAPON",
	Buy = 2500,
	Weight = 400,
	Atk = 45,
	Range = 2,
	Slots = 4,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	EquipLv = 3,
	Subtype = "WT_WHIP",
},
[1952] = {
	AegisName = "Line",
	Name = "Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 12000,
	Weight = 300,
	Atk = 80,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_WHIP",
},
[1953] = {
	AegisName = "Line_",
	Name = "Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 12000,
	Weight = 300,
	Atk = 80,
	Range = 2,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_WHIP",
},
[1954] = {
	AegisName = "Wire",
	Name = "Wire Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 17500,
	Weight = 1000,
	Atk = 95,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_WHIP",
},
[1955] = {
	AegisName = "Wire_",
	Name = "Wire Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 17500,
	Weight = 1000,
	Atk = 95,
	Range = 2,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 2,
	EquipLv = 16,
	Subtype = "WT_WHIP",
},
[1956] = {
	AegisName = "Rante",
	Name = "Rante Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 32000,
	Weight = 900,
	Atk = 135,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
},
[1957] = {
	AegisName = "Rante_",
	Name = "Rante Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 32000,
	Weight = 900,
	Atk = 135,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
},
[1958] = {
	AegisName = "Tail",
	Name = "Tail Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 700,
	Atk = 105,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bLuk,3; ]]
},
[1959] = {
	AegisName = "Tail_",
	Name = "Tail Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 41000,
	Weight = 700,
	Atk = 105,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bLuk,3; ]]
},
[1960] = {
	AegisName = "Whip",
	Name = "Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 38000,
	Weight = 700,
	Atk = 120,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
},
[1961] = {
	AegisName = "Whip_",
	Name = "Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 38000,
	Weight = 700,
	Atk = 120,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
},
[1962] = {
	AegisName = "Lariat",
	Name = "Lariat Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 100,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bDex,5;
		bonus bAgi,1;
	]]
},
[1963] = {
	AegisName = "Rapture_Rose",
	Name = "Rapture Rose",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 300,
	Atk = 115,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bAtkEle,Ele_Poison;
		bonus2 bAddEff,Eff_Poison,5000;
	]]
},
[1964] = {
	AegisName = "Chemeti",
	Name = "Chemeti Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 135,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 44,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bCritical,5;
		bonus bFlee,10;
		bonus bFlee2,2;
	]]
},
[1965] = {
	AegisName = "Whip_Of_Red_Flame",
	Name = "Red Flame Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bAtkEle,Ele_Fire; ]]
},
[1966] = {
	AegisName = "Whip_Of_Ice_Piece",
	Name = "Icicle Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bAtkEle,Ele_Water; ]]
},
[1967] = {
	AegisName = "Whip_Of_Earth",
	Name = "Gaia Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bAtkEle,Ele_Earth; ]]
},
[1968] = {
	AegisName = "Jump_Rope",
	Name = "Skipping Rope",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 400,
	Atk = 120,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bCritical,20; ]]
},
[1969] = {
	AegisName = "Bladed_Whip",
	Name = "Blade Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1200,
	Atk = 140,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus2 bAddEff,Eff_Bleeding,300; ]]
},
[1970] = {
	AegisName = "Queens_Whip",
	Name = "Queen's Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1100,
	Atk = 150,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_WHIP",
	Script = [[
		bonus2 bSkillAtk,CG_ARROWVULCAN,10;
		bonus2 bSkillAtk,DC_THROWARROW,10;
	]]
},
[1971] = {
	AegisName = "Electric_Wire",
	Name = "Electric Wire",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 30,
	Subtype = "WT_WHIP",
	Script = [[ bonus bAtkEle,Ele_Wind; ]]
},
[1972] = {
	AegisName = "Electric_Eel",
	Name = "Electric Eel",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 100,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bInt,2;
		bonus bAgi,2;
		bonus3 bAutoSpell,WZ_JUPITEL,3,20;
		if(getrefine()>0) bonus3 bAutoSpell,CG_ARROWVULCAN,getrefine(),50;
	]]
},
[1973] = {
	AegisName = "Sea_Witch_Foot",
	Name = "Sea Witch's Foot",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 110,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bSPGainValue,5;
		bonus4 bAutoSpellWhenHit,WZ_FROSTNOVA,3,50,1;
		bonus3 bAutoSpell,NPC_WIDESILENCE,2,100;
	]]
},
[1974] = {
	AegisName = "Carrot_Whip",
	Name = "Carrot Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1300,
	Atk = 185,
	Range = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_WHIP",
	Script = [[ if(getrefine()>0) bonus3 bAutoSpell,AL_INCAGI,getrefine(),10; ]]
},
[1975] = {
	AegisName = "Queen_Is_Whip",
	Name = "Queen Is Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 120,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 1,
	Refine = false,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRace, RC_All, 50; ]]
},
[1976] = {
	AegisName = "Queens_Whip_",
	Name = "Queen's Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1100,
	Atk = 150,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 65,
	Subtype = "WT_WHIP",
	Script = [[
		bonus2 bSkillAtk,CG_ARROWVULCAN,10;
		bonus2 bSkillAtk,DC_THROWARROW,10;
	]]
},
[1977] = {
	AegisName = "BF_Whip1",
	Name = "Valorous Battle Lariat",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1978] = {
	AegisName = "BF_Whip2",
	Name = "Brave Battle Lariat",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 80,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bSkillAtk,CG_ARROWVULCAN,20;
		bonus bUnbreakableWeapon,0;
	]]
},
[1979] = {
	AegisName = "Stem_Of_Nepenthes",
	Name = "Stem of Nepenthes",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 120,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bInt,2;
		if( getrefine()>=9 ) {
			bonus3 bAddEffOnSkill,DC_THROWARROW,Eff_Freeze,2000;
		}
		else {
			bonus3 bAddEffOnSkill,DC_THROWARROW,Eff_Freeze,1000;
		}
	]]
},
[1980] = {
	AegisName = "Whip_Of_Balance",
	Name = "Whip of Balance",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 700,
	Atk = 110,
	Range = 2,
	Slots = 3,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bAgi,2;
		bonus bDex,3;
		bonus2 bAddSkillBlow,DC_THROWARROW,2;
		bonus2 bAddSkillBlow,CG_ARROWVULCAN,3;
	]]
},
[1981] = {
	AegisName = "Krieger_Whip1",
	Name = "Glorious Lariat",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,95;
		bonus2 bIgnoreDefRate,RC_DemiPlayer,20;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bAddRace,RC_DemiPlayer,((min(getrefine(),14)-4) ** (2));
			bonus2 bIgnoreDefRate,RC_DemiPlayer,5;
		}
		if(getrefine()>8) bonus4 bAutoSpellOnSkill,CG_ARROWVULCAN,CG_TAROTCARD,5,100;
	]]
},
[1982] = {
	AegisName = "Phenomena_Whip",
	Name = "Phenomena Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 160,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	Refine = false,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus2 bSkillAtk,DC_THROWARROW,25;
	]]
},
[1983] = {
	AegisName = "Rante_C",
	Name = "Rante Whip",
	Type = "IT_TYPE_WEAPON",
	Atk = 170,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	Refine = false,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddSize,Size_Small,40;
		bonus2 bAddSize,Size_Medium,40;
		bonus2 bAddSize,Size_Large,40;
	]]
},
[1984] = {
	AegisName = "Stem_Whip",
	Name = "Stem Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 170,
	Matk = 50,
	Range = 1,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 102,
	Subtype = "WT_WHIP",
	Script = [[
		if(getrefine()>5) {
			bonus2 bSkillUseSP,WA_SWING_DANCE,(getrefine()-5)*4;
			bonus2 bSkillUseSP,WM_LULLABY_DEEPSLEEP,(getrefine()-5)*4;
		}
		bonus2 bSkillVariableCast,WA_SWING_DANCE,-2000;
		bonus2 bSkillVariableCast,WM_LULLABY_DEEPSLEEP,-2000;
	]]
},
[1985] = {
	AegisName = "Rosebine",
	Name = "Rosevine",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Matk = 130,
	Range = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 110,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bInt,2;
		bonus bAgi,-2;
		bonus3 bAutoSpell,WM_VOICEOFSIREN,1,20;
	]]
},
[1986] = {
	AegisName = "P_Tail1",
	Name = "Eden Group Whip I",
	Type = "IT_TYPE_WEAPON",
	Atk = 125,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 60,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1987] = {
	AegisName = "TE_Woe_Rope",
	Name = "TE WoE Rope",
	Type = "IT_TYPE_WEAPON",
	Atk = 100,
	Range = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,40;
		bonus2 bAddEff,Eff_Blind,1000;
	]]
},
[1988] = {
	AegisName = "Thanos_Whip",
	Name = "Thanatos Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2200,
	Atk = 200,
	Matk = 130,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[1989] = {
	AegisName = "Gymnastics_Ribbon",
	Name = "Rhythmic Gymnastics Ribbon",
	Type = "IT_TYPE_WEAPON",
	Buy = 124000,
	Weight = 300,
	Atk = 150,
	Matk = 120,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 130,
	Subtype = "WT_WHIP",
	Script = [[ bonus bAspdRate,20; ]]
},
[1990] = {
	AegisName = "Floral_Mic_Of_Igu",
	Name = "Bloody Floral Decoration Microphone",
	Type = "IT_TYPE_WEAPON",
	Buy = 124000,
	Weight = 1000,
	Atk = 160,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_WHIP",
	Script = [[ bonus2 bSkillUseSP,CG_MOONLIT,-20; ]]
},
[1991] = {
	AegisName = "Ru_Blue_Whip",
	Name = "Blue Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 180,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 100,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bDex,5;
		bonus bVit,5;
	]]
},
[1992] = {
	AegisName = "Ru_Gold_Whip",
	Name = "Ru Gold Whip",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 180,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 120,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bDex,8;
		bonus bVit,8;
	]]
},
[1994] = {
	AegisName = "Infinity_Wire",
	Name = "Infinity Wire",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 100,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_WHIP",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[1995] = {
	AegisName = "Scarlet_Wire",
	Name = "Crimson Wire",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 80,
	Range = 2,
	Slots = 2,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bAtk,(((BaseLevel-70)/10)*5); }
	]]
},
[1996] = {
	AegisName = "Wire_of_Vicious_Mind",
	Name = "Wire of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1300,
	Atk = 130,
	Matk = 50,
	Range = 2,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Loc = "EQP_WEAPON",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_WHIP",
	Script = [[
		bonus bAtk,((min(getrefine(),15)) ** (2));
		bonus bMatk,((min(getrefine(),15)) ** (2))/2;
	]]
},

--== More Two-Handed Staves ================================
[2000] = {
	AegisName = "Destruction_Rod",
	Name = "Staff of Destruction",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 130,
	Matk = 280,
	Range = 1,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bMatkRate,getrefine()/2;
		bonus bInt,3;
		bonus bAgi,10;
		bonus bUseSPrate,(getrefine()*2);
		bonus3 bAutoSpellWhenHit,WZ_JUPITEL,5,(getrefine()*20);
		bonus2 bVariableCastrate,HW_MAGICPOWER,-50;
	]]
},
[2001] = {
	AegisName = "Divine_Cross",
	Name = "Divine Cross",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 120,
	Matk = 210,
	Range = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bDex,4;
		bonus2 bAddRaceTolerance,RC_Demon,15;
		bonus2 bAddRaceTolerance,RC_Undead,15;
	]]
},
[2002] = {
	AegisName = "Krieger_Twohand_Staff1",
	Name = "Glorious Destruction Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 70,
	Matk = 210,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSTAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMatkRate,getrefine();
		bonus2 bMagicAddRace,RC_DemiPlayer,15;
		bonus2 bIgnoreMdefRate,RC_DemiPlayer,25;
		bonus bUnbreakableWeapon,0;
		if(getrefine()>5) {
			bonus2 bMagicAddRace,RC_DemiPlayer,(min(getrefine(),14)-5)*2;
			bonus2 bIgnoreMdefRate,RC_DemiPlayer,5+(min(getrefine(),14)-5)*2;
		}
		if(getrefine()>8) {
			bonus5 bAutoSpellOnSkill,WZ_STORMGUST,MG_SAFETYWALL,10,200,1;
			bonus5 bAutoSpellOnSkill,WZ_METEOR,MG_SAFETYWALL,10,200,1;
			bonus5 bAutoSpellOnSkill,WZ_VERMILION,MG_SAFETYWALL,10,200,1;
		}
	]]
},
[2003] = {
	AegisName = "Destruction_Rod_M",
	Name = "Staff of Destruction",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2500,
	Atk = 130,
	Matk = 280,
	Range = 1,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 80,
	Subtype = "WT_2HSTAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMatkRate,getrefine()/2;
		bonus bInt,3;
		bonus bAgi,10;
		bonus bUseSPrate,(getrefine()*2);
		bonus3 bAutoSpellWhenHit,WZ_JUPITEL,5,(getrefine()*20);
		bonus2 bVariableCastrate,HW_MAGICPOWER,-50;
	]]
},
[2004] = {
	AegisName = "Kronos",
	Name = "Kronos",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 30,
	Matk = 240,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 50,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bInt,3+(getrefine()/2);
		bonus bMaxHP,300+(50*getrefine()/2);
		autobonus "{ bonus bMatkRate,12; bonus bUseSPrate,20; }",1,5000,BF_MAGIC,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
	]]
},
[2005] = {
	AegisName = "Dea_Staff",
	Name = "Dea Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 30,
	Matk = 220,
	Range = 1,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 50,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bMatkRate,getrefine()/2;
		bonus bInt,6;
		bonus bVit,2;
		autobonus3 "{ }",20,1000,AL_HEAL,"{ specialeffect(EF_MAGICALATTHIT, AREA, playerattached()); heal 0,200; }";
	]]
},
[2006] = {
	AegisName = "G_Staff_Of_Light",
	Name = "Guardian Of Light Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1900,
	Atk = 80,
	Matk = 150,
	Range = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 60,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Holy;
		bonus bInt,6;
	]]
},
[2007] = {
	AegisName = "Golden_Rod_Staff",
	Name = "Golden Rod Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 230,
	Range = 1,
	Slots = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bInt,3;
		bonus2 bSkillAtk,WZ_JUPITEL,12;
	]]
},
[2008] = {
	AegisName = "Aqua_Staff",
	Name = "Aqua Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 230,
	Range = 1,
	Slots = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus bInt,3;
		bonus2 bSkillAtk,MG_COLDBOLT,12;
		bonus2 bSkillAtk,MG_FROSTDIVER,12;
	]]
},
[2009] = {
	AegisName = "Crimson_Staff",
	Name = "Crimson Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 230,
	Range = 1,
	Slots = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus bInt,3;
		bonus2 bSkillAtk,MG_FIREBOLT,10;
		bonus2 bSkillAtk,MG_FIREBALL,10;
	]]
},
[2010] = {
	AegisName = "Forest_Staff",
	Name = "Forest Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 230,
	Range = 1,
	Slots = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bAtkEle,Ele_Earth;
		bonus bInt,3;
		bonus2 bSkillAtk,WZ_EARTHSPIKE,10;
		bonus2 bSkillAtk,WZ_HEAVENDRIVE,10;
	]]
},
[2011] = {
	AegisName = "Golden_Rod_Staff2",
	Name = "Empowered Golden Rod Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 270,
	Range = 1,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Wind;
		bonus bInt,5;
		bonus2 bSkillAtk,WZ_JUPITEL,30;
	]]
},
[2012] = {
	AegisName = "Aqua_Staff2",
	Name = "Empowered Aqua Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 270,
	Range = 1,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Water;
		bonus bInt,5;
		bonus2 bSkillAtk,MG_COLDBOLT,30;
		bonus2 bSkillAtk,MG_FROSTDIVER,30;
	]]
},
[2013] = {
	AegisName = "Crimson_Staff2",
	Name = "Empowered Crimson Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 270,
	Range = 1,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Fire;
		bonus bInt,5;
		bonus2 bSkillAtk,MG_FIREBOLT,30;
		bonus2 bSkillAtk,MG_FIREBALL,30;
	]]
},
[2014] = {
	AegisName = "Forest_Staff2",
	Name = "Empowered Forest Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 900,
	Atk = 30,
	Matk = 270,
	Range = 1,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 130,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bAtkEle,Ele_Earth;
		bonus bInt,5;
		bonus2 bSkillAtk,WZ_EARTHSPIKE,30;
		bonus2 bSkillAtk,WZ_HEAVENDRIVE,30;
	]]
},
[2015] = {
	AegisName = "Upg_Staff",
	Name = "Upgrade Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 50,
	Matk = 70,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bMatk,(getrefine()*10);
		bonus bHealPower,getrefine();
		if(BaseJob==Job_Wizard) bonus bMatk,30;
		else if(BaseJob==Job_Sage) bonus bMatk,20;
		if(BaseLevel>70) { bonus bMatk,(((BaseLevel-70)/10)*10); }
	]]
},
[2016] = {
	AegisName = "Velum_Arc_Wand",
	Name = "Vellum Arc Wand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 800,
	Atk = 110,
	Matk = 220,
	Range = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 95,
	Subtype = "WT_STAFF",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bMagicAddRace,RC_Player,25;
		bonus bIgnoreMdefRate,25;
		if(getrefine()>5) {
			bonus2 bMagicAddRace,RC_Player,15;
		}
		if(getrefine()>8) {
			bonus bVariableCastrate,-20;
			bonus bFixedCast,-200;
		}
	]]
},
[2017] = {
	AegisName = "Divine_Cross_",
	Name = "Divine Cross",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1500,
	Atk = 120,
	Matk = 210,
	Range = 1,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 70,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bAtkEle,Ele_Holy;
		bonus bDex,4;
	]]
},
[2018] = {
	AegisName = "Metal_Staff",
	Name = "Metal Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Matk = 70,
	Range = 1,
	Slots = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	Subtype = "WT_2HSTAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableWeapon,0;
		if(BaseJob==Job_Wizard) bonus bMatk,15;
		else if(BaseJob==Job_Sage) bonus bMatk,10;
		bonus bMatk,(getrefine()*5);
		.@val = min(BaseLevel/10, 12);
		if (.@val > 2) { bonus bMatk,((.@val-2)*5); }
	]]
},
[2019] = {
	AegisName = "TE_Woe_Two_Hand_Staff",
	Name = "TE Woe Two Hand Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Atk = 50,
	Matk = 130,
	Range = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 40,
	Refine = false,
	Subtype = "WT_2HSTAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bMagicAddRace,RC_Player,20;
		bonus bHealPower,5;
		bonus2 bAddEff,Eff_Stun,1000;
	]]
},
[2020] = {
	AegisName = "Jormungand",
	Name = "Jormungand",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 3000,
	Atk = 200,
	Matk = 280,
	Range = 1,
	Job = {
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 90,
	Refine = false,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bInt,20;
		bonus bAtkEle,Ele_Poison;
		bonus3 bAddEff,Eff_Poison,300,ATF_SKILL;
		bonus2 bAddEffWhenHit,Eff_Poison,100;
		bonus bUnbreakableWeapon,0;
	]]
},
[2021] = {
	AegisName = "Ganbantein",
	Name = "Ganbantein",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 2000,
	Atk = 100,
	Matk = 320,
	Range = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 100,
	Refine = false,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bInt,25;
		bonus bDex,25;
		bonus5 bAutoSpell,AB_SILENTIUM,1,100,BF_MAGIC,1;
		bonus3 bAddEff,Eff_Poison,100,ATF_SKILL;
		bonus2 bAddEffWhenHit,Eff_Silence,10000;
		bonus bUnbreakableWeapon,0;
	]]
},
[2022] = {
	AegisName = "Staff_Of_Geffen",
	Name = "Staff Of Geffen",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Matk = 300,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 1,
	EquipLv = 150,
	Subtype = "WT_STAFF",
	Script = [[ bonus bInt,20; ]]
},
[2023] = {
	AegisName = "Thanos_Rod",
	Name = "Thanatos Two-Handed Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1400,
	Atk = 120,
	Matk = 250,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 120,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bInt,6;
		bonus bVit,6;
		bonus bLuk,-6;
		bonus2 bSPDrainRate,10,5;
		bonus2 bHPDrainRate,10,5;
		bonus2 bHPLossRate,100,10000;
		bonus bHealPower,18;
	]],
	OnUnequipScript = [[ heal -1000,0; ]]
},
[2024] = {
	AegisName = "Infinity_Staff",
	Name = "Infinity Staff",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 500,
	Atk = 30,
	Matk = 170,
	Slots = 1,
	Job = {
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 100,
	Subtype = "WT_2HSTAFF",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2025] = {
	AegisName = "Scarlet_Staff",
	Name = "Staff of Crimson",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Matk = 150,
	Range = 1,
	Slots = 2,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 3,
	EquipLv = 70,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bInt,5;
		bonus bMatk,((min(getrefine(),15)) ** (2));
		if(BaseLevel>70) { bonus bMatk,(((BaseLevel-70)/10)*5); }
	]]
},
[2026] = {
	AegisName = "Staff_of_Vicious_Mind",
	Name = "Staff of Vicious Mind",
	Type = "IT_TYPE_WEAPON",
	Buy = 20,
	Weight = 1000,
	Atk = 100,
	Matk = 200,
	Range = 1,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMS",
	WeaponLv = 4,
	EquipLv = 160,
	Subtype = "WT_2HSTAFF",
	Script = [[
		bonus bInt,6;
		bonus bMatk,((min(getrefine(),15)) ** (2));
		bonus bUnbreakableWeapon,0;
	]]
},

--== Shields ===============================================
[2101] = {
	AegisName = "Guard",
	Name = "Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 500,
	Weight = 300,
	Def = 20,
	Loc = "EQP_SHIELD",
	ViewSprite = 1,
},
[2102] = {
	AegisName = "Guard_",
	Name = "Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 500,
	Weight = 300,
	Def = 20,
	Slots = 1,
	Loc = "EQP_SHIELD",
	ViewSprite = 1,
},
[2103] = {
	AegisName = "Buckler",
	Name = "Buckler",
	Type = "IT_TYPE_ARMOR",
	Buy = 14000,
	Weight = 600,
	Def = 40,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 2,
},
[2104] = {
	AegisName = "Buckler_",
	Name = "Buckler",
	Type = "IT_TYPE_ARMOR",
	Buy = 14000,
	Weight = 600,
	Def = 40,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 2,
},
[2105] = {
	AegisName = "Shield",
	Name = "Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 1300,
	Def = 60,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 3,
},
[2106] = {
	AegisName = "Shield_",
	Name = "Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 1300,
	Def = 60,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 3,
},
[2107] = {
	AegisName = "Mirror_Shield",
	Name = "Mirror Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 60000,
	Weight = 1000,
	Def = 45,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 4,
	Script = [[ bonus bMdef,5; ]]
},
[2108] = {
	AegisName = "Mirror_Shield_",
	Name = "Mirror Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 60000,
	Weight = 1000,
	Def = 45,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 4,
	Script = [[ bonus bMdef,5; ]]
},
[2109] = {
	AegisName = "Memorize_Book",
	Name = "Memory Book",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 25,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 5,
	Script = [[
		bonus bInt,1;
		bonus bMdef,2;
	]]
},
[2110] = {
	AegisName = "Holy_Guard",
	Name = "Holy Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 85000,
	Weight = 1400,
	Def = 110,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 68,
	Refine = false,
	ViewSprite = 4,
	Script = [[
		bonus bVit,2;
		bonus bMdef,2;
	]]
},
[2111] = {
	AegisName = "Herald_Of_GOD",
	Name = "Sacred Mission",
	Type = "IT_TYPE_ARMOR",
	Buy = 128000,
	Weight = 1600,
	Def = 120,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 83,
	ViewSprite = 4,
	Script = [[
		bonus bVit,3;
		bonus bInt,2;
		bonus bMdef,3;
		bonus bUnbreakableShield,0;
	]]
},
[2112] = {
	AegisName = "Novice_Guard",
	Name = "Novice Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 1,
	Def = 20,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	Refine = false,
	ViewSprite = 1,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2113] = {
	AegisName = "Novice_Shield",
	Name = "Novice Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 1000,
	Def = 20,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 40,
	ViewSprite = 3,
	Script = [[
		bonus2 bSubEle,Ele_Water,20;
		bonus2 bSubEle,Ele_Earth,20;
		bonus2 bSubEle,Ele_Fire,20;
		bonus2 bSubEle,Ele_Wind,20;
		bonus2 bSubEle,Ele_Poison,20;
		bonus2 bSubEle,Ele_Ghost,20;
		bonus2 bSubEle,Ele_Holy,20;
		bonus2 bSubEle,Ele_Dark,20;
		bonus2 bSubEle,Ele_Undead,20;
	]]
},
[2114] = {
	AegisName = "Stone_Buckler",
	Name = "Stone Buckler",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 1500,
	Def = 45,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 2,
	Script = [[ bonus2 bSubSize,Size_Large,5; ]]
},
[2115] = {
	AegisName = "Valkyrjas_Shield",
	Name = "Valkyrja's Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 80,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 4,
	Script = [[
		bonus2 bSubEle,Ele_Water,20;
		bonus2 bSubEle,Ele_Fire,20;
		bonus2 bSubEle,Ele_Dark,20;
		bonus2 bSubEle,Ele_Undead,20;
		bonus bMdef,5;
	]]
},
[2116] = {
	AegisName = "Angels_Safeguard",
	Name = "Angelic Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 400,
	Def = 30,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	ViewSprite = 1,
	Script = [[ bonus2 bAddRaceTolerance,RC_Demon,5; ]]
},
[2117] = {
	AegisName = "Arm_Guard",
	Name = "Arm Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 150,
	Def = 50,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	ViewSprite = 1,
},
[2118] = {
	AegisName = "Arm_Guard_",
	Name = "Arm Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 150,
	Def = 50,
	Slots = 1,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	ViewSprite = 1,
},
[2119] = {
	AegisName = "Improved_Arm_Guard",
	Name = "Advanced Arm Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 40000,
	Weight = 150,
	Def = 45,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 50,
	ViewSprite = 1,
	Script = [[ bonus bMdef,5; ]]
},
[2120] = {
	AegisName = "Improved_Arm_Guard_",
	Name = "Advanced Arm Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 40000,
	Weight = 150,
	Def = 45,
	Slots = 1,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 50,
	ViewSprite = 1,
	Script = [[ bonus bMdef,5; ]]
},
[2121] = {
	AegisName = "Memorize_Book_",
	Name = "Memory Book",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 25,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 5,
	Script = [[
		bonus bInt,1;
		bonus bMdef,2;
	]]
},
[2122] = {
	AegisName = "Platinum_Shield",
	Name = "Platinum Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1200,
	Def = 95,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 68,
	ViewSprite = 4,
	Script = [[
		bonus bMdef,5;
		bonus2 bSubSize,Size_Medium,15;
		bonus2 bSubSize,Size_Large,15;
		bonus2 bAddRaceTolerance,RC_Undead,10;
		bonus5 bAutoSpellWhenHit,NPC_MAGICMIRROR,2,150,BF_MAGIC,0;
	]]
},
[2123] = {
	AegisName = "Orleans_Server",
	Name = "Orleans's Server",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 75,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 55,
	ViewSprite = 4,
	Script = [[
		bonus bMdef,2;
		bonus bMagicDamageReturn,5;
	]]
},
[2124] = {
	AegisName = "Thorny_Buckler",
	Name = "Thorny Buckler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 85,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 55,
	ViewSprite = 2,
	Script = [[ bonus bMdef,2; ]]
},
[2125] = {
	AegisName = "Strong_Shield",
	Name = "Strong Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2500,
	Def = 90,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 75,
	ViewSprite = 4,
	Script = [[
		bonus bNoKnockback,0;
		bonus2 bSubEle,Ele_Neutral,-20;
		bonus2 bSubEle,Ele_Fire,-20;
		bonus2 bSubEle,Ele_Water,-20;
		bonus2 bSubEle,Ele_Wind,-20;
		bonus2 bSubEle,Ele_Earth,-20;
		bonus2 bSubEle,Ele_Dark,-20;
		bonus2 bSubEle,Ele_Holy,-20;
		bonus2 bSubEle,Ele_Ghost,-20;
	]]
},
[2126] = {
	AegisName = "Guyak_Shield",
	Name = "Guyak Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 2,
	Script = [[
		bonus bMdef,2;
		bonus bMagicDamageReturn,2;
		autobonus2 "{ bonus bShortWeaponDamageReturn,5; }",20,1000,BF_WEAPON,"{ specialeffect(EF_REFLECTSHIELD, AREA, playerattached()); }";
	]]
},
[2127] = {
	AegisName = "Secular_Mission",
	Name = "Secular Mission",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Loc = "EQP_SHIELD",
	Refine = false,
	ViewSprite = 4,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bSubRace, RC_All, 25; ]]
},
[2128] = {
	AegisName = "Herald_Of_GOD_",
	Name = "Sacred Mission",
	Type = "IT_TYPE_ARMOR",
	Buy = 128000,
	Weight = 1600,
	Def = 120,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 83,
	ViewSprite = 4,
	Script = [[
		bonus bVit,3;
		bonus bInt,2;
		bonus bMdef,3;
		bonus bUnbreakableShield,0;
	]]
},
[2129] = {
	AegisName = "Exorcism_Bible",
	Name = "Exorcism Bible",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 80,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 50,
	ViewSprite = 5,
	Script = [[
		bonus bHPrecovRate,3;
		bonus bSPrecovRate,3;
		bonus bInt,1;
	]]
},
[2130] = {
	AegisName = "Cross_Shield",
	Name = "Cross Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Def = 130,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 80,
	ViewSprite = 4,
	Script = [[
		bonus bStr,1;
		bonus2 bSkillAtk,PA_SHIELDCHAIN,30;
		bonus2 bSkillAtk,CR_SHIELDBOOMERANG,30;
		bonus bUseSPrate,10;
	]]
},
[2131] = {
	AegisName = "Magic_Study_Vol1",
	Name = "Magic Bible Vol1",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 18,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 70,
	ViewSprite = 5,
	Script = [[
		bonus bMdef,3;
		bonus bInt,2;
		bonus2 bAddEffWhenHit,Eff_Stun,1000;
	]]
},
[2132] = {
	AegisName = "Shelter_Resistance",
	Name = "Shelter Resistance",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 140,
	Loc = "EQP_SHIELD",
	Refine = false,
	ViewSprite = 2,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSubEle,Ele_Neutral,20;
		bonus2 bSubEle,Ele_Water,20;
		bonus2 bSubEle,Ele_Earth,20;
		bonus2 bSubEle,Ele_Fire,20;
		bonus2 bSubEle,Ele_Wind,20;
		bonus2 bSubEle,Ele_Poison,20;
		bonus2 bSubEle,Ele_Holy,20;
		bonus2 bSubEle,Ele_Dark,20;
		bonus2 bSubEle,Ele_Ghost,20;
		bonus2 bSubEle,Ele_Undead,20;
		bonus bShortWeaponDamageReturn,1;
	]]
},
[2133] = {
	AegisName = "Tournament_Shield",
	Name = "Tournament Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 105,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 50,
	ViewSprite = 4,
	Script = [[
		bonus2 bAddRace, RC_All, 1;
		if (Class == Job_Lord_Knight)
			bonus bAspdRate,-5;
	]]
},
[2134] = {
	AegisName = "Shield_Of_Naga",
	Name = "Shield of Naga",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 35,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	ViewSprite = 2,
	Script = [[
		bonus bMdef,3;
		autobonus2 "{ bonus bShortWeaponDamageReturn,(getrefine()*3); }",10,5000,BF_WEAPON,"{ specialeffect(EF_GUARD, AREA, playerattached()); }";
	]]
},
[2135] = {
	AegisName = "Shadow_Guard",
	Name = "Shadow Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 52,
	Slots = 1,
	Job = {
		Rogue = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 70,
	ViewSprite = 2,
},
[2136] = {
	AegisName = "Cracked_Buckler",
	Name = "Cracked Buckler",
	Type = "IT_TYPE_ARMOR",
	Def = 55,
	Loc = "EQP_SHIELD",
	Refine = false,
	ViewSprite = 2,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAgi,2;
		bonus2 bAddEle,Ele_Neutral,-10;
		bonus3 bAutoSpellWhenHit,PR_KYRIE,10,10;
		bonus bMdef,1;
	]]
},
[2137] = {
	AegisName = "Valkyrjas_Shield_C",
	Name = "Neo Valkyrja's Shield",
	Type = "IT_TYPE_ARMOR",
	Def = 110,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 95,
	Refine = false,
	ViewSprite = 4,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSubEle,Ele_Water,20;
		bonus2 bSubEle,Ele_Fire,20;
		bonus2 bSubEle,Ele_Dark,20;
		bonus2 bSubEle,Ele_Undead,20;
		bonus bMdef,5;
	]]
},
[2138] = {
	AegisName = "Bradium_Shield",
	Name = "Bradium Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1800,
	Def = 98,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
	Script = [[
		bonus2 bSkillAtk,CR_SHIELDBOOMERANG,60;
		bonus bAgi,-1;
		bonus bMaxHP,500;
	]]
},
[2139] = {
	AegisName = "Flame_Thrower",
	Name = "Flame Thrower",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 2000,
	Def = 60,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 99,
	Refine = false,
	ViewSprite = 1,
},
[2140] = {
	AegisName = "Energy_Rune_Guard",
	Name = "Energy Rune Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 70,
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 99,
	ViewSprite = 4,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMaxSPrate,2; ]]
},
[2141] = {
	AegisName = "Freyja_SShield7",
	Name = "Freya Soul Shield",
	Type = "IT_TYPE_ARMOR",
	Weight = 300,
	Def = 5,
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	Refine = false,
	ViewSprite = 1,
	Script = [[ bonus2 bSubSize,Size_Medium,25; ]]
},
[2142] = {
	AegisName = "Freyja_SShield30",
	Name = "Freya Soul Shield",
	Type = "IT_TYPE_ARMOR",
	Weight = 300,
	Def = 5,
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	Refine = false,
	ViewSprite = 1,
	Script = [[ bonus2 bSubSize,Size_Medium,25; ]]
},
[2143] = {
	AegisName = "Freyja_SShield60",
	Name = "Freya Soul Shield",
	Type = "IT_TYPE_ARMOR",
	Weight = 300,
	Def = 5,
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	Refine = false,
	ViewSprite = 1,
	Script = [[ bonus2 bSubSize,Size_Medium,25; ]]
},
[2144] = {
	AegisName = "Freyja_SShield90",
	Name = "Freya Soul Shield",
	Type = "IT_TYPE_ARMOR",
	Weight = 300,
	Def = 5,
	Loc = "EQP_SHIELD",
	EquipLv = 20,
	Refine = false,
	ViewSprite = 1,
	Script = [[ bonus2 bSubSize,Size_Medium,25; ]]
},
[2145] = {
	AegisName = "Time_Keepr_Shield",
	Name = "Guardian Shield",
	Type = "IT_TYPE_ARMOR",
	Def = 20,
	Loc = "EQP_SHIELD",
	ViewSprite = 3,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,1;
		bonus2 bSubEle,Ele_Neutral,10;
		bonus2 bSubSize,Size_Medium,25;
	]]
},
[2146] = {
	AegisName = "Siver_Guard",
	Name = "Siver Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 12500,
	Weight = 300,
	Def = 60,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 22,
	ViewSprite = 1,
},
[2147] = {
	AegisName = "Round_Buckler",
	Name = "Round Buckler",
	Type = "IT_TYPE_ARMOR",
	Buy = 24000,
	Weight = 600,
	Def = 90,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 22,
	ViewSprite = 2,
},
[2148] = {
	AegisName = "Rotha_Shield",
	Name = "Rosa Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 1300,
	Def = 130,
	Slots = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 3,
},
[2149] = {
	AegisName = "Upg_Guard",
	Name = "Reinforcement Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Def = 25,
	Slots = 1,
	Loc = "EQP_SHIELD",
	ViewSprite = 1,
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2150] = {
	AegisName = "Upg_Buckler",
	Name = "Reinforcement Buckler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 45,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 2,
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2151] = {
	AegisName = "Upg_Shield",
	Name = "Reinforcement Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 650,
	Def = 65,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 3,
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2152] = {
	AegisName = "Anti_Demon_Shield_C",
	Name = "Anti Demon Shield",
	Type = "IT_TYPE_ARMOR",
	Def = 120,
	Loc = "EQP_SHIELD",
	Refine = false,
	ViewSprite = 3,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSubRace,RC_DemiPlayer,25;
		bonus2 bSubRace,RC_Demon,25;
		bonus bMaxHP,400;
	]]
},
[2153] = {
	AegisName = "Imperial_Guard",
	Name = "Imperial Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2500,
	Def = 120,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 102,
	ViewSprite = 4,
	Script = [[
		bonus bMdef,5;
		if(getrefine()>=6) {
			bonus2 bSkillAtk,LG_SHIELDPRESS,20+((getrefine()-5)*2);
		}
		else {
			bonus2 bSkillAtk,LG_SHIELDPRESS,20;
		}
	]]
},
[2154] = {
	AegisName = "Toy_Shield",
	Name = "Toy Shield",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Def = 1,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 10,
	ViewSprite = 1,
},
[2155] = {
	AegisName = "Academy_Shield",
	Name = "Academy Shield",
	Type = "IT_TYPE_ARMOR",
	Weight = 1500,
	Def = 3,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHIELD",
	ViewSprite = 4,
},
[2156] = {
	AegisName = "Bible_Of_Promise1",
	Name = "Bible of Promise(1st Vol.)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 10,
	Slots = 1,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 110,
	ViewSprite = 5,
	Script = [[
		bonus bMdef,2;
		skill ALL_ODINS_POWER,1;
	]]
},
[2157] = {
	AegisName = "Insecticide",
	Name = "Pesticide",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bAddRace,RC_Insect,10;
	]]
},
[2158] = {
	AegisName = "Ramor_Shield_Undead",
	Name = "Ramorushirudo",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
	Script = [[
		bonus2 bAddRaceTolerance, RC_Undead, 5;
		bonus2 bAddRaceTolerance, RC_DemiPlayer, -5;
	]]
},
[2159] = {
	AegisName = "Sharel_Shield",
	Name = "Sharerushirudo",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2160] = {
	AegisName = "Giant_Shield",
	Name = "Giant Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 2800,
	Def = 130,
	Slots = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 4,
	Script = [[
		bonus2 bSubSize,Size_Large,5;
		if(getrefine()>=9) {
			bonus2 bSubSize,Size_Large,5;
		}
	]]
},
[2161] = {
	AegisName = "Geffenia_Book_Water",
	Name = "Geffenia Water Book",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 1000,
	Def = 30,
	Slots = 1,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 5,
	Script = [[
		bonus bMdef,2;
		bonus bInt,1;
		if(readparam(bInt)>=120) {
			bonus bMatk,10;
			bonus bMaxHP,800;
		}
	]]
},
[2162] = {
	AegisName = "Bible_Of_Promise2",
	Name = "Bible of Promise(2nd Vol.)",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 500,
	Def = 20,
	Slots = 1,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 140,
	ViewSprite = 5,
	Script = [[
		bonus bMdef,5;
		bonus bHealPower,5;
		skill ALL_ODINS_POWER,2;
	]]
},
[2163] = {
	AegisName = "Flow_Shield",
	Name = "Floor Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2164] = {
	AegisName = "Sombre_Shield",
	Name = "Bull Son Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2165] = {
	AegisName = "Sol_Shield",
	Name = "Sol Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2166] = {
	AegisName = "Exorcism_Bible_",
	Name = "Devil's Bible Drive",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 80,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 50,
	ViewSprite = 5,
	Script = [[ bonus bInt,1; ]]
},
[2167] = {
	AegisName = "Poison_Shield",
	Name = "Poison Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2168] = {
	AegisName = "Immuned_Shield",
	Name = "Immune Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 55,
	Slots = 1,
	Loc = "EQP_SHIELD",
	ViewSprite = 1,
	Script = [[ if (getrefine()>5) bonus2 bSubEle,Ele_Neutral,min(getrefine(),12)-5; ]]
},
[2169] = {
	AegisName = "Kalasak",
	Name = "Kalasag",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 40,
	Loc = "EQP_SHIELD",
	ViewSprite = 1,
	Script = [[ bonus2 bSubRace,RC_Boss,getrefine()/3; ]]
},
[2170] = {
	AegisName = "Bayani_Kalasak",
	Name = "Kalasag(Bayani)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 40,
	Slots = 1,
	Loc = "EQP_SHIELD",
	ViewSprite = 1,
	Script = [[ bonus2 bSubRace,RC_Boss,getrefine()/3; ]]
},
[2171] = {
	AegisName = "Fox_Armguard",
	Name = "Fox Armguard",
	Type = "IT_TYPE_ARMOR",
	Buy = 40000,
	Weight = 200,
	Def = 45,
	Slots = 1,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 1,
	Script = [[ bonus bFlee,5; ]]
},
[2172] = {
	AegisName = "Wolf_Armguard",
	Name = "Wolf Armguard",
	Type = "IT_TYPE_ARMOR",
	Buy = 45000,
	Weight = 250,
	Def = 70,
	Slots = 1,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 1,
	Script = [[ autobonus "{ bonus bBaseAtk,100; bonus bFlee,-50; }",10,5000,BF_WEAPON,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }"; ]]
},
[2173] = {
	AegisName = "Crescent_Armguard",
	Name = "Crescent Armguard",
	Type = "IT_TYPE_ARMOR",
	Buy = 45000,
	Weight = 250,
	Def = 45,
	Slots = 1,
	Job = {
		Ninja = true,
		Kagerou = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 1,
	Script = [[ bonus bDelayrate,-(getrefine()*2); ]]
},
[2174] = {
	AegisName = "Lumiere_Shield",
	Name = "Lumiere Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2175] = {
	AegisName = "Esprit_Shield",
	Name = "Spirit Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1300,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 3,
},
[2176] = {
	AegisName = "Dark_Book",
	Name = "Black Book",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 80,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 5,
	Script = [[ bonus bMdef,5; ]]
},
[2177] = {
	AegisName = "Shield_Of_Death",
	Name = "Shield Of Death",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Def = 150,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 90,
	ViewSprite = 3,
	Script = [[
		bonus2 bAddRace,RC_Boss,2;
		bonus2 bSubRace,RC_NonBoss,-10;
	]]
},
[2178] = {
	AegisName = "TE_Woe_Buckler",
	Name = "TE WoE Buckler",
	Type = "IT_TYPE_ARMOR",
	Def = 15,
	Loc = "EQP_SHIELD",
	EquipLv = 40,
	Refine = false,
	ViewSprite = 3,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,15;
		bonus bMaxHP,100;
		bonus bMaxSP,100;
		bonus2 bSubRace,RC_Player,15;
	]]
},
[2179] = {
	AegisName = "TE_Woe_Shield",
	Name = "TE WoE Shield",
	Type = "IT_TYPE_ARMOR",
	Def = 25,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 40,
	Refine = false,
	ViewSprite = 3,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus bMaxHP,200;
		bonus2 bSubRace,RC_Player,20;
	]]
},
[2180] = {
	AegisName = "TE_Woe_Magic_Guard",
	Name = "TE WoE Magic Guard",
	Type = "IT_TYPE_ARMOR",
	Def = 5,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 40,
	Refine = false,
	ViewSprite = 3,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,25;
		bonus bMaxSP,200;
		bonus2 bSubRace,RC_Player,10;
	]]
},
[2181] = {
	AegisName = "Hervor",
	Name = "Hervor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1500,
	Def = 100,
	Loc = "EQP_SHIELD",
	EquipLv = 90,
	Refine = false,
	ViewSprite = 2,
	Script = [[
		bonus bMdef,5;
		bonus2 bSubRace,RC_All,30;
		bonus bUnbreakableShield,1;
	]]
},
[2182] = {
	AegisName = "Hervor_Alvitr",
	Name = "Hervor Alvitr",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3000,
	Def = 150,
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	Refine = false,
	ViewSprite = 2,
	Script = [[
		bonus bVit,20;
		bonus bMdef,10;
		bonus2 bAddRaceTolerance,RC_All,30;
		/* TODO: bonus3 bAutoSpellWhenHit,"ALL_RAY_OF_PROTECTION",1,50; */
		bonus bUnbreakableShield,1;
	]]
},
[2183] = {
	AegisName = "Impr_Angels_Safeguard",
	Name = "Advanced Angelic Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 400,
	Def = 30,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 99,
	ViewSprite = 1,
	Script = [[
		bonus2 bAddRaceTolerance,RC_Demon,5;
		bonus2 bSubEle,Ele_Water,5;
		bonus2 bSubEle,Ele_Earth,5;
		bonus2 bSubEle,Ele_Fire,5;
		bonus2 bSubEle,Ele_Wind,5;
		bonus2 bSubEle,Ele_Poison,5;
		bonus2 bSubEle,Ele_Ghost,5;
		bonus2 bSubEle,Ele_Holy,5;
		bonus2 bSubEle,Ele_Dark,5;
		bonus2 bSubEle,Ele_Undead,5;
	]]
},
[2185] = {
	AegisName = "Magic_Reflector",
	Name = "Magic Reflector",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 50,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 99,
	Refine = false,
	ViewSprite = 2,
	Script = [[
		bonus bMdef,10;
		bonus bMagicDamageReturn,3+((getrefine()>=9)?3:0);
	]]
},
[2186] = {
	AegisName = "Encyclopedia_Revision",
	Name = "Revised Encyclopedia",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 50,
	Slots = 1,
	Job = {
		Priest = true,
		Sage = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_SHIELD",
	EquipLv = 99,
	ViewSprite = 2,
	Script = [[
		bonus bMatk,5;
		bonus bInt,3;
		bonus bDex,2;
		bonus bCritical,3;
		if (getrefine()>6) bonus bCritical,2;
		if (getrefine()>8) bonus bMatk,5;
	]]
},
[2187] = {
	AegisName = "Shield_Of_Gray",
	Name = "Gray Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Def = 75,
	Slots = 1,
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 120,
	ViewSprite = 2,
	Script = [[
		bonus bMdef,10+(getrefine()/3);
		bonus2 bSubEle,Ele_Holy,30+getrefine();
	]]
},
[2188] = {
	AegisName = "Svalinn_J",
	Name = "Svalinn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 80,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 65,
	ViewSprite = 2,
	Script = [[
		bonus bMdef,5;
		bonus2 bSubEle,Ele_Water,10+(getrefine()/3);
		bonus bMaxHP,getrefine();
	]]
},
[2189] = {
	AegisName = "Mad_Bunny",
	Name = "Mad Bunny",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Def = 40,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 30,
	ViewSprite = 1,
	Script = [[
		bonus bMdef,6;
		bonus bDex,1;
		bonus2 bSubEle,Ele_Water,5;
		bonus2 bSubEle,Ele_Earth,5;
		bonus2 bSubEle,Ele_Fire,5;
		bonus2 bSubEle,Ele_Wind,5;
		bonus2 bSubEle,Ele_Poison,5;
		bonus2 bSubEle,Ele_Ghost,5;
		bonus2 bSubEle,Ele_Holy,5;
		bonus2 bSubEle,Ele_Dark,5;
		bonus2 bSubEle,Ele_Undead,5;
		bonus2 bSubEle,Ele_Neutral,5;
		if (isequipped(20725)) {
			if (getequiprefinerycnt(EQI_HAND_L)>6) {
				bonus2 bSubEle,Ele_Water,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Earth,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Fire,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Wind,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Poison,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Ghost,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Holy,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Dark,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Undead,(getrefine()*2)-12;
				bonus2 bSubEle,Ele_Neutral,(getrefine()*2)-12;
			}
		}
	]]
},
[2190] = {
	AegisName = "Ancient_Shield_Of_Aeon",
	Name = "Ancient Shield Of Aeon",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 5,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHIELD",
	EquipLv = 130,
	ViewSprite = 2,
	Script = [[
		bonus2 bSubEle,Ele_Neutral,10;
		bonus2 bSubEle,Ele_Fire,10;
		bonus2 bSubEle,Ele_Water,10;
		bonus2 bSubEle,Ele_Wind,10;
		bonus2 bSubEle,Ele_Earth,10;
		bonus2 bSubEle,Ele_Dark,10;
		bonus2 bSubEle,Ele_Holy,10;
		bonus2 bSubEle,Ele_Ghost,10;
		bonus bMaxHP,500;
		bonus bMaxSP,50;
		if(getrefine()>=14) { skill MG_STONECURSE,5; }
	]]
},
[2198] = {
	AegisName = "Lapine_Shield",
	Name = "Laphine Shield",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 25,
	Slots = 1,
	Loc = "EQP_SHIELD",
	EquipLv = 100,
	ViewSprite = 2,
	Script = [[
		bonus bMdef,10;
		if(getrefine()>=7) { bonus bMatk,20; }
	]]
},

--== GM Shield =============================================
[2199] = {
	AegisName = "Ahura_Mazda",
	Name = "Ahura Mazdah",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 10,
	Def = 10000,
	Loc = "EQP_SHIELD",
	Refine = false,
	Script = [[
		bonus bUnbreakableShield,0;
		bonus bAllStats,50;
		bonus bMdef,99;
		bonus bShortWeaponDamageReturn,100;
		bonus2 bSubRace,RC_DemiPlayer,95;
		skill CR_FULLPROTECTION,5;
		skill WZ_ESTIMATION,1;
		skill ST_FULLSTRIP,5;
		skill HW_MAGICPOWER,10;
		bonus bMaxHPrate,200;
		bonus bNoKnockback,0;
		bonus bDelayrate,-20;
		bonus bSpeedRate,25;
		bonus bIntravision,0;
	]],
	OnEquipScript = [[ sc_start4 SC_ENDURE,60000,10,0,0,1;s]],
	OnUnequipScript = [[ sc_end SC_ENDURE; ]]
},

--== Headgears =============================================
[2201] = {
	AegisName = "Sunglasses",
	Name = "Sunglasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 12,
	Script = [[ bonus2 bResEff,Eff_Blind,500; ]]
},
[2202] = {
	AegisName = "Sunglasses_",
	Name = "Sunglasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 12,
	Script = [[ bonus2 bResEff,Eff_Blind,500; ]]
},
[2203] = {
	AegisName = "Glasses",
	Name = "Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 4000,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 3,
},
[2204] = {
	AegisName = "Glasses_",
	Name = "Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 4000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 3,
},
[2205] = {
	AegisName = "Divers_Goggles",
	Name = "Diver Goggles",
	Type = "IT_TYPE_ARMOR",
	Buy = 3500,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 10,
},
[2206] = {
	AegisName = "Wedding_Veil",
	Name = "Wedding Veil",
	Type = "IT_TYPE_ARMOR",
	Buy = 23000,
	Weight = 100,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 44,
	Script = [[ bonus bMdef,5; ]]
},
[2207] = {
	AegisName = "Fancy_Flower",
	Name = "Fancy Flower",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 4,
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,10; ]]
},
[2208] = {
	AegisName = "Ribbon",
	Name = "Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 17,
	Script = [[ bonus bMdef,3; ]]
},
[2209] = {
	AegisName = "Ribbon_",
	Name = "Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 17,
	Script = [[ bonus bMdef,3; ]]
},
[2210] = {
	AegisName = "Hair_Band",
	Name = "Hairband",
	Type = "IT_TYPE_ARMOR",
	Buy = 500,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 9,
},
[2211] = {
	AegisName = "Bandana",
	Name = "Bandana",
	Type = "IT_TYPE_ARMOR",
	Buy = 400,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 6,
},
[2212] = {
	AegisName = "Eye_Bandage",
	Name = "Eye Patch",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 13,
},
[2213] = {
	AegisName = "Cat_Hairband",
	Name = "Kitty Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 2,
},
[2214] = {
	AegisName = "Bunny_Band",
	Name = "Bunny Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 15,
	Script = [[ bonus bLuk,2; ]]
},
[2215] = {
	AegisName = "Flower_Hairband",
	Name = "Flower Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 5,
},
[2216] = {
	AegisName = "Biretta",
	Name = "Biretta",
	Type = "IT_TYPE_ARMOR",
	Buy = 9000,
	Weight = 100,
	Def = 8,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 11,
},
[2217] = {
	AegisName = "Biretta_",
	Name = "Biretta",
	Type = "IT_TYPE_ARMOR",
	Buy = 9000,
	Weight = 100,
	Def = 8,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 11,
},
[2218] = {
	AegisName = "Flu_Mask",
	Name = "Flu Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 300,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 8,
	Script = [[ bonus2 bResEff,Eff_Silence,1000; ]]
},
[2219] = {
	AegisName = "Flu_Mask_",
	Name = "Flu Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 300,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 8,
},
[2220] = {
	AegisName = "Hat",
	Name = "Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 200,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 16,
},
[2221] = {
	AegisName = "Hat_",
	Name = "Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 200,
	Def = 2,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 16,
},
[2222] = {
	AegisName = "Turban",
	Name = "Turban",
	Type = "IT_TYPE_ARMOR",
	Buy = 4500,
	Weight = 300,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 7,
},
[2223] = {
	AegisName = "Turban_",
	Name = "Turban",
	Type = "IT_TYPE_ARMOR",
	Buy = 4500,
	Weight = 300,
	Def = 5,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 7,
},
[2224] = {
	AegisName = "Goggle",
	Name = "Goggles",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 1,
},
[2225] = {
	AegisName = "Goggle_",
	Name = "Goggles",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Slots = 1,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 1,
},
[2226] = {
	AegisName = "Cap",
	Name = "Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 12000,
	Weight = 400,
	Def = 7,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 14,
},
[2227] = {
	AegisName = "Cap_",
	Name = "Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 12000,
	Weight = 400,
	Def = 7,
	Slots = 1,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 14,
},
[2228] = {
	AegisName = "Helm",
	Name = "Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 44000,
	Weight = 600,
	Def = 13,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 40,
},
[2229] = {
	AegisName = "Helm_",
	Name = "Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 44000,
	Weight = 600,
	Def = 13,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 40,
},
[2230] = {
	AegisName = "Gemmed_Sallet",
	Name = "Gemmed Sallet",
	Type = "IT_TYPE_ARMOR",
	Buy = 50000,
	Weight = 500,
	Def = 8,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	Script = [[ bonus bMdef,3; ]]
},
[2231] = {
	AegisName = "Gemmed_Sallet_",
	Name = "Gemmed Sallet",
	Type = "IT_TYPE_ARMOR",
	Buy = 50000,
	Weight = 500,
	Def = 8,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	Script = [[ bonus bMdef,3; ]]
},
[2232] = {
	AegisName = "Circlet",
	Name = "Circlet",
	Type = "IT_TYPE_ARMOR",
	Buy = 7500,
	Weight = 300,
	Def = 6,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 18,
	Script = [[ bonus bMdef,3; ]]
},
[2233] = {
	AegisName = "Circlet_",
	Name = "Circlet",
	Type = "IT_TYPE_ARMOR",
	Buy = 7500,
	Weight = 300,
	Def = 6,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 18,
	Script = [[ bonus bMdef,3; ]]
},
[2234] = {
	AegisName = "Tiara",
	Name = "Tiara",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 7,
	Job = {
		All = true,
		Novice = false,
	},
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 19,
	Script = [[ bonus bInt,2; ]]
},
[2235] = {
	AegisName = "Crown",
	Name = "Crown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 7,
	Job = {
		All = true,
		Novice = false,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 45,
	Script = [[ bonus bInt,2; ]]
},
[2236] = {
	AegisName = "Santas_Hat",
	Name = "Santa Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 20,
	Script = [[
		bonus bMdef,1;
		bonus bLuk,1;
	]]
},
[2237] = {
	AegisName = "Weird_Goatee",
	Name = "Bandit Beard",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 21,
},
[2238] = {
	AegisName = "Weird_Moustache",
	Name = "Moustache",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 22,
},
[2239] = {
	AegisName = "One_Eyed_Glass",
	Name = "Monocle",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 23,
},
[2240] = {
	AegisName = "Beard",
	Name = "Beard",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 24,
	Sprite = 2241,
},
[2241] = {
	AegisName = "Granpa_Beard",
	Name = "Grampa Beard",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 25,
},
[2242] = {
	AegisName = "Luxury_Sunglasses",
	Name = "Purple Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 24000,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 26,
	Script = [[ bonus2 bResEff,Eff_Blind,1000; ]]
},
[2243] = {
	AegisName = "Spinning_Eyes",
	Name = "Geek Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 27,
	Script = [[ bonus2 bResEff,Eff_Blind,1500; ]]
},
[2244] = {
	AegisName = "Big_Sis_Ribbon",
	Name = "Big Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 15000,
	Weight = 200,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 28,
	Script = [[ bonus bMdef,3; ]]
},
[2245] = {
	AegisName = "Sweet_Gents",
	Name = "Sweet Gent",
	Type = "IT_TYPE_ARMOR",
	Buy = 15000,
	Weight = 400,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 29,
},
[2246] = {
	AegisName = "Golden_Gear",
	Name = "Golden Gear",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Def = 9,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 40,
	ViewSprite = 30,
	Script = [[ bonus bUnbreakableHelm,0; ]]
},
[2247] = {
	AegisName = "Oldmans_Romance",
	Name = "Romantic Gent",
	Type = "IT_TYPE_ARMOR",
	Buy = 15000,
	Weight = 400,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 31,
},
[2248] = {
	AegisName = "Western_Grace",
	Name = "Western Grace",
	Type = "IT_TYPE_ARMOR",
	Buy = 15000,
	Weight = 400,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 32,
},
[2249] = {
	AegisName = "Coronet",
	Name = "Coronet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 33,
	Script = [[ bonus bInt,1; ]]
},
[2250] = {
	AegisName = "Fillet",
	Name = "Cute Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 500,
	Weight = 100,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 34,
	Script = [[ bonus bMaxSP,20; ]]
},
[2251] = {
	AegisName = "Holy_Bonnet",
	Name = "Monk Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Def = 10,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 35,
	Script = [[ bonus bMdef,3; ]]
},
[2252] = {
	AegisName = "Star_Sparkling",
	Name = "Wizard Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 7,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 36,
	Script = [[ bonus bMaxSP,100; ]]
},
[2253] = {
	AegisName = "Sunflower",
	Name = "Sunflower",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 37,
	Script = [[ bonus2 bAddRaceTolerance,RC_Insect,10; ]]
},
[2254] = {
	AegisName = "Angelic_Chain",
	Name = "Angel Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 38,
	Script = [[
		bonus bMdef,3;
		bonus bAgi,1;
		bonus bLuk,1;
		bonus2 bAddRaceTolerance,RC_Demon,3;
	]]
},
[2255] = {
	AegisName = "Satanic_Chain",
	Name = "Evil Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 39,
	Script = [[
		bonus bMdef,2;
		bonus bStr,1;
		bonus2 bAddRaceTolerance,RC_Angel,3;
	]]
},
[2256] = {
	AegisName = "Magestic_Goat",
	Name = "Magestic Goat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 9,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 41,
	Script = [[ bonus bStr,1; ]]
},
[2257] = {
	AegisName = "Snowy_Horn",
	Name = "Unicorn Horn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 42,
},
[2258] = {
	AegisName = "Sharp_Gear",
	Name = "Spiky Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 12,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 43,
},
[2259] = {
	AegisName = "Mini_Propeller",
	Name = "Mini Propeller",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 46,
},
[2260] = {
	AegisName = "Mini_Glasses",
	Name = "Mini Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 28000,
	Weight = 100,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 47,
},
[2261] = {
	AegisName = "Prontera_Army_Cap",
	Name = "Army Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 8,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 48,
},
[2262] = {
	AegisName = "Pierrot_Nose",
	Name = "Clown Nose",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 49,
},
[2263] = {
	AegisName = "Gangster_Patch",
	Name = "Zorro Masque",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 50,
},
[2264] = {
	AegisName = "Munak_Turban",
	Name = "Munak Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 51,
	Script = [[ bonus2 bAddRaceTolerance,RC_Undead,10; ]]
},
[2265] = {
	AegisName = "Ganster_Mask",
	Name = "Gangster Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 52,
	Script = [[ bonus2 bResEff,Eff_Silence,1500; ]]
},
[2266] = {
	AegisName = "Iron_Cane",
	Name = "Iron Cain",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 4,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_HEAD_LOW",
	EquipLv = 50,
	Refine = false,
	ViewSprite = 53,
},
[2267] = {
	AegisName = "Cigar",
	Name = "Cigarette",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 54,
	Script = [[ bonus2 bAddRaceTolerance,RC_Insect,3; ]]
},
[2268] = {
	AegisName = "Smoking_Pipe",
	Name = "Pipe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 55,
	Script = [[ bonus2 bAddRaceTolerance,RC_Insect,3; ]]
},
[2269] = {
	AegisName = "Centimental_Flower",
	Name = "Romantic Flower",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 56,
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,3; ]]
},
[2270] = {
	AegisName = "Centimental_Leaf",
	Name = "Romantic Leaf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 57,
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,3; ]]
},
[2271] = {
	AegisName = "Jack_A_Dandy",
	Name = "Jack be Dandy",
	Type = "IT_TYPE_ARMOR",
	Buy = 45000,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 58,
},
[2272] = {
	AegisName = "Stop_Post",
	Name = "Stop Post",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 59,
},
[2273] = {
	AegisName = "Doctor_Cap",
	Name = "Doctor Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 60,
	Script = [[ bonus bInt,1; ]]
},
[2274] = {
	AegisName = "Ghost_Bandana",
	Name = "Ghost Bandana",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 61,
	Script = [[ bonus bAgi,2; ]]
},
[2275] = {
	AegisName = "Red_Bandana",
	Name = "Red Bandana",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 62,
},
[2276] = {
	AegisName = "Eagle_Eyes",
	Name = "Angled Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 63,
},
[2277] = {
	AegisName = "Nurse_Cap",
	Name = "Nurse Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 64,
	Script = [[ bonus bInt,1; ]]
},
[2278] = {
	AegisName = "Mr_Smile",
	Name = "Mr. Smile",
	Type = "IT_TYPE_ARMOR",
	Buy = 60,
	Weight = 100,
	Def = 1,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 65,
},
[2279] = {
	AegisName = "Bomb_Wick",
	Name = "Bomb Wick",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 66,
},
[2280] = {
	AegisName = "Sahkkat",
	Name = "Sakkat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 67,
	Script = [[ bonus bAgi,1; ]]
},
[2281] = {
	AegisName = "Phantom_Of_Opera",
	Name = "Opera Masque",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 68,
},
[2282] = {
	AegisName = "Spirit_Chain",
	Name = "Halo",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 69,
	Script = [[ bonus2 bSubEle,Ele_Holy,15; ]]
},
[2283] = {
	AegisName = "Ear_Mufs",
	Name = "Ear Muffs",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 70,
	Script = [[ bonus2 bResEff,Eff_Curse,1000; ]]
},
[2284] = {
	AegisName = "Antler",
	Name = "Antlers",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 71,
},
[2285] = {
	AegisName = "Apple_Of_Archer",
	Name = "Apple of Archer",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	ViewSprite = 72,
	Script = [[ bonus bDex,3; ]]
},
[2286] = {
	AegisName = "Elven_Ears",
	Name = "Elven Ears",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	EquipLv = 70,
	Refine = false,
	ViewSprite = 73,
},
[2287] = {
	AegisName = "Pirate_Bandana",
	Name = "Pirate Bandana",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 74,
	Script = [[ bonus bStr,1; ]]
},
[2288] = {
	AegisName = "Mr_Scream",
	Name = "Mr. Scream",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 75,
},
[2289] = {
	AegisName = "Poo_Poo_Hat",
	Name = "Poo Poo Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 76,
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,10; ]]
},
[2290] = {
	AegisName = "Funeral_Costume",
	Name = "Funeral Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 3000,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 77,
},
[2291] = {
	AegisName = "Masquerade",
	Name = "Masquerade",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 78,
	Script = [[ bonus2 bAddRace,RC_DemiPlayer,3; ]]
},
[2292] = {
	AegisName = "Welding_Mask",
	Name = "Welding Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 2,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	EquipLv = 50,
	Refine = false,
	ViewSprite = 79,
	Script = [[ bonus2 bSubEle,Ele_Fire,10; ]]
},
[2293] = {
	AegisName = "Pretend_Murdered",
	Name = "Pretend Murdered",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 80,
},
[2294] = {
	AegisName = "Star_Dust",
	Name = "Stellar",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 81,
},
[2295] = {
	AegisName = "Blinker",
	Name = "Blinker",
	Type = "IT_TYPE_ARMOR",
	Buy = 1500,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 82,
	Script = [[ bonus2 bResEff,Eff_Blind,10000; ]]
},
[2296] = {
	AegisName = "Binoculars",
	Name = "Binoculars",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_HEAD_MID",
	EquipLv = 50,
	Refine = false,
	ViewSprite = 83,
	Script = [[ bonus bDex,1; ]]
},
[2297] = {
	AegisName = "Goblini_Mask",
	Name = "Goblin Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 84,
},
[2298] = {
	AegisName = "Green_Feeler",
	Name = "Green Feeler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 85,
},
[2299] = {
	AegisName = "Viking_Helm",
	Name = "Orc Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 9,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 86,
},

--== Armors ================================================
[2301] = {
	AegisName = "Cotton_Shirt",
	Name = "Cotton Shirt",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 100,
	Def = 10,
	Loc = "EQP_ARMOR",
},
[2302] = {
	AegisName = "Cotton_Shirt_",
	Name = "Cotton Shirt",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 100,
	Def = 10,
	Slots = 1,
	Loc = "EQP_ARMOR",
},
[2303] = {
	AegisName = "Leather_Jacket",
	Name = "Jacket",
	Type = "IT_TYPE_ARMOR",
	Buy = 200,
	Weight = 200,
	Def = 15,
	Loc = "EQP_ARMOR",
},
[2304] = {
	AegisName = "Leather_Jacket_",
	Name = "Jacket",
	Type = "IT_TYPE_ARMOR",
	Buy = 200,
	Weight = 200,
	Def = 15,
	Slots = 1,
	Loc = "EQP_ARMOR",
},
[2305] = {
	AegisName = "Adventure_Suit",
	Name = "Adventurer's Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 300,
	Def = 20,
	Loc = "EQP_ARMOR",
},
[2306] = {
	AegisName = "Adventureres_Suit_",
	Name = "Adventurer's Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 300,
	Def = 20,
	Slots = 1,
	Loc = "EQP_ARMOR",
},
[2307] = {
	AegisName = "Mantle",
	Name = "Mantle",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 600,
	Def = 37,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
},
[2308] = {
	AegisName = "Mantle_",
	Name = "Mantle",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 600,
	Def = 37,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
},
[2309] = {
	AegisName = "Coat",
	Name = "Coat",
	Type = "IT_TYPE_ARMOR",
	Buy = 22000,
	Weight = 1200,
	Def = 42,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
},
[2310] = {
	AegisName = "Coat_",
	Name = "Coat",
	Type = "IT_TYPE_ARMOR",
	Buy = 22000,
	Weight = 1200,
	Def = 42,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
},
[2311] = {
	AegisName = "Mink_Coat",
	Name = "Mink Coat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2300,
	Def = 30,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 30,
},
[2312] = {
	AegisName = "Padded_Armor",
	Name = "Padded Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 48000,
	Weight = 2800,
	Def = 35,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
},
[2313] = {
	AegisName = "Padded_Armor_",
	Name = "Padded Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 48000,
	Weight = 2800,
	Def = 35,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
},
[2314] = {
	AegisName = "Chain_Mail",
	Name = "Chain Mail",
	Type = "IT_TYPE_ARMOR",
	Buy = 65000,
	Weight = 3300,
	Def = 55,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
},
[2315] = {
	AegisName = "Chain_Mail_",
	Name = "Chain Mail",
	Type = "IT_TYPE_ARMOR",
	Buy = 65000,
	Weight = 3300,
	Def = 55,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
},
[2316] = {
	AegisName = "Plate_Armor",
	Name = "Full Plate",
	Type = "IT_TYPE_ARMOR",
	Buy = 80000,
	Weight = 4500,
	Def = 70,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 40,
},
[2317] = {
	AegisName = "Plate_Armor_",
	Name = "Full Plate",
	Type = "IT_TYPE_ARMOR",
	Buy = 80000,
	Weight = 4500,
	Def = 70,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 40,
},
[2318] = {
	AegisName = "Clothes_Of_The_Lord",
	Name = "Lord's Clothes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2500,
	Def = 59,
	Slots = 1,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 70,
	Script = [[
		bonus bMdef,5;
		bonus bInt,1;
	]]
},
[2319] = {
	AegisName = "Glittering_Clothes",
	Name = "Glittering Jacket",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2500,
	Def = 58,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 60,
	Script = [[
		bonus bMdef,5;
		bonus2 bAddEff,Eff_Blind,300;
	]]
},
[2320] = {
	AegisName = "Formal_Suit",
	Name = "Formal Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 40,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
},
[2321] = {
	AegisName = "Silk_Robe",
	Name = "Silk Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 8000,
	Weight = 400,
	Def = 20,
	Job = {
		Swordsman = true,
		Magician = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Alchemist = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMdef,10; ]]
},
[2322] = {
	AegisName = "Silk_Robe_",
	Name = "Silk Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 8000,
	Weight = 400,
	Def = 20,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Acolyte = true,
		Merchant = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Alchemist = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMdef,10; ]]
},
[2323] = {
	AegisName = "Scapulare",
	Name = "Scapulare",
	Type = "IT_TYPE_ARMOR",
	Buy = 6500,
	Weight = 400,
	Def = 24,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMOR",
},
[2324] = {
	AegisName = "Scapulare_",
	Name = "Scapulare",
	Type = "IT_TYPE_ARMOR",
	Buy = 6500,
	Weight = 400,
	Def = 24,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMOR",
},
[2325] = {
	AegisName = "Saint_Robe",
	Name = "Saint's Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 54000,
	Weight = 600,
	Def = 50,
	Job = {
		Acolyte = true,
		Merchant = true,
		Priest = true,
		Blacksmith = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMdef,5; ]]
},
[2326] = {
	AegisName = "Saint_Robe_",
	Name = "Saint's Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 54000,
	Weight = 600,
	Def = 50,
	Slots = 1,
	Job = {
		Acolyte = true,
		Merchant = true,
		Priest = true,
		Blacksmith = true,
		Monk = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMdef,5; ]]
},
[2327] = {
	AegisName = "Holy_Robe",
	Name = "Holy Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1700,
	Def = 57,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 60,
	Script = [[
		bonus bMdef,5;
		bonus2 bAddRaceTolerance,RC_Demon,15;
		bonus2 bSubEle,Ele_Dark,10;
	]]
},
[2328] = {
	AegisName = "Wooden_Mail",
	Name = "Wooden Mail",
	Type = "IT_TYPE_ARMOR",
	Buy = 5500,
	Weight = 1000,
	Def = 25,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
},
[2329] = {
	AegisName = "Wooden_Mail_",
	Name = "Wooden Mail",
	Type = "IT_TYPE_ARMOR",
	Buy = 5500,
	Weight = 1000,
	Def = 25,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
},
[2330] = {
	AegisName = "Tights",
	Name = "Tights",
	Type = "IT_TYPE_ARMOR",
	Buy = 71000,
	Weight = 500,
	Def = 27,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDex,1; ]]
},
[2331] = {
	AegisName = "Tights_",
	Name = "Tights",
	Type = "IT_TYPE_ARMOR",
	Buy = 71000,
	Weight = 500,
	Def = 27,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDex,1; ]]
},
[2332] = {
	AegisName = "Silver_Robe",
	Name = "Silver Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 7000,
	Weight = 700,
	Def = 23,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
},
[2333] = {
	AegisName = "Silver_Robe_",
	Name = "Silver Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 7000,
	Weight = 700,
	Def = 23,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
},
[2334] = {
	AegisName = "Mage_Coat",
	Name = "Mage Coat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 40,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 50,
	Script = [[
		bonus bMdef,5;
		bonus bInt,1;
	]]
},
[2335] = {
	AegisName = "Thief_Clothes",
	Name = "Thief Clothes",
	Type = "IT_TYPE_ARMOR",
	Buy = 74000,
	Weight = 100,
	Def = 40,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bAgi,1; ]]
},
[2336] = {
	AegisName = "Thief_Clothes_",
	Name = "Thief Clothes",
	Type = "IT_TYPE_ARMOR",
	Buy = 74000,
	Weight = 100,
	Def = 40,
	Slots = 1,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bAgi,1; ]]
},
[2337] = {
	AegisName = "Ninja_Suit",
	Name = "Ninja Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1500,
	Def = 58,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 50,
	Script = [[
		bonus bAgi,1;
		bonus bMdef,3;
	]]
},
[2338] = {
	AegisName = "Wedding_Dress",
	Name = "Wedding Dress",
	Type = "IT_TYPE_ARMOR",
	Buy = 43000,
	Weight = 500,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMdef,15; ]]
},
[2339] = {
	AegisName = "G_Strings",
	Name = "Pantie",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 100,
	Def = 22,
	Loc = "EQP_ARMOR",
},
[2340] = {
	AegisName = "Novice_Breast",
	Name = "Novice Breastplate",
	Type = "IT_TYPE_ARMOR",
	Buy = 89000,
	Weight = 500,
	Def = 32,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 10,
},
[2341] = {
	AegisName = "Full_Plate_Armor",
	Name = "Legion Plate Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 94000,
	Weight = 5500,
	Def = 79,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 70,
},
[2342] = {
	AegisName = "Full_Plate_Armor_",
	Name = "Legion Plate Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 102500,
	Weight = 5500,
	Def = 79,
	Slots = 1,
	Job = {
		Crusader = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 70,
},
[2343] = {
	AegisName = "Robe_Of_Casting",
	Name = "Robe of Cast",
	Type = "IT_TYPE_ARMOR",
	Buy = 124800,
	Weight = 1100,
	Def = 40,
	Job = {
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 75,
	Script = [[
		bonus bVariableCastrate,-3;
		bonus bMdef,4;
	]]
},
[2344] = {
	AegisName = "Flame_Sprits_Armor",
	Name = "Lucius's Fierce Armor of Volcano",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Fire; ]]
},
[2345] = {
	AegisName = "Flame_Sprits_Armor_",
	Name = "Lucius's Fierce Armor of Volcano",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Fire; ]]
},
[2346] = {
	AegisName = "Water_Sprits_Armor",
	Name = "Saphien's Armor of Ocean",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Water; ]]
},
[2347] = {
	AegisName = "Water_Sprits_Armor_",
	Name = "Saphien's Armor of Ocean",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Water; ]]
},
[2348] = {
	AegisName = "Wind_Sprits_Armor",
	Name = "Aebecee's Raging Typhoon Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Wind; ]]
},
[2349] = {
	AegisName = "Wind_Sprits_Armor_",
	Name = "Aebecee's Raging Typhoon Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Wind; ]]
},
[2350] = {
	AegisName = "Earth_Sprits_Armor",
	Name = "Claytos Cracking Earth Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Earth; ]]
},
[2351] = {
	AegisName = "Earth_Sprits_Armor_",
	Name = "Claytos Cracking Earth Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 136000,
	Weight = 2200,
	Def = 25,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 45,
	Script = [[ bonus bDefEle,Ele_Earth; ]]
},
[2352] = {
	AegisName = "Novice_Plate",
	Name = "Tattered Novice Ninja Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 1,
	Def = 25,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2353] = {
	AegisName = "Odins_Blessing",
	Name = "Odin's Blessing",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 2500,
	Def = 53,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 65,
},
[2354] = {
	AegisName = "Goibnes_Armor",
	Name = "Goibne's Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 50000,
	Weight = 3500,
	Def = 58,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 54,
	Script = [[
		bonus bVit,2;
		bonus bMaxHPrate,10;
	]]
},
[2355] = {
	AegisName = "Angels_Protection",
	Name = "Angelic Protection",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 600,
	Def = 25,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 40,
	Script = [[ bonus bMdef,20; ]]
},
[2356] = {
	AegisName = "Vestment_Of_Grace",
	Name = "Blessed Holy Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2500,
	Def = 45,
	Slots = 1,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 70,
	Script = [[
		bonus bMdef,5;
		bonus2 bResEff,Eff_Blind,8000;
	]]
},
[2357] = {
	AegisName = "Valkyrie_Armor",
	Name = "Valkyrian Armor",
	Type = "IT_TYPE_ARMOR",
	Weight = 2800,
	Def = 55,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bAllStats,1;
		bonus bUnbreakableArmor,0;
		if(BaseClass==Job_Mage||BaseClass==Job_Archer||BaseClass==Job_Acolyte) bonus2 bResEff,Eff_Silence,5000;
		else if(BaseClass==Job_Swordman||BaseClass==Job_Merchant||BaseClass==Job_Thief) bonus2 bResEff,Eff_Stun,5000;
	]]
},
[2358] = {
	AegisName = "Dress_Of_Angel",
	Name = "Angel's Dress",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 5,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bLuk,4; ]]
},
[2359] = {
	AegisName = "Ninja_Suit_",
	Name = "Ninja Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1500,
	Def = 58,
	Slots = 1,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 50,
	Script = [[
		bonus bAgi,1;
		bonus bMdef,3;
	]]
},
[2360] = {
	AegisName = "Robe_Of_Casting_",
	Name = "Robe of Cast",
	Type = "IT_TYPE_ARMOR",
	Buy = 124800,
	Weight = 1100,
	Def = 40,
	Slots = 1,
	Job = {
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 75,
	Script = [[
		bonus bVariableCastrate,-3;
		bonus bMdef,4;
	]]
},
[2361] = {
	AegisName = "Blue_Aodai",
	Name = "Blue Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bStr,5;
		bonus bInt,5;
		bonus bVit,5;
		bonus bDex,5;
		bonus bAgi,5;
		bonus bLuk,5;
		bonus bMdef,5;
	]]
},
[2362] = {
	AegisName = "Red_Aodai",
	Name = "Red Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bStr,5;
		bonus bInt,5;
		bonus bVit,5;
		bonus bDex,5;
		bonus bAgi,5;
		bonus bLuk,5;
		bonus bMdef,5;
	]]
},
[2363] = {
	AegisName = "White_Aodai",
	Name = "White Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bStr,3;
		bonus bInt,3;
		bonus bVit,3;
		bonus bDex,3;
		bonus bAgi,3;
		bonus bLuk,3;
		bonus bMdef,5;
	]]
},
[2364] = {
	AegisName = "Meteo_Plate_Armor",
	Name = "Meteo Plate Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3000,
	Def = 85,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 55,
	Script = [[
		bonus2 bResEff,Eff_Stun,3000;
		bonus2 bResEff,Eff_Freeze,3000;
	]]
},
[2365] = {
	AegisName = "Orleans_Gown",
	Name = "Orleans's Gown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 15,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 55,
	Script = [[
		bonus bVariableCastrate,15;
		bonus bNoCastCancel,0;
	]]
},
[2366] = {
	AegisName = "Divine_Cloth",
	Name = "Divine Cloth",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1500,
	Def = 50,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 55,
	Script = [[
		bonus2 bResEff,Eff_Curse,500;
		bonus2 bResEff,Eff_Silence,500;
		bonus2 bResEff,Eff_Stun,500;
		bonus2 bResEff,Eff_Stone,500;
		bonus2 bResEff,Eff_Sleep,500;
	]]
},
[2367] = {
	AegisName = "Sniping_Suit",
	Name = "Sniping Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 750,
	Def = 42,
	Slots = 1,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 50,
	Script = [[
		bonus bMdef,5;
		bonus bCritical,6+(readparam(bLuk)/10);
		bonus bDelayrate,-23;
	]]
},
[2368] = {
	AegisName = "Golden_Armor",
	Name = "Golden Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Def = 4,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMdef,4; ]]
},
[2369] = {
	AegisName = "Freyja_Overcoat",
	Name = "Freyja Overcoat",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Def = 12,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableArmor,0;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,10;
	]]
},
[2370] = {
	AegisName = "Used_Mage_Coat",
	Name = "Used Mage Coat",
	Type = "IT_TYPE_ARMOR",
	Def = 15,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,300;
		bonus bMaxSP,30;
		bonus bBaseAtk,10;
		bonus bAgi,1;
	]]
},
[2371] = {
	AegisName = "G_Strings_",
	Name = "Pantie",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 100,
	Def = 22,
	Slots = 1,
	Loc = "EQP_ARMOR",
},
[2372] = {
	AegisName = "Mage_Coat_",
	Name = "Mage Coat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 40,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 50,
	Script = [[
		bonus bMdef,5;
		bonus bInt,1;
	]]
},
[2373] = {
	AegisName = "Holy_Robe_",
	Name = "Holy Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1700,
	Def = 57,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 60,
	Script = [[
		bonus bMdef,5;
		bonus2 bAddRaceTolerance,RC_Demon,15;
		bonus2 bSubEle,Ele_Dark,10;
	]]
},
[2374] = {
	AegisName = "Diabolus_Robe",
	Name = "Diabolus Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 57,
	Slots = 1,
	Job = {
		Magician = true,
		Archer = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Hunter = true,
		Monk = true,
		Sage = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 60,
	Script = [[
		bonus bMaxSP,150;
		bonus bMdef,5;
		bonus bHealPower,6;
		bonus bDelayrate,-10;
	]]
},
[2375] = {
	AegisName = "Diabolus_Armor",
	Name = "Diabolus Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 79,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 60,
	Script = [[
		bonus bStr,2;
		bonus bDex,1;
		bonus bMaxHP,150;
		bonus2 bResEff,Eff_Stun,500;
		bonus2 bResEff,Eff_Stone,500;
	]]
},
[2376] = {
	AegisName = "Assaulter_Plate",
	Name = "Assaulter Plate",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 57,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2377] = {
	AegisName = "Elite_Engineer_Armor",
	Name = "Elite Engineer Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 50,
	Slots = 1,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2378] = {
	AegisName = "Assassin_Robe",
	Name = "Assassin Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 41,
	Slots = 1,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2379] = {
	AegisName = "Warlock_Battle_Robe",
	Name = "Warlock's Battle Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 36,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2380] = {
	AegisName = "Medic_Robe",
	Name = "Medic's Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 25,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2381] = {
	AegisName = "Elite_Archer_Suit",
	Name = "Elite Archer Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 35,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2382] = {
	AegisName = "Elite_Shooter_Suit",
	Name = "Elite Shooter Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 25,
	Slots = 1,
	Job = {
		Gunslinger = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_ARMOR",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,150;
		bonus bMdef,2;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,2;
	]]
},
[2383] = {
	AegisName = "Brynhild",
	Name = "Brynhild",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 120,
	Loc = "EQP_ARMOR",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bMdef,10;
		bonus bMaxHP,20*BaseLevel;
		bonus bMaxSP,5*BaseLevel;
		bonus2 bAddRace, RC_All, 10;
		bonus bMatkRate,10;
		bonus bUnbreakableArmor,0;
		bonus bNoKnockback,0;
	]]
},
[2384] = {
	AegisName = "Spritual_Tunic",
	Name = "Spritual Tunic",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 38,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus bMaxHP,800;
		bonus2 bResEff,Eff_Freeze,10000;
		bonus2 bSubEle,Ele_Earth,20;
		bonus2 bSubEle,Ele_Fire,20;
		bonus2 bSubEle,Ele_Wind,20;
		bonus2 bSubEle,Ele_Poison,20;
		bonus2 bSubEle,Ele_Holy,20;
		bonus2 bSubEle,Ele_Dark,20;
		bonus2 bSubEle,Ele_Ghost,20;
		bonus2 bSubEle,Ele_Undead,20;
	]]
},
[2385] = {
	AegisName = "Recuperative_Armor",
	Name = "Recuperative Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 67,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bNoRegen,1;
		bonus bNoRegen,2;
		bonus bHPGainValue,60;
		bonus bSPGainValue,6;
		bonus bMagicHPGainValue,60;
		bonus bMagicSPGainValue,6;
	]],
	OnUnequipScript = [[ heal 0,-100; ]]
},
[2386] = {
	AegisName = "Chameleon_Armor",
	Name = "Chameleon Armor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1700,
	Def = 55,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 70,
	Script = [[
		bonus bMaxHP,(BaseLevel*7);
		bonus bMaxSP,(BaseLevel/2);
		autobonus2 "{ bonus bNoMagicDamage,100; }",10,2000,BF_MAGIC,"{ specialeffect(EF_ENERGYCOAT, AREA, playerattached()); }";
		if( BaseClass==Job_Mage||BaseClass==Job_Archer||BaseClass==Job_Acolyte ) bonus bMdef,5;
		else if( BaseClass==Job_Swordman||BaseClass==Job_Merchant||BaseClass==Job_Thief ) bonus bDef,3;
	]]
},
[2387] = {
	AegisName = "Sprint_Mail",
	Name = "Sprint Mail",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 20,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bVit,1;
		bonus bHPrecovRate,5;
		bonus bAddItemHealRate,3;
		bonus2 bSkillHeal,AL_HEAL,3;
	]]
},
[2388] = {
	AegisName = "Kandura",
	Name = "Kandura",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 36,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 70,
	Script = [[
		bonus bAgi,1;
		bonus bFlee,5;
		bonus bAspdRate,2;
	]]
},
[2389] = {
	AegisName = "Armor_Of_Naga",
	Name = "Armor of Naga",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 45,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMdef,2;
		autobonus "{ bonus bBaseAtk,20; }",10,10000,BF_WEAPON,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
	]]
},
[2390] = {
	AegisName = "Improved_Tights",
	Name = "Improved Tights",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 38,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 75,
	Script = [[
		bonus bMdef,2;
		bonus bFlee2,3;
	]]
},
[2391] = {
	AegisName = "Life_Link",
	Name = "Life Link",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3500,
	Def = 75,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 82,
	Script = [[
		bonus bVit,2;
		bonus bMdef,5;
		bonus bHPrecovRate,50;
	]]
},
[2392] = {
	AegisName = "Old_Pant",
	Name = "Old Green Pantie",
	Type = "IT_TYPE_ARMOR",
	Def = 60,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus bVit,2;
		bonus bMaxHP,200;
		bonus3 bAutoSpellWhenHit,MO_CALLSPIRITS,5,20;
		bonus bMdef,1;
	]]
},
[2393] = {
	AegisName = "N_Adventurers_Suit",
	Name = "Novice Adventurer's Suit",
	Type = "IT_TYPE_ARMOR",
	Def = 45,
	Slots = 1,
	Loc = "EQP_ARMOR",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2394] = {
	AegisName = "Krieger_Suit1",
	Name = "Glorious Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 81,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,20;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,7;
	]]
},
[2395] = {
	AegisName = "Krieger_Suit2",
	Name = "Glorious Popularized Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	EquipLv = 61,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,600;
		bonus bSPrecovRate,10;
	]]
},
[2396] = {
	AegisName = "Krieger_Suit3",
	Name = "Glorious Mass-Production Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMaxHP,500; ]]
},
[2397] = {
	AegisName = "Incredible_Coat",
	Name = "Incredible Event Resignation Coat",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 900,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ARMOR",
},
[2398] = {
	AegisName = "Sniping_Suit_M",
	Name = "Sniping Suit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 750,
	Def = 5,
	Slots = 1,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	EquipLv = 50,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus bCritical,6+(readparam(bLuk)/10);
		bonus bDelayrate,-23;
	]]
},
[2399] = {
	AegisName = "Dragon_Vest",
	Name = "Dragon Vest",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 20,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMdef,3; ]]
},

--== Footgears =============================================
[2401] = {
	AegisName = "Sandals",
	Name = "Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 400,
	Weight = 200,
	Def = 5,
	Loc = "EQP_SHOES",
},
[2402] = {
	AegisName = "Sandals_",
	Name = "Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 400,
	Weight = 200,
	Def = 5,
	Slots = 1,
	Loc = "EQP_SHOES",
},
[2403] = {
	AegisName = "Shoes",
	Name = "Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 3500,
	Weight = 400,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
},
[2404] = {
	AegisName = "Shoes_",
	Name = "Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 3500,
	Weight = 400,
	Def = 10,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
},
[2405] = {
	AegisName = "Boots",
	Name = "Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 18000,
	Weight = 600,
	Def = 16,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Taekwon = true,
		Star_Gladiator = true,
		Gunslinger = true,
	},
	Loc = "EQP_SHOES",
},
[2406] = {
	AegisName = "Boots_",
	Name = "Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 18000,
	Weight = 600,
	Def = 16,
	Slots = 1,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Taekwon = true,
		Star_Gladiator = true,
		Gunslinger = true,
	},
	Loc = "EQP_SHOES",
},
[2407] = {
	AegisName = "Chrystal_Pumps",
	Name = "Crystal Pumps",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMdef,10;
		bonus bLuk,5;
	]]
},
[2408] = {
	AegisName = "Cuffs",
	Name = "Shackles",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 3000,
	Def = 18,
	Loc = "EQP_SHOES",
},
[2409] = {
	AegisName = "Spiky_Heel",
	Name = "High Heels",
	Type = "IT_TYPE_ARMOR",
	Buy = 8500,
	Weight = 600,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	Script = [[ bonus bMdef,5; ]]
},
[2410] = {
	AegisName = "Sleipnir",
	Name = "Sleipnir",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3500,
	Def = 40,
	Loc = "EQP_SHOES",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bUnbreakableShoes,0;
		bonus bMdef,10;
		bonus bMaxHPrate,20;
		bonus bMaxSPrate,20;
		bonus bSPrecovRate,25;
		bonus bSpeedRate,25;
		bonus bInt,25;
	]]
},
[2411] = {
	AegisName = "Grave",
	Name = "Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 48000,
	Weight = 750,
	Def = 27,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 65,
},
[2412] = {
	AegisName = "Grave_",
	Name = "Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 54000,
	Weight = 750,
	Def = 27,
	Slots = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 65,
},
[2413] = {
	AegisName = "Safty_Boots",
	Name = "Safety Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 34000,
	Weight = 350,
	Def = 22,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 30,
	Refine = false,
},
[2414] = {
	AegisName = "Novice_Boots",
	Name = "Novice Slippers",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 1,
	Def = 5,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2415] = {
	AegisName = "Slipper",
	Name = "Bunny Slipper",
	Type = "IT_TYPE_ARMOR",
	Buy = 34000,
	Weight = 300,
	Def = 9,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 30,
	Script = [[
		bonus bLuk,3;
		bonus bMdef,3;
	]]
},
[2416] = {
	AegisName = "Novice_Shoes",
	Name = "Novice Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 35000,
	Weight = 500,
	Def = 8,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 40,
	Script = [[ bonus bMaxHPrate,5; ]]
},
[2417] = {
	AegisName = "Fricco_Shoes",
	Name = "Fricco's Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 12,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 65,
	Script = [[
		bonus bAgi,2;
		bonus2 bAddItemHealRate,Red_Potion,20;
		bonus2 bAddItemHealRate,Yellow_Potion,20;
		bonus2 bAddItemHealRate,Orange_Potion,20;
		bonus2 bAddItemHealRate,White_Potion,20;
	]]
},
[2418] = {
	AegisName = "Vidars_Boots",
	Name = "Vidar's Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 650,
	Def = 13,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 65,
	Script = [[
		bonus bMaxHPrate,9;
		bonus bMaxSPrate,9;
	]]
},
[2419] = {
	AegisName = "Goibnes_Combat_Boots",
	Name = "Goibne's Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 700,
	Def = 13,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 54,
	Script = [[
		bonus bMdef,3;
		bonus bMaxHPrate,5;
		bonus bMaxSPrate,5;
	]]
},
[2420] = {
	AegisName = "Angels_Arrival",
	Name = "Angel's Reincarnation",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 300,
	Def = 8,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 25,
	Script = [[ bonus bMaxHP,100; ]]
},
[2421] = {
	AegisName = "Valkyrie_Shoes",
	Name = "Valkyrian Shoes",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Def = 13,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	Script = [[
		bonus bUnbreakableShoes,0;
		if(BaseClass==Job_Mage||BaseClass==Job_Archer||BaseClass==Job_Acolyte) bonus bMaxHP,(BaseLevel*5);
		else if(BaseClass==Job_Swordman||BaseClass==Job_Merchant||BaseClass==Job_Thief) bonus bMaxSP,(JobLevel*2);
	]]
},
[2422] = {
	AegisName = "High_Fashion_Sandals",
	Name = "High Fashion Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 24000,
	Weight = 200,
	Def = 7,
	Slots = 1,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 40,
	Script = [[ bonus bMdef,10; ]]
},
[2423] = {
	AegisName = "Variant_Shoes",
	Name = "Variant Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 13,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 85,
	Script = [[
		bonus bMaxHPrate,20-getrefine();
		bonus bMaxSPrate,20-getrefine();
		bonus bDef,getrefine()/2;
	]]
},
[2424] = {
	AegisName = "Tidal_Shoes",
	Name = "Tidal Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 13,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 55,
	Script = [[ bonus2 bSubEle,Ele_Water,5; ]]
},
[2425] = {
	AegisName = "Black_Leather_Boots",
	Name = "Black Leather Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 16,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 55,
	Script = [[
		bonus bAgi,1;
		if(getrefine()>=9) bonus bAgi,2;
	]]
},
[2426] = {
	AegisName = "Shadow_Walk",
	Name = "Shadow Walk",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 75,
	Script = [[
		bonus bMdef,10;
		if(getskilllv(AS_CLOAKING)<2) {
			bonus5 bAutoSpellWhenHit,AS_CLOAKING,2,100,BF_MAGIC,0;
		}
		else bonus5 bAutoSpellWhenHit,AS_CLOAKING,getskilllv(AS_CLOAKING),100,BF_MAGIC,0;
	]]
},
[2427] = {
	AegisName = "Golden_Shoes",
	Name = "Golden Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 4,
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMdef,4; ]]
},
[2428] = {
	AegisName = "Freyja_Boots",
	Name = "Freyja Boots",
	Type = "IT_TYPE_ARMOR",
	Weight = 300,
	Def = 22,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,5; ]]
},
[2429] = {
	AegisName = "Iron_Boots01",
	Name = "Iron Boots",
	Type = "IT_TYPE_ARMOR",
	Weight = 1500,
	Def = 5,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_SHOES",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2430] = {
	AegisName = "Iron_Boots02",
	Name = "Iron Boots",
	Type = "IT_TYPE_ARMOR",
	Weight = 800,
	Def = 5,
	Loc = "EQP_SHOES",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2431] = {
	AegisName = "Valley_Shoes",
	Name = "Valley Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,7;
		bonus bMaxSPrate,7;
	]]
},
[2432] = {
	AegisName = "Spiky_Heel_",
	Name = "Highheels",
	Type = "IT_TYPE_ARMOR",
	Buy = 8500,
	Weight = 600,
	Def = 10,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	Script = [[ bonus bMdef,5; ]]
},
[2433] = {
	AegisName = "Diabolus_Boots",
	Name = "Diabolus Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 250,
	Def = 15,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxHP,(BaseLevel*10); ]]
},
[2434] = {
	AegisName = "Black_Leather_Boots_",
	Name = "Black Leather Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 16,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 55,
	Script = [[
		bonus bAgi,1;
		if(getrefine()>=9) bonus bAgi,2;
	]]
},
[2435] = {
	AegisName = "Battle_Greave",
	Name = "Battle Greave",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 15,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,100;
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,1;
	]]
},
[2436] = {
	AegisName = "Combat_Boots",
	Name = "Combat Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 9,
	Slots = 1,
	Job = {
		Magician = true,
		Archer = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Hunter = true,
		Monk = true,
		Sage = true,
		Bard = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,100;
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,1;
	]]
},
[2437] = {
	AegisName = "Battle_Boots",
	Name = "Battle Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 9,
	Slots = 1,
	Job = {
		Gunslinger = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_SHOES",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,100;
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,1;
	]]
},
[2438] = {
	AegisName = "Paw_Of_Cat",
	Name = "Paw Of Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 300,
	Loc = "EQP_SHOES",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bFlee,5;
		bonus bAgi,1;
		skill ALL_CATCRY, 1;
	]]
},
[2439] = {
	AegisName = "Refresh_Shoes",
	Name = "Refresh Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 20,
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,17;
		bonus bMaxSPrate,8;
		bonus2 bHPRegenRate,20,10000;
		bonus2 bSPRegenRate,3,10000;
	]]
},
[2440] = {
	AegisName = "Sprint_Shoes",
	Name = "Sprint Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 10,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAgi,1;
		bonus bSPrecovRate,5;
	]]
},
[2441] = {
	AegisName = "Beach_Sandal",
	Name = "Beach Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
		bonus bAgi,1;
		bonus2 bSubEle,Ele_Fire,10;
	]]
},
[2442] = {
	AegisName = "Boots_Perforated",
	Name = "Red Stocking Boots",
	Type = "IT_TYPE_ARMOR",
	Def = 18,
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bLuk,2;
		bonus bHPrecovRate,10;
		bonus bSPrecovRate,10;
		bonus3 bAutoSpellWhenHit,WZ_QUAGMIRE,3,30;
		bonus bMdef,1;
	]]
},
[2443] = {
	AegisName = "Fish_Shoes",
	Name = "Fisher's Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 250,
	Loc = "EQP_SHOES",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2444] = {
	AegisName = "Krieger_Shoes1",
	Name = "Glorious Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 81,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,10;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,4;
		bonus3 bAutoSpellWhenHit,AL_INCAGI,1,10;
	]]
},
[2445] = {
	AegisName = "Krieger_Shoes2",
	Name = "Glorious Popularized Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 61,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,5;
		bonus bMaxSPrate,5;
	]]
},
[2446] = {
	AegisName = "Krieger_Shoes3",
	Name = "Glorious Mass-Production Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMaxHPrate,5; ]]
},
[2447] = {
	AegisName = "Military_Boots",
	Name = "Army Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 1000,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
},
[2448] = {
	AegisName = "Air_Boss",
	Name = "Air Boss",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Def = 2,
	Loc = "EQP_SHOES",
	Script = [[ bonus bAgi,1; ]]
},
[2449] = {
	AegisName = "Variant_Shoes_M",
	Name = "Variant Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 3,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 85,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,20-getrefine();
		bonus bMaxSPrate,20-getrefine();
		bonus bDef,getrefine()/2;
	]]
},
[2450] = {
	AegisName = "Vital_Tree_Shoes",
	Name = "Vital Tree Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 16,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 60,
	Script = [[
		bonus bMaxHPrate,10;
		bonus2 bHPRegenRate,30,10000;
		bonus bHealPower2,5;
		bonus bAddItemHealRate,5;
		bonus bMdef,3;
		bonus bVit,2;
	]]
},
[2451] = {
	AegisName = "Freyja_SSandal7",
	Name = "Freya Spirit Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 5,
	Loc = "EQP_SHOES",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bMaxHPrate,8;
		bonus bMaxSPrate,8;
	]]
},
[2452] = {
	AegisName = "Freyja_SSandal30",
	Name = "Freya Spirit Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 5,
	Loc = "EQP_SHOES",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bMaxHPrate,8;
		bonus bMaxSPrate,8;
	]]
},
[2453] = {
	AegisName = "Freyja_SSandal60",
	Name = "Freya Spirit Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 5,
	Loc = "EQP_SHOES",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bMaxHPrate,8;
		bonus bMaxSPrate,8;
	]]
},
[2454] = {
	AegisName = "Freyja_SSandal90",
	Name = "Freya Spirit Sandals",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 5,
	Loc = "EQP_SHOES",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bMaxHPrate,8;
		bonus bMaxSPrate,8;
	]]
},
[2455] = {
	AegisName = "Time_Keepr_Boots",
	Name = "Guardian Boots",
	Type = "IT_TYPE_ARMOR",
	Def = 17,
	Loc = "EQP_SHOES",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,1;
		bonus bMaxHP,100;
		bonus bHPrecovRate,10;
		bonus bSPrecovRate,10;
	]]
},
[2456] = {
	AegisName = "Para_Team_Boots1",
	Name = "Eden Group Boots I",
	Type = "IT_TYPE_ARMOR",
	Def = 14,
	Loc = "EQP_SHOES",
	EquipLv = 12,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bHPrecovRate,10;
		bonus bSPrecovRate,2;
	]]
},
[2457] = {
	AegisName = "Para_Team_Boots2",
	Name = "Eden Group Boots II",
	Type = "IT_TYPE_ARMOR",
	Def = 16,
	Loc = "EQP_SHOES",
	EquipLv = 26,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bHPrecovRate,12;
		bonus bSPrecovRate,4;
	]]
},
[2458] = {
	AegisName = "Para_Team_Boots3",
	Name = "Eden Group Boots III",
	Type = "IT_TYPE_ARMOR",
	Def = 18,
	Loc = "EQP_SHOES",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bHPrecovRate,14;
		bonus bSPrecovRate,6;
	]]
},
[2459] = {
	AegisName = "Upg_Shoes",
	Name = "Reinforcement Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 15,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2460] = {
	AegisName = "Upg_Boots",
	Name = "Reinforcement Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 21,
	Slots = 1,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Taekwon = true,
		Star_Gladiator = true,
		Gunslinger = true,
	},
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2461] = {
	AegisName = "Upg_Greave",
	Name = "Reinforcement Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 32,
	Slots = 1,
	Job = {
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2462] = {
	AegisName = "Sleipnir_C",
	Name = "Ephemeral Sleipnir",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 40,
	Loc = "EQP_SHOES",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bUnbreakableShoes,0;
		bonus bMdef,10;
		bonus bMaxHPrate,20;
		bonus bMaxSPrate,20;
		bonus bSPrecovRate,15;
		bonus bSpeedRate,25;
	]]
},
[2463] = {
	AegisName = "Feral_Boots",
	Name = "Feral Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 12,
	Loc = "EQP_SHOES",
	EquipLv = 75,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2464] = {
	AegisName = "No_Fear_Shoes",
	Name = "NoFear Shoes",
	Type = "IT_TYPE_ARMOR",
	Def = 6,
	Loc = "EQP_SHOES",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bUnbreakableShoes,0;
		bonus bStr,1;
		bonus bInt,1;
		bonus bDex,1;
		bonus bMaxHPrate,10;
		bonus bMaxSPrate,5;
		bonus2 bSubRace,RC_DemiPlayer,2;
	]]
},
[2465] = {
	AegisName = "Dance_Shoes",
	Name = "Dance Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 15,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 105,
	Script = [[
		bonus bAgi,1;
		bonus bAspdRate,2;
		bonus2 bSkillUseSP,WA_SWING_DANCE,32;
	]]
},
[2466] = {
	AegisName = "Training_Shoes",
	Name = "Training Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Loc = "EQP_SHOES",
},
[2467] = {
	AegisName = "Golden_Rod_Shoes",
	Name = "Golden Rod Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 12,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMdef,2;
		bonus bMaxHP,500;
		bonus2 bSubEle,Ele_Wind,15;
	]]
},
[2468] = {
	AegisName = "Aqua_Shoes",
	Name = "Aqua Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 12,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMdef,2;
		bonus bMaxHP,500;
		bonus2 bSubEle,Ele_Water,15;
	]]
},
[2469] = {
	AegisName = "Crimson_Shoes",
	Name = "Crimson Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 12,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMdef,2;
		bonus bMaxHP,500;
		bonus2 bSubEle,Ele_Fire,15;
	]]
},
[2470] = {
	AegisName = "Forest_Shoes",
	Name = "Forest Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 12,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMdef,2;
		bonus bMaxHP,500;
		bonus2 bSubEle,Ele_Earth,15;
	]]
},
[2471] = {
	AegisName = "Shoes_Of_Affection",
	Name = "Shoes Of Affection",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 12,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMaxHP,500;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,10;
		bonus2 bAddRaceTolerance,RC_Formless,-10;
		bonus2 bAddRaceTolerance,RC_Undead,-10;
		bonus2 bAddRaceTolerance,RC_Brute,-10;
		bonus2 bAddRaceTolerance,RC_Plant,-10;
		bonus2 bAddRaceTolerance,RC_Insect,-10;
		bonus2 bAddRaceTolerance,RC_Fish,-10;
		bonus2 bAddRaceTolerance,RC_Demon,-10;
		bonus2 bAddRaceTolerance,RC_Angel,-10;
		bonus2 bAddRaceTolerance,RC_Dragon,-10;
	]]
},
[2472] = {
	AegisName = "Shoes_Of_Judgement",
	Name = "Shoes Of Judgement",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 12,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus2 bSkillAtk,AB_JUDEX,30;
		bonus2 bSkillUseSP,AB_JUDEX,-40;
		bonus bMaxSP,150;
	]]
},
[2473] = {
	AegisName = "Para_Team_Boots4",
	Name = "Eden Group Boots IV",
	Type = "IT_TYPE_ARMOR",
	Def = 20,
	Loc = "EQP_SHOES",
	EquipLv = 60,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAgi,1;
		bonus bVit,1;
		bonus bHPrecovRate,28;
		bonus bSPrecovRate,12;
	]]
},
[2474] = {
	AegisName = "Lehmannza_Shoes",
	Name = "Lehmannza Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 3,
	Slots = 1,
	Loc = "EQP_SHOES",
	EquipLv = 60,
	Script = [[ bonus bMdef,3; ]]
},
[2475] = {
	AegisName = "Ur_Greave",
	Name = "Ur's Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Def = 32,
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMaxSP,40;
		if(getequiprefinerycnt(EQI_SHOES)>7) bonus bMaxHPrate,getequiprefinerycnt(EQI_SHOES)-7;
	]]
},
[2476] = {
	AegisName = "Peuz_Greave",
	Name = "Peuz's Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Def = 32,
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMaxSP,40;
		if (getrefine() >= 8)
			bonus bAgi, getrefine() - 7;
	]]
},
[2477] = {
	AegisName = "Sabah_Shoes",
	Name = "Sapha Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 18,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bMaxSP,30;
		bonus bLuk,3;
	]]
},
[2478] = {
	AegisName = "Nab_Shoes",
	Name = "Nab Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 18,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bFlee,3;
		bonus bInt,2;
	]]
},
[2479] = {
	AegisName = "White_Wing_Boots",
	Name = "White Wing Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 18,
	Slots = 1,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bAgi,2;
		bonus2 bSkillUseSP,RA_AIMEDBOLT,10;
	]]
},
[2480] = {
	AegisName = "Black_Wing_Boots",
	Name = "Black Wing Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 18,
	Slots = 1,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 100,
	Script = [[
		bonus bInt,2;
		bonus bMaxSPrate,5;
	]]
},
[2481] = {
	AegisName = "Rune_Boots",
	Name = "Rune Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Slots = 1,
	Loc = "EQP_SHOES",
},
[2482] = {
	AegisName = "Shoes_Of_Valor",
	Name = "Shoes Of Valor",
	Type = "IT_TYPE_ARMOR",
	Def = 4,
	Loc = "EQP_SHOES",
	Refine = false,
},
[2483] = {
	AegisName = "Siege_Greave",
	Name = "WoE Greave",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 750,
	Def = 30,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 95,
	Script = [[
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_Player,2;
	]]
},
[2484] = {
	AegisName = "Siege_Boots",
	Name = "WoE Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 500,
	Def = 20,
	Slots = 1,
	Job = {
		Swordsman = true,
		Archer = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
		Taekwon = true,
		Star_Gladiator = true,
		Gunslinger = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 95,
	Script = [[
		bonus bMdef,5;
		bonus2 bAddRaceTolerance,RC_Player,1;
	]]
},
[2485] = {
	AegisName = "Siege_Shoes",
	Name = "WoE Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 350,
	Def = 15,
	Slots = 1,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 95,
	Script = [[
		bonus bMdef,10;
		bonus2 bAddRaceTolerance,RC_Player,1;
	]]
},
[2486] = {
	AegisName = "Shadow_Walk_",
	Name = "Shadow Walker",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 75,
	Script = [[ bonus bMdef,10; ]]
},
[2487] = {
	AegisName = "Vital_Tree_Shoes_",
	Name = "Sephiroth's Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 16,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_SHOES",
	EquipLv = 60,
	Script = [[
		bonus bVit,2;
		bonus bMdef,3;
	]]
},
[2488] = {
	AegisName = "Fricco_Shoes_",
	Name = "Freyja Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 12,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 65,
	Script = [[ bonus bAgi,2; ]]
},
[2489] = {
	AegisName = "Vidars_Boots_",
	Name = "Vidar's Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 650,
	Def = 13,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 65,
},
[2491] = {
	AegisName = "Bangungot_Boots",
	Name = "Bangungot Boots of Nightmare",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMdef,getrefine();
		if(getrefine()>=14) {
			bonus bSpeedRate,25;
		}
	]]
},
[2492] = {
	AegisName = "Bayani_Bangungot_Boots",
	Name = "Bangungot Boots(Bayani)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 10,
	Slots = 1,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMdef,getrefine();
		if(getrefine()>=12) {
			bonus bSpeedRate,25;
		}
	]]
},
[2493] = {
	AegisName = "Goibnes_Combat_Boots_",
	Name = "Goibne's Greaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 700,
	Def = 13,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_SHOES",
	EquipLv = 54,
	Script = [[
		bonus bMdef,3;
		bonus bMaxHPrate,5;
		bonus bMaxSPrate,5;
	]]
},
[2494] = {
	AegisName = "Chrystal_Pumps_",
	Name = "Crystal Pumps",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMdef,10;
		bonus bLuk,5;
	]]
},
[2495] = {
	AegisName = "Egir_Shoes",
	Name = "Aegir Shoes",
	Type = "IT_TYPE_ARMOR",
	Buy = 200000,
	Weight = 300,
	Def = 13,
	Slots = 1,
	Loc = "EQP_SHOES",
	EquipLv = 110,
	Script = [[
		if (BaseClass == Job_Mage || BaseClass == Job_Archer || BaseClass == Job_Acolyte)
			bonus bMaxHP, BaseLevel * 5;
		else if (BaseClass == Job_Swordman || BaseClass == Job_Merchant || BaseClass == Job_Thief)
			bonus bMaxSP, JobLevel * 2;
	]]
},
[2496] = {
	AegisName = "TE_Woe_Shoes",
	Name = "TE WoE Shoes",
	Type = "IT_TYPE_ARMOR",
	Def = 5,
	Loc = "EQP_SHOES",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus bMaxHP,150;
		bonus bMaxSP,150;
		bonus2 bAddRace,RC_Player,5;
		bonus2 bMagicAddRace,RC_Player,5;
		bonus2 bResEff,Eff_Freeze,2500;
	]]
},
[2497] = {
	AegisName = "TE_Woe_Boots",
	Name = "TE WoE Boots",
	Type = "IT_TYPE_ARMOR",
	Def = 10,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,200;
		bonus bMaxSP,100;
		bonus2 bAddRace,RC_Player,10;
		bonus2 bResEff,Eff_Freeze,2500;
	]]
},
[2498] = {
	AegisName = "TE_Woe_Magic_Sandal",
	Name = "TE WoE Magic Sandal",
	Type = "IT_TYPE_ARMOR",
	Def = 5,
	Job = {
		Novice = true,
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_SHOES",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus bMaxHP,100;
		bonus bMaxSP,200;
		bonus2 bMagicAddRace,RC_Player,5;
		bonus2 bResEff,Eff_Freeze,2500;
	]]
},
[2499] = {
	AegisName = "Temporal_Boots",
	Name = "Temporal Boots",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 20,
	Loc = "EQP_SHOES",
	EquipLv = 10,
	Script = [[
		bonus bMaxHP,300+((getrefine()/3)*100);
		bonus bMaxSP,30+((getrefine()/3)*10);
	]]
},

--== Garments ==============================================
[2501] = {
	AegisName = "Hood",
	Name = "Hood",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 200,
	Def = 4,
	Loc = "EQP_GARMENT",
},
[2502] = {
	AegisName = "Hood_",
	Name = "Hood",
	Type = "IT_TYPE_ARMOR",
	Buy = 1000,
	Weight = 200,
	Def = 4,
	Slots = 1,
	Loc = "EQP_GARMENT",
},
[2503] = {
	AegisName = "Muffler",
	Name = "Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 400,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
},
[2504] = {
	AegisName = "Muffler_",
	Name = "Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 400,
	Def = 8,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
},
[2505] = {
	AegisName = "Manteau",
	Name = "Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 32000,
	Weight = 600,
	Def = 13,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_GARMENT",
},
[2506] = {
	AegisName = "Manteau_",
	Name = "Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 32000,
	Weight = 600,
	Def = 13,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_GARMENT",
},
[2507] = {
	AegisName = "Cape_Of_Ancient_Lord",
	Name = "Ancient Cape",
	Type = "IT_TYPE_ARMOR",
	Buy = 82000,
	Weight = 600,
	Def = 9,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 40,
	Script = [[ bonus bAgi,1; ]]
},
[2508] = {
	AegisName = "Ragamuffin_Cape",
	Name = "Ragamuffin Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 500,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bUnbreakableGarment,0;
		bonus bMdef,10;
	]]
},
[2509] = {
	AegisName = "Clack_Of_Servival",
	Name = "Survivor's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 550,
	Def = 10,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 75,
	Script = [[
		bonus bMdef,5;
		bonus bVit,10;
	]]
},
[2510] = {
	AegisName = "Novice_Hood",
	Name = "Somber Novice Hood",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 1,
	Def = 4,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bSubEle,Ele_Neutral,20; ]]
},
[2511] = {
	AegisName = "Skeletons_Cape",
	Name = "Skeleton Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 5000,
	Weight = 700,
	Def = 13,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 75,
	Script = [[
		bonus bStr,2;
		bonus bInt,-3;
		bonus bDex,2;
		bonus bVit,-3;
		bonus bLuk,2;
		bonus bAgi,-4;
	]]
},
[2512] = {
	AegisName = "Novice_Manteau",
	Name = "Novice Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 50000,
	Weight = 500,
	Def = 7,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 40,
	Script = [[ bonus2 bSubEle,Ele_Neutral,10; ]]
},
[2513] = {
	AegisName = "Celestial_Robe",
	Name = "Heavenly Maiden Robe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 18,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 80,
},
[2514] = {
	AegisName = "Pauldron",
	Name = "Pauldron",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 25,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 80,
},
[2515] = {
	AegisName = "Wing_Of_Eagle",
	Name = "Eagle Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 300,
	Def = 12,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 85,
},
[2516] = {
	AegisName = "Falcon_Robe",
	Name = "Falcon Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 400,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 65,
	Script = [[
		bonus bFlee,15;
		bonus bFlee2,5;
	]]
},
[2517] = {
	AegisName = "Valis_Manteau",
	Name = "Vali's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 600,
	Def = 13,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 65,
	Script = [[ bonus2 bSubEle,Ele_Neutral,15; ]]
},
[2518] = {
	AegisName = "Morpheuss_Shawl",
	Name = "Morpheus's Shawl",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 600,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 33,
	Script = [[
		bonus bMaxSPrate,10;
		bonus bMdef,3;
	]]
},
[2519] = {
	AegisName = "Morriganes_Manteau",
	Name = "Morrigane's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 600,
	Def = 9,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 61,
	Script = [[
		bonus bLuk,2;
		bonus bFlee2,8;
	]]
},
[2520] = {
	AegisName = "Goibnes_Shoulder_Arms",
	Name = "Goibne's Spaulders",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 700,
	Def = 11,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 54,
	Script = [[
		bonus bLongAtkDef,10;
		bonus bMdef,2;
		bonus bVit,1;
	]]
},
[2521] = {
	AegisName = "Angels_Warmth",
	Name = "Angelic Cardigan",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 400,
	Def = 6,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 20,
	Script = [[ bonus bHPrecovRate,5; ]]
},
[2522] = {
	AegisName = "Undershirt",
	Name = "Undershirt",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 150,
	Def = 5,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMdef,1; ]]
},
[2523] = {
	AegisName = "Undershirt_",
	Name = "Undershirt",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 150,
	Def = 5,
	Slots = 1,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMdef,1; ]]
},
[2524] = {
	AegisName = "Valkyrie_Manteau",
	Name = "Valkyrian Manteau",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Def = 10,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bUnbreakableGarment,0;
		if(BaseClass==Job_Mage||BaseClass==Job_Archer||BaseClass==Job_Acolyte) bonus bFlee2,5+(getequiprefinerycnt(EQI_GARMENT)*2);
		else if(BaseClass==Job_Swordman||BaseClass==Job_Merchant||BaseClass==Job_Thief) bonus bShortWeaponDamageReturn,5+(getequiprefinerycnt(EQI_GARMENT)*2);
	]]
},
[2525] = {
	AegisName = "Cape_Of_Ancient_Lord_",
	Name = "Ancient Cape",
	Type = "IT_TYPE_ARMOR",
	Buy = 82000,
	Weight = 600,
	Def = 9,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 40,
	Script = [[ bonus bAgi,1; ]]
},
[2526] = {
	AegisName = "Dragon_Scale_Coat",
	Name = "Coat of Dragon Scale",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 10,
	Def = 14,
	Loc = "EQP_GARMENT",
	EquipLv = 50,
	Script = [[ bonus bMaxHP,300; ]]
},
[2527] = {
	AegisName = "Dragon_Breath",
	Name = "Dragon Breath",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 16,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 48,
	Script = [[ bonus2 bAddRaceTolerance,RC_Dragon,15; ]]
},
[2528] = {
	AegisName = "Wool_Scarf",
	Name = "Wool Scarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 11,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 55,
	Script = [[ bonus bMdef,4; ]]
},
[2529] = {
	AegisName = "Rider_Insignia",
	Name = "Rider Insignia",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 13,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 55,
	Script = [[ bonus bAgi,2; ]]
},
[2530] = {
	AegisName = "Rider_Insignia_",
	Name = "Rider Insignia",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 13,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 55,
	Script = [[ bonus bAgi,2; ]]
},
[2531] = {
	AegisName = "Ulfhedinn",
	Name = "Ulfhedinn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 13,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 70,
	Script = [[ bonus3 bAutoSpellWhenHit,NPC_STONESKIN,6,20; ]]
},
[2532] = {
	AegisName = "Mithril_Magic_Cape",
	Name = "Mithril Magic Cape",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 8,
	Slots = 1,
	Job = {
		Magician = true,
		Archer = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Hunter = true,
		Monk = true,
		Sage = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 70,
	Script = [[
		bonus bMdef,3;
		bonus5 bAutoSpellWhenHit,NPC_ANTIMAGIC,1,200,BF_MAGIC,0;
	]]
},
[2533] = {
	AegisName = "Freyja_Cape",
	Name = "Freyja Cape",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,15; ]]
},
[2534] = {
	AegisName = "Ruffler",
	Name = "Ruffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 10,
	Loc = "EQP_GARMENT",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSubEle,Ele_Neutral,17;
		bonus bFlee,17;
	]]
},
[2535] = {
	AegisName = "Cloak_Of_Survival_C",
	Name = "Cloak Of Survival",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 17,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_GARMENT",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bVit,10;
		bonus bMdef,10;
	]]
},
[2536] = {
	AegisName = "Skin_Of_Ventus",
	Name = "Skin of Ventus",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 250,
	Def = 7,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 60,
	Script = [[
		bonus bMdef,2;
		bonus bMaxHP,200;
		bonus bFlee,10;
	]]
},
[2537] = {
	AegisName = "Diabolus_Manteau",
	Name = "Diabolus Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 250,
	Def = 15,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Neutral,5;
		bonus bMaxHP,100;
		bonus2 bAddDamageClass,1916,10;
		bonus2 bAddDamageClass,1917,10;
	]]
},
[2538] = {
	AegisName = "Commander_Manteau",
	Name = "Captain's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 28,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,50;
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,1;
	]]
},
[2539] = {
	AegisName = "Commander_Manteau_",
	Name = "Commander's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 20,
	Slots = 1,
	Job = {
		Magician = true,
		Archer = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Hunter = true,
		Monk = true,
		Sage = true,
		Bard = true,
		Soul_Linker = true,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,50;
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,1;
	]]
},
[2540] = {
	AegisName = "Sheriff_Manteau",
	Name = "Sheriff's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Def = 20,
	Slots = 1,
	Job = {
		Gunslinger = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_GARMENT",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,50;
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,1;
	]]
},
[2541] = {
	AegisName = "Asprika",
	Name = "Asprika",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 40,
	Loc = "EQP_GARMENT",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bMdef,5;
		bonus3 bSubEle,Ele_Neutral,30,BF_SHORT;
		bonus3 bSubEle,Ele_Water,30,BF_SHORT;
		bonus3 bSubEle,Ele_Earth,30,BF_SHORT;
		bonus3 bSubEle,Ele_Fire,30,BF_SHORT;
		bonus3 bSubEle,Ele_Wind,30,BF_SHORT;
		bonus3 bSubEle,Ele_Poison,30,BF_SHORT;
		bonus3 bSubEle,Ele_Holy,30,BF_SHORT;
		bonus3 bSubEle,Ele_Dark,30,BF_SHORT;
		bonus3 bSubEle,Ele_Ghost,30,BF_SHORT;
		bonus3 bSubEle,Ele_Undead,30,BF_SHORT;
		bonus bFlee,30;
		skill AL_TELEPORT,1;
		bonus bUnbreakableGarment,0;
	]]
},
[2542] = {
	AegisName = "Flame_Manteau",
	Name = "Flame Manteau of Naght Sieger",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 16,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 70,
	Script = [[
		bonus bMaxHPrate,5;
		bonus bMdef,2;
		bonus bMatkRate,1;
		bonus2 bAddEle,Ele_Fire,2;
	]]
},
[2543] = {
	AegisName = "Sylphid_Manteau",
	Name = "Sylphid Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 33,
	Loc = "EQP_GARMENT",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bFlee,13;
		bonus2 bSubEle,Ele_Neutral,13;
		bonus bFlee2,1;
	]]
},
[2544] = {
	AegisName = "Leather_Of_Tendrilion",
	Name = "Leather of Tendrilion",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 14,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Water,5;
		bonus2 bSubEle,Ele_Earth,5;
		bonus2 bAddRaceTolerance,RC_Plant,5;
		bonus2 bAddRaceTolerance,RC_Brute,5;
	]]
},
[2545] = {
	AegisName = "Musika",
	Name = "Musika",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 10,
	Slots = 1,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 70,
	Script = [[
		bonus bMdef,3;
		bonus3 bAutoSpellWhenHit,AL_HEAL,max(getskilllv(AL_HEAL),1),20;
	]]
},
[2546] = {
	AegisName = "Beach_Manteau",
	Name = "Beach Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Slots = 1,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
		bonus2 bSubEle,Ele_Fire,10;
	]]
},
[2547] = {
	AegisName = "Cheap_Running_Shirts",
	Name = "Cheap Undershirt",
	Type = "IT_TYPE_ARMOR",
	Def = 11,
	Loc = "EQP_GARMENT",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus bFlee,10;
		bonus2 bSubEle,Ele_Neutral,10;
		bonus bMdef,1;
	]]
},
[2548] = {
	AegisName = "Muffler_C",
	Name = "Neo Muffler",
	Type = "IT_TYPE_ARMOR",
	Def = 22,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 95,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bSubRace,RC_DemiPlayer,10;
		bonus bMaxHPrate,10;
		bonus2 bSubEle,Ele_Water,5;
		bonus2 bSubEle,Ele_Fire,5;
		bonus2 bSubEle,Ele_Holy,5;
		bonus2 bSubEle,Ele_Dark,5;
	]]
},
[2549] = {
	AegisName = "Krieger_Muffler1",
	Name = "Glorious Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 80,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHPrate,5;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,5;
	]]
},
[2550] = {
	AegisName = "Fishers_Muffler",
	Name = "Fisher's Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Loc = "EQP_GARMENT",
},
[2551] = {
	AegisName = "Rider_Insignia_M",
	Name = "Crest of the Rider",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 55,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAgi,2; ]]
},
[2552] = {
	AegisName = "Mithril_Magic_Cape_M",
	Name = "Mithril Magic Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 3,
	Slots = 1,
	Job = {
		Magician = true,
		Archer = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Hunter = true,
		Monk = true,
		Sage = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 70,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,3;
		bonus5 bAutoSpellWhenHit,NPC_ANTIMAGIC,1,200,BF_MAGIC,0;
	]]
},
[2553] = {
	AegisName = "Dragon_Manteau",
	Name = "Dragon Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 14,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bAgi,1;
		bonus bMdef,5;
	]]
},
[2554] = {
	AegisName = "Piece_Of_Angent_Skin",
	Name = "Nidhoggur's Shadow Garb",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 25,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 90,
	Script = [[
		bonus2 bSubEle,Ele_Neutral,7;
		bonus2 bSubEle,Ele_Water,7;
		bonus2 bSubEle,Ele_Earth,7;
		bonus2 bSubEle,Ele_Fire,7;
		bonus2 bSubEle,Ele_Wind,7;
		bonus2 bSubEle,Ele_Poison,7;
		bonus2 bSubEle,Ele_Holy,7;
		bonus2 bSubEle,Ele_Dark,7;
		bonus2 bSubEle,Ele_Ghost,7;
		bonus2 bSubEle,Ele_Undead,7;
		bonus bMaxSP,(BaseLevel/3)+(getrefine()*10);
		bonus3 bSPDrainRate,10,1,0;
		bonus bMdef,3;
	]]
},
[2555] = {
	AegisName = "Freyja_SScarf7",
	Name = "Freya Soul Scarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 4,
	Loc = "EQP_GARMENT",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bFlee,15;
		bonus2 bSubEle,Ele_Neutral,15;
	]]
},
[2556] = {
	AegisName = "Freyja_SScarf30",
	Name = "Freya Soul Scarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 4,
	Loc = "EQP_GARMENT",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bFlee,15;
		bonus2 bSubEle,Ele_Neutral,15;
	]]
},
[2557] = {
	AegisName = "Freyja_SScarf60",
	Name = "Freya Soul Scarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 4,
	Loc = "EQP_GARMENT",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bFlee,15;
		bonus2 bSubEle,Ele_Neutral,15;
	]]
},
[2558] = {
	AegisName = "Freyja_SScarf90",
	Name = "Freya Soul Scarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 4,
	Loc = "EQP_GARMENT",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bFlee,15;
		bonus2 bSubEle,Ele_Neutral,15;
	]]
},
[2559] = {
	AegisName = "Time_Keepr_Manteau",
	Name = "Guardian Manteau",
	Type = "IT_TYPE_ARMOR",
	Def = 9,
	Loc = "EQP_GARMENT",
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,1;
		bonus bFlee,10;
		bonus2 bSubEle,Ele_Neutral,10;
	]]
},
[2560] = {
	AegisName = "Para_Team_Manteau",
	Name = "Eden Group Manteau",
	Type = "IT_TYPE_ARMOR",
	Def = 14,
	Loc = "EQP_GARMENT",
	EquipLv = 12,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bSubEle,Ele_Neutral,10; ]]
},
[2561] = {
	AegisName = "Upg_Hood",
	Name = "Reinforcement Hood",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Def = 9,
	Slots = 1,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2562] = {
	AegisName = "Upg_Muffler",
	Name = "Reinforcement Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 13,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2563] = {
	AegisName = "Upg_Manteau",
	Name = "Reinforcement Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 18,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMaxHPrate,3; ]]
},
[2564] = {
	AegisName = "Feral_Tail",
	Name = "Feral Tail",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 16,
	Loc = "EQP_GARMENT",
	EquipLv = 75,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2565] = {
	AegisName = "Beach_Towel",
	Name = "Beach Towel",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Slots = 1,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bMdef,3;
		bonus bFlee,7;
	]]
},
[2566] = {
	AegisName = "Half_Asprika",
	Name = "Asprika (Trial Version)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 20,
	Loc = "EQP_GARMENT",
	EquipLv = 47,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,2;
		bonus3 bSubEle,Ele_Neutral,15,BF_SHORT;
		bonus3 bSubEle,Ele_Water,15,BF_SHORT;
		bonus3 bSubEle,Ele_Earth,15,BF_SHORT;
		bonus3 bSubEle,Ele_Fire,15,BF_SHORT;
		bonus3 bSubEle,Ele_Wind,15,BF_SHORT;
		bonus3 bSubEle,Ele_Poison,15,BF_SHORT;
		bonus3 bSubEle,Ele_Holy,15,BF_SHORT;
		bonus3 bSubEle,Ele_Dark,15,BF_SHORT;
		bonus3 bSubEle,Ele_Ghost,15,BF_SHORT;
		bonus3 bSubEle,Ele_Undead,15,BF_SHORT;
		bonus bFlee,15;
		skill AL_TELEPORT,1;
		bonus bUnbreakableGarment,0;
	]]
},
[2567] = {
	AegisName = "Academy_Manteau",
	Name = "Academy Manteau",
	Type = "IT_TYPE_ARMOR",
	Weight = 600,
	Def = 3,
	Slots = 1,
	Job = {
		Gunslinger = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_GARMENT",
},
[2568] = {
	AegisName = "Muffler_Of_Roki",
	Name = "Loki's Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 10,
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bUnbreakableGarment,0;
		bonus bAgi,1;
		bonus2 bSkillAtk,GC_CROSSIMPACT,5;
	]]
},
[2569] = {
	AegisName = "Shawl_Of_Affection",
	Name = "Shawl Of Affection",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 12,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bFlee2,5;
		bonus5 bAutoSpellWhenHit,AB_RENOVATIO,1,30,BF_WEAPON,0;
		bonus5 bAutoSpellWhenHit,AB_RENOVATIO,1,40,BF_MAGIC,0;
	]]
},
[2570] = {
	AegisName = "Shawl_Of_Judgement",
	Name = "Shawl Of Judgement",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 12,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bFlee,5;
		.@val = max(getskilllv(AB_ORATIO), 2);
		bonus5 bAutoSpellWhenHit,AB_ORATIO,.@val,30,BF_WEAPON,0;
		bonus5 bAutoSpellWhenHit,AB_ORATIO,.@val,40,BF_MAGIC,0;
	]]
},
[2571] = {
	AegisName = "Para_Team_Manteau2",
	Name = "Eden Group Manteau II",
	Type = "IT_TYPE_ARMOR",
	Def = 18,
	Loc = "EQP_GARMENT",
	EquipLv = 60,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bFlee,12;
		bonus2 bSubEle,Ele_Neutral,10;
	]]
},
[2572] = {
	AegisName = "Katabart_Sholder",
	Name = "Katabart Sholder",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3000,
	Def = 4,
	Loc = "EQP_GARMENT",
	EquipLv = 70,
},
[2573] = {
	AegisName = "Archangel_Wing",
	Name = "Eternal Wings",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 18,
	Slots = 1,
	Loc = "EQP_GARMENT",
	ViewSprite = 1,
},
[2574] = {
	AegisName = "Ur_Manteau",
	Name = "Ur's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 20,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bMaxHPrate,2;
		bonus2 bSubEle,Ele_Neutral,10;
	]]
},
[2575] = {
	AegisName = "Peuz_Manteau",
	Name = "Peuz's Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 16,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bFlee,10;
		bonus bCritical,10;
	]]
},
[2576] = {
	AegisName = "Bravery_Bag",
	Name = "Heroic Backpack",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 20,
	Slots = 1,
	Loc = "EQP_GARMENT",
	ViewSprite = 2,
	Script = [[
		skill BS_GREED,1;
		if(getrefine()>6) {
			if(readparam(bStr)>=90) {
				bonus bBaseAtk,20;
			}
			if(readparam(bInt)>=90) {
				bonus bMatk,30;
			}
			if(readparam(bVit)>=90) {
				bonus2 bSubEle,Ele_Neutral,10;
			}
			if(readparam(bAgi)>=90) {
				bonus bAspdRate,8;
			}
			if(readparam(bDex)>=90) {
				bonus bLongAtkRate,5;
			}
			if(readparam(bLuk)>=90) {
				bonus bCritAtkRate,10;
			}
		}
		if(getrefine()>8) {
			if(readparam(bStr)>=90) {
				bonus bBaseAtk,10;
			}
			if(readparam(bInt)>=90) {
				bonus bMatk,20;
			}
			if(readparam(bVit)>=90) {
				bonus2 bSubEle,Ele_Neutral,5;
			}
			if(readparam(bAgi)>=90) {
				bonus bAspd,1;
			}
			if(readparam(bDex)>=90) {
				bonus bLongAtkRate,5;
			}
			if(readparam(bLuk)>=90) {
				bonus bCritAtkRate,5;
			}
		}
	]]
},
[2577] = {
	AegisName = "Sabah_Hood",
	Name = "Sapha Hood",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 13,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bFlee,12;
		bonus bCritical,getrefine();
	]]
},
[2578] = {
	AegisName = "Nab_Hood",
	Name = "Nab Hood",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 13,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bFlee,getrefine()*2;
		bonus bBaseAtk,getrefine()*2;
	]]
},
[2579] = {
	AegisName = "Magic_Stole",
	Name = "Magic Stall",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 8,
	Slots = 1,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMdef,3; ]]
},
[2580] = {
	AegisName = "White_Wing_Manteau",
	Name = "White Wing Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 15,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bAgi,2;
		bonus bFlee,10;
		autobonus2 "{ bonus bFlee,20; }",10,7000,BF_LONG,"{ specialeffect(EF_WIND, AREA, playerattached()); }";
	]]
},
[2581] = {
	AegisName = "Black_Wing_Manteau",
	Name = "Black Wing Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 15,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 100,
	Script = [[
		bonus bInt,2;
		if(getequiprefinerycnt(EQI_GARMENT)>6) bonus bFlee2,getequiprefinerycnt(EQI_GARMENT)-6;
	]]
},
[2582] = {
	AegisName = "Salvage_Cape",
	Name = "Salvage Cape",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 400,
	Def = 1,
	Job = {
		Priest = true,
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_GARMENT",
	EquipLv = 130,
	Script = [[
		skill NJ_UTSUSEMI,1;
		bonus2 bSkillCooldown,NJ_UTSUSEMI,30000;
		bonus bUseSPrate,100;
	]],
	OnUnequipScript = [[ heal 0,-1200; ]]
},
[2583] = {
	AegisName = "Holy_Cape",
	Name = "Holy Cape",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Slots = 1,
	Loc = "EQP_GARMENT",
	EquipLv = 50,
	Script = [[
		bonus bDex,-5;
		bonus bMdef,5;
	]]
},
[2584] = {
	AegisName = "Wanderer_Outer",
	Name = "Coat Of Wandering",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 8,
	Slots = 1,
	Loc = "EQP_GARMENT",
},
[2585] = {
	AegisName = "Muffler_Of_Valor",
	Name = "Muffler Of Valor",
	Type = "IT_TYPE_ARMOR",
	Def = 4,
	Loc = "EQP_GARMENT",
	Refine = false,
},
[2586] = {
	AegisName = "Siege_Manteau",
	Name = "WoE Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 600,
	Def = 32,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 95,
	Script = [[
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_Player,2;
	]]
},
[2587] = {
	AegisName = "Siege_Muffler",
	Name = "WoE Muffler",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 400,
	Def = 15,
	Slots = 1,
	Loc = "EQP_GARMENT",
	EquipLv = 95,
	Script = [[
		bonus bMdef,10;
		bonus2 bAddRaceTolerance,RC_Player,2;
	]]
},
[2588] = {
	AegisName = "Ragamuffin_Cape_",
	Name = "Rag mantle",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 500,
	Def = 4,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 40,
	Script = [[
		bonus bUnbreakableGarment,0;
		bonus bMdef,10;
	]]
},
[2589] = {
	AegisName = "Fallen_Angel_Wing",
	Name = "Fallen Angel Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 18,
	Slots = 1,
	Loc = "EQP_GARMENT",
	ViewSprite = 3,
	Script = [[
		bonus bAllStats,1;
		bonus bAtk,readparam(bStr)/20;
		bonus bMatk,readparam(bInt)/20;
		bonus2 bSubEle,Ele_Neutral,readparam(bVit)/20;
		bonus bAspdRate,readparam(bAgi)/20;
		bonus bLongAtkRate,readparam(bDex)/20;
		bonus bCritAtkRate,readparam(bLuk)/20;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,10;
	]]
},
[2590] = {
	AegisName = "Buwaya_Cloth",
	Name = "Buwaya Sack Cloth",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 8,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bHealPower2,getrefine()/3;
		bonus bAddItemHealRate,getrefine()/3;
		bonus2 bSubEle,Ele_Water,10;
		bonus2 bSubEle,Ele_Wind,10;
		bonus2 bSubEle,Ele_Earth,10;
		bonus2 bSubEle,Ele_Fire,10;
	]]
},
[2591] = {
	AegisName = "Bayani_Buwaya_Cloth",
	Name = "Buwaya Sack Cloth(Bayani)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 8,
	Slots = 1,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bHealPower2,getrefine();
		bonus bAddItemHealRate,getrefine();
		bonus2 bSubEle,Ele_Water,10;
		bonus2 bSubEle,Ele_Wind,10;
		bonus2 bSubEle,Ele_Earth,10;
		bonus2 bSubEle,Ele_Fire,10;
	]]
},
[2592] = {
	AegisName = "Boss_Brownie_Manteau",
	Name = "Cloak of Domovoi",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_GARMENT",
	EquipLv = 50,
},
[2593] = {
	AegisName = "Flow_Manteau",
	Name = "Froid Manteau",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 20,
	Slots = 1,
	Loc = "EQP_GARMENT",
	EquipLv = 65,
},
[2594] = {
	AegisName = "Wrapping_Manteau",
	Name = "Furoshiki Cloak",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_GARMENT",
},
[2596] = {
	AegisName = "Sharel_Manteau",
	Name = "Sharel Manteau",
	Type = "IT_TYPE_ARMOR",
	Weight = 700,
	Def = 20,
	Slots = 1,
	Loc = "EQP_GARMENT",
	EquipLv = 65,
	Script = [[
		bonus2 bSubEle,Ele_Fire,5;
		bonus2 bAddRaceTolerance,RC_Demon,5;
	]]
},
[2597] = {
	AegisName = "Scarlet_Poncho",
	Name = "Bloody Muffler",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Def = 10,
	Slots = 1,
	Loc = "EQP_GARMENT",
	EquipLv = 50,
	Script = [[ bonus bCritAtkRate,3; ]]
},
[2599] = {
	AegisName = "Goibnes_Shoulder_Arms_",
	Name = "Goibne's Spaulders",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 700,
	Def = 11,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_GARMENT",
	EquipLv = 54,
	Script = [[
		bonus bLongAtkDef,10;
		bonus bMdef,2;
		bonus bVit,1;
	]]
},

--== Accessories ===========================================
[2601] = {
	AegisName = "Ring",
	Name = "Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bStr,2; ]]
},
[2602] = {
	AegisName = "Earring",
	Name = "Earring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bInt,2; ]]
},
[2603] = {
	AegisName = "Necklace",
	Name = "Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bVit,2; ]]
},
[2604] = {
	AegisName = "Glove",
	Name = "Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bDex,2; ]]
},
[2605] = {
	AegisName = "Brooch",
	Name = "Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bAgi,2; ]]
},
[2607] = {
	AegisName = "Clip",
	Name = "Clip",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMaxSP,10; ]]
},
[2608] = {
	AegisName = "Rosary",
	Name = "Rosary",
	Type = "IT_TYPE_ARMOR",
	Buy = 15000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bMdef,5;
		bonus bLuk,2;
	]]
},
[2609] = {
	AegisName = "Skul_Ring",
	Name = "Skull Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2610] = {
	AegisName = "Gold_Ring",
	Name = "Gold Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2611] = {
	AegisName = "Silver_Ring",
	Name = "Silver Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2612] = {
	AegisName = "Flower_Ring",
	Name = "Flower Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1500,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2613] = {
	AegisName = "Diamond_Ring",
	Name = "Diamond Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 45000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2614] = {
	AegisName = "An_Eye_Of_Dullahan",
	Name = "Eye of Dullahan",
	Type = "IT_TYPE_ARMOR",
	Buy = 90000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 50,
	Refine = false,
	Script = [[
		bonus2 bResEff,Eff_Poison,10000;
		bonus2 bAddRaceTolerance,RC_Undead,4;
		bonus2 bAddRaceTolerance,RC_Demon,4;
	]]
},
[2615] = {
	AegisName = "Safety_Ring",
	Name = "Safety Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 40,
	Refine = false,
	Script = [[ bonus bMdef,5; ]]
},
[2616] = {
	AegisName = "Critical_Ring",
	Name = "Critical Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 40,
	Refine = false,
	Script = [[ bonus bCritical,5; ]]
},
[2617] = {
	AegisName = "Mitten_Of_Presbyter",
	Name = "Celebrant's Mitten",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 35,
	Refine = false,
	Script = [[ bonus bInt,1; ]]
},
[2618] = {
	AegisName = "Matyrs_Flea_Guard",
	Name = "Matyr's Leash",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 35,
	Refine = false,
	Script = [[ bonus bAgi,1; ]]
},
[2619] = {
	AegisName = "Thimble_Of_Archer",
	Name = "Bow Thimble",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 100,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 65,
	Refine = false,
	Script = [[ bonus bLongAtkRate,3; ]]
},
[2620] = {
	AegisName = "Ring_Of_Rogue",
	Name = "Rogue's Treasure",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 100,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Script = [[
		if(readparam(bStr)>=90) {
			bonus bHit,10;
			bonus bFlee,10;
		}
		if(readparam(bAgi)>=90) {
			bonus bBaseAtk,10;
			bonus bCritical,10;
		}
	]]
},
[2621] = {
	AegisName = "Ring_",
	Name = "Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bStr,1; ]]
},
[2622] = {
	AegisName = "Earring_",
	Name = "Earring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bInt,1; ]]
},
[2623] = {
	AegisName = "Necklace_",
	Name = "Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bVit,1; ]]
},
[2624] = {
	AegisName = "Glove_",
	Name = "Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bDex,1; ]]
},
[2625] = {
	AegisName = "Brooch_",
	Name = "Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bAgi,1; ]]
},
[2626] = {
	AegisName = "Rosary_",
	Name = "Rosary",
	Type = "IT_TYPE_ARMOR",
	Buy = 15000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[
		bonus bMdef,3;
		bonus bLuk,1;
	]]
},
[2627] = {
	AegisName = "Belt",
	Name = "Belt",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 1200,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 25,
	Refine = false,
},
[2628] = {
	AegisName = "Novice_Armlet",
	Name = "Novice Armlet",
	Type = "IT_TYPE_ARMOR",
	Buy = 400,
	Weight = 200,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
},
[2629] = {
	AegisName = "Magingiorde",
	Name = "Magingiorde",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 8000,
	Def = 2,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,40+BaseLevel/5;
		bonus bMdef,7;
		if(readparam(bStr)>=120) {
			bonus2 bAddRace,RC_Boss,10;
		}
	]]
},
[2630] = {
	AegisName = "Brysinggamen",
	Name = "Brysinggamen",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1500,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bDex, 6;
		bonus bStr, 6;
		bonus bAgi, 6;
		bonus bVit, 6;
		bonus bInt, 10;
		bonus bLuk, 10;
		bonus bMdef, 5;
		bonus bHealPower, 6;
	]]
},
[2631] = {
	AegisName = "First_Age_Ring",
	Name = "Celebration Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 10,
	Loc = "EQP_ACC",
	Refine = false,
},
[2632] = {
	AegisName = "Korean_Trinket",
	Name = "Korean Trinket",
	Type = "IT_TYPE_ARMOR",
	Buy = 125000,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 65,
	Refine = false,
	Script = [[
		bonus bVit,1;
		bonus bDex,1;
		bonus bLuk,1;
	]]
},
[2633] = {
	AegisName = "Jade_Ring",
	Name = "Jade Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 204000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[
		bonus bStr,2;
		bonus bInt,1;
	]]
},
[2634] = {
	AegisName = "Bridegroom_Ring",
	Name = "Wedding Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		skill WE_MALE,1;
		skill WE_FEMALE,1;
		skill WE_CALLPARTNER,1;
	]]
},
[2635] = {
	AegisName = "Bride_Ring",
	Name = "Wedding Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		skill WE_MALE,1;
		skill WE_FEMALE,1;
		skill WE_CALLPARTNER,1;
	]]
},
[2636] = {
	AegisName = "Gold_Ring_",
	Name = "Gold Christmas Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bLuk,1; ]]
},
[2637] = {
	AegisName = "Silver_Ring_",
	Name = "Silver Christmas Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bLuk,1; ]]
},
[2638] = {
	AegisName = "Exorcize_Sachet",
	Name = "Sacred Incense",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,1;
		bonus bLuk,1;
	]]
},
[2639] = {
	AegisName = "Purification_Sachet",
	Name = "Occult Incense",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bInt,1;
		bonus bAgi,1;
	]]
},
[2640] = {
	AegisName = "Kafra_Ring",
	Name = "Kafra Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 40000,
	Weight = 200,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
		bonus bAgi,1;
		bonus bLuk,1;
		bonus bMdef,1;
	]]
},
[2641] = {
	AegisName = "Fashionable_Sack",
	Name = "Fashion Hip Sack",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 50,
	Refine = false,
	Script = [[ bonus bStr,2; ]]
},
[2642] = {
	AegisName = "Serins_Gold_Ring",
	Name = "Serin's Gold Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2643] = {
	AegisName = "Serins_Gold_Ring_",
	Name = "Serin's Gold Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 45000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2644] = {
	AegisName = "The_Sign_",
	Name = "The Sign",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus2 bMagicAddRace, RC_All, 5;
	]]
},
[2645] = {
	AegisName = "Moonlight_Ring",
	Name = "Moonlight Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 40000,
	Weight = 200,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
	Script = [[ bonus bMdef,2; ]]
},
[2646] = {
	AegisName = "Bunch_Of_Carnation",
	Name = "Bunch of Carnation",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bAllStats,3; ]]
},
[2647] = {
	AegisName = "Nile_Rose",
	Name = "Nile Rose",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMaxHP,10; ]]
},
[2648] = {
	AegisName = "Morpheuss_Ring",
	Name = "Morpheus's Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 33,
	Refine = false,
	Script = [[
		bonus bInt,1;
		bonus bMaxSPrate,5;
	]]
},
[2649] = {
	AegisName = "Morpheuss_Armlet",
	Name = "Morpheus's Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 33,
	Refine = false,
	Script = [[
		bonus bInt,1;
		bonus bMaxSPrate,5;
	]]
},
[2650] = {
	AegisName = "Morriganes_Belt",
	Name = "Morrigane's Belt",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 61,
	Refine = false,
	Script = [[
		bonus bBaseAtk,5;
		bonus bCritical,3;
	]]
},
[2651] = {
	AegisName = "Morriganes_Pendant",
	Name = "Morrigane's Pendant",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 61,
	Refine = false,
	Script = [[
		bonus bStr,2;
		bonus bCritical,3;
	]]
},
[2652] = {
	AegisName = "Cursed_Lucky_Brooch",
	Name = "Goddess of Fortune's Cursed Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 40,
	Refine = false,
	Script = [[
		bonus bCritical,6;
		bonus2 bAddEff2,Eff_Curse,50;
	]]
},
[2653] = {
	AegisName = "Sacrifice_Ring",
	Name = "Sacrifice Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
},
[2654] = {
	AegisName = "Shinobis_Sash",
	Name = "Shinobi Sash",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 300,
	Def = 1,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 30,
	Refine = false,
	Script = [[
		bonus bStr,1;
		bonus bAgi,1;
		bonus bMdef,1;
	]]
},
[2655] = {
	AegisName = "Bloody_Iron_Ball",
	Name = "Bloodied Shackle Ball",
	Type = "IT_TYPE_ARMOR",
	Buy = 50000,
	Weight = 4000,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
},
[2656] = {
	AegisName = "Hyper_Changer",
	Name = "Armor Charm",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 1000,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMaxHP,50; ]]
},
[2657] = {
	AegisName = "Lab_Passport",
	Name = "Laboratory Permit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2658] = {
	AegisName = "Nile_Rose_",
	Name = "Nile Rose",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMaxHP,10; ]]
},
[2659] = {
	AegisName = "Vesper_Core01",
	Name = "Vesper Core 01",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMdef,3;
		bonus bInt,2;
		bonus bMaxSPrate,5;
	]]
},
[2660] = {
	AegisName = "Vesper_Core02",
	Name = "Vesper Core 02",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMdef,3;
		bonus bStr,3;
		bonus bBaseAtk,10;
	]]
},
[2661] = {
	AegisName = "Vesper_Core03",
	Name = "Vesper Core 03",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMdef,3;
		bonus bAgi,3;
		bonus bFlee,5;
	]]
},
[2662] = {
	AegisName = "Vesper_Core04",
	Name = "Vesper Core 04",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMdef,3;
		bonus bDex,3;
		bonus bHit,10;
	]]
},
[2663] = {
	AegisName = "Gauntlet_Of_Accuracy",
	Name = "Gauntlet of Hit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Loc = "EQP_ACC",
	EquipLv = 75,
	Refine = false,
	Script = [[
		bonus bHit,15;
		bonus bStr,1;
	]]
},
[2664] = {
	AegisName = "Scarf_Belt",
	Name = "Belcarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 75,
	Refine = false,
	Script = [[
		bonus bDex,2;
		bonus bInt,1;
	]]
},
[2665] = {
	AegisName = "Ring_Of_Exorcism",
	Name = "Exorcising Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
	Script = [[
		bonus bMdef,1;
		bonus2 bExpAddRace,RC_Undead,5;
		bonus2 bExpAddRace,RC_Demon,5;
	]]
},
[2666] = {
	AegisName = "Lamp_Of_Hope",
	Name = "Lantern of Hope",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,2;
		bonus2 bResEff,Eff_Blind,1000;
	]]
},
[2667] = {
	AegisName = "Glove_Of_Archer",
	Name = "Renown Archer's Gloves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
	Script = [[
		bonus bHit,5;
		bonus bCritical,5;
		bonus bDex,1;
	]]
},
[2668] = {
	AegisName = "Womens_Glory",
	Name = "Woman Glory",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2669] = {
	AegisName = "Golden_Necklace_",
	Name = "RJC Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMaxSP,10; ]]
},
[2670] = {
	AegisName = "Ring_Of_Longing",
	Name = "Ring of Longing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 30,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bFlee,5; ]]
},
[2671] = {
	AegisName = "Thimble_Of_Archer_",
	Name = "Bow Thimble",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 100,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 65,
	Refine = false,
	Script = [[ bonus bLongAtkRate,3; ]]
},
[2672] = {
	AegisName = "Anniversary_Ring",
	Name = "3rd Anniversary Celebration Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
},
[2673] = {
	AegisName = "Shining_Ring",
	Name = "Warrior's Shining Ring",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 48,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bBaseAtk,10;
		bonus bSPrecovRate,3;
	]]
},
[2674] = {
	AegisName = "Honor_Ring",
	Name = "Ring of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2675] = {
	AegisName = "Lord_Ring",
	Name = "Lord Ring",
	Type = "IT_TYPE_ARMOR",
	Weight = 10,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bAllStats,3; ]]
},
[2676] = {
	AegisName = "Hunter_Earring",
	Name = "Hunter's Earring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddMonsterDropItem,7618,100; ]]
},
[2677] = {
	AegisName = "Spiritual_Ring",
	Name = "Spiritual Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bInt,2;
		bonus bDex,1;
	]]
},
[2678] = {
	AegisName = "Ring_Of_Flame_Lord",
	Name = "Ring Of Flame Lord",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,2;
		bonus bVit,1;
		bonus bBaseAtk,15;
		bonus2 bSubEle,Ele_Fire,10;
		bonus3 bAutoSpell,CH_SOULCOLLECT,1,30;
		bonus3 bAutoSpell,MO_EXPLOSIONSPIRITS,1,10;
		bonus3 bAutoSpell,PA_PRESSURE,2,30;
		bonus3 bAutoSpell,MG_FIREBALL,1,150;
		bonus3 bAutoSpell,KN_BOWLINGBASH,5,20;
	]]
},
[2679] = {
	AegisName = "Ring_Of_Resonance",
	Name = "Ring Of Resonance",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAgi,2;
		bonus bVit,1;
		bonus bMdef,2;
		bonus4 bAutoSpellWhenHit,WZ_QUAGMIRE,1,50,0;
		bonus3 bAutoSpellWhenHit,AS_SPLASHER,10,20;
		bonus3 bAutoSpellWhenHit,AL_HEAL,10,30;
		bonus3 bAutoSpellWhenHit,HP_ASSUMPTIO,3,20;
		bonus3 bAutoSpellWhenHit,CG_TAROTCARD,5,20;
	]]
},
[2680] = {
	AegisName = "Lesser_Elemental_Ring",
	Name = "Lesser Elemental Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAllStats,1;
		bonus3 bAutoSpell,WZ_ESTIMATION,1,80;
		bonus3 bAutoSpell,MC_IDENTIFY,1,50;
		bonus3 bAutoSpell,TF_PICKSTONE,1,100;
		bonus3 bAutoSpell,BS_GREED,1,10;
		bonus3 bAutoSpellWhenHit,TK_RUN,5,20;
		bonus3 bAutoSpellWhenHit,TK_HIGHJUMP,3,30;
		bonus3 bAutoSpellWhenHit,NV_FIRSTAID,1,100;
		bonus3 bAutoSpellWhenHit,TF_BACKSLIDING,1,50;
	]]
},
[2681] = {
	AegisName = "Republic_Ring",
	Name = "Republic Anniversary Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAllStats,3; ]]
},
[2682] = {
	AegisName = "Ring_Of_Water",
	Name = "Ring of Water",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus2 bSubEle,Ele_Water,5; ]]
},
[2683] = {
	AegisName = "Ring_Of_Fire",
	Name = "Ring of Fire",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus2 bSubEle,Ele_Fire,5; ]]
},
[2684] = {
	AegisName = "Ring_Of_Wind",
	Name = "Ring of Wind",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus2 bSubEle,Ele_Wind,5; ]]
},
[2685] = {
	AegisName = "Ring_Of_Earth",
	Name = "Ring of Earth",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus2 bSubEle,Ele_Earth,5; ]]
},
[2686] = {
	AegisName = "Elven_Ears_C",
	Name = "Rental Elven Ears",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 73,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,1; ]]
},
[2687] = {
	AegisName = "Steel_Flower_C",
	Name = "Rental Steel Flower",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 56,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bSubRace,RC_Plant,3; ]]
},
[2688] = {
	AegisName = "Critical_Ring_C",
	Name = "Rental Critical Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bCritical,10; ]]
},
[2689] = {
	AegisName = "Earring_C",
	Name = "Rental Earring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,3; ]]
},
[2690] = {
	AegisName = "Ring_C",
	Name = "Rental Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bStr,4; ]]
},
[2691] = {
	AegisName = "Necklace_C",
	Name = "Rental Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bVit,4; ]]
},
[2692] = {
	AegisName = "Glove_C",
	Name = "Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bDex,4; ]]
},
[2693] = {
	AegisName = "Brooch_C",
	Name = "Rental Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAgi,4; ]]
},
[2694] = {
	AegisName = "Rosary_C",
	Name = "Rental Rosary",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus bLuk,4;
	]]
},
[2695] = {
	AegisName = "Safety_Ring_C",
	Name = "Rental Safety Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMdef,8; ]]
},
[2696] = {
	AegisName = "Vesper_Core01_C",
	Name = "Vesper Core 01",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,3;
		bonus bInt,2;
		bonus bMaxSPrate,5;
	]]
},
[2697] = {
	AegisName = "Vesper_Core02_C",
	Name = "Vesper Core 02",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,3;
		bonus bStr,3;
		bonus bBaseAtk,10;
	]]
},
[2698] = {
	AegisName = "Vesper_Core03_C",
	Name = "Vesper Core 03",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,3;
		bonus bAgi,3;
		bonus bFlee,5;
	]]
},
[2699] = {
	AegisName = "Vesper_Core04_C",
	Name = "Vesper Core 04",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,3;
		bonus bDex,3;
		bonus bHit,10;
	]]
},
[2700] = {
	AegisName = "Red_Silk_Seal",
	Name = "Red Silk Seal",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
},
[2701] = {
	AegisName = "Orleans_Glove",
	Name = "Orleans's Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[
		bonus bDex,2;
		bonus bMatkRate,3;
	]]
},
[2702] = {
	AegisName = "Bison_Horn",
	Name = "Bison Horn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bAgi,2; ]]
},
[2703] = {
	AegisName = "Expert_Ring",
	Name = "Expert Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 50,
	Refine = false,
	Script = [[
		bonus bDelayrate,-5;
		bonus bUseSPrate,5;
	]]
},
[2704] = {
	AegisName = "Golden_Accessory",
	Name = "Golden Accessories",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMdef,4; ]]
},
[2705] = {
	AegisName = "Golden_Accessory2",
	Name = "Golden Accessories",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddMonsterDropItem,12018,500; ]]
},
[2706] = {
	AegisName = "Handcuff",
	Name = "Arrest Handcuffs",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2707] = {
	AegisName = "GUSLI",
	Name = "Gusli",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2708] = {
	AegisName = "Chinese_Handicraft",
	Name = "Chinese Handicraft",
	Type = "IT_TYPE_ARMOR",
	Weight = 50,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus3 bAutoSpell,MG_FIREBOLT,5,300; ]]
},
[2709] = {
	AegisName = "5_Anniversary_Coin",
	Name = "5th Anniversary Coin",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkRate,5;
		bonus bMatkRate,5;
	]]
},
[2710] = {
	AegisName = "Bloody_Iron_Ball_C",
	Name = "Bloody Iron Ball",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bBaseAtk,30; ]]
},
[2711] = {
	AegisName = "Spiritual_Ring_C",
	Name = "Spiritual Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,2;
		bonus bDex,2;
	]]
},
[2712] = {
	AegisName = "Ragnarok_Limited_Ed",
	Name = "Ragnarok Limited Edition",
	Type = "IT_TYPE_ARMOR",
	Weight = 300,
	Loc = "EQP_ACC",
	EquipLv = 30,
	Refine = false,
	Script = [[
		bonus bVit,3;
		bonus bAgi,3;
		bonus bLuk,3;
	]]
},
[2713] = {
	AegisName = "Certificate_TW",
	Name = "Certificate",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2714] = {
	AegisName = "Marvelous_Pandent",
	Name = "Marvelous Pendant",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
},
[2715] = {
	AegisName = "Skul_Ring_",
	Name = "Skull Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus2 bAddRaceTolerance,RC_Undead,1; ]]
},
[2716] = {
	AegisName = "Librarian_Glove",
	Name = "Librarian Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Job = {
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[ bonus bMaxSP,20; ]]
},
[2717] = {
	AegisName = "Pocket_Watch_",
	Name = "Pocket Watch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 0,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[
		bonus bHPrecovRate,15;
		bonus bSPrecovRate,15;
		bonus bMatkRate,7;
	]]
},
[2718] = {
	AegisName = "Lunatic_Brooch",
	Name = "Lunatic Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 65,
	Refine = false,
},
[2719] = {
	AegisName = "Iron_Wrist",
	Name = "Iron Wrist",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 50,
	Refine = false,
	Script = [[
		bonus2 bSkillAtk,SM_BASH,6;
		bonus2 bSkillAtk,MC_MAMMONITE,6;
	]]
},
[2720] = {
	AegisName = "Medal_Swordman",
	Name = "Medal of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bHit,10;
		bonus bMaxHP,500;
		bonus bMaxSP,50;
		bonus3 bAddEff,Eff_Stun,100,ATF_SHORT;
	]]
},
[2721] = {
	AegisName = "Medal_Thief",
	Name = "Medal of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Thief = true,
		Assassin = true,
		Rogue = true,
		Ninja = true,
		Kagerou = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bFlee,10;
		bonus bMaxHP,300;
		bonus bMaxSP,80;
		bonus3 bAddEff,Eff_Poison,100,ATF_SHORT;
	]]
},
[2722] = {
	AegisName = "Medal_Acolyte",
	Name = "Medal of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bMdef,6;
		bonus bMaxHP,600;
		bonus3 bAddEff,Eff_Silence,100,ATF_SHORT;
	]]
},
[2723] = {
	AegisName = "Medal_Mage",
	Name = "Medal of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bMdef,6;
		bonus bMaxHP,600;
		bonus2 bAddEffWhenHit,Eff_Stone,100;
	]]
},
[2724] = {
	AegisName = "Medal_Archer",
	Name = "Medal of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bCritical,10;
		bonus bMaxHP,300;
		bonus bMaxSP,80;
		bonus3 bAddEff,Eff_Blind,100,ATF_LONG;
	]]
},
[2725] = {
	AegisName = "Medal_Merchant",
	Name = "Medal of Honor",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bAspdRate,10;
		bonus bMaxHP,500;
		bonus bMaxSP,50;
		bonus3 bAddEff,Eff_Curse,100,ATF_SHORT;
	]]
},
[2726] = {
	AegisName = "Icarus_Wing",
	Name = "Icarus Wings",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Script = [[
		bonus bMaxSP,50;
		bonus bDex,3;
	]]
},
[2727] = {
	AegisName = "Bowman_Scarf",
	Name = "Bowman Scarf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Script = [[
		bonus bMaxSP,50;
		bonus bDex,3;
	]]
},
[2728] = {
	AegisName = "Cursed_Hand",
	Name = "Cursed Hand",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[
		bonus3 bAutoSpell,NPC_CRITICALWOUND,1,30;
		bonus bHit,10;
		bonus bHPrecovRate,20;
	]]
},
[2729] = {
	AegisName = "Diabolus_Ring",
	Name = "Diabolus Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,100;
		bonus bHealPower,5;
		bonus2 bAddDamageClass,1916,10;
		bonus2 bAddDamageClass,1917,10;
	]]
},
[2730] = {
	AegisName = "Morroc_Seal",
	Name = "Seal of Continental Guard",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,50;
		bonus bAspdRate,3;
	]]
},
[2731] = {
	AegisName = "Morroc_Charm_Stone",
	Name = "Rune Spellstone",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,50;
		bonus bVariableCastrate,-1;
	]]
},
[2732] = {
	AegisName = "Morroc_Ring",
	Name = "Death Loop",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bCritical,5; ]]
},
[2733] = {
	AegisName = "Medal_Gunner",
	Name = "Sheriff Badge",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Job = {
		Gunslinger = true,
	},
	Upper = "ITEMUPPER_NORMAL",
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus bCritical,10;
		bonus bMaxHP,300;
		bonus bMaxSP,80;
		bonus3 bAddEff,Eff_Blind,100,ATF_LONG;
	]]
},
[2734] = {
	AegisName = "Directive_A",
	Name = "Directive",
	Type = "IT_TYPE_ARMOR",
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2735] = {
	AegisName = "Directive_B",
	Name = "Directive",
	Type = "IT_TYPE_ARMOR",
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2736] = {
	AegisName = "Navel_Ring",
	Name = "Navel Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 75,
	Refine = false,
	Script = [[
		bonus bDex,3;
		bonus bLuk,3;
		bonus bMdef,2;
	]]
},
[2737] = {
	AegisName = "Foot_Ring",
	Name = "Foot Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 75,
	Refine = false,
	Script = [[
		bonus bVit,3;
		bonus bMaxHPrate,10;
	]]
},
[2738] = {
	AegisName = "Shiny_Coin",
	Name = "Shiny Coin",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 6;
		bonus bMatkRate,6;
	]]
},
[2739] = {
	AegisName = "Ordinary_Coin",
	Name = "Ordinary Coin",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
	]]
},
[2740] = {
	AegisName = "Rusty_Coin",
	Name = "Rusty Coin",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 3;
		bonus bMatkRate,3;
	]]
},
[2741] = {
	AegisName = "All_In_One_Ring",
	Name = "All In One Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAllStats,1;
		bonus bNoCastCancel,0;
		bonus bVariableCastrate,10;
		skill AL_HEAL,1;
		skill AL_TELEPORT,1;
	]]
},
[2742] = {
	AegisName = "Lucky_Clip",
	Name = "Lucky Clip",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2743] = {
	AegisName = "Angelic_Ring",
	Name = "Angelic Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Script = [[
		bonus bInt,2;
		bonus bDex,1;
		bonus bMdef,2;
		autobonus3 "{ bonus bHealPower,20; }",50,3000,AL_HEAL;
		autobonus3 "{ bonus bHealPower,20; }",50,3000,AM_POTIONPITCHER;
		autobonus3 "{ bonus bHealPower,20; }",50,3000,PR_SANCTUARY;
	]]
},
[2744] = {
	AegisName = "Sprint_Ring",
	Name = "Sprint Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bVariableCastrate,-10;
		bonus bDelayrate,5;
	]]
},
[2745] = {
	AegisName = "Pinguicula_Corsage",
	Name = "Pinguicula Corsage",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bMaxSP,25;
	]]
},
[2746] = {
	AegisName = "Cold_Heart",
	Name = "Cold Heart",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[ bonus bAgi,3; ]]
},
[2747] = {
	AegisName = "Black_Cat",
	Name = "Black Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Rogue = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[ bonus bDex,3; ]]
},
[2748] = {
	AegisName = "Cursed_Star",
	Name = "Cursed Star",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 84,
	Refine = false,
	Script = [[
		bonus bMdef,3;
		bonus bDex,2;
		bonus bLuk,-1;
		bonus2 bHPLossRate,50,10000;
		bonus3 bAddEff,Eff_Curse,200,ATF_WEAPON|ATF_LONG|ATF_TARGET;
	]],
	OnUnequipScript = [[ heal -300,0; ]]
},
[2749] = {
	AegisName = "Linen_Glove",
	Name = "Linen Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 120,
	Def = 1,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[
		bonus bMdef,1;
		bonus bAgi,2;
		bonus bDex,1;
	]]
},
[2750] = {
	AegisName = "Summer_Night_Dream",
	Name = "Midsummer Night's Dream",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ skill ALL_DREAM_SUMMERNIGHT,1; ]]
},
[2751] = {
	AegisName = "Academy_Badge",
	Name = "Academy Of Badge",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		if(BaseLevel<80) {
			bonus bMaxHP,400;
			bonus bMaxSP,200;
		}
	]]
},
[2752] = {
	AegisName = "Praxinus_C",
	Name = "Praccsinos",
	Type = "IT_TYPE_ARMOR",
	Buy = 2,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
	]]
},
[2753] = {
	AegisName = "Beholder_Ring",
	Name = "Beholder Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Formless,15; ]]
},
[2754] = {
	AegisName = "Hallow_Ring",
	Name = "Hallow Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Undead,15; ]]
},
[2755] = {
	AegisName = "Clamorous_Ring",
	Name = "Clamorous Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Brute,15; ]]
},
[2756] = {
	AegisName = "Chemical_Ring",
	Name = "Chemical Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Plant,15; ]]
},
[2757] = {
	AegisName = "Insecticide_Ring",
	Name = "Insecticide Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Insect,15; ]]
},
[2758] = {
	AegisName = "Fisher_Ring",
	Name = "Fischer Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Fish,15; ]]
},
[2759] = {
	AegisName = "Decussate_Ring",
	Name = "Decussate Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Demon,15; ]]
},
[2760] = {
	AegisName = "Bloody_Ring",
	Name = "Bloody Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_DemiPlayer,15; ]]
},
[2761] = {
	AegisName = "Satanic_Ring",
	Name = "Satanic Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Angel,15; ]]
},
[2762] = {
	AegisName = "Dragoon_Ring",
	Name = "Dragon Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace,RC_Dragon,15; ]]
},
[2763] = {
	AegisName = "Skul_Ring_C",
	Name = "Neo Skull Ring",
	Type = "IT_TYPE_ARMOR",
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 95,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtkRate,5;
		bonus bMatkRate,5;
		bonus bMaxHPrate,5;
		bonus2 bSkillHeal,AL_HEAL,5;
		skill MG_SIGHT,1;
	]]
},
[2764] = {
	AegisName = "Small_Fishing_Rod",
	Name = "Small Fishing Rod",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 250,
	Loc = "EQP_ACC",
	Refine = false,
},
[2765] = {
	AegisName = "Novice_Figure",
	Name = "Novice Figure",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxHP,70;
		if(Class==Job_Novice || Class==Job_Novice_High || Class==Job_SuperNovice) bonus bMaxHP,30;
	]]
},
[2766] = {
	AegisName = "Swordman_Figure",
	Name = "Swordman Figure",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bVit,1;
		if(BaseClass==Job_Swordman) bonus bDef,2;
	]]
},
[2767] = {
	AegisName = "Acolyte_Figure",
	Name = "Acolyte Figure",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,1;
		if(BaseClass==Job_Acolyte) bonus bMaxSP,50;
	]]
},
[2768] = {
	AegisName = "Mage_Figure",
	Name = "Mage Figure",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,1;
		if(BaseClass==Job_Mage) bonus bSPrecovRate,5;
	]]
},
[2769] = {
	AegisName = "Archer_Figure",
	Name = "Archer Figure",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,1;
		if(BaseClass==Job_Archer) bonus bBaseAtk,10;
	]]
},
[2770] = {
	AegisName = "Thief_Figure",
	Name = "Thief Figure",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAgi,1;
		if(BaseClass==Job_Thief) bonus bAspdRate,3;
	]]
},
[2771] = {
	AegisName = "Merchant_Figure",
	Name = "Merchant Figure",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,1;
		if(BaseClass==Job_Merchant) bonus bCritical,5;
	]]
},
[2772] = {
	AegisName = "Krieger_Ring1",
	Name = "Glorious Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 81,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,300;
		bonus2 bSubEle,Ele_Water,10;
		bonus2 bSubEle,Ele_Wind,10;
		bonus2 bSubEle,Ele_Earth,10;
		bonus2 bSubEle,Ele_Fire,10;
		bonus bAspdRate,5;
		bonus bVariableCastrate,-3;
		bonus bHealPower,5;
	]]
},
[2773] = {
	AegisName = "Krieger_Ring2",
	Name = "Glorious Popularized Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 61,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAllStats,2; ]]
},
[2774] = {
	AegisName = "Krieger_Ring3",
	Name = "Glorious Mass-Production Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bAllStats,1; ]]
},
[2775] = {
	AegisName = "Lure",
	Name = "Lure",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
},
[2776] = {
	AegisName = "Cool_Towel",
	Name = "Adventurer's Trusty Towel",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	OnEquipScript = [[ sc_start SC_SUMMER,-1,0;s]],
	OnUnequipScript = [[ sc_end SC_SUMMER; ]]
},
[2777] = {
	AegisName = "Shaman_Ring",
	Name = "Shaman Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[ bonus bUseSPrate,-5; ]]
},
[2778] = {
	AegisName = "Shaman_Earing",
	Name = "Shaman Earrings",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[ bonus bInt,2; ]]
},
[2779] = {
	AegisName = "Dark_Knight_Belt",
	Name = "Dark Knight Belt",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[
		bonus bStr,2;
		bonus bAgi,1;
	]]
},
[2780] = {
	AegisName = "Dark_Knight_Glove",
	Name = "Dark Knight Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[ autobonus "{ bonus bAspdRate,2; }",10,10000,0,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }"; ]]
},
[2781] = {
	AegisName = "Aumduras_Grace",
	Name = "Aumdura's Benefit",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[
		bonus bAllStats,1;
		bonus bMdef,1;
	]]
},
[2782] = {
	AegisName = "Ring_Of_Wise_King",
	Name = "Ring of the Ancient Wise King",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,50;
		bonus bMaxSP,20;
	]]
},
[2783] = {
	AegisName = "Eyes_Stone_Ring",
	Name = "Eye Stone Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Script = [[
		bonus bCritical,2;
		bonus bMaxSP,25;
	]]
},
[2784] = {
	AegisName = "Oh_Holy_Night",
	Name = "Christmas Musicbox",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ skill ALL_WEWISH,1; ]]
},
[2785] = {
	AegisName = "Orleans_Glove_M",
	Name = "Orlean's Gloves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bDex,2;
		bonus bMatkRate,3;
	]]
},
[2786] = {
	AegisName = "Spiritual_Ring_M",
	Name = "Spiritual Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bInt,2;
		bonus bDex,1;
	]]
},
[2787] = {
	AegisName = "Waterdrop_Brooch",
	Name = "Waterdrop Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bMaxHPrate,1;
		bonus2 bSubEle,Ele_Water,5;
	]]
},
[2788] = {
	AegisName = "Bradium_Earing",
	Name = "Bradium Earring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bInt,1;
		bonus bDex,1;
		bonus bMatk,5;
	]]
},
[2789] = {
	AegisName = "Bradium_Ring",
	Name = "Bradium Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,1;
		bonus bVit,1;
		bonus bBaseAtk,5;
	]]
},
[2790] = {
	AegisName = "Bradium_Brooch",
	Name = "Bradium Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAgi,1;
		bonus bFlee,4;
		if(readparam(bAgi)>=120) {
			bonus bCritical,4;
		}
	]]
},
[2791] = {
	AegisName = "Just_Got_Fish",
	Name = "Fresh Fish",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bHit,3; ]]
},
[2792] = {
	AegisName = "Ring_Of_Flame_Lord_I",
	Name = "Ring of Flame Lord",
	Type = "IT_TYPE_ARMOR",
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,2;
		bonus bVit,1;
		bonus bBaseAtk,15;
		bonus2 bSubEle,Ele_Fire,10;
		bonus3 bAutoSpell,CH_SOULCOLLECT,1,30;
		bonus3 bAutoSpell,MO_EXPLOSIONSPIRITS,1,10;
		bonus3 bAutoSpell,PA_PRESSURE,2,30;
		bonus3 bAutoSpell,MG_FIREBALL,1,150;
		bonus3 bAutoSpell,KN_BOWLINGBASH,5,20;
	]]
},
[2793] = {
	AegisName = "Ring_Of_Resonance_I",
	Name = "Ring of Resonance",
	Type = "IT_TYPE_ARMOR",
	Def = 2,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAgi,2;
		bonus bVit,1;
		bonus bMdef,2;
		bonus4 bAutoSpellWhenHit,WZ_QUAGMIRE,1,50,0;
		bonus3 bAutoSpellWhenHit,AS_SPLASHER,10,20;
		bonus3 bAutoSpellWhenHit,AL_HEAL,10,30;
		bonus3 bAutoSpellWhenHit,HP_ASSUMPTIO,3,20;
		bonus3 bAutoSpellWhenHit,CG_TAROTCARD,5,20;
	]]
},
[2794] = {
	AegisName = "Magic_Stone_Ring",
	Name = "Magic Stone Ring",
	Type = "IT_TYPE_ARMOR",
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bStr,2; ]]
},
[2795] = {
	AegisName = "Green_Apple_Ring",
	Name = "Green Apple Ring",
	Type = "IT_TYPE_ARMOR",
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		if(JobLevel<30) {
			bonus bAllStats,6-(JobLevel/5);
		}
	]]
},
[2796] = {
	AegisName = "Magical_Stone",
	Name = "Magical Stone",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddDamageClass,2047,10;
		bonus2 bAddDefClass,2048,-10;
		bonus3 bAddClassDropItem,6152,2047,70;
	]]
},
[2797] = {
	AegisName = "Magical_Stone_",
	Name = "Magical Stone",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddDamageClass,2049,10;
		bonus2 bAddDefClass,2050,-10;
		bonus3 bAddClassDropItem,6151,2049,70;
	]]
},
[2798] = {
	AegisName = "Will_Of_Exhausted_Angel",
	Name = "Will Of Exhausted Warrior",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Job = {
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		if(strcharinfo(PC_MAP)=="job3_arch02") {
			bonus2 bAddDefClass,1761,50;
			bonus2 bAddDefClass,1762,50;
		}
	]]
},
[2799] = {
	AegisName = "Kuirpenring",
	Name = "Ring of Protection",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMdef,1; ]]
},
[2800] = {
	AegisName = "Accelerator",
	Name = "Accelerator",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 100,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bAgi,2; ]]
},
[2801] = {
	AegisName = "Hovering_Booster",
	Name = "Hovering Booster",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 2000,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bAgi,1; ]]
},
[2802] = {
	AegisName = "Suicidal_Device",
	Name = "Suicidal Device",
	Type = "IT_TYPE_ARMOR",
	Buy = 500000,
	Weight = 1000,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
},
[2803] = {
	AegisName = "Shape_Shifter",
	Name = "Shape Shifter",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 500,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bInt,3; ]]
},
[2804] = {
	AegisName = "Cooling_Device",
	Name = "Cooling Device",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 2500,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bDex,1; ]]
},
[2805] = {
	AegisName = "Mag_Field_Generator",
	Name = "Magnetic Field Generator",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 6000,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bDex,1; ]]
},
[2806] = {
	AegisName = "Barrier_Builder",
	Name = "Barrier Builder",
	Type = "IT_TYPE_ARMOR",
	Buy = 150000,
	Weight = 8000,
	Def = 3,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bDex,1; ]]
},
[2807] = {
	AegisName = "Repair_Kit",
	Name = "Repair Kit",
	Type = "IT_TYPE_ARMOR",
	Buy = 200000,
	Weight = 400,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
},
[2808] = {
	AegisName = "Camouflage_Generator",
	Name = "Camouflage Generator",
	Type = "IT_TYPE_ARMOR",
	Buy = 250000,
	Weight = 1000,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bAgi,3; ]]
},
[2809] = {
	AegisName = "High_Quality_Cooler",
	Name = "High Quality Cooler",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 2500,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bDex,1; ]]
},
[2810] = {
	AegisName = "Special_Cooler",
	Name = "Special Cooler",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 2500,
	Slots = 1,
	Job = {
		Blacksmith = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Script = [[ bonus bDex,1; ]]
},
[2811] = {
	AegisName = "Freyja_SBracelet7",
	Name = "Freya Spirit Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2812] = {
	AegisName = "Freyja_SBracelet30",
	Name = "Freya Spirit Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2813] = {
	AegisName = "Freyja_SBracelet60",
	Name = "Freya Spirit Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2814] = {
	AegisName = "Freyja_SBracelet90",
	Name = "Freya Spirit Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2815] = {
	AegisName = "Th_Ring_Of_Water",
	Name = "Ring of Water",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAllStats,1;
		bonus bMdef,2;
	]]
},
[2816] = {
	AegisName = "Radar_Ring1",
	Name = "Radar Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2817] = {
	AegisName = "Radar_Ring2",
	Name = "Radar Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2818] = {
	AegisName = "Radar_Ring3",
	Name = "Radar Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2819] = {
	AegisName = "Swordman_Manual",
	Name = "Swordman Manual",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill SM_BASH,1;
		skill SM_PROVOKE,1;
		skill SM_MAGNUM,1;
	]]
},
[2820] = {
	AegisName = "Thief_Manual",
	Name = "Thief Manual",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill TF_DOUBLE,3;
		bonus bDoubleRate,15;
		skill TF_STEAL,1;
		skill TF_HIDING,1;
		skill TF_POISON,1;
	]]
},
[2821] = {
	AegisName = "Acolyte_Manual",
	Name = "Acolyte Manual",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill AL_HEAL,1;
		skill AL_INCAGI,1;
		skill AL_BLESSING,1;
	]]
},
[2822] = {
	AegisName = "Archer_Manual",
	Name = "Archer Manual",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill AC_OWL,1;
		skill AC_CONCENTRATION,1;
	]]
},
[2823] = {
	AegisName = "Merchant_Manual",
	Name = "Merchant Manual",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill MC_DISCOUNT,1;
		skill MC_OVERCHARGE,10;
		skill MC_IDENTIFY,1;
		skill MC_MAMMONITE,1;
	]]
},
[2824] = {
	AegisName = "Mage_Manual",
	Name = "Mage Manual",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill MG_SRECOVERY,1;
		skill MG_COLDBOLT,1;
		skill MG_FIREWALL,1;
		skill MG_FIREBOLT,1;
	]]
},
[2825] = {
	AegisName = "Shaman_EaringB",
	Name = "Shaman Earrings",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[ bonus bInt,2; ]]
},
[2826] = {
	AegisName = "Dark_Knight_BeltB",
	Name = "Dark Knight Belt",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[
		bonus bDex,2;
		bonus bAgi,1;
	]]
},
[2827] = {
	AegisName = "Dark_Knight_GloveB",
	Name = "Dark Knight Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
	},
	Script = [[ autobonus "{ bonus bMaxHPrate,10; }",10,10000,0,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }"; ]]
},
[2828] = {
	AegisName = "Upg_Clip",
	Name = "Upg Clip",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxHPrate,3;
		bonus bMaxSP,30;
	]]
},
[2829] = {
	AegisName = "Greed_Clip",
	Name = "Greed Clip",
	Type = "IT_TYPE_ARMOR",
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
},
[2830] = {
	AegisName = "Magingiorde_C",
	Name = "Ephemeral Magingiorde",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 2,
	Loc = "EQP_ACC",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bStr,40;
		bonus bMdef,7;
	]]
},
[2831] = {
	AegisName = "Brysinggamen_C",
	Name = "Ephemeral Brysinggamen",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 94,
	Refine = false,
	Script = [[
		bonus bStr,6;
		bonus bInt,6;
		bonus bVit,6;
		bonus bAgi,6;
		bonus bLuk,10;
		bonus bMdef,5;
		bonus bHealPower,6;
	]]
},
[2832] = {
	AegisName = "Freyja_Ring",
	Name = "Freya Ring R",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2833] = {
	AegisName = "Odins_Recall",
	Name = "Odin Recall R",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2834] = {
	AegisName = "F_All_In_One_Ring",
	Name = "All In One Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAllStats,1;
		bonus bNoCastCancel,0;
		bonus bVariableCastrate,10;
		skill AL_HEAL,1;
		skill AL_TELEPORT,1;
	]]
},
[2835] = {
	AegisName = "F_Critical_Ring_C",
	Name = "Critical Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bCritical,10; ]]
},
[2836] = {
	AegisName = "F_Glove_C",
	Name = "Rental Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bDex,4; ]]
},
[2837] = {
	AegisName = "F_Safety_Ring_C",
	Name = "Safety Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMdef,5; ]]
},
[2838] = {
	AegisName = "F_Necklace_C",
	Name = "Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bVit,4; ]]
},
[2839] = {
	AegisName = "F_Ring_C",
	Name = "Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bStr,4; ]]
},
[2840] = {
	AegisName = "F_Rosary_C",
	Name = "Rosary",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bLuk,4;
		bonus bMdef,5;
	]]
},
[2841] = {
	AegisName = "Caracas_Ring",
	Name = "Caracas Ring",
	Type = "IT_TYPE_ARMOR",
	Def = 2,
	Job = {
		Sage = true,
		Alchemist = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 99,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bInt,2;
		bonus bDex,2;
		bonus bMdef,2;
		bonus2 bExpAddRace, RC_All, 10;
	]]
},
[2842] = {
	AegisName = "F_Earing_C",
	Name = "Earring",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bInt,3; ]]
},
[2843] = {
	AegisName = "Gold_Trickle",
	Name = "Golden Bell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	EquipLv = 75,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMaxSP,50; ]]
},
[2844] = {
	AegisName = "El_Dicastes_Light",
	Name = "Light of El Dicastes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ skill RETURN_TO_ELDICASTES,1; ]]
},
[2845] = {
	AegisName = "No_Fear_Belt",
	Name = "NoFear Belts",
	Type = "IT_TYPE_ARMOR",
	Def = 2,
	Loc = "EQP_ACC",
	EquipLv = 20,
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bAtkRate,5;
		bonus bMatkRate,5;
	]]
},
[2846] = {
	AegisName = "E_All_In_One_Ring",
	Name = "E All In One Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2847] = {
	AegisName = "E_Critical_Ring_C",
	Name = "E Critical Ring C",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bCritical,10; ]]
},
[2848] = {
	AegisName = "E_Glove_C",
	Name = "E Glove C",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bDex,4; ]]
},
[2849] = {
	AegisName = "E_Safety_Ring_C",
	Name = "E Safety Ring C",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMdef,5; ]]
},
[2850] = {
	AegisName = "E_Ring_C",
	Name = "E Ring C",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bVit,4; ]]
},
[2851] = {
	AegisName = "E_Necklace_C",
	Name = "E Necklace C",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bStr,4; ]]
},
[2852] = {
	AegisName = "E_Rosary_C",
	Name = "E Rosary C",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bLuk,4;
		bonus bMdef,5;
	]]
},
[2853] = {
	AegisName = "Telekinetic_Orb",
	Name = "Telekinetic Orb",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 110,
	Refine = false,
	Script = [[
		bonus bMdef,1;
		bonus bInt,3;
		bonus bMaxSP,30;
		bonus2 bSkillAtk,WL_SOULEXPANSION,10;
		bonus2 bSkillAtk,SO_PSYCHIC_WAVE,10;
		bonus2 bSkillUseSP,WL_SOULEXPANSION,-50;
		bonus2 bSkillUseSP,SO_PSYCHIC_WAVE,-50;
	]]
},
[2854] = {
	AegisName = "Alchemy_Glove",
	Name = "Alchemy Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 125,
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bInt,1;
		bonus2 bMagicAtkEle,Ele_Fire,10;
		bonus2 bMagicAtkEle,Ele_Water,-20;
		bonus2 bSubEle,Ele_Water,-30;
		bonus3 bAutoSpell,MG_FIREBALL,5,30;
		bonus5 bAutoSpell,MG_FIREBOLT,5,30,BF_MAGIC,1;
	]]
},
[2855] = {
	AegisName = "Whike_Black_Tail",
	Name = "Whikebain's Black Tail",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 45,
	Refine = false,
	Script = [[
		bonus bCritical,7;
		bonus bAspdRate,3;
		bonus2 bAddEff2,Eff_Curse,10;
	]]
},
[2856] = {
	AegisName = "Half_Megin",
	Name = "Meginjard (Trial Version)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 47,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,3;
		bonus bStr,20;
	]]
},
[2857] = {
	AegisName = "Half_Brysing",
	Name = "Brisingamen (Trial Version)",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 47,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bStr,3;
		bonus bInt,5;
		bonus bVit,3;
		bonus bDex,3;
		bonus bAgi,3;
		bonus bLuk,5;
		bonus bMdef,2;
	]]
},
[2858] = {
	AegisName = "Pendant_Of_Guardian",
	Name = "Pendant Of Guardian",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ skill ALL_GUARDIAN_RECALL,1; ]]
},
[2859] = {
	AegisName = "Golden_Rod_Orb",
	Name = "Golden Rod Orb",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bInt,1;
		bonus2 bSubEle,Ele_Wind,15;
		bonus3 bAutoSpellWhenHit,WZ_JUPITEL,3,30;
	]]
},
[2860] = {
	AegisName = "Aqua_Orb",
	Name = "Aqua Orb",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bInt,1;
		bonus2 bSubEle,Ele_Water,15;
		bonus3 bAutoSpellWhenHit,WZ_FROSTNOVA,3,30;
	]]
},
[2861] = {
	AegisName = "Crimson_Orb",
	Name = "Crimson Orb",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bInt,1;
		bonus2 bSubEle,Ele_Fire,15;
		bonus3 bAutoSpellWhenHit,WZ_SIGHTRASHER,3,30;
	]]
},
[2862] = {
	AegisName = "Forest_Orb",
	Name = "Forest Orb",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		Wizard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMdef,2;
		bonus bInt,1;
		bonus2 bSubEle,Ele_Earth,15;
		bonus3 bAutoSpellWhenHit,WZ_QUAGMIRE,3,30;
	]]
},
[2863] = {
	AegisName = "Ring_Of_Valkyrie",
	Name = "Ring of The Valkyrie",
	Type = "IT_TYPE_ARMOR",
	Def = 2,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace, RC_All, 5; ]]
},
[2864] = {
	AegisName = "Light_Of_Cure",
	Name = "Light Of Cure",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 110,
	Refine = false,
	Script = [[
		bonus bVit,2;
		bonus bHealPower,2;
	]]
},
[2865] = {
	AegisName = "Seal_Of_Cathedral",
	Name = "Seal Of Cathedral",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 110,
	Refine = false,
	Script = [[
		bonus bInt,2;
		bonus bHealPower,2;
	]]
},
[2866] = {
	AegisName = "Ring_Of_Archbishop",
	Name = "Ring Of Archbishop",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Job = {
		Priest = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 110,
	Refine = false,
	Script = [[
		bonus bDex,2;
		bonus bHealPower,2;
	]]
},
[2867] = {
	AegisName = "Broken_Bamboo_Piece",
	Name = "Broken Bamboo Piece",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bMdef,2; ]]
},
[2868] = {
	AegisName = "Green_Batik",
	Name = "Green Batik",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 45,
	Refine = false,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
		bonus bDex,1;
		bonus bMdef,1;
	]]
},
[2869] = {
	AegisName = "Colorful_Ketupat",
	Name = "Colorful Ketupat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 45,
	Refine = false,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
		bonus bDex,1;
	]]
},
[2870] = {
	AegisName = "Tw_8th_Anni_Ring",
	Name = "Tw 8th Anni Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bStr,5;
		bonus bInt,5;
		bonus bVit,5;
		bonus bDex,5;
		bonus bAgi,5;
		bonus bLuk,5;
	]]
},
[2871] = {
	AegisName = "Brazilian_Emblem",
	Name = "Symbol Of Brazil",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
},
[2872] = {
	AegisName = "G_Honor_Certificate",
	Name = "G Honor Certificate",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2873] = {
	AegisName = "Cat_Hand_Glove",
	Name = "Cat Hand Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bVit,1;
		bonus bDex,1;
		bonus bAgi,1;
		bonus bLuk,1;
	]]
},
[2874] = {
	AegisName = "Buffalo_Horn",
	Name = "Buffalo Horns",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
},
[2875] = {
	AegisName = "RO_Appreciation_Ring",
	Name = "Grate Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
	]]
},
[2876] = {
	AegisName = "Necklace_Spica",
	Name = "Spica Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
	Script = [[ bonus bMdef,1; ]]
},
[2877] = {
	AegisName = "Glove_Sabik",
	Name = "Sabiku Gloves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
	Script = [[ bonus bMdef,1; ]]
},
[2878] = {
	AegisName = "Bracelet_Arunairi",
	Name = "Bracelet Alna And Iris",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
	Script = [[ bonus bMdef,1; ]]
},
[2879] = {
	AegisName = "Badge_Giorredart",
	Name = "Algol Badge",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
	Script = [[ bonus bMdef,1; ]]
},
[2880] = {
	AegisName = "Ring_Lupak",
	Name = "Rufaku Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
	Script = [[ bonus bMdef,1; ]]
},
[2881] = {
	AegisName = "Orleans_Necklace",
	Name = "Orlean's Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bDex,2;
		bonus bMatk,20;
	]]
},
[2882] = {
	AegisName = "Ecoro_Cardslip",
	Name = "Card Sleeves ECO ?RO",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bVit,1;
		bonus bLuk,1;
	]]
},
[2883] = {
	AegisName = "Ur_Seal",
	Name = "Ur's Seal",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 4,
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHPrate,2;
		bonus2 bSkillUseSP,LK_SPIRALPIERCE,5;
		bonus2 bSkillUseSP,RK_HUNDREDSPEAR,5;
	]]
},
[2884] = {
	AegisName = "Peuz_Seal",
	Name = "Peuz's Seal",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 3,
	Slots = 1,
	Job = {
		Knight = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bBaseAtk,20;
		bonus bMaxSP,20;
	]]
},
[2885] = {
	AegisName = "Mother_Heart",
	Name = "Mother's Heart",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	EquipLv = { 1, 120 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bBaseAtk,30;
		bonus bMatk,30;
		bonus2 bExpAddRace, RC_All, 15;
		skill CR_AUTOGUARD,3;
		skill AL_CURE,1;
	]]
},
[2886] = {
	AegisName = "Sabah_Ring",
	Name = "Sapha Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bCritical,3;
		bonus2 bSkillUseSP,GC_DARKILLUSION,5;
	]]
},
[2887] = {
	AegisName = "Nab_Ring",
	Name = "Nab Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bBaseAtk,10;
		bonus bMatk,20;
	]]
},
[2888] = {
	AegisName = "School_Bag",
	Name = "Attending School Back",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAspdRate,3;
		bonus bVariableCastrate,-3;
		if(BaseLevel<80) {
			bonus bMaxHP,200;
			bonus bMaxSP,100;
		}
	]]
},
[2889] = {
	AegisName = "Endure_Ring",
	Name = "Ring of Patience",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
},
[2890] = {
	AegisName = "White_Wing_Brooch",
	Name = "White Wing Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bDex,2;
		bonus bLongAtkRate,3;
	]]
},
[2891] = {
	AegisName = "Black_wing_Brooch",
	Name = "Black Wing Brooch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Hunter = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bInt,2;
		bonus bFlee2,3;
	]]
},
[2892] = {
	AegisName = "Assassin_Handcuffs",
	Name = "Assassin Handcuffs",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 400,
	Def = 3,
	Slots = 1,
	Job = {
		Assassin = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxSP,20;
		bonus bCritical,3;
	]]
},
[2893] = {
	AegisName = "Cursed_Heart",
	Name = "Haunted Heart",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
},
[2894] = {
	AegisName = "Glove_Of_Shura",
	Name = "Glove Of Shura",
	Type = "IT_TYPE_ARMOR",
	Buy = 56000,
	Weight = 400,
	Def = 1,
	Job = {
		Monk = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 130,
	Refine = false,
	Script = [[
		bonus bStr,5;
		bonus bMaxSPrate,6;
		bonus bMaxHPrate,-6;
		if(readparam(bStr)>=120) {
			bonus bBaseAtk,30;
		}
	]]
},
[2895] = {
	AegisName = "Medal_Of_Valor1",
	Name = "Medal Of Valor1",
	Type = "IT_TYPE_ARMOR",
	Def = 4,
	Loc = "EQP_ACC",
	Refine = false,
},
[2896] = {
	AegisName = "Medal_Of_Valor2",
	Name = "Medal Of Valor2",
	Type = "IT_TYPE_ARMOR",
	Def = 4,
	Loc = "EQP_ACC",
	Refine = false,
},
[2897] = {
	AegisName = "2011RWC_Necklace_J",
	Name = "RWC Necklace",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace, RC_All, 5;
		bonus bMatkRate,5;
		bonus2 bExpAddRace, RC_All, 1;
	]]
},
[2898] = {
	AegisName = "Black_Rosary",
	Name = "Black Rosary",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[ bonus bMdef,15; ]]
},
[2899] = {
	AegisName = "Sound_Amplifier",
	Name = "Sound Amplifier",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Job = {
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[
		bonus2 bSkillAtk,WM_METALICSOUND,150;
		bonus2 bSkillUseSP,WM_METALICSOUND,-60;
		bonus bVariableCastrate,-50;
	]]
},
[2900] = {
	AegisName = "Morriganes_Belt_",
	Name = "Morrigane's Belt",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 61,
	Refine = false,
	Script = [[
		bonus bBaseAtk,5;
		bonus bCritical,3;
	]]
},
[2901] = {
	AegisName = "Morriganes_Pendant_",
	Name = "Morrigane's Pendant",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 61,
	Refine = false,
	Script = [[
		bonus bStr,2;
		bonus bCritical,3;
	]]
},
[2902] = {
	AegisName = "Morpheuss_Ring_",
	Name = "Morpheus's Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 33,
	Refine = false,
	Script = [[ bonus bInt,1; ]]
},
[2903] = {
	AegisName = "Morpheuss_Armlet_",
	Name = "Morpheus's Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_ACC",
	EquipLv = 33,
	Refine = false,
	Script = [[ bonus bInt,1; ]]
},
[2904] = {
	AegisName = "Naqsh",
	Name = "At Lorient",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	Refine = false,
},
[2905] = {
	AegisName = "Super_Ora_Ora",
	Name = "Ora Ora Very Strong",
	Type = "IT_TYPE_ARMOR",
	Weight = 1000,
	Loc = "EQP_ACC",
	Refine = false,
},
[2906] = {
	AegisName = "Happy_Gauntlet",
	Name = "Gloves of Fortune",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 3,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 70,
	Refine = false,
	Script = [[ bonus bMdef,3; ]]
},
[2907] = {
	AegisName = "Buwaya_Tattoo",
	Name = "Buwaya Agimat Tattoo",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMatkRate,7;
		bonus bFixedCastrate,-7;
	]]
},
[2908] = {
	AegisName = "Light_Ring",
	Name = "Ring of Light",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
},
[2909] = {
	AegisName = "Darkness_Ring",
	Name = "Ring of Darkness",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
},
[2910] = {
	AegisName = "Bakonawa_Tattoo",
	Name = "Bakonawa Agimat Tattoo",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus2 bAddRace, RC_All, 7;
		bonus bAspdRate,10;
	]]
},
[2911] = {
	AegisName = "Bangungot_Tattoo",
	Name = "Bangungot Agimat Tattoo",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bHealPower,4;
		bonus bHealPower2,7;
	]]
},
[2912] = {
	AegisName = "Xylitol_2011",
	Name = "Xylitol 2011",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
},
[2913] = {
	AegisName = "Thief_Handcuff",
	Name = "Thieves Large Handcuffs",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1400,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
},
[2914] = {
	AegisName = "Wizard_Left_Eye",
	Name = "Wizard Left Eye",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bInt,4;
		bonus bMdef,3;
	]]
},
[2915] = {
	AegisName = "Ettlang_Keepsake",
	Name = "Ettlang Keepsake",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMdef,10; ]]
},
[2916] = {
	AegisName = "Fairy_Wing",
	Name = "Fairy Wing",
	Type = "IT_TYPE_ARMOR",
	Weight = 10,
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ skill ECLAGE_RECALL,1; ]]
},
[2917] = {
	AegisName = "Str_Glove",
	Name = "Str Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bBaseAtk,(readparam(bStr)/10);
		if(readparam(bStr)>=110) {
			bonus bAtkRate,1;
		}
	]]
},
[2918] = {
	AegisName = "Int_Glove",
	Name = "Int Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bMatk,(readparam(bInt)/10);
		if(readparam(bInt)>=110) {
			bonus bMatkRate,1;
		}
	]]
},
[2919] = {
	AegisName = "Agi_Glove",
	Name = "Agi Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bFlee,(readparam(bAgi)/10);
		if(readparam(bAgi)>=110) {
			bonus bFlee2,1;
		}
	]]
},
[2920] = {
	AegisName = "Vit_Glove",
	Name = "Vit Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bMaxHP,(readparam(bVit)/10)*50;
		if(readparam(bVit)>=110) {
			bonus bMaxHPrate,1;
		}
	]]
},
[2921] = {
	AegisName = "Dex_Glove",
	Name = "Dex Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bHit,(readparam(bDex)/10);
		if(readparam(bDex)>=110) {
			bonus bLongAtkRate,1;
		}
	]]
},
[2922] = {
	AegisName = "Luk_Glove",
	Name = "Luk Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bCritical,(readparam(bLuk)/10);
		if(readparam(bLuk)>=110) {
			bonus bCritAtkRate,1;
		}
	]]
},
[2923] = {
	AegisName = "Str_Glove_",
	Name = "Str Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bBaseAtk,(readparam(bStr)/10);
		if(readparam(bStr)>=110) {
			bonus bAtkRate,1;
		}
	]]
},
[2924] = {
	AegisName = "Int_Glove_",
	Name = "Int Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bMatk,(readparam(bInt)/10);
		if(readparam(bInt)>=110) {
			bonus bMatkRate,1;
		}
	]]
},
[2925] = {
	AegisName = "Agi_Glove_",
	Name = "Agi Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bFlee,(readparam(bAgi)/10);
		if(readparam(bAgi)>=110) {
			bonus bFlee2,1;
		}
	]]
},
[2926] = {
	AegisName = "Vit_Glove_",
	Name = "Vit Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bMaxHP,(readparam(bVit)/10)*50;
		if(readparam(bVit)>=110) {
			bonus bMaxHPrate,1;
		}
	]]
},
[2927] = {
	AegisName = "Dex_Glove_",
	Name = "Dex Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bHit,(readparam(bDex)/10);
		if(readparam(bDex)>=110) {
			bonus bLongAtkRate,1;
		}
	]]
},
[2928] = {
	AegisName = "Luk_Glove_",
	Name = "Luk Glove",
	Type = "IT_TYPE_ARMOR",
	Buy = 75000,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 100,
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		bonus bMaxSP,20;
		bonus bCritical,(readparam(bLuk)/10);
		if(readparam(bLuk)>=110) {
			bonus bCritAtkRate,1;
		}
	]]
},
[2936] = {
	AegisName = "Recovery_Ring",
	Name = "Rings of Recovery",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 10,
	Refine = false,
	Script = [[ bonus bVit,1; ]]
},
[2940] = {
	AegisName = "Ninja_Manual",
	Name = "Ninja Tutorial",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill NJ_UTSUSEMI,1;
		skill NJ_KOUENKA,1;
		skill NJ_SYURIKEN,1;
	]]
},
[2941] = {
	AegisName = "Gunslinger_Manual",
	Name = "Gunslinger Tutorial",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill GS_GLITTERING,1;
		skill GS_ADJUSTMENT,1;
		skill GS_MADNESSCANCEL,1;
		skill GS_INCREASING,1;
	]]
},
[2942] = {
	AegisName = "Taekwon_Manual",
	Name = "Taekwon Tutorial",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = { 1, 12 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxSP,100;
		skill TK_SEVENWIND,4;
		skill TK_JUMPKICK,5;
	]]
},
[2944] = {
	AegisName = "TE_Ring_Of_Protection",
	Name = "TE Ring of Protection",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMaxHP,100;
		bonus2 bAddRaceTolerance,RC_Player,5;
	]]
},
[2945] = {
	AegisName = "TE_Ring_Of_Rage",
	Name = "TE Rage Of Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus2 bAddRace,RC_Player,5;
		bonus2 bMagicAddRace,RC_Player,5;
	]]
},
[2946] = {
	AegisName = "TE_Ring_Of_Defiance",
	Name = "TE Ring Of Defiance",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	EquipLv = 40,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bMdef,5;
		bonus2 bAddRaceTolerance,RC_Player,5;
	]]
},
[2949] = {
	AegisName = "Silversmith_Bracelet",
	Name = "Silversmith Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 60,
	Refine = false,
	Script = [[
		bonus bAllStats, 1;
		bonus bMdef, 3;
		skill SA_SPELLBREAKER,5;
	]]
},
[2950] = {
	AegisName = "Rune_Ring",
	Name = "Rune Ring",
	Type = "IT_TYPE_ARMOR",
	Loc = "EQP_ACC",
	EquipLv = { 1, 100 },
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bExpAddRace, RC_All, 10; ]]
},
[2951] = {
	AegisName = "Kvasir_Ring_Blue",
	Name = "Kvasir Ring Blue",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxSP,30;
		skill ECL_SNOWFLIP,1;
	]]
},
[2952] = {
	AegisName = "Kvasir_Ring_Red",
	Name = "Kvasir Ring Red",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxSP,30;
		skill "ECL_PEONYMAMY",1;
	]]
},
[2953] = {
	AegisName = "Kvasir_Ring_Green",
	Name = "Kvasir Ring Green",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		skill "ECL_SADAGUI",1;
	]]
},
[2954] = {
	AegisName = "Kvasir_Ring_Brown",
	Name = "Kvasir Ring Brown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20000,
	Weight = 100,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxHP,100;
		skill "ECL_SEQUOIADUST",1;
	]]
},
[2959] = {
	AegisName = "Fidelity_Necklace",
	Name = "Fidelity Necklace",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 50,
	Refine = false,
	Script = [[
		bonus bAgi,2;
		bonus2 bSubRace,RC_Brute,3;
	]]
},
[2960] = {
	AegisName = "Badge_Of_Manny",
	Name = "Badge Of Manny",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus bAllStats,1; ]]
},
[2963] = {
	AegisName = "Body_Power_Up_Ring",
	Name = "Physical Enhancer Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[
		bonus bAtkRate,5;
	]]
},
[2964] = {
	AegisName = "Ring_Of_Spell_Explosion",
	Name = "Magic Intensifier Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Slots = 1,
	Loc = "EQP_ACC",
	EquipLv = 90,
	Refine = false,
	Script = [[
		bonus bMatkRate,5;
	]]
},
[2966] = {
	AegisName = "RWC_2012_Ring",
	Name = "RWC 2012 Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus2 bAddRace, RC_All, 1; ]]
},
[2967] = {
	AegisName = "RWC_2012_Ring_",
	Name = "Chambered RWC 2012 Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[ bonus2 bAddRace, RC_All, 1; ]]
},
[2968] = {
	AegisName = "RWC_2012_Pendant",
	Name = "RWC 2012 Pendant",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Loc = "EQP_ACC",
	Refine = false,
},
[2969] = {
	AegisName = "RWC_2012_Pendant_",
	Name = "Chambered RWC 2012 Pendant",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
},
[2971] = {
	AegisName = "Pocket_Watch__",
	Name = "Pocket Watch",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Slots = 1,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER" },
	Loc = "EQP_ACC",
	EquipLv = 80,
	Refine = false,
	Script = [[
		bonus bHPrecovRate,15;
		bonus bSPrecovRate,15;
		bonus bMatkRate,7;
	]]
},
[2981] = {
	AegisName = "RingOfHero",
	Name = "Brave Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Loc = "EQP_ACC",
	EquipLv = 160,
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[2986] = {
	AegisName = "Snake_Ring",
	Name = "Snake Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bDex,3;
		bonus bMdef,2;
	]]
},
[2987] = {
	AegisName = "Snake_Pendant",
	Name = "Snake Pendant",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bAgi,3;
		bonus bLuk,2;
		bonus bMdef,3;
	]]
},
[2988] = {
	AegisName = "Winged_Ring_Of_Newoz",
	Name = "Oz's New Wing Ring",
	Type = "IT_TYPE_ARMOR",
	Buy = 62000,
	Weight = 100,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_ACC",
	EquipLv = 130,
	Refine = false,
	Script = [[ bonus bVariableCastrate,-25; ]]
},
[2989] = {
	AegisName = "Floral_Bracelet_Of_Igu",
	Name = "Bloody Floral Decoration Bracelet",
	Type = "IT_TYPE_ARMOR",
	Buy = 62000,
	Weight = 100,
	Slots = 1,
	Job = {
		Bard = true,
	},
	Upper = { "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_ACC",
	EquipLv = 130,
	Refine = false,
	Script = [[ bonus bVariableCastrate,-25; ]]
},
[2997] = {
	AegisName = "RWC_Gold_Brooch",
	Name = "RWC Gold Brooch",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Slots = 1,
	Loc = "EQP_ACC",
	Refine = false,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bAtk,20;
		bonus bMatk,20;
	]]
},
[2999] = {
	AegisName = "RWC_Silver_Brooch",
	Name = "RWC Silver Brooch",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Loc = "EQP_ACC",
	Refine = false,
	Script = [[
		bonus bMaxHP,300;
		bonus bMaxSP,30;
	]]
},

--== Cards =================================================
[4001] = {
	AegisName = "Poring_Card",
	Name = "Poring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bLuk,2;
		bonus bFlee2,1;
	]]
},
[4002] = {
	AegisName = "Fabre_Card",
	Name = "Fabre Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bVit,1;
		bonus bMaxHP,100;
	]]
},
[4003] = {
	AegisName = "Pupa_Card",
	Name = "Pupa Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMaxHP,700; ]]
},
[4004] = {
	AegisName = "Drops_Card",
	Name = "Drops Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bDex,1;
		bonus bHit,3;
	]]
},
[4005] = {
	AegisName = "Poring__Card",
	Name = "Santa Poring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Dark,20; ]]
},
[4006] = {
	AegisName = "Lunatic_Card",
	Name = "Lunatic Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bLuk,1;
		bonus bCritical,1;
		bonus bFlee2,1;
	]]
},
[4007] = {
	AegisName = "Pecopeco_Egg_Card",
	Name = "Pecopeco Egg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Formless,20; ]]
},
[4008] = {
	AegisName = "Picky_Card",
	Name = "Picky Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bStr,1;
		bonus bBaseAtk,10;
	]]
},
[4009] = {
	AegisName = "Chonchon_Card",
	Name = "Chonchon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAgi,1;
		bonus bFlee,2;
	]]
},
[4010] = {
	AegisName = "Wilow_Card",
	Name = "Willow Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bMaxSP,80; ]]
},
[4011] = {
	AegisName = "Picky__Card",
	Name = "Picky Egg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bVit,1;
		bonus bMaxHP,100;
	]]
},
[4012] = {
	AegisName = "Thief_Bug_Egg_Card",
	Name = "Thiefbug Egg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus bMaxHP,400; ]]
},
[4013] = {
	AegisName = "Andre_Egg_Card",
	Name = "Andre Egg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus bMaxHPrate,5; ]]
},
[4014] = {
	AegisName = "Roda_Frog_Card",
	Name = "Roda Frog Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHP,400;
		bonus bMaxSP,50;
	]]
},
[4015] = {
	AegisName = "Condor_Card",
	Name = "Condor Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bFlee,10; ]]
},
[4016] = {
	AegisName = "Thief_Bug_Card",
	Name = "Thief Bug Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bAgi,1; ]]
},
[4017] = {
	AegisName = "Savage_Babe_Card",
	Name = "Savage Bebe Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEff,Eff_Stun,500; ]]
},
[4018] = {
	AegisName = "Andre_Larva_Card",
	Name = "Andre Larva Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bInt,1;
		bonus bMaxSP,10;
	]]
},
[4019] = {
	AegisName = "Hornet_Card",
	Name = "Hornet Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bStr,1;
		bonus bBaseAtk,3;
	]]
},
[4020] = {
	AegisName = "Farmiliar_Card",
	Name = "Familiar Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Blind,500;
		bonus bBaseAtk,5;
	]]
},
[4021] = {
	AegisName = "Rocker_Card",
	Name = "Rocker Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDex,1;
		bonus bBaseAtk,5;
	]]
},
[4022] = {
	AegisName = "Spore_Card",
	Name = "Spore Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bVit,2; ]]
},
[4023] = {
	AegisName = "Desert_Wolf_Babe_Card",
	Name = "Baby Desertwolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bInt,1; ]]
},
[4024] = {
	AegisName = "Plankton_Card",
	Name = "Plankton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Sleep,500;
		bonus bBaseAtk,5;
	]]
},
[4025] = {
	AegisName = "Skeleton_Card",
	Name = "Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,10;
		bonus2 bAddEff,Eff_Stun,200;
	]]
},
[4026] = {
	AegisName = "Thief_Bug_Female_Card",
	Name = "Female Thiefbug Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bAgi,1;
		bonus bFlee,1;
	]]
},
[4027] = {
	AegisName = "Kukre_Card",
	Name = "Kukre Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bAgi,2; ]]
},
[4028] = {
	AegisName = "Tarou_Card",
	Name = "Tarou Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bStr,2; ]]
},
[4029] = {
	AegisName = "Wolf_Card",
	Name = "Wolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,15;
		bonus bCritical,1;
	]]
},
[4030] = {
	AegisName = "Mandragora_Card",
	Name = "Mandragora Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Wind,20; ]]
},
[4031] = {
	AegisName = "Pecopeco_Card",
	Name = "Pecopeco Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMaxHPrate,10; ]]
},
[4032] = {
	AegisName = "Ambernite_Card",
	Name = "Ambernite Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus bDef,2; ]]
},
[4033] = {
	AegisName = "Poporing_Card",
	Name = "PoPoring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill TF_DETOXIFY,1; ]]
},
[4034] = {
	AegisName = "Worm_Tail_Card",
	Name = "Wormtail Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bDex,2; ]]
},
[4035] = {
	AegisName = "Hydra_Card",
	Name = "Hydra Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_DemiPlayer,20; ]]
},
[4036] = {
	AegisName = "Muka_Card",
	Name = "Muka Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bHPrecovRate,10; ]]
},
[4037] = {
	AegisName = "Snake_Card",
	Name = "Snake Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Poison,500;
		bonus bBaseAtk,5;
	]]
},
[4038] = {
	AegisName = "Zombie_Card",
	Name = "Zombie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bHPrecovRate,20; ]]
},
[4039] = {
	AegisName = "Stainer_Card",
	Name = "Stainer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bResEff,Eff_Silence,2000;
		bonus bDef,1;
	]]
},
[4040] = {
	AegisName = "Creamy_Card",
	Name = "Creamy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill AL_TELEPORT,1; ]]
},
[4041] = {
	AegisName = "Coco_Card",
	Name = "Coco Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bResEff,Eff_Sleep,2000;
		bonus bDef,1;
	]]
},
[4042] = {
	AegisName = "Steel_Chonchon_Card",
	Name = "Steel Chonchon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bSubEle,Ele_Wind,10;
		bonus bDef,2;
	]]
},
[4043] = {
	AegisName = "Andre_Card",
	Name = "Andre Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bBaseAtk,20; ]]
},
[4044] = {
	AegisName = "Smokie_Card",
	Name = "Smokie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill TF_HIDING,1;s]],
	OnUnequipScript = [[ sc_end SC_HIDING; ]]
},
[4045] = {
	AegisName = "Horn_Card",
	Name = "Horn Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus bLongAtkDef,35; ]]
},
[4046] = {
	AegisName = "Martin_Card",
	Name = "Martin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bResEff,Eff_Blind,2000;
		bonus bDef,1;
	]]
},
[4047] = {
	AegisName = "Ghostring_Card",
	Name = "Ghostring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Ghost;
		bonus bHPrecovRate,-25;
	]]
},
[4048] = {
	AegisName = "Poison_Spore_Card",
	Name = "Poison Spore Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill TF_POISON,3; ]]
},
[4049] = {
	AegisName = "Vadon_Card",
	Name = "Vadon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Fire,20; ]]
},
[4050] = {
	AegisName = "Thief_Bug_Male_Card",
	Name = "Male Thiefbug Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bAgi,2; ]]
},
[4051] = {
	AegisName = "Yoyo_Card",
	Name = "Yoyo Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bFlee2,5;
		bonus bAgi,1;
	]]
},
[4052] = {
	AegisName = "Elder_Wilow_Card",
	Name = "Elder Willow Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bInt,2; ]]
},
[4053] = {
	AegisName = "Vitata_Card",
	Name = "Vitata Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		skill AL_HEAL,1;
		bonus bUseSPrate,25;
	]]
},
[4054] = {
	AegisName = "Angeling_Card",
	Name = "Angeling Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bDefEle,Ele_Holy; ]]
},
[4055] = {
	AegisName = "Marina_Card",
	Name = "Marina Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Freeze,500;
		bonus bBaseAtk,5;
	]]
},
[4056] = {
	AegisName = "Dustiness_Card",
	Name = "Dustiness Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Wind,30;
		bonus bFlee,5;
	]]
},
[4057] = {
	AegisName = "Metaller_Card",
	Name = "Metaller Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Silence,500;
		bonus bBaseAtk,5;
	]]
},
[4058] = {
	AegisName = "Thara_Frog_Card",
	Name = "Thara Frog Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,30; ]]
},
[4059] = {
	AegisName = "Soldier_Andre_Card",
	Name = "Soldier Andre Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,30; ]]
},
[4060] = {
	AegisName = "Goblin_Card",
	Name = "Goblin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Brute,20; ]]
},
[4061] = {
	AegisName = "Cornutus_Card",
	Name = "Cornutus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bUnbreakableArmor,0;
		bonus bDef,1;
	]]
},
[4062] = {
	AegisName = "Anacondaq_Card",
	Name = "Anacondaq Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Poison,20; ]]
},
[4063] = {
	AegisName = "Caramel_Card",
	Name = "Caramel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Insect,20; ]]
},
[4064] = {
	AegisName = "Zerom_Card",
	Name = "Zerom Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bDex,3; ]]
},
[4065] = {
	AegisName = "Kaho_Card",
	Name = "Kaho Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Earth,20; ]]
},
[4066] = {
	AegisName = "Orc_Warrior_Card",
	Name = "Orc Warrior Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Brute,30; ]]
},
[4067] = {
	AegisName = "Megalodon_Card",
	Name = "Megalodon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bResEff,Eff_Freeze,2000;
		bonus bDef,1;
	]]
},
[4068] = {
	AegisName = "Scorpion_Card",
	Name = "Scorpion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Plant,20; ]]
},
[4069] = {
	AegisName = "Drainliar_Card",
	Name = "Drainliar Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Water,20; ]]
},
[4070] = {
	AegisName = "Eggyra_Card",
	Name = "Eggyra Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bSPrecovRate,15; ]]
},
[4071] = {
	AegisName = "Orc_Zombie_Card",
	Name = "Orc Zombie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Undead,30;
		bonus bFlee,5;
	]]
},
[4072] = {
	AegisName = "Golem_Card",
	Name = "Golem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus bBaseAtk,5;
	]]
},
[4073] = {
	AegisName = "Pirate_Skel_Card",
	Name = "Pirate Skel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill MC_DISCOUNT,5; ]]
},
[4074] = {
	AegisName = "BigFoot_Card",
	Name = "Bigfoot Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Insect,30; ]]
},
[4075] = {
	AegisName = "Argos_Card",
	Name = "Argos Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bResEff,Eff_Stone,2000;
		bonus bDef,1;
	]]
},
[4076] = {
	AegisName = "Magnolia_Card",
	Name = "Magnolia Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Curse,500;
		bonus bBaseAtk,5;
	]]
},
[4077] = {
	AegisName = "Phen_Card",
	Name = "Phen Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bNoCastCancel,0;
		bonus bVariableCastrate,25;
	]]
},
[4078] = {
	AegisName = "Savage_Card",
	Name = "Savage Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bVit,3; ]]
},
[4079] = {
	AegisName = "Mantis_Card",
	Name = "Mantis Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bStr,3; ]]
},
[4080] = {
	AegisName = "Flora_Card",
	Name = "Flora Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Fish,20; ]]
},
[4081] = {
	AegisName = "Hode_Card",
	Name = "Hode Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Earth,30;
		bonus bFlee,5;
	]]
},
[4082] = {
	AegisName = "Desert_Wolf_Card",
	Name = "Desert Wolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddSize,Size_Small,15;
		bonus bBaseAtk,5;
	]]
},
[4083] = {
	AegisName = "Rafflesia_Card",
	Name = "Rafflesia Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Fish,30; ]]
},
[4084] = {
	AegisName = "Marine_Sphere_Card",
	Name = "Marine Sphere Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill SM_MAGNUM,3; ]]
},
[4085] = {
	AegisName = "Orc_Skeleton_Card",
	Name = "Orc Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Holy,20; ]]
},
[4086] = {
	AegisName = "Soldier_Skeleton_Card",
	Name = "Soldier Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bCritical,9; ]]
},
[4087] = {
	AegisName = "Giearth_Card",
	Name = "Giearth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bResEff,Eff_Confusion,10000;
		bonus2 bSubEle,Ele_Earth,15;
	]]
},
[4088] = {
	AegisName = "Frilldora_Card",
	Name = "Frilldora Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ skill AS_CLOAKING,1;s]],
	OnUnequipScript = [[ sc_end SC_CLOAKING; ]]
},
[4089] = {
	AegisName = "Sword_Fish_Card",
	Name = "Swordfish Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Water;
		bonus bDef,1;
	]]
},
[4090] = {
	AegisName = "Munak_Card",
	Name = "Munak Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bResEff,Eff_Stone,1500;
		bonus2 bSubEle,Ele_Earth,5;
		bonus bDef,1;
	]]
},
[4091] = {
	AegisName = "Kobold_Card",
	Name = "Kobold Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bStr,1;
		bonus bCritical,4;
	]]
},
[4092] = {
	AegisName = "Skel_Worker_Card",
	Name = "Skel Worker Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddSize,Size_Medium,15;
		bonus bBaseAtk,5;
	]]
},
[4093] = {
	AegisName = "Obeaune_Card",
	Name = "Obeaune Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill AL_CURE,1; ]]
},
[4094] = {
	AegisName = "Archer_Skeleton_Card",
	Name = "Archer Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bLongAtkRate,10; ]]
},
[4095] = {
	AegisName = "Marse_Card",
	Name = "Marse Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Water,30;
		bonus bFlee,5;
	]]
},
[4096] = {
	AegisName = "Zenorc_Card",
	Name = "Zenorc Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddEff,Eff_Poison,400;
		bonus bBaseAtk,10;
	]]
},
[4097] = {
	AegisName = "Matyr_Card",
	Name = "Matyr Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHPrate,10;
		bonus bAgi,1;
	]]
},
[4098] = {
	AegisName = "Dokebi_Card",
	Name = "Dokebi Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Wind;
		bonus bDef,1;
	]]
},
[4099] = {
	AegisName = "Pasana_Card",
	Name = "Pasana Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Fire;
		bonus bDef,1;
	]]
},
[4100] = {
	AegisName = "Sohee_Card",
	Name = "Sohee Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxSPrate,15;
		bonus bSPrecovRate,3;
	]]
},
[4101] = {
	AegisName = "Sand_Man_Card",
	Name = "Sandman Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Earth;
		bonus bDef,1;
	]]
},
[4102] = {
	AegisName = "Whisper_Card",
	Name = "Whisper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,20;
		bonus2 bSubEle,Ele_Ghost,-50;
	]]
},
[4103] = {
	AegisName = "Horong_Card",
	Name = "Horong Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill MG_SIGHT,1;s]],
	OnUnequipScript = [[ sc_end SC_SIGHT; ]]
},
[4104] = {
	AegisName = "Requiem_Card",
	Name = "Requiem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEff,Eff_Confusion,500; ]]
},
[4105] = {
	AegisName = "Marc_Card",
	Name = "Marc Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bSubEle,Ele_Water,5;
		bonus2 bResEff,Eff_Freeze,10000;
	]]
},
[4106] = {
	AegisName = "Mummy_Card",
	Name = "Mummy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bHit,20; ]]
},
[4107] = {
	AegisName = "Verit_Card",
	Name = "Verit Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHPrate,8;
		bonus bMaxSPrate,8;
	]]
},
[4108] = {
	AegisName = "Myst_Card",
	Name = "Myst Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Poison,30;
		bonus bFlee,5;
	]]
},
[4109] = {
	AegisName = "Jakk_Card",
	Name = "Jakk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Fire,30;
		bonus bFlee,5;
	]]
},
[4110] = {
	AegisName = "Ghoul_Card",
	Name = "Ghoul Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bResEff,Eff_Poison,2000;
		bonus bDef,1;
	]]
},
[4111] = {
	AegisName = "Strouf_Card",
	Name = "Strouf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Demon,20; ]]
},
[4112] = {
	AegisName = "Marduk_Card",
	Name = "Marduk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus2 bResEff,Eff_Silence,10000; ]]
},
[4113] = {
	AegisName = "Marionette_Card",
	Name = "Marionette Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Ghost,30;
		bonus bFlee,5;
	]]
},
[4114] = {
	AegisName = "Argiope_Card",
	Name = "Argiope Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Poison;
		bonus bDef,1;
	]]
},
[4115] = {
	AegisName = "Hunter_Fly_Card",
	Name = "Hunter Fly Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bHPDrainRate,30,15; ]]
},
[4116] = {
	AegisName = "Isis_Card",
	Name = "Isis Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Dark,30;
		bonus bFlee,5;
	]]
},
[4117] = {
	AegisName = "Side_Winder_Card",
	Name = "Sidewinder Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		skill TF_DOUBLE,1;
		bonus bDoubleRate,5;
	]]
},
[4118] = {
	AegisName = "Petit_Card",
	Name = "Earth Petite Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Dragon,20; ]]
},
[4119] = {
	AegisName = "Bathory_Card",
	Name = "Bathory Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bDefEle,Ele_Dark; ]]
},
[4120] = {
	AegisName = "Petit__Card",
	Name = "Sky Petite Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Dragon,30; ]]
},
[4121] = {
	AegisName = "Phreeoni_Card",
	Name = "Phreeoni Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bHit,100; ]]
},
[4122] = {
	AegisName = "Deviruchi_Card",
	Name = "Deviruchi Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bStr,1;
		bonus2 bResEff,Eff_Blind,10000;
	]]
},
[4123] = {
	AegisName = "Eddga_Card",
	Name = "Eddga Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxHPrate,-25;s]],
	OnEquipScript = [[ sc_start4 SC_ENDURE,60000,10,0,0,1;s]],
	OnUnequipScript = [[ sc_end SC_ENDURE; ]]
},
[4124] = {
	AegisName = "Medusa_Card",
	Name = "Medusa Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bAddRaceTolerance,RC_Demon,15;
		bonus2 bResEff,Eff_Stone,10000;
	]]
},
[4125] = {
	AegisName = "Deviace_Card",
	Name = "Deviace Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,7;
		bonus2 bAddRace,RC_Brute,7;
		bonus2 bAddRace,RC_Plant,7;
		bonus2 bAddRace,RC_Insect,7;
	]]
},
[4126] = {
	AegisName = "Minorous_Card",
	Name = "Minorous Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddSize,Size_Large,15;
		bonus bBaseAtk,5;
	]]
},
[4127] = {
	AegisName = "Nightmare_Card",
	Name = "Nightmare Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bResEff,Eff_Sleep,10000;
		bonus bAgi,1;
	]]
},
[4128] = {
	AegisName = "Golden_Bug_Card",
	Name = "Golden Thiefbug Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bNoMagicDamage,100;
		bonus bUseSPrate,100;
	]]
},
[4129] = {
	AegisName = "Baphomet__Card",
	Name = "Bapho Jr. Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bAgi,3;
		bonus bCritical,1;
	]]
},
[4130] = {
	AegisName = "Scorpion_King_Card",
	Name = "Scorpion King Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Undead,20; ]]
},
[4131] = {
	AegisName = "Moonlight_Flower_Card",
	Name = "Moonlight Flower Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bSpeedRate,25; ]]
},
[4132] = {
	AegisName = "Mistress_Card",
	Name = "Mistress Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bNoGemStone,0;
		bonus bUseSPrate,25;
	]]
},
[4133] = {
	AegisName = "Daydric_Card",
	Name = "Raydric Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus2 bSubEle,Ele_Neutral,20; ]]
},
[4134] = {
	AegisName = "Dracula_Card",
	Name = "Dracula Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPDrainRate,100,5; ]]
},
[4135] = {
	AegisName = "Orc_Load_Card",
	Name = "Orc Lord Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bShortWeaponDamageReturn,30; ]]
},
[4136] = {
	AegisName = "Khalitzburg_Card",
	Name = "Khalitzburg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Demon,30; ]]
},
[4137] = {
	AegisName = "Drake_Card",
	Name = "Drake Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bNoSizeFix,0; ]]
},
[4138] = {
	AegisName = "Anubis_Card",
	Name = "Anubis Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Angel,30; ]]
},
[4139] = {
	AegisName = "Joker_Card",
	Name = "Joker Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill TF_STEAL,1; ]]
},
[4140] = {
	AegisName = "Knight_Of_Abyss_Card",
	Name = "Abysmal Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Boss,25; ]]
},
[4141] = {
	AegisName = "Evil_Druid_Card",
	Name = "Evil Druid Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Undead;
		bonus bInt,1;
		bonus bDef,1;
	]]
},
[4142] = {
	AegisName = "Doppelganger_Card",
	Name = "Doppelganger Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bAspdRate,10; ]]
},
[4143] = {
	AegisName = "Orc_Hero_Card",
	Name = "Orc Hero Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bVit,3;
		bonus2 bResEff,Eff_Stun,10000;
	]]
},
[4144] = {
	AegisName = "Osiris_Card",
	Name = "Osiris Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bRestartFullRecover,0; ]]
},
[4145] = {
	AegisName = "Berzebub_Card",
	Name = "Berzebub Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bVariableCastrate,-30; ]]
},
[4146] = {
	AegisName = "Maya_Card",
	Name = "Maya Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus bMagicDamageReturn,50; ]]
},
[4147] = {
	AegisName = "Baphomet_Card",
	Name = "Baphomet Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bHit,-10;
		bonus bSplashRange,1;
	]]
},
[4148] = {
	AegisName = "Pharaoh_Card",
	Name = "Pharaoh Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bUseSPrate,-30; ]]
},
[4149] = {
	AegisName = "Gargoyle_Card",
	Name = "Gargoyle Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12028,RC_Insect,100; ]]
},
[4150] = {
	AegisName = "Goat_Card",
	Name = "Goat Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		if(getrefine()<6) {
			bonus bDef,2;
			bonus bMdef,5;
		}
	]]
},
[4151] = {
	AegisName = "Gajomart_Card",
	Name = "Gajomart Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Plant,-20;
		bonus2 bExpAddRace,RC_Plant,10;
	]]
},
[4152] = {
	AegisName = "Galapago_Card",
	Name = "Galapago Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddItemHealRate,Apple_Juice,50;
		bonus2 bAddItemHealRate,Banana_Juice,50;
		bonus2 bAddItemHealRate,Carrot_Juice,50;
		bonus3 bAddMonsterDropItem,531,RC_Insect,300;
		bonus3 bAddMonsterDropItem,532,RC_Insect,300;
		bonus3 bAddMonsterDropItem,534,RC_Insect,300;
	]]
},
[4153] = {
	AegisName = "Crab_Card",
	Name = "Crab Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,5;
		bonus2 bAddDamageClass,1266,30;
	]]
},
[4154] = {
	AegisName = "Rice_Cake_Boy_Card",
	Name = "Dumpling Kid Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddItemHealRate,Candy,50;
		bonus2 bAddItemHealRate,Candy_Striper,50;
		bonus3 bAddMonsterDropItem,529,RC_DemiPlayer,300;
		bonus3 bAddMonsterDropItem,530,RC_DemiPlayer,100;
	]]
},
[4155] = {
	AegisName = "Goblin_Leader_Card",
	Name = "Goblin Leader Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace2,RC2_Goblin,30; ]]
},
[4156] = {
	AegisName = "Steam_Goblin_Card",
	Name = "Goblin Steamrider Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Formless,7;
	]]
},
[4157] = {
	AegisName = "Goblin_Archer_Card",
	Name = "Goblin Archer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Undead,7;
	]]
},
[4158] = {
	AegisName = "Flying_Deleter_Card",
	Name = "Sky Deleter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bHPrecovRate,-100;
		bonus bHPGainValue,100;
	]]
},
[4159] = {
	AegisName = "Nine_Tail_Card",
	Name = "Nine Tail Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bAgi,2;
		if(getrefine()>8) bonus bFlee,20;
	]]
},
[4160] = {
	AegisName = "Antique_Firelock_Card",
	Name = "Firelock Soldier Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bStr,2;
		if(getrefine()>8) {
			bonus bMaxHPrate,10;
			bonus bMaxSPrate,10;
		}
	]]
},
[4161] = {
	AegisName = "Grand_Peco_Card",
	Name = "Grand Peco Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus3 bAutoSpellWhenHit,PR_GLORIA,1,50; ]]
},
[4162] = {
	AegisName = "Grizzly_Card",
	Name = "Grizzly Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Blind,300; ]]
},
[4163] = {
	AegisName = "Gryphon_Card",
	Name = "Gryphon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bFlee,2;
		bonus bCritical,7;
		if(BaseClass==Job_Swordman) bonus3 bAutoSpell,KN_BOWLINGBASH,5,10;
	]]
},
[4164] = {
	AegisName = "Gullinbursti_Card",
	Name = "Gullinbursti Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Fish,-20;
		bonus2 bExpAddRace,RC_Fish,10;
	]]
},
[4165] = {
	AegisName = "Gig_Card",
	Name = "Gig Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Insect,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4166] = {
	AegisName = "Nightmare_Terror_Card",
	Name = "Nightmare Terror Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Curse,300; ]]
},
[4167] = {
	AegisName = "Neraid_Card",
	Name = "Nereid Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Brute,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4168] = {
	AegisName = "Dark_Lord_Card",
	Name = "Dark Lord Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus3 bAutoSpellWhenHit,WZ_METEOR,5,100; ]]
},
[4169] = {
	AegisName = "Dark_Illusion_Card",
	Name = "Dark Illusion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMaxHPrate,-10;
		bonus bMaxSPrate,-10;
		bonus bVariableCastrate,-10;
	]]
},
[4170] = {
	AegisName = "Dark_Frame_Card",
	Name = "Dark Frame Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Stone,600; ]]
},
[4171] = {
	AegisName = "Dark_Priest_Card",
	Name = "Dark Priest Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSPVanishRate, 50, 10;
		if (BaseJob == Job_Sage) bonus bSPDrainValue, 1;
	]]
},
[4172] = {
	AegisName = "The_Paper_Card",
	Name = "The Paper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,20;
		bonus2 bSPDrainValue,-1,0;
	]]
},
[4173] = {
	AegisName = "Demon_Pungus_Card",
	Name = "Demon Fungus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Sleep,600; ]]
},
[4174] = {
	AegisName = "Deviling_Card",
	Name = "Deviling Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Neutral,50;
		bonus2 bSubEle,Ele_Water,-50;
		bonus2 bSubEle,Ele_Earth,-50;
		bonus2 bSubEle,Ele_Fire,-50;
		bonus2 bSubEle,Ele_Wind,-50;
		bonus2 bSubEle,Ele_Poison,-50;
		bonus2 bSubEle,Ele_Holy,-50;
		bonus2 bSubEle,Ele_Dark,-50;
		bonus2 bSubEle,Ele_Ghost,-50;
		bonus2 bSubEle,Ele_Undead,-50;
	]]
},
[4175] = {
	AegisName = "Poison_Toad_Card",
	Name = "Poisonous Toad Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus3 bAutoSpell,TF_POISON,1,20;
		bonus2 bAddSkillBlow,52,5;
	]]
},
[4176] = {
	AegisName = "Dullahan_Card",
	Name = "Dullahan Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Dragon,7;
	]]
},
[4177] = {
	AegisName = "Dryad_Card",
	Name = "Dryad Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus3 bAddMonsterDropItem,993,RC_Plant,100;
		bonus2 bSubEle,Ele_Earth,10;
	]]
},
[4178] = {
	AegisName = "Dragon_Tail_Card",
	Name = "Dragon Tail Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bAgi,1;
		bonus bFlee,10;
		bonus2 bSkillAtk,AC_DOUBLE,5;
		bonus2 bSkillAtk,AC_SHOWER,5;
	]]
},
[4179] = {
	AegisName = "Dragon_Fly_Card",
	Name = "Dragon Fly Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bAgi,1; ]]
},
[4180] = {
	AegisName = "Driller_Card",
	Name = "Driller Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Dragon,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4181] = {
	AegisName = "Disguise_Card",
	Name = "Disguise Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Silence,300+600*(readparam(bVit)>=77); ]]
},
[4182] = {
	AegisName = "Diabolic_Card",
	Name = "Diabolic Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Demon,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4183] = {
	AegisName = "Vagabond_Wolf_Card",
	Name = "Vagabond Wolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bStr,1; ]]
},
[4184] = {
	AegisName = "Lava_Golem_Card",
	Name = "Lava Golem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace2,RC2_Golem,30; ]]
},
[4185] = {
	AegisName = "Rideword_Card",
	Name = "Rideword Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,1;
		if(BaseClass==Job_Acolyte) {
			bonus bInt,1;
			bonus bMdef,1;
		}
	]]
},
[4186] = {
	AegisName = "Raggler_Card",
	Name = "Raggler Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bStr,1;
		bonus bVit,1;
	]]
},
[4187] = {
	AegisName = "Raydric_Archer_Card",
	Name = "Raydric Archer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12030,RC_Demon,100; ]]
},
[4188] = {
	AegisName = "Leib_Olmai_Card",
	Name = "Leib Olmai Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bSubEle,Ele_Fire,10;
		bonus3 bAddMonsterDropItem,990,RC_Brute,100;
	]]
},
[4189] = {
	AegisName = "Wraith_Dead_Card",
	Name = "Wraith Dead Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Curse,600; ]]
},
[4190] = {
	AegisName = "Wraith_Card",
	Name = "Wraith Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12027,RC_Undead,100; ]]
},
[4191] = {
	AegisName = "Loli_Ruri_Card",
	Name = "Loli Ruri Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAutoSpellWhenHit,AL_HEAL,3,50; ]]
},
[4192] = {
	AegisName = "Rotar_Zairo_Card",
	Name = "Rotar Zairo Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Fish,7;
	]]
},
[4193] = {
	AegisName = "Lude_Card",
	Name = "Lude Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ if(BaseJob==Job_Novice||BaseJob==Job_SuperNovice) bonus3 bAutoSpellWhenHit,SM_ENDURE,1,200; ]]
},
[4194] = {
	AegisName = "Rybio_Card",
	Name = "Rybio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Stun,300+600*(readparam(bDex)>=77); ]]
},
[4195] = {
	AegisName = "Leaf_Cat_Card",
	Name = "Leaf Cat Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bSubEle,Ele_Water,10;
		bonus3 bAddMonsterDropItem,991,RC_Fish,100;
	]]
},
[4196] = {
	AegisName = "Marin_Card",
	Name = "Marin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddMonsterDropItem,909,2000;
		bonus2 bAddMonsterDropItem,7126,10;
	]]
},
[4197] = {
	AegisName = "Mastering_Card",
	Name = "Mastering Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bLuk,1; ]]
},
[4198] = {
	AegisName = "Maya_Puple_Card",
	Name = "Maya Purple Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bIntravision,0; ]]
},
[4199] = {
	AegisName = "Merman_Card",
	Name = "Merman Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bHPrecovRate,10;
		bonus bSPrecovRate,10;
	]]
},
[4200] = {
	AegisName = "Megalith_Card",
	Name = "Megalith Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ if(getrefine()<6) bonus bMdef,7; ]]
},
[4201] = {
	AegisName = "Majoruros_Card",
	Name = "Majoruros Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Stun,600; ]]
},
[4202] = {
	AegisName = "Civil_Servant_Card",
	Name = "Mao Guai Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEle,Ele_Ghost,20; ]]
},
[4203] = {
	AegisName = "Mutant_Dragon_Card",
	Name = "Mutant Dragonoid Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,15;
		bonus3 bAutoSpell,MG_FIREBALL,3+2*(getskilllv(MG_FIREBALL)==10),50;
	]]
},
[4204] = {
	AegisName = "Mini_Demon_Card",
	Name = "Mini Demon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Brute,-20;
		bonus2 bExpAddRace,RC_Brute,10;
	]]
},
[4205] = {
	AegisName = "Mimic_Card",
	Name = "Mimic Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus2 bAddMonsterDropItem,603,10; ]]
},
[4206] = {
	AegisName = "Mystcase_Card",
	Name = "Myst Case Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus2 bAddMonsterDropItem,644,30; ]]
},
[4207] = {
	AegisName = "Mysteltainn_Card",
	Name = "Mysteltainn Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubSize,Size_Small,25;
		bonus bDef,1;
	]]
},
[4208] = {
	AegisName = "Miyabi_Ningyo_Card",
	Name = "Miyabi Doll Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxSPrate,10;
		bonus2 bSkillAtk,MG_FROSTDIVER,5;
	]]
},
[4209] = {
	AegisName = "Violy_Card",
	Name = "Violy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,BA_FROSTJOKER,1+4*(getskilllv(BA_FROSTJOKER)==5),20; ]]
},
[4210] = {
	AegisName = "Wander_Man_Card",
	Name = "Wanderer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ if(BaseClass==Job_Thief) bonus bFlee,20; ]]
},
[4211] = {
	AegisName = "Vocal_Card",
	Name = "Vocal Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMdef,3; ]]
},
[4212] = {
	AegisName = "Bon_Gun_Card",
	Name = "Bongun Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus3 bAutoSpell,SM_BASH,1,20;
		bonus2 bAddSkillBlow,SM_BASH,5;
		bonus2 bAddDefClass,1026,-100;
	]]
},
[4213] = {
	AegisName = "Brilight_Card",
	Name = "Brilight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Silence,600; ]]
},
[4214] = {
	AegisName = "Bloody_Murderer_Card",
	Name = "Bloody Murderer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Insect,7;
	]]
},
[4215] = {
	AegisName = "Blazzer_Card",
	Name = "Blazzer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bAddMonsterDropChainItem,ITMCHAIN_FOOD; ]]
},
[4216] = {
	AegisName = "Sasquatch_Card",
	Name = "Sasquatch Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Freeze,600; ]]
},
[4217] = {
	AegisName = "Live_Peach_Tree_Card",
	Name = "Enchanted Peach Tree Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus3 bAutoSpell,AL_HEAL,1+9*(getskilllv(AL_HEAL)==10),20; ]]
},
[4218] = {
	AegisName = "Succubus_Card",
	Name = "Succubus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bVit,-3;
		bonus bHPrecovRate,-20;
		bonus bMaxHP,1000;
	]]
},
[4219] = {
	AegisName = "Sageworm_Card",
	Name = "Sage Worm Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddMonsterDropItem,715,30;
		bonus2 bAddMonsterDropItem,716,30;
		bonus2 bAddMonsterDropItem,717,30;
	]]
},
[4220] = {
	AegisName = "Solider_Card",
	Name = "Solider Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDef,2;
		bonus bMdef,2;
	]]
},
[4221] = {
	AegisName = "Skeleton_General_Card",
	Name = "Skeleton General Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Insect,-20;
		bonus2 bExpAddRace,RC_Insect,10;
	]]
},
[4222] = {
	AegisName = "Skel_Prisoner_Card",
	Name = "Skel Prisoner Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Sleep,300; ]]
},
[4223] = {
	AegisName = "Stalactic_Golem_Card",
	Name = "Stalactic Golem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDef,1;
		bonus2 bResEff,Eff_Stun,2000;
	]]
},
[4224] = {
	AegisName = "Stem_Worm_Card",
	Name = "Stem Worm Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12032,RC_Brute,100; ]]
},
[4225] = {
	AegisName = "Stone_Shooter_Card",
	Name = "Stone Shooter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,10;
		bonus bHit,10;
	]]
},
[4226] = {
	AegisName = "Sting_Card",
	Name = "Sting Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bDef,2;
		if(getrefine()>8) bonus bMdef,5;
	]]
},
[4227] = {
	AegisName = "Spring_Rabbit_Card",
	Name = "Spring Rabbit Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddItemHealRate,Meat,50;
		bonus2 bAddItemHealRate,528,50;
		bonus3 bAddMonsterDropItem,Meat,RC_Brute,200;
		bonus3 bAddMonsterDropItem,528,RC_Brute,200;
	]]
},
[4228] = {
	AegisName = "Sleeper_Card",
	Name = "Sleeper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12031,RC_Fish,100; ]]
},
[4229] = {
	AegisName = "C_Tower_Manager_Card",
	Name = "Tower Keeper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,1;
		bonus bVariableCastrate,-5;
	]]
},
[4230] = {
	AegisName = "Shinobi_Card",
	Name = "Shinobi Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bAgi,1;
		bonus3 bAutoSpellWhenHit,AS_CLOAKING,5,100;
	]]
},
[4231] = {
	AegisName = "Increase_Soil_Card",
	Name = "Mi Gao Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bSubRace2,RC2_Guardian,50; ]]
},
[4232] = {
	AegisName = "Wild_Ginseng_Card",
	Name = "Hermit Plant Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddItemHealRate,Red_Herb,50;
		bonus2 bAddItemHealRate,Yellow_Herb,50;
		bonus2 bAddItemHealRate,White_Herb,50;
		bonus3 bAddMonsterDropItem,507,RC_Plant,300;
		bonus3 bAddMonsterDropItem,508,RC_Plant,200;
		bonus3 bAddMonsterDropItem,509,RC_Plant,100;
	]]
},
[4233] = {
	AegisName = "Baby_Leopard_Card",
	Name = "Baby Leopard Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bLuk,3;
		if(BaseClass==Job_Merchant) bonus bUnbreakableArmor,0;
	]]
},
[4234] = {
	AegisName = "Anolian_Card",
	Name = "Anolian Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAutoSpellWhenHit,AC_CONCENTRATION,1+9*(getskilllv(AC_CONCENTRATION)==10),30; ]]
},
[4235] = {
	AegisName = "Cookie_XMAS_Card",
	Name = "Christmas Cookie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Angel,-20;
		bonus2 bExpAddRace,RC_Angel,10;
	]]
},
[4236] = {
	AegisName = "Amon_Ra_Card",
	Name = "Amon Ra Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAllStats,1;
		bonus3 bAutoSpellWhenHit,PR_KYRIE,10,(30+70*(readparam(bInt)>=99));
	]]
},
[4237] = {
	AegisName = "Owl_Duke_Card",
	Name = "Owl Duke Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,PR_IMPOSITIO,3,3; ]]
},
[4238] = {
	AegisName = "Owl_Baron_Card",
	Name = "Owl Baron Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,PR_LEXAETERNA,1,30; ]]
},
[4239] = {
	AegisName = "Iron_Fist_Card",
	Name = "Iron Fist Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Formless,-20;
		bonus2 bExpAddRace,RC_Formless,10;
	]]
},
[4240] = {
	AegisName = "Arclouse_Card",
	Name = "Arclouze Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		if(getrefine()<6) {
			bonus bDef,2;
			bonus bMdef,3;
		}
	]]
},
[4241] = {
	AegisName = "Archangeling_Card",
	Name = "Arc Angeling Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMaxHP,300;
		if(readparam(bLuk)>=77) {
			bonus bHPrecovRate,100;
			bonus bSPrecovRate,100;
		}
	]]
},
[4242] = {
	AegisName = "Apocalips_Card",
	Name = "Apocalipse Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bVit,2;
		if(getrefine()>8) bonus bMaxHP,800;
	]]
},
[4243] = {
	AegisName = "Antonio_Card",
	Name = "Antonio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAutoSpellWhenHit,AL_TELEPORT,1,500; ]]
},
[4244] = {
	AegisName = "Alarm_Card",
	Name = "Alarm Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus3 bAutoSpellWhenHit,MG_SIGHT,1,200;
		bonus bMaxHP,300;
		bonus bVit,1;
	]]
},
[4245] = {
	AegisName = "Am_Mut_Card",
	Name = "Am Mut Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_DemiPlayer,-20;
		bonus2 bExpAddRace,RC_DemiPlayer,10;
	]]
},
[4246] = {
	AegisName = "Assulter_Card",
	Name = "Assaulter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_DemiPlayer,7;
	]]
},
[4247] = {
	AegisName = "Aster_Card",
	Name = "Aster Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,5;
		bonus2 bAddDamageClass,1074,30;
	]]
},
[4248] = {
	AegisName = "Ancient_Mummy_Card",
	Name = "Ancient Mummy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus3 bAutoSpellWhenHit,AL_CRUCIS,5,30; ]]
},
[4249] = {
	AegisName = "Ancient_Worm_Card",
	Name = "Ancient Worm Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Demon,-20;
		bonus2 bExpAddRace,RC_Demon,10;
	]]
},
[4250] = {
	AegisName = "Executioner_Card",
	Name = "Executioner Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubSize,Size_Large,25;
		bonus bDef,1;
	]]
},
[4251] = {
	AegisName = "Elder_Card",
	Name = "Elder Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace2,RC2_Guardian,40; ]]
},
[4252] = {
	AegisName = "Alligator_Card",
	Name = "Alligator Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bLongAtkDef,5; ]]
},
[4253] = {
	AegisName = "Alice_Card",
	Name = "Alice Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubRace,RC_Boss,40;
		bonus2 bSubRace,RC_NonBoss,-40;
	]]
},
[4254] = {
	AegisName = "Tirfing_Card",
	Name = "Ogretooth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubSize,Size_Medium,25;
		bonus bDef,1;
	]]
},
[4255] = {
	AegisName = "Orc_Lady_Card",
	Name = "Orc Lady Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace2,RC2_Orc,30; ]]
},
[4256] = {
	AegisName = "Orc_Archer_Card",
	Name = "Orc Archer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12034,RC_DemiPlayer,100; ]]
},
[4257] = {
	AegisName = "Wild_Rose_Card",
	Name = "Wild Rose Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAgi,1;
		if(BaseClass==Job_Thief) bonus bFlee2,5;
	]]
},
[4258] = {
	AegisName = "Wicked_Nymph_Card",
	Name = "Evil Nymph Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,1;
		bonus bMaxSP,50;
	]]
},
[4259] = {
	AegisName = "Wooden_Golem_Card",
	Name = "Wooden Golem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDef,1;
		bonus bHPrecovRate,30;
	]]
},
[4260] = {
	AegisName = "Wootan_Shooter_Card",
	Name = "Wootan Shooter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDef,1;
		bonus2 bResEff,Eff_Confusion,2000;
	]]
},
[4261] = {
	AegisName = "Wootan_Fighter_Card",
	Name = "Wootan Fighter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDef,1;
		bonus2 bResEff,Eff_Bleeding,2000;
	]]
},
[4262] = {
	AegisName = "Evil_Cloud_Hermit_Card",
	Name = "Cloud Hermit Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12029,RC_Plant,100; ]]
},
[4263] = {
	AegisName = "Incant_Samurai_Card",
	Name = "Samurai Spector Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bIgnoreDefRace,RC_NonBoss;
		bonus bHPrecovRate,-100;
		bonus2 bHPLossRate,666,10000;
	]],
	OnUnequipScript = [[
		if((Hp<=999) && !getmapflag(strcharinfo(PC_MAP),mf_pvp) && !getmapflag(strcharinfo(PC_MAP),mf_pvp_noparty) && !getmapflag(strcharinfo(PC_MAP),mf_pvp_noguild)) {
			heal(1-Hp),0;
		}
		else {
			heal -999,0;
		}
	]]
},
[4264] = {
	AegisName = "Wind_Ghost_Card",
	Name = "Wind Ghost Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,WZ_JUPITEL,3+7*(getskilllv(WZ_JUPITEL)==10),20; ]]
},
[4265] = {
	AegisName = "Li_Me_Mang_Ryang_Card",
	Name = "Jing Guai Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12033,RC_Angel,100; ]]
},
[4266] = {
	AegisName = "Eclipse_Card",
	Name = "Eclipse Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bVit,1; ]]
},
[4267] = {
	AegisName = "Explosion_Card",
	Name = "Explosion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Dragon,-20;
		bonus2 bExpAddRace,RC_Dragon,10;
	]]
},
[4268] = {
	AegisName = "Injustice_Card",
	Name = "Injustice Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAutoSpell,AS_SONICBLOW,1,50; ]]
},
[4269] = {
	AegisName = "Incubus_Card",
	Name = "Incubus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,-3;
		bonus bSPrecovRate,-20;
		bonus bMaxSP,150;
	]]
},
[4270] = {
	AegisName = "Giant_Spider_Card",
	Name = "Giant Spider Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Poison,600; ]]
},
[4271] = {
	AegisName = "Giant_Honet_Card",
	Name = "Giant Hornet Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bSubEle,Ele_Wind,10;
		bonus3 bAddMonsterDropItem,992,RC_Insect,100;
	]]
},
[4272] = {
	AegisName = "Dancing_Dragon_Card",
	Name = "Zhu Po Long Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bAgi,1;
		bonus bCritical,3;
	]]
},
[4273] = {
	AegisName = "Shellfish_Card",
	Name = "Shell Fish Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,5;
		bonus2 bAddDamageClass,1073,30;
	]]
},
[4274] = {
	AegisName = "Zombie_Master_Card",
	Name = "Zombie Master Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Undead,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4275] = {
	AegisName = "Zombie_Prisoner_Card",
	Name = "Zombie Prisoner Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bSubRace,RC_Undead,-20;
		bonus2 bExpAddRace,RC_Undead,10;
	]]
},
[4276] = {
	AegisName = "Lord_Of_Death_Card",
	Name = "Lord of The Dead Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus3 bAddEff,Eff_Stun,500,ATF_SHORT;
		bonus3 bAddEff,Eff_Curse,500,ATF_SHORT;
		bonus3 bAddEff,Eff_Silence,500,ATF_SHORT;
		bonus3 bAddEff,Eff_Poison,500,ATF_SHORT;
		bonus3 bAddEff,Eff_Bleeding,500,ATF_SHORT;
		bonus2 bWeaponComaRace,RC_NonBoss,1;
	]]
},
[4277] = {
	AegisName = "Zherlthsh_Card",
	Name = "Zealotus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bLuk,2;
		bonus2 bSkillAtk,BA_MUSICALSTRIKE,10;
		bonus2 bSkillAtk,DC_THROWARROW,10;
	]]
},
[4278] = {
	AegisName = "Gibbet_Card",
	Name = "Gibbet Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ if(getrefine()<6) bonus bMdef,5; ]]
},
[4279] = {
	AegisName = "Deleter_Card",
	Name = "Earth Deleter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bSPrecovRate,-100;
		bonus bSPGainValue,10;
	]],
	OnUnequipScript = [[ heal 0,-100; ]]
},
[4280] = {
	AegisName = "Geographer_Card",
	Name = "Geographer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAutoSpellWhenHit,AL_BLESSING,2+8*(getskilllv(AL_BLESSING)==10),30; ]]
},
[4281] = {
	AegisName = "Zipper_Bear_Card",
	Name = "Zipper Bear Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,30;
		bonus2 bSPDrainValue,-1,0;
		if(BaseClass==Job_Merchant) bonus bUnbreakableWeapon,0;
	]]
},
[4282] = {
	AegisName = "Tengu_Card",
	Name = "Tengu Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bAddMonsterDropChainItem,ITMCHAIN_HEAL; ]]
},
[4283] = {
	AegisName = "Greatest_General_Card",
	Name = "Greatest General Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,MO_CALLSPIRITS,5,2+18*(BaseClass==Job_Acolyte); ]]
},
[4284] = {
	AegisName = "Chepet_Card",
	Name = "Chepet Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus4 bAutoSpell,AL_HEAL,5,50,1; ]]
},
[4285] = {
	AegisName = "Choco_Card",
	Name = "Choco Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee2,5;
		bonus bFlee,10;
	]]
},
[4286] = {
	AegisName = "Karakasa_Card",
	Name = "Karakasa Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Confusion,300+600*(readparam(bStr)>=77); ]]
},
[4287] = {
	AegisName = "Kapha_Card",
	Name = "Kapha Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ if(getrefine()<6) bonus bMdef,8; ]]
},
[4288] = {
	AegisName = "Carat_Card",
	Name = "Carat Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,2;
		if(getrefine()>8) bonus bMaxSP,150;
	]]
},
[4289] = {
	AegisName = "Caterpillar_Card",
	Name = "Caterpillar Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Plant,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4290] = {
	AegisName = "Cat_O_Nine_Tail_Card",
	Name = "Cat O' Nine Tails Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMdef,3;
		bonus bMagicDamageReturn,5;
	]]
},
[4291] = {
	AegisName = "Kobold_Leader_Card",
	Name = "Kobold Leader Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace2,RC2_Kobold,30; ]]
},
[4292] = {
	AegisName = "Kobold_Archer_Card",
	Name = "Kobold Archer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Plant,7;
	]]
},
[4293] = {
	AegisName = "Cookie_Card",
	Name = "Cookie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bLuk,2;
		bonus2 bSkillAtk,AL_HOLYLIGHT,10;
	]]
},
[4294] = {
	AegisName = "Quve_Card",
	Name = "Quve Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ if(BaseJob==Job_Novice||BaseJob==Job_SuperNovice) bonus3 bAutoSpellWhenHit,AL_INCAGI,1,100; ]]
},
[4295] = {
	AegisName = "Kraben_Card",
	Name = "Kraben Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Blind,600; ]]
},
[4296] = {
	AegisName = "Cramp_Card",
	Name = "Cramp Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus2 bGetZenyNum,500,1; ]]
},
[4297] = {
	AegisName = "Cruiser_Card",
	Name = "Cruiser Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Brute,7;
	]]
},
[4298] = {
	AegisName = "Cremy_Fear_Card",
	Name = "Creamy Fear Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Confusion,600; ]]
},
[4299] = {
	AegisName = "Clock_Card",
	Name = "Clock Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAutoSpellWhenHit,CR_AUTOGUARD,3+7*(getskilllv(CR_AUTOGUARD)==10),30;s]],
	OnUnequipScript = [[ sc_end SC_AUTOGUARD; ]]
},
[4300] = {
	AegisName = "Chimera_Card",
	Name = "Chimera Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Poison,300+600*(BaseJob==Job_Assassin); ]]
},
[4301] = {
	AegisName = "Killer_Mantis_Card",
	Name = "Killer Mantis Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Bleeding,600; ]]
},
[4302] = {
	AegisName = "Tao_Gunka_Card",
	Name = "Tao Gunka Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHPrate,100;
		bonus bDefRate,-50;
		bonus bMdefRate,-50;
	]]
},
[4303] = {
	AegisName = "Whisper_Boss_Card",
	Name = "Giant Whisper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		if(readparam(bStr)>=80) {
			bonus bBaseAtk,20;
		}
		if(readparam(bVit)>=80) {
			bonus bMaxHPrate,3;
		}
		if(readparam(bLuk)>=80) {
			bonus bCritical,3;
		}
	]]
},
[4304] = {
	AegisName = "Tamruan_Card",
	Name = "Tamruan Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bDef,2;
		bonus2 bSkillAtk,CR_SHIELDCHARGE,10;
		bonus2 bSkillAtk,CR_SHIELDBOOMERANG,10;
	]]
},
[4305] = {
	AegisName = "Turtle_General_Card",
	Name = "Turtle General Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddRace, RC_All, 20;
		bonus3 bAutoSpell,SM_MAGNUM,10,30;
	]]
},
[4306] = {
	AegisName = "Toad_Card",
	Name = "Toad Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bFlee2,1; ]]
},
[4307] = {
	AegisName = "Kind_Of_Beetle_Card",
	Name = "Beetle King Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Fish,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4308] = {
	AegisName = "Tri_Joint_Card",
	Name = "Tri Joint Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Formless,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4309] = {
	AegisName = "Parasite_Card",
	Name = "Parasite Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bDef,1;
		bonus2 bAddRaceTolerance,RC_Formless,5;
	]]
},
[4310] = {
	AegisName = "Panzer_Goblin_Card",
	Name = "Panzer Goblin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,10;
		bonus2 bCriticalAddRace,RC_Demon,7;
	]]
},
[4311] = {
	AegisName = "Permeter_Card",
	Name = "Permeter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bSubEle,Ele_Dark,15;
		bonus2 bSubEle,Ele_Undead,15;
	]]
},
[4312] = {
	AegisName = "Fur_Seal_Card",
	Name = "Fur Seal Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bFlee,3;
		bonus bHit,10;
		if(BaseClass==Job_Acolyte) {
			bonus2 bCriticalAddRace,RC_Undead,9;
			bonus2 bCriticalAddRace,RC_Demon,9;
		}
	]]
},
[4313] = {
	AegisName = "Punk_Card",
	Name = "Punk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus4 bAutoSpellWhenHit,WZ_QUAGMIRE,1+4*(getskilllv(WZ_QUAGMIRE)==5),50,0; ]]
},
[4314] = {
	AegisName = "Penomena_Card",
	Name = "Penomena Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bSubRace,RC_Formless,30; ]]
},
[4315] = {
	AegisName = "Pest_Card",
	Name = "Pest Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Stone,300+600*(readparam(bInt)>=77); ]]
},
[4316] = {
	AegisName = "Fake_Angel_Card",
	Name = "False Angel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_Angel,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4317] = {
	AegisName = "Mobster_Card",
	Name = "Mobster Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,15;
		if(BaseClass==Job_Thief) bonus bCritical,4;
	]]
},
[4318] = {
	AegisName = "Knight_Windstorm_Card",
	Name = "Stormy Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus3 bAutoSpell,WZ_STORMGUST,2,20;
		bonus2 bAddEff,Eff_Freeze,2000;
	]]
},
[4319] = {
	AegisName = "Freezer_Card",
	Name = "Freezer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHP,300;
		if(getrefine()>=9) bonus2 bSkillAtk,SM_BASH,10;
	]]
},
[4320] = {
	AegisName = "Bloody_Knight_Card",
	Name = "Bloody Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAutoSpell,WZ_METEOR,1,20; ]]
},
[4321] = {
	AegisName = "Hylozoist_Card",
	Name = "Hylozoist Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bClassChange,100; ]]
},
[4322] = {
	AegisName = "High_Orc_Card",
	Name = "High Orc Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bDef,1;
		bonus bShortWeaponDamageReturn,5;
	]]
},
[4323] = {
	AegisName = "Garm_Baby_Card",
	Name = "Hatii Bebe Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAutoSpell,MG_FROSTDIVER,3,50; ]]
},
[4324] = {
	AegisName = "Garm_Card",
	Name = "Hatii Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Freeze,5000; ]]
},
[4325] = {
	AegisName = "Harpy_Card",
	Name = "Harpy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bAddRaceTolerance,RC_Formless,15;
		bonus2 bSkillAtk,MG_NAPALMBEAT,5;
	]]
},
[4326] = {
	AegisName = "See_Otter_Card",
	Name = "Sea-Otter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddItemHealRate,Sushi,50;
		bonus2 bAddItemHealRate,Fish_Slice,50;
		bonus3 bAddMonsterDropItem,551,RC_Fish,300;
		bonus3 bAddMonsterDropItem,544,RC_Fish,300;
	]]
},
[4327] = {
	AegisName = "Blood_Butterfly_Card",
	Name = "Bloody Butterfly Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bVariableCastrate,30;
		bonus bNoCastCancel,0;
		bonus2 bSkillAtk,MG_FIREWALL,5;
	]]
},
[4328] = {
	AegisName = "Hyegun_Card",
	Name = "Yao Jun Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,15;
		bonus bCritical,1;
	]]
},
[4329] = {
	AegisName = "Phendark_Card",
	Name = "Phendark Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPGainRace,RC_DemiPlayer,5;s]],
	OnUnequipScript = [[ heal 0,-5; ]]
},
[4330] = {
	AegisName = "Dark_Snake_Lord_Card",
	Name = "Evil Snake Lord Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,3;
		bonus2 bResEff,Eff_Blind,10000;
		bonus2 bResEff,Eff_Curse,10000;
	]]
},
[4331] = {
	AegisName = "Heater_Card",
	Name = "Heater Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bCritical,3;
		if(BaseClass==Job_Swordman) bonus bFlee2,3;
	]]
},
[4332] = {
	AegisName = "Waste_Stove_Card",
	Name = "Waste Stove Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bBaseAtk,5;
		bonus bInt,1;
	]]
},
[4333] = {
	AegisName = "Venomous_Card",
	Name = "Venomous Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAddEffWhenHit,Eff_Poison,3000,ATF_TARGET|ATF_SELF; ]]
},
[4334] = {
	AegisName = "Noxious_Card",
	Name = "Noxious Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bLongAtkDef,10;
		bonus2 bSubEle,Ele_Neutral,10;
	]]
},
[4335] = {
	AegisName = "Pitman_Card",
	Name = "Pitman Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,WZ_EARTHSPIKE,5;
		bonus2 bSkillAtk,WZ_HEAVENDRIVE,5;
	]],
	OnUnequipScript = [[ heal 0,-50; ]]
},
[4336] = {
	AegisName = "Ungoliant_Card",
	Name = "Ungoliant Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bHPrecovRate,10;
		bonus2 bResEff,Eff_Bleeding,10000;
	]]
},
[4337] = {
	AegisName = "Porcellio_Card",
	Name = "Porcellio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bBaseAtk,25;
		bonus bDef,-5;
	]]
},
[4338] = {
	AegisName = "Obsidian_Card",
	Name = "Obsidian Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bVit,readparam(bDex)/18; ]]
},
[4339] = {
	AegisName = "Mineral_Card",
	Name = "Mineral Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bBaseAtk,-25;
		bonus bDef,3;
	]]
},
[4340] = {
	AegisName = "Teddy_Bear_Card",
	Name = "Teddy Bear Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Undead,30; ]]
},
[4341] = {
	AegisName = "Metaling_Card",
	Name = "Metaling Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAutoSpell,RG_STRIPWEAPON,1,50; ]]
},
[4342] = {
	AegisName = "Rsx_0806_Card",
	Name = "RSX-0806 Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bVit,3;
		bonus bUnbreakableArmor,0;
		bonus bNoKnockback,0;
	]]
},
[4343] = {
	AegisName = "Mole_Card",
	Name = "Holden Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bLuk,2; ]]
},
[4344] = {
	AegisName = "Anopheles_Card",
	Name = "Anopheles Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12058,RC_Insect,50; ]]
},
[4345] = {
	AegisName = "Hill_Wind_Card",
	Name = "Hill Wind Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,MG_THUNDERSTORM,5;
		bonus2 bSkillAtk,WZ_JUPITEL,5;
		bonus2 bSkillAtk,WZ_VERMILION,5;
	]],
	OnUnequipScript = [[ heal 0,-50; ]]
},
[4346] = {
	AegisName = "Ygnizem_Card",
	Name = "Egnigem Cenia Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bStr,readparam(bInt)/18; ]]
},
[4347] = {
	AegisName = "Armaia_Card",
	Name = "Armeyer Dinze Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12053,RC_Fish,50; ]]
},
[4348] = {
	AegisName = "Whikebain_Card",
	Name = "Wickebine Tres Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,RG_STRIPARMOR,1,50; ]]
},
[4349] = {
	AegisName = "Erend_Card",
	Name = "Errende Ebecee Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus4 bAutoSpellWhenHit,AL_PNEUMA,1,50,0; ]]
},
[4350] = {
	AegisName = "Rawrel_Card",
	Name = "Laurell Weinder Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,WZ_FROSTNOVA,3;
		bonus2 bSkillAtk,WZ_STORMGUST,3;
	]],
	OnUnequipScript = [[ heal 0,-50; ]]
},
[4351] = {
	AegisName = "Kavac_Card",
	Name = "Kavach Icarus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if(getrefine()<=4) {
			bonus bFlee,20;
			bonus bFlee2,1;
		}
		else {
			bonus bFlee,10;
		}
	]]
},
[4352] = {
	AegisName = "B_Ygnizem_Card",
	Name = "Boss Egnigem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHPrate,10;
		bonus bMaxSPrate,10;
		bonus2 bHPRegenRate,50,10000;
		bonus2 bSPRegenRate,10,10000;
	]]
},
[4353] = {
	AegisName = "Removal_Card",
	Name = "Remover Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHP,800-40*getrefine();
		bonus bHPrecovRate,10;
	]]
},
[4354] = {
	AegisName = "Gemini_Card",
	Name = "Gemini-S58 Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		if(readparam(bAgi)>=90) {
			bonus2 bResEff,Eff_Silence,3000;
			bonus2 bResEff,Eff_Stun,3000;
		}
		if(readparam(bVit)>=80) {
			bonus2 bResEff,Eff_Stone,5000;
			bonus2 bResEff,Eff_Sleep,5000;
		}
	]]
},
[4355] = {
	AegisName = "Gremlin_Card",
	Name = "Gremlin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12043,RC_Brute,50; ]]
},
[4356] = {
	AegisName = "Beholder_Card",
	Name = "Beholder Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ skill SA_CASTCANCEL,1; ]]
},
[4357] = {
	AegisName = "B_Seyren_Card",
	Name = "Lord Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		skill LK_BERSERK,1;
		bonus bMaxHPrate,-50;
	]]
},
[4358] = {
	AegisName = "Seyren_Card",
	Name = "Seyren Windsor Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bStr,getrefine()-6; ]]
},
[4359] = {
	AegisName = "B_Eremes_Card",
	Name = "Assassin Cross Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ skill AS_CLOAKING,3;s]],
	OnUnequipScript = [[ sc_end SC_CLOAKING; ]]
},
[4360] = {
	AegisName = "Eremes_Card",
	Name = "Eremes Guile Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bCriticalAddRace,RC_DemiPlayer,10; ]]
},
[4361] = {
	AegisName = "B_Harword_Card",
	Name = "MasterSmith Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBreakWeaponRate,1000;
		bonus bBreakArmorRate,700;
	]]
},
[4362] = {
	AegisName = "Harword_Card",
	Name = "Howard Alt-Eisen Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bAspdRate,-5;
		bonus bHit,30;
	]]
},
[4363] = {
	AegisName = "B_Magaleta_Card",
	Name = "High Priest Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus5 bAutoSpellWhenHit,HP_ASSUMPTIO,1,50,BF_WEAPON|BF_MAGIC,0; ]]
},
[4364] = {
	AegisName = "Magaleta_Card",
	Name = "Margaretha Sorin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,1;
		bonus5 bAutoSpellWhenHit,PR_LEXDIVINA,5,150,BF_MAGIC,1;
	]]
},
[4365] = {
	AegisName = "B_Katrinn_Card",
	Name = "High Wizard Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bIgnoreMdefRace,RC_NonBoss;
		bonus bVariableCastrate,100;
		bonus bSPrecovRate,-100;
	]],
	OnUnequipScript = [[ heal 0,-2000; ]]
},
[4366] = {
	AegisName = "Katrinn_Card",
	Name = "Kathryne Keyron Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bVariableCastrate,getrefine()*-1;
		if(getrefine()>=9) {
			bonus bMatkRate,2;
		}
	]]
},
[4367] = {
	AegisName = "B_Shecil_Card",
	Name = "Sniper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bHPDrainRate,10,20;
		bonus bHPrecovRate,-10;
	]]
},
[4368] = {
	AegisName = "Shecil_Card",
	Name = "Cecil Damon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bAspdRate,5;
		bonus bHit,-30;
	]]
},
[4369] = {
	AegisName = "Venatu_Card",
	Name = "Venatu Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bLuk,readparam(bAgi)/18; ]]
},
[4370] = {
	AegisName = "Dimik_Card",
	Name = "Dimik Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bVit,getrefine()-5; ]]
},
[4371] = {
	AegisName = "Archdam_Card",
	Name = "Archdam Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bBaseAtk,10;
		bonus bVariableCastrate,20;
	]]
},
[4372] = {
	AegisName = "Bacsojin_Card",
	Name = "White Lady Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bHealPower,30;
		bonus bUseSPrate,15;
	]]
},
[4373] = {
	AegisName = "Chung_E_Card",
	Name = "Green Maiden Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bLuk,getrefine()-5;
		bonus bCritical,min(getrefine(),10);
	]]
},
[4374] = {
	AegisName = "Apocalips_H_Card",
	Name = "Vesper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDex,2;
		bonus2 bIgnoreMdefRate,RC_Boss,30;
	]]
},
[4375] = {
	AegisName = "Orc_Baby_Card_Card",
	Name = "Orc Baby Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if(getrefine()>=9) {
			bonus2 bSubEle,Ele_Neutral,15;
			bonus bFlee,15;
		}
		else {
			bonus2 bSubEle,Ele_Neutral,10;
			bonus bFlee,10;
		}
	]]
},
[4376] = {
	AegisName = "Lady_Tanee_Card",
	Name = "Lady Tanee Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHPrate,-40;
		bonus bMaxSPrate,50;
		bonus2 bAddMonsterDropItem,513,200;
		bonus2 bAddItemHealRate,513,100;
	]]
},
[4377] = {
	AegisName = "Green_Iguana_Card",
	Name = "Grove Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12063,RC_Formless,50; ]]
},
[4378] = {
	AegisName = "Acidus_Card",
	Name = "Gold Acidus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		if(getrefine()<=4) {
			bonus bMaxHPrate,8;
			bonus bMaxSPrate,8;
			bonus bHPrecovRate,5;
			bonus bSPrecovRate,5;
		}
		else {
			bonus bMaxHPrate,4;
			bonus bMaxSPrate,4;
		}
	]]
},
[4379] = {
	AegisName = "Acidus__Card",
	Name = "Blue Acidus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		if(getrefine()<=4) {
			bonus bSPrecovRate,5;
			bonus bMaxSP,80;
		}
		else {
			bonus bMaxSP,40;
		}
	]]
},
[4380] = {
	AegisName = "Ferus_Card",
	Name = "Red Ferus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,WZ_FIREPILLAR,5;
		bonus2 bSkillAtk,WZ_METEOR,5;
	]],
	OnUnequipScript = [[ heal 0,-50; ]]
},
[4381] = {
	AegisName = "Ferus__Card",
	Name = "Green Ferus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bVit,1;
		bonus bMaxHPrate,10;
	]]
},
[4382] = {
	AegisName = "Novus__Card",
	Name = "Yellow Novus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHP,500;
		bonus bHPrecovRate,10;
	]]
},
[4383] = {
	AegisName = "Novus_Card",
	Name = "Red Novus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAddEffWhenHit,Eff_Confusion,3000,ATF_TARGET|ATF_SELF; ]]
},
[4384] = {
	AegisName = "Hydro_Card",
	Name = "Hydro Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,SA_SPELLBREAKER,1,100; ]]
},
[4385] = {
	AegisName = "Dragon_Egg_Card",
	Name = "Dragon Egg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12048,RC_Dragon,50; ]]
},
[4386] = {
	AegisName = "Detale_Card",
	Name = "Detardeurus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMdef,-20;
		bonus2 bResEff,Eff_Freeze,10000;
		bonus5 bAutoSpellWhenHit,SA_LANDPROTECTOR,1,70,BF_MAGIC,0;
	]]
},
[4387] = {
	AegisName = "Ancient_Mimic_Card",
	Name = "Ancient Mimic Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bAgi,readparam(bLuk)/18; ]]
},
[4388] = {
	AegisName = "Deathword_Card",
	Name = "Death Word Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,MG_NAPALMBEAT,5;
		bonus2 bSkillAtk,MG_SOULSTRIKE,5;
		bonus2 bSkillAtk,HW_NAPALMVULCAN,5;
	]],
	OnUnequipScript = [[ heal 0,-50; ]]
},
[4389] = {
	AegisName = "Plasma_Card",
	Name = "Plasma Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddMonsterDropItem,12118,50;
		bonus2 bAddMonsterDropItem,12119,50;
		bonus2 bAddMonsterDropItem,12120,50;
		bonus2 bAddMonsterDropItem,12121,50;
	]]
},
[4390] = {
	AegisName = "Breeze_Card",
	Name = "Breeze Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,5;
		bonus2 bAddEff,Eff_Bleeding,500;
	]]
},
[4391] = {
	AegisName = "Retribution_Card",
	Name = "Baroness of Retribution Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAddMonsterDropItem,12068,RC_Angel,50; ]]
},
[4392] = {
	AegisName = "Observation_Card",
	Name = "Dame of Sentinel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bDex,readparam(bVit)/18; ]]
},
[4393] = {
	AegisName = "Shelter_Card",
	Name = "Mistress of Shelter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bInt,readparam(bStr)/18; ]]
},
[4394] = {
	AegisName = "Solace_Card",
	Name = "Lady Solace Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ if(BaseJob==Job_Priest) bonus3 bAutoSpell,CR_GRANDCROSS,5,20; ]]
},
[4395] = {
	AegisName = "Tha_Maero_Card",
	Name = "Maero of Thanatos Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,5;
		bonus3 bAutoSpell,AL_DECAGI,3,50;
	]]
},
[4396] = {
	AegisName = "Tha_Odium_Card",
	Name = "Odium of Thanatos Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bAgi,getrefine()-5; ]]
},
[4397] = {
	AegisName = "Tha_Despero_Card",
	Name = "Despero of Thanatos Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus bInt,getrefine()-6; ]]
},
[4398] = {
	AegisName = "Tha_Dolor_Card",
	Name = "Dolor of Thanatos Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Angel,10; ]]
},
[4399] = {
	AegisName = "Thanatos_Card",
	Name = "Memory of Thanatos Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bDefRatioAtkRace, RC_All;
		bonus bSPDrainValue,-1;
		bonus bDef,-30;
		bonus bFlee,-30;
	]]
},
[4400] = {
	AegisName = "Aliza_Card",
	Name = "Aliza Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAutoSpellWhenHit,DC_WINKCHARM,1,50+50*(BaseJob==Job_Dancer); ]]
},
[4401] = {
	AegisName = "Alicel_Card",
	Name = "Alicel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bFlee,10;
		bonus bDef,-5;
	]]
},
[4402] = {
	AegisName = "Aliot_Card",
	Name = "Aliot Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if(BaseClass==Job_Swordman||BaseClass==Job_Merchant||BaseClass==Job_Thief) {
			bonus bStr,2;
			bonus bMaxHPrate,5;
		}
		if(BaseClass==Job_Mage||BaseClass==Job_Archer||BaseClass==Job_Acolyte) {
			bonus bInt,2;
			bonus bMaxSPrate,5;
		}
	]]
},
[4403] = {
	AegisName = "Kiel_Card",
	Name = "Kiel-D-01 Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bDelayrate,-30; ]]
},
[4404] = {
	AegisName = "Skogul_Card",
	Name = "Skogul Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus3 bAddEffWhenHit,Eff_Bleeding,3000,ATF_TARGET|ATF_SELF; ]]
},
[4405] = {
	AegisName = "Frus_Card",
	Name = "Frus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMagicDamageReturn,min(getrefine(),10)*2;
		if(BaseClass==Job_Mage) bonus bMdef,3;
	]]
},
[4406] = {
	AegisName = "Skeggiold_Card",
	Name = "Skeggiold Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Demon,2; ]]
},
[4407] = {
	AegisName = "Randgris_Card",
	Name = "Randgris Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bUnbreakableWeapon,0;
		bonus2 bAddRace, RC_All, 10;
		bonus3 bAutoSpell,SA_DISPELL,1,50;
	]]
},
[4408] = {
	AegisName = "Gloom_Under_Night_Card",
	Name = "Gloom Under Night Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bAddEle,Ele_Holy,40;
		bonus2 bAddEle,Ele_Dark,40;
		bonus2 bAddRace,RC_Angel,40;
		bonus2 bAddRace,RC_Demon,40;
	]]
},
[4409] = {
	AegisName = "Agav_Card",
	Name = "Agav Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMatkRate,5;
		bonus bDef,-10;
		if(BaseClass==Job_Mage) bonus bMaxSP,100;
	]]
},
[4410] = {
	AegisName = "Echio_Card",
	Name = "Echio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bBaseAtk,15;
		if(BaseClass==Job_Swordman) bonus bMaxHP,500;
	]]
},
[4411] = {
	AegisName = "Vanberk_Card",
	Name = "Vanberk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bStr,2;
		autobonus "{ bonus bCritical,100; }",5,5000,0,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
	]]
},
[4412] = {
	AegisName = "Isilla_Card",
	Name = "Isilla Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,2;
		autobonus "{ bonus bVariableCastrate,-50; bonus bFlee,30; }",50,5000,BF_MAGIC,"{ specialeffect(EF_SUFFRAGIUM, AREA, playerattached()); }";
	]]
},
[4413] = {
	AegisName = "Hodremlin_Card",
	Name = "Hodremlin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubSize,Size_Small,15;
		bonus2 bSubSize,Size_Medium,15;
		bonus2 bSubSize,Size_Large,15;
		autobonus2 "{ bonus bFlee2,30; }",3,10000,BF_WEAPON|BF_MAGIC,"{ specialeffect(EF_WIND, AREA, playerattached()); }";
	]]
},
[4414] = {
	AegisName = "Seeker_Card",
	Name = "Seeker Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		skill MG_STONECURSE,1;
		bonus2 bResEff,Eff_Stone,3000;
		bonus bMdef,10;
	]]
},
[4415] = {
	AegisName = "Snowier_Card",
	Name = "Snowier Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bAddMonsterDropItem,536,500;
		bonus2 bAddItemHealRate,536,100;
	]]
},
[4416] = {
	AegisName = "Siroma_Card",
	Name = "Siroma Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bSkillAtk,MG_COLDBOLT,25;
		bonus2 bVariableCastrate,MG_COLDBOLT,-25;
	]]
},
[4417] = {
	AegisName = "Ice_Titan_Card",
	Name = "Ice Titan Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bVit,2;
		autobonus2 "{ bonus bDef,10; }",3,10000,BF_WEAPON|BF_MAGIC,"{ specialeffect(EF_FREEZED, AREA, playerattached()); }";
	]]
},
[4418] = {
	AegisName = "Gazeti_Card",
	Name = "Gazeti Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus3 bAutoSpell,MG_COLDBOLT,2,100; ]]
},
[4419] = {
	AegisName = "Ktullanux_Card",
	Name = "Ktullanux Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bAddEle,Ele_Fire,50;
		bonus5 bAutoSpellWhenHit,WZ_FROSTNOVA,10,20,BF_WEAPON|BF_MAGIC,0;
	]]
},
[4420] = {
	AegisName = "Muscipular_Card",
	Name = "Muscipular Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus3 bAutoSpellWhenHit,AL_HEAL,1,100;
		bonus3 bAutoSpellWhenHit,AL_INCAGI,1,100;
	]]
},
[4421] = {
	AegisName = "Drosera_Card",
	Name = "Drosera Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ if(getiteminfo(getequipid(EQI_HAND_R),9)>3) bonus bCritical,15; ]]
},
[4422] = {
	AegisName = "Roween_Card",
	Name = "Roween Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,5;
		bonus bFlee2,3;
		bonus2 bAddEle,Ele_Water,10;
		bonus2 bCriticalAddRace,RC_Fish,15;
	]]
},
[4423] = {
	AegisName = "Galion_Card",
	Name = "Galion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bHit,5;
		bonus2 bAddEle,Ele_Water,5;
	]]
},
[4424] = {
	AegisName = "Stapo_Card",
	Name = "Stapo Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		skill TF_PICKSTONE,1;
		skill TF_THROWSTONE,1;
	]]
},
[4425] = {
	AegisName = "Atroce_Card",
	Name = "Atroce Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,25;
		autobonus "{ bonus bAspdRate,100; }",5,10000,0,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
	]]
},
[4426] = {
	AegisName = "Byorgue_Card",
	Name = "Byorgue Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		if (BaseJob == Job_Rogue) {
			bonus bMatkRate,10;
			bonus2 bAddRace, RC_All, 10;
		}
	]]
},
[4427] = {
	AegisName = "Sword_Guardian_Card",
	Name = "Sword Guardian Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if(getiteminfo(getequipid(EQI_HAND_R),11)==2||getiteminfo(getequipid(EQI_HAND_R),11)==3) {
			bonus bHit,5;
			bonus bCritical,5;
			bonus2 bSkillAtk,62,25;
		}
	]]
},
[4428] = {
	AegisName = "Bow_Guardian_Card",
	Name = "Bow Guardian Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if(getiteminfo(getequipid(EQI_HAND_R),11)==11) {
			bonus bHit,5;
			bonus bCritical,5;
			bonus2 bSkillAtk,AC_SHOWER,50;
		}
	]]
},
[4429] = {
	AegisName = "Salamander_Card",
	Name = "Salamander Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSkillAtk,WZ_FIREPILLAR,40;
		bonus2 bSkillAtk,WZ_METEOR,40;
	]]
},
[4430] = {
	AegisName = "Ifrit_Card",
	Name = "Ifrit Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bBaseAtk,(JobLevel/10);
		bonus bCritical,(JobLevel/10);
		bonus bHit,(JobLevel/10);
		bonus3 bAutoSpellWhenHit,NPC_EARTHQUAKE,10,1;
	]]
},
[4431] = {
	AegisName = "Kasa_Card",
	Name = "Kasa Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus3 bAutoSpell,MG_FIREBALL,5,20;
		bonus3 bAutoSpell,MG_FIREBOLT,5,20;
	]]
},
[4432] = {
	AegisName = "Magmaring_Card",
	Name = "Magmaring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bBaseAtk,5;
		bonus2 bAddEle,Ele_Earth,10;
		bonus2 bCriticalAddRace,RC_Brute,15;
	]]
},
[4433] = {
	AegisName = "Imp_Card",
	Name = "Imp Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bSkillAtk,MG_FIREBOLT,25;
		bonus2 bVariableCastrate,MG_FIREBOLT,-25;
	]]
},
[4434] = {
	AegisName = "Knocker_Card",
	Name = "Knocker Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bAddRace,RC_Formless,5;
		bonus3 bAddMonsterDropItem,756,RC_Formless,10;
		bonus3 bAddMonsterDropItem,757,RC_Formless,10;
	]]
},
[4435] = {
	AegisName = "Zombie_Slaughter_Card",
	Name = "Zombie Slaughter Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,1;
		bonus2 bMagicAddRace,RC_DemiPlayer,1;
		bonus bHPGainValue,50;
	]]
},
[4436] = {
	AegisName = "Ragged_Zombie_Card",
	Name = "Ragged Zombie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bCriticalAddRace,RC_DemiPlayer,5;
		bonus2 bAddRace,RC_DemiPlayer,1;
		bonus2 bMagicAddRace,RC_DemiPlayer,1;
		bonus2 bAddEff2,Eff_Bleeding,10;
	]]
},
[4437] = {
	AegisName = "Hell_Poodle_Card",
	Name = "Hell Poodle Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bHit,1;
		bonus2 bAddItemHealRate,517,100;
		bonus3 bAddEff,Eff_Bleeding,50,ATF_SHORT;
	]]
},
[4438] = {
	AegisName = "Banshee_Card",
	Name = "Banshee Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		if(BaseClass==Job_Mage) {
			bonus bMaxSP,100;
			bonus bMaxHP,-100;
			bonus2 bSkillAtk,MG_NAPALMBEAT,20;
			bonus2 bSkillAtk,MG_SOULSTRIKE,20;
			bonus2 bSkillAtk,HW_NAPALMVULCAN,20;
		}
	]]
},
[4439] = {
	AegisName = "Flame_Skull_Card",
	Name = "Flame Skull Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bResEff,Eff_Blind,3000;
		bonus2 bResEff,Eff_Stun,3000;
		bonus2 bResEff,Eff_Curse,3000;
		bonus2 bResEff,Eff_Stone,3000;
		bonus2 bAddEffWhenHit,Eff_Blind,500;
		bonus2 bAddEffWhenHit,Eff_Stun,500;
		bonus2 bAddEffWhenHit,Eff_Curse,500;
		bonus2 bAddEffWhenHit,Eff_Stone,500;
	]]
},
[4440] = {
	AegisName = "Necromancer_Card",
	Name = "Necromancer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		.@i = getiteminfo(getequipid(EQI_HAND_R),11);
		if (.@i == 10 || .@i == 23) {
			bonus bInt,1;
			bonus bIgnoreMdefRate,2;
		}
	]]
},
[4441] = {
	AegisName = "Fallen_Bishop_Card",
	Name = "Fallen Bishop Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMatkRate,10;
		bonus bMaxSPrate,-50;
		bonus2 bMagicAddRace,RC_Angel,50;
		bonus2 bMagicAddRace,RC_DemiPlayer,50;
	]]
},
[4442] = {
	AegisName = "Tatacho_Card",
	Name = "Tatacho Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Neutral,20;
		bonus2 bAddEle,Ele_Neutral,5;
	]]
},
[4443] = {
	AegisName = "Aqua_Elemental_Card",
	Name = "Aqua Elemental Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Water,20;
		bonus2 bAddEle,Ele_Water,5;
	]]
},
[4444] = {
	AegisName = "Draco_Card",
	Name = "Draco Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Earth,20;
		bonus2 bAddEle,Ele_Earth,5;
	]]
},
[4445] = {
	AegisName = "Luciola_Vespa_Card",
	Name = "Luciola Vespa Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Wind,20;
		bonus2 bAddEle,Ele_Wind,5;
	]]
},
[4446] = {
	AegisName = "P_Skeleton_Card",
	Name = "Enhanced Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bAtk,15;
		bonus2 bAddEff,Eff_Stun,200;
		if(BaseLevel>99) {
			bonus2 bAddEff,Eff_Stun,100;
		}
	]]
},
[4447] = {
	AegisName = "Centipede_Card",
	Name = "Centipede Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Poison,20;
		bonus2 bAddEle,Ele_Poison,5;
	]]
},
[4448] = {
	AegisName = "Cornus_Card",
	Name = "Cornus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Holy,20;
		bonus2 bAddEle,Ele_Holy,5;
	]]
},
[4449] = {
	AegisName = "Dark_Shadow_Card",
	Name = "Dark Shadow Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubEle,Ele_Dark,20;
		bonus2 bAddEle,Ele_Dark,5;
	]]
},
[4450] = {
	AegisName = "Banshee_Master_Card",
	Name = "Banshee Master Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bInt,1;
		bonus bMatk,10;
	]]
},
[4451] = {
	AegisName = "Ant_Buyanne_Card",
	Name = "Entweihen Crothen Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bMatk,100; ]]
},
[4452] = {
	AegisName = "Centipede_Larva_Card",
	Name = "Centipede Larva Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bInt,1;
		bonus bMatk,3;
	]]
},
[4453] = {
	AegisName = "Hilsrion_Card",
	Name = "Hillslion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bBaseAtk,25; ]]
},
[4454] = {
	AegisName = "Light_Up_Card1",
	Name = "No name card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
},
[4455] = {
	AegisName = "Light_Up_Card2",
	Name = "No name card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
},
[4456] = {
	AegisName = "Nidhogg_Shadow_Card",
	Name = "Nidhoggur Shadow Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bInt,5;
		if (Class == Job_High_Wizard || Class == Job_Baby_Warlock || Class == Job_Warlock || Class == Job_Warlock_T) bonus bFixedCastrate,-50;
	]]
},
[4457] = {
	AegisName = "Nahtzigger_Card",
	Name = "Naght Seiger Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bSkillAtk,MG_NAPALMBEAT,30;
		bonus2 bSkillAtk,MG_SOULSTRIKE,30;
		bonus2 bSkillAtk,HW_NAPALMVULCAN,30;
		bonus2 bSkillAtk,GS_MAGICALBULLET,30;
		bonus2 bSkillAtk,WL_SOULEXPANSION,30;
	]]
},
[4458] = {
	AegisName = "Duneirre_Card",
	Name = "Duneyrr Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bBaseAtk,10;
		autobonus "{ bonus bFlee2,10; }",10,10000,0,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
	]]
},
[4459] = {
	AegisName = "Lata_Card",
	Name = "Rata Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,10;
		autobonus "{ bonus bFixedCastrate,-50; }",5,4000,BF_MAGIC,"{ specialeffect(EF_SUFFRAGIUM, AREA, playerattached()); }";
	]]
},
[4460] = {
	AegisName = "Ringco_Card",
	Name = "Rhyncho Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bHealPower,4;
		bonus2 bSkillUseSP,AL_HEAL,-15;
	]]
},
[4461] = {
	AegisName = "Pillar_Card",
	Name = "Phylla Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDex,1;
		bonus bAgi,1;
		autobonus "{ bonus bCritical,20; }",15,4000,0,"{ specialeffect(EF_ENHANCE, AREA, playerattached()); }";
	]]
},
[4462] = {
	AegisName = "Hardrock_Mommos_Card",
	Name = "Hardrock Mammoth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDef,5;
		if(getrefine()>=12) {
			bonus bDef,20;
			bonus bMaxHPrate,10;
		}
		if(getrefine()>=14) {
			bonus bMaxHPrate,3;
		}
	]]
},
[4463] = {
	AegisName = "Tendrilion_Card",
	Name = "Tendrillion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritical,5;
		if(getrefine()>=12) {
			bonus bBaseAtk,35;
		}
		if(getrefine()>=14) {
			bonus bCritical,10;
		}
	]]
},
[4464] = {
	AegisName = "Aunoe_Card",
	Name = "Aunoe Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bCritAtkRate,20; ]]
},
[4465] = {
	AegisName = "Panat_Card",
	Name = "Fanat Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,10;
		if(getiteminfo(getequipid(EQI_HAND_R),11)==3) {
			if(getrefine()>=10) {
				bonus bAspd,1;
			}
			if(getrefine()>=14) {
				bonus bAspd,1;
			}
		}
	]]
},
[4466] = {
	AegisName = "Beholder_Master_Card",
	Name = "Beholder Master Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bLongAtkRate,3;
		if(getiteminfo(getequipid(EQI_HAND_R),11)==11) {
			if(getrefine()>=10) {
				bonus bAspd,1;
			}
			if(getrefine()>=14) {
				bonus bAspd,1;
			}
		}
	]]
},
[4467] = {
	AegisName = "Heavy_Metaling_Card",
	Name = "Heavy Metaling Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bStr,2;
		if(BaseClass==Job_Merchant) {
			bonus2 bSkillAtk,MC_CARTREVOLUTION,50;
		}
	]]
},
[4468] = {
	AegisName = "Pinguicula_Dark_Card",
	Name = "Dark Pinguicula Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bBaseAtk,10;
		bonus2 bAddMonsterDropItem,7932,10;
		bonus2 bAddMonsterDropItem,7933,10;
		bonus2 bAddMonsterDropItem,7934,10;
		bonus2 bAddMonsterDropItem,7935,10;
		bonus2 bAddMonsterDropItem,7936,10;
		bonus2 bAddMonsterDropItem,7937,10;
	]]
},
[4469] = {
	AegisName = "Naga_Card",
	Name = "Naga Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Fish,10; ]]
},
[4470] = {
	AegisName = "Nepenthes_Card",
	Name = "Nepenthes Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Plant,10; ]]
},
[4471] = {
	AegisName = "Egg_Of_Draco_Card",
	Name = "Draco Egg Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Dragon,10; ]]
},
[4472] = {
	AegisName = "Bradium_Goram_Card",
	Name = "Bradium Golem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Brute,10; ]]
},
[4473] = {
	AegisName = "Ancient_Tree_Card",
	Name = "Ancient Tree Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Undead,10; ]]
},
[4474] = {
	AegisName = "Jakudam_Card",
	Name = "Zakudam Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_DemiPlayer,10; ]]
},
[4475] = {
	AegisName = "Cobalt_Mineral_Card",
	Name = "Cobalt Mineral Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Formless,10; ]]
},
[4476] = {
	AegisName = "Pinguicula_Card",
	Name = "Pinguicula Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Insect,10; ]]
},
[4477] = {
	AegisName = "Hell_Apocalips_Card",
	Name = "Hell Apocalypse Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bMagicAddRace,RC_Demon,10; ]]
},
[4478] = {
	AegisName = "Light_Up_Card3",
	Name = "Lie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
},
[4479] = {
	AegisName = "Light_Up_Card4",
	Name = "Lie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
},
[4480] = {
	AegisName = "Sealed_Kiel_Card",
	Name = "Sealed Kiel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bDelayrate,((getrefine()>14)?-20:-15); ]]
},
[4481] = {
	AegisName = "Sealed_Ktullanux_Card",
	Name = "Sealed Ktullanux Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bAddEle,Ele_Fire,((getrefine()>14)?35:25);
		bonus5 bAutoSpellWhenHit,WZ_FROSTNOVA,10,10,BF_WEAPON|BF_MAGIC,0;
	]]
},
[4482] = {
	AegisName = "Sealed_B_Ygnizem_Card",
	Name = "Sealed B Ygnizem Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		.@rate = (getrefine()>14)?7:5;
		bonus bMaxHPrate,.@rate;
		bonus bMaxSPrate,.@rate;
		bonus2 bHPRegenRate,50,10000;
		bonus2 bSPRegenRate,10,10000;
	]]
},
[4483] = {
	AegisName = "Sealed_Dracula_Card",
	Name = "Sealed Dracula Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bSPDrainRate,((getrefine()>14)?70:50),5; ]]
},
[4484] = {
	AegisName = "Sealed_Mistress_Card",
	Name = "Sealed Mistress Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bNoGemStone,0;
		bonus bUseSPrate,((getrefine()>14)?35:50);
	]]
},
[4485] = {
	AegisName = "Sealed_Gloom_Card",
	Name = "Sealed Gloom Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		.@rate = (getrefine()>14)?30:20;
		bonus2 bAddEle,Ele_Holy,.@rate;
		bonus2 bAddEle,Ele_Dark,.@rate;
		bonus2 bAddRace,RC_Angel,.@rate;
		bonus2 bAddRace,RC_Demon,.@rate;
	]]
},
[4486] = {
	AegisName = "Sealed_Berz_Card",
	Name = "Sealed Berzebub Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bVariableCastrate,-15; ]]
},
[4487] = {
	AegisName = "Sealed_Ifrit_Card",
	Name = "Sealed Ifrit Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bBaseAtk,(JobLevel/20);
		bonus bCritical,(JobLevel/20);
		bonus bHit,(JobLevel/20);
		bonus3 bAutoSpellWhenHit,NPC_EARTHQUAKE,5,1;
	]]
},
[4488] = {
	AegisName = "Sealed_D_Lord_Card",
	Name = "Sealed Dark Lord Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus3 bAutoSpellWhenHit,WZ_METEOR,5,50; ]]
},
[4489] = {
	AegisName = "Sealed_Pharaoh_Card",
	Name = "Sealed Pharaoh Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bUseSPrate,-15; ]]
},
[4490] = {
	AegisName = "Sealed_M_Flower_Card",
	Name = "Sealed Moonlight Flower Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ skill AL_INCAGI,((getrefine()>14)?5:1); ]]
},
[4491] = {
	AegisName = "Sealed_B_Shecil_Card",
	Name = "Sealed Sniper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bHPrecovRate,-100;
		bonus2 bHPDrainRate,5,((getrefine()>14)?15:10);
	]]
},
[4492] = {
	AegisName = "Sealed_Orc_Hero_Card",
	Name = "Sealed Orc Hero Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bVit,3;
		bonus2 bResEff,Eff_Stun,((getrefine()>14)?6000:4000);
	]]
},
[4493] = {
	AegisName = "Sealed_Tao_Card",
	Name = "Sealed Tao Gunka Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHPrate,((getrefine()>14)?75:50);
		bonus bDefRate,-50;
		bonus bMdefRate,-50;
	]]
},
[4494] = {
	AegisName = "Sealed_TurtleG_Card",
	Name = "Sealed Turtle General Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddRace, RC_All, (getrefine() > 14) ? 15 : 10;
		bonus3 bAutoSpell,SM_MAGNUM,10,15;
	]]
},
[4495] = {
	AegisName = "Sealed_Amon_Ra_Card",
	Name = "Sealed Amon Ra Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAllStats,1;
		bonus3 bAutoSpellWhenHit,PR_KYRIE,((getrefine()>14)?8:5),(15+35*(readparam(bInt)>=99));
	]]
},
[4496] = {
	AegisName = "Sealed_Drake_Card",
	Name = "Sealed Drake Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
},
[4497] = {
	AegisName = "Sealed_Knight_WS_Card",
	Name = "Sealed Stormy Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus3 bAutoSpell,WZ_STORMGUST,1,10;
		bonus2 bAddEff,Eff_Freeze, ((getrefine()>14)?1500:1000);
	]]
},
[4498] = {
	AegisName = "Sealed_Lady_Tanee_Card",
	Name = "Sealed Lady Tanee Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHPrate,((getrefine()>14)?-50:-60);
		bonus bMaxSPrate,50;
		bonus2 bAddMonsterDropItem,513,100;
		bonus2 bAddItemHealRate,513,((getrefine()>14)?80:50);
	]]
},
[4499] = {
	AegisName = "Sealed_Samurai_Card",
	Name = "Sealed Incantation Samurai Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bIgnoreDefRace,RC_NonBoss;
		bonus bHPrecovRate,-100;
		if (getrefine()>14) bonus2 bHPLossRate,777,8000;
		else bonus2 bHPLossRate,888,5000;
	]],
	OnUnequipScript = [[
		if((Hp<=999) && !getmapflag(strcharinfo(PC_MAP),mf_pvp) && !getmapflag(strcharinfo(PC_MAP),mf_pvp_noparty) && !getmapflag(strcharinfo(PC_MAP),mf_pvp_noguild)) {
			heal(1-Hp),0;
		}
		else {
			heal -999,0;
		}
	]]
},
[4500] = {
	AegisName = "Sealed_Orc_Load_Card",
	Name = "Sealed Orc Lord Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus bShortWeaponDamageReturn,((getrefine()>14)?25:15); ]]
},
[4501] = {
	AegisName = "Sealed_B_Magaleta_Card",
	Name = "Sealed High Priest Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus5 bAutoSpellWhenHit,HP_ASSUMPTIO,1,((getrefine()>14)?35:25),BF_WEAPON|BF_MAGIC,0; ]]
},
[4502] = {
	AegisName = "Sealed_B_Harword_Card",
	Name = "Sealed MasterSmith Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if (getrefine()>14) {
			bonus bBreakWeaponRate,800;
			bonus bBreakArmorRate,600;
		}
		else {
			bonus bBreakWeaponRate,500;
			bonus bBreakArmorRate,400;
		}
	]]
},
[4503] = {
	AegisName = "Sealed_Apocalips_H_Card",
	Name = "Sealed Vesper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDex,2;
		bonus2 bIgnoreMdefRate,RC_Boss,((getrefine()>14)?25:15);
	]]
},
[4504] = {
	AegisName = "Sealed_Eddga_Card",
	Name = "Sealed Eddga Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxHPrate,((getrefine()>14)?-35:-50);s]],
	OnEquipScript = [[ sc_start4 SC_ENDURE,60000,10,0,0,1;s]],
	OnUnequipScript = [[ sc_end SC_ENDURE; ]]
},
[4505] = {
	AegisName = "Scaraba_Card",
	Name = "Scaraba Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bMatk,20;
		bonus bMaxSPrate,-1;
	]]
},
[4506] = {
	AegisName = "Dolomedes_Card",
	Name = "Dolomedes Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bDex,2;
		if(BaseClass==Job_Archer) {
			bonus bDex,getrefine()/3;
		}
	]]
},
[4507] = {
	AegisName = "Q_Scaraba_Card",
	Name = "Queen Scaraba Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddRace2,RC2_Scaraba,30;
		bonus2 bAddMonsterDropItem,12806,30;
	]]
},
[4508] = {
	AegisName = "Gold_Scaraba_Card",
	Name = "Gold Scaraba Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bBaseAtk,20;
		bonus bMaxHPrate,-1;
	]]
},
[4509] = {
	AegisName = "Gold_Q_Scaraba_Card",
	Name = "Gold Queen Scaraba Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,3;
		bonus2 bAddRaceTolerance,RC_Insect,10;
		if(getrefine()>=9) {
			bonus2 bAddRaceTolerance,RC_Insect,5;
		}
	]]
},
[4510] = {
	AegisName = "Miming_Card",
	Name = "Miming Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEff,Eff_Deepsleep,500; ]]
},
[4511] = {
	AegisName = "Little_Fatum_Card",
	Name = "Little Fatum Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAddEff,Eff_Silence,500,ATF_SKILL; ]]
},
[4512] = {
	AegisName = "Parus_Card",
	Name = "Parus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bHealPower,3;
		if(BaseClass==Job_Acolyte) {
			bonus bHealPower,getrefine()/2;
		}
	]]
},
[4513] = {
	AegisName = "Angra_Mantis_Card",
	Name = "Angra Mantis Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bCritAtkRate,2;
		if(BaseClass==Job_Thief) {
			bonus bCritAtkRate,getrefine()/2;
		}
	]]
},
[4514] = {
	AegisName = "Pom_Spider_Card",
	Name = "Pom Spider Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Undead,20; ]]
},
[4515] = {
	AegisName = "Alnoldi_Card",
	Name = "Alnoldi Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,30; ]]
},
[4516] = {
	AegisName = "Comodo_Card",
	Name = "Comodo Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDef,50;
		bonus bFlee,-25;
	]]
},
[4517] = {
	AegisName = "Cendrawasih_Card",
	Name = "Cendrawasih Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,2;
		if(BaseClass==Job_Mage) {
			bonus bInt,getrefine()/3;
		}
	]]
},
[4518] = {
	AegisName = "Banaspaty_Card",
	Name = "Banaspaty Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddEff,Eff_Burning,1500; ]]
},
[4519] = {
	AegisName = "Butoijo_Card",
	Name = "Butoijo Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus2 bAddRace,RC_Angel,20; ]]
},
[4520] = {
	AegisName = "Leak_Card",
	Name = "Leak Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bStr,3;
		bonus2 bAddEff,Eff_Confusion,5000;
		bonus3 bAddEff,Eff_Confusion,5000,ATF_SKILL;
	]]
},
[4521] = {
	AegisName = "Sedora_Card",
	Name = "Sedora Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bCritAtkRate,15; ]]
},
[4522] = {
	AegisName = "Sropho_Card",
	Name = "Sropho Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus4 bAddEff,Eff_Cold,500,ATF_SHORT,3000; ]]
},
[4523] = {
	AegisName = "Pot_Dofle_Card",
	Name = "Pot Dofle Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDefEle,Ele_Water;
		bonus2 bAddRaceTolerance,RC_Fish,10;
	]]
},
[4524] = {
	AegisName = "King_Dramoh_Card",
	Name = "King Dramoh Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bStr,2;
		if(BaseClass==Job_Swordman) {
			bonus bStr,getrefine()/3;
		}
	]]
},
[4525] = {
	AegisName = "Kraken_Card",
	Name = "Kraken Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		skill TF_HIDING,1;
		skill RG_RAID,1;
		bonus3 bAddEffOnSkill,RG_RAID,Eff_Bleeding,1000;
	]],
	OnUnequipScript = [[ sc_end SC_HIDING; ]]
},
[4526] = {
	AegisName = "Odd_Coelacanth_Card",
	Name = "Weird Coelacanth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxSPrate,5;
		bonus bMdef,50;
	]]
},
[4527] = {
	AegisName = "Black_Coelacanth_Card",
	Name = "Dark Coelacanth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHPrate,10;
		bonus bDef,100;
	]]
},
[4528] = {
	AegisName = "Mutant_Coelacanth_Card",
	Name = "Mutant Coelacanth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatkRate,2+(getrefine()/2);
		bonus bMaxHPrate,-getrefine()/2;
	]]
},
[4529] = {
	AegisName = "Cruel_Coelacanth_Card",
	Name = "Violent Coelacanth Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bAddRace, RC_All, 2+(getrefine()/2);
		bonus bMaxSPrate,-getrefine()/2;
	]]
},
[4530] = {
	AegisName = "Siorava_Card",
	Name = "Siorava Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bLuk,2;
		if(BaseClass==Job_Merchant) {
			bonus bLuk,getrefine()/3;
		}
	]]
},
[4531] = {
	AegisName = "Red_Eruma_Card",
	Name = "Red Eruma Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAddEff,Eff_Curse,500,ATF_SKILL; ]]
},
[4532] = {
	AegisName = "Wild_Rider_Card",
	Name = "Wild Rider Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus3 bAutoSpellWhenHit,AL_INCAGI,1,10; ]]
},
[4533] = {
	AegisName = "Mini_Octopus_Card",
	Name = "Octopus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus3 bAddEff,Eff_Blind,500,ATF_SKILL; ]]
},
[4534] = {
	AegisName = "Giant_Octopus_Card",
	Name = "Giant Octopus Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHPrate,12;
		skill WZ_WATERBALL,5;
	]]
},
[4535] = {
	AegisName = "Sealed_Rand_Card",
	Name = "Sealed Rand Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
},
[4536] = {
	AegisName = "Sealed_Atroce_Card",
	Name = "Sealed Atroce Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,((getrefine()>14)?25:15);
		autobonus "{ bonus bAspdRate,((getrefine()>14)?75:50); }",5,10000,0,"{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); }";
	]]
},
[4537] = {
	AegisName = "Sealed_Phreeoni_Card",
	Name = "Sealed Phreeoni Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bHit,((getrefine()>14)?75:50); ]]
},
[4538] = {
	AegisName = "Sealed_Bacsojin_Card",
	Name = "Sealed White Lady Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		if (getrefine()>14) {
			bonus bHealPower,25;
			bonus bUseSPrate,20;
		}
		else {
			bonus bHealPower,15;
			bonus bUseSPrate,30;
		}
	]]
},
[4539] = {
	AegisName = "Sealed_F_Bishop_Card",
	Name = "Sealed Fallen Bishop Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMatkRate,((getrefine()>14)?8:5);
		bonus bMaxSPrate,-50;
		.@rate = (getrefine()>14)?33:25;
		bonus2 bMagicAddRace,RC_Angel,.@rate;
		bonus2 bMagicAddRace,RC_DemiPlayer,.@rate;
	]]
},
[4540] = {
	AegisName = "SLD_Lord_Of_Death_Card",
	Name = "Sealed Lord Of The Death Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		.@rate = (getrefine()>14)?350:250;
		bonus3 bAddEff,Eff_Stun,.@rate,ATF_SHORT;
		bonus3 bAddEff,Eff_Curse,.@rate,ATF_SHORT;
		bonus3 bAddEff,Eff_Silence,.@rate,ATF_SHORT;
		bonus3 bAddEff,Eff_Poison,.@rate,ATF_SHORT;
		bonus3 bAddEff,Eff_Bleeding,.@rate,ATF_SHORT;
		bonus2 bWeaponComaRace,RC_NonBoss,1;
	]]
},
[4541] = {
	AegisName = "SLD_B_Katrinn_Card",
	Name = "Sealed High Wizard Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bIgnoreMdefRace,RC_NonBoss;
		if (getrefine()>14) {
			bonus bVariableCastrate,120;
			bonus bSPrecovRate,-120;
		}
		else {
			bonus bVariableCastrate,150;
			bonus bSPrecovRate,-150;
		}
	]],
	OnUnequipScript = [[ heal 0,((getrefine()>14)?-2000:-3000); ]]
},
[4542] = {
	AegisName = "SLD_Detale_Card",
	Name = "SLD Detale Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
},
[4543] = {
	AegisName = "SLD_Garm_Card",
	Name = "Sealed Garm Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[ bonus2 bAddEffWhenHit,Eff_Freeze,((getrefine()>14)?4000:2500); ]]
},
[4544] = {
	AegisName = "SLD_Dark_Snake_Card",
	Name = "Sealed Dark Snake Lord Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bInt,3;
		if (getrefine()>14) {
			bonus2 bResEff,Eff_Blind,7500;
			bonus2 bResEff,Eff_Curse,7500;
		}
		else {
			bonus2 bResEff,Eff_Blind,5000;
			bonus2 bResEff,Eff_Curse,5000;
		}
	]]
},
[4545] = {
	AegisName = "Novice_Poring_Card",
	Name = "Novice Poring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bLuk,1; ]]
},
[4546] = {
	AegisName = "Valkhiri_Card",
	Name = "Val'khiri Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
},
[4547] = {
	AegisName = "Upd_Byorgue_Card",
	Name = "Enhanced Byorgue Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		if (BaseJob == Job_Rogue) {
			bonus bMatkRate,10;
			bonus2 bAddRace, RC_All, 10;
		}
		bonus bMaxHPrate,getrefine()/2;
		bonus3 bAddEffOnSkill,SC_BODYPAINT,Eff_Confusion,100;
	]]
},
[4548] = {
	AegisName = "Upd_Salamander_Card",
	Name = "Enhanced Salamander Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSkillAtk,WZ_FIREPILLAR,40;
		bonus2 bSkillAtk,WZ_METEOR,40;
	]]
},
[4549] = {
	AegisName = "Upd_Maya_Puple_Card",
	Name = "Upd Maya Puple Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bIntravision,0;
		bonus bAllStats,1;
		skill AL_RUWACH,1;
	]]
},
[4550] = {
	AegisName = "Upd_Bow_Guardian_Card",
	Name = "Upd Bow Guardian Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if(getiteminfo(getequipid(EQI_HAND_R),11)==11) {
			bonus2 bSkillAtk,RA_ARROWSTORM,50;
			bonus bCritical,25+10*(getequiprefinerycnt(EQI_HAND_R)/4);
			bonus bHit,5;
			bonus3 bAutoSpell,HT_PHANTASMIC,1,100;
		}
	]]
},
[4551] = {
	AegisName = "Upd_Necromancer_Card",
	Name = "Enhanced Necromancer Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if(getiteminfo(getequipid(EQI_HAND_R),11)==10) {
			bonus bInt,1;
			bonus bIgnoreMdefRate,2;
			bonus bIgnoreMdefRate,getrefine()/4;
		}
	]]
},
[4552] = {
	AegisName = "Manny_Card",
	Name = "Manny Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bMaxHP,10;
	]]
},
[4553] = {
	AegisName = "Sid_Card",
	Name = "Sid Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHP,100;
	]]
},
[4554] = {
	AegisName = "Diego_Card",
	Name = "Diego Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bMaxHP,100;
	]]
},
[4555] = {
	AegisName = "Scrat_Card",
	Name = "Scrat Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMaxHP,100;
	]]
},
[4556] = {
	AegisName = "Fenrir_Card",
	Name = "Fenrir Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,50;
		bonus bMatk,(getrefine()*5);
		bonus bFixedCastrate,-70;
	]]
},
[4557] = {
	AegisName = "Fenrir_Card_",
	Name = "Weakened Fenrir Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,25;
	]]
},
[4558] = {
	AegisName = "Woodie_Card",
	Name = "Chun Tree Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Earth,20;
		bonus3 bAutoSpellWhenHit,PR_KYRIE,2,20;
	]]
},
[4559] = {
	AegisName = "M_Morocc_Card",
	Name = "Devil Morocc Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAspd,1;
		bonus bMaxSPrate,-10;
	]]
},
[4560] = {
	AegisName = "Clown_Card",
	Name = "Clown Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bFlee,20;
		if(readparam(bVit)>=110) {
			bonus bFlee,20;
		}
		if(getiteminfo(getequipid(EQI_HAND_R),11)==13) {
			skill BA_POEMBRAGI,10;
		}
	]]
},
[4561] = {
	AegisName = "Professor_Card",
	Name = "Professor Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMatkRate,7;
		if(readparam(bDex)>=110) {
			bonus bMatkRate,7;
		}
		bonus5 bAutoSpellWhenHit,SA_LANDPROTECTOR,5,70,BF_MAGIC,0;
	]]
},
[4562] = {
	AegisName = "Champion_Card",
	Name = "Champion Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bAtkRate,7;
		if(readparam(bAgi)>=110) {
			bonus bAtkRate,7;
		}
		bonus5 bAutoSpellWhenHit,MO_INVESTIGATE,5,70,BF_WEAPON,1;
	]]
},
[4563] = {
	AegisName = "Creator_Card",
	Name = "Creator Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bCritical,20;
		if(readparam(bStr)>=110) {
			bonus bCritical,20;
		}
		bonus5 bAutoSpellWhenHit,AM_ACIDTERROR,5,70,BF_WEAPON,1;
	]]
},
[4564] = {
	AegisName = "Stalker_Card",
	Name = "Stalker Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bHit,20;
		if(readparam(bLuk)>=110) {
			bonus bHit,20;
		}
		bonus5 bAutoSpellWhenHit,ST_FULLSTRIP,1,70,BF_WEAPON,1;
	]]
},
[4565] = {
	AegisName = "Paladin_Card",
	Name = "Paladin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHPrate,10;
		if(readparam(bInt)>=110) {
			bonus bMaxHPrate,10;
		}
		bonus5 bAutoSpellWhenHit,CR_GRANDCROSS,10,70,BF_WEAPON,0;
	]]
},
[4566] = {
	AegisName = "Gypsy_Card",
	Name = "Gypsy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		if(getiteminfo(getequipid(EQI_HAND_R),11)==13) {
			skill DC_FORTUNEKISS,10;
		}
		bonus bFlee,20;
		if(readparam(bVit)>=110) {
			bonus bFlee,20;
		}
	]]
},
[4567] = {
	AegisName = "Alphoccio_Card",
	Name = "Alphoccio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		if(BaseJob==Job_Bard) {
			bonus bMaxHPrate,10;
			bonus bMaxSPrate,5;
		}
	]]
},
[4568] = {
	AegisName = "Ceila_Card",
	Name = "Celia Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		skill SA_ABRACADABRA,1;
	]]
},
[4569] = {
	AegisName = "Chen_Card",
	Name = "Chen Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		skill MO_CALLSPIRITS,2;
	]]
},
[4570] = {
	AegisName = "Flamel_Card",
	Name = "Flamel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		bonus2 bAddItemHealRate,501,200;
		bonus2 bAddItemHealRate,502,200;
		bonus2 bAddItemHealRate,503,200;
		bonus2 bAddItemHealRate,504,200;
	]]
},
[4571] = {
	AegisName = "Gertie_Card",
	Name = "Gertie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		skill RG_CLOSECONFINE,1;
	]]
},
[4572] = {
	AegisName = "Randel_Card",
	Name = "Randel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		skill CR_AUTOGUARD,3;
	]]
},
[4573] = {
	AegisName = "Trentini_Card",
	Name = "Trentini Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bFlee,10;
		if(BaseJob==Job_Dancer) {
			bonus bMaxHPrate,10;
			bonus bMaxSPrate,5;
		}
	]]
},
[4574] = {
	AegisName = "Daehyon_Card",
	Name = "General Daehyon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if((getiteminfo(getequipid(EQI_HAND_R),11)==3)||(getiteminfo(getequipid(EQI_HAND_R),11)==4)) {
			bonus bBaseAtk,100;
		}
	]]
},
[4575] = {
	AegisName = "Soheon_Card",
	Name = "Armed Guard Soheon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,10;
		if(getiteminfo(getequipid(EQI_HAND_R),11)==1) {
			if(getrefine()>=10) {
				bonus bAspd,1;
			}
			if(getrefine()>=14) {
				bonus bAspd,1;
			}
		}
	]]
},
[4576] = {
	AegisName = "Gioia_Card",
	Name = "Gioia Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bMagicAtkEle,Ele_Wind,100;
		bonus2 bMagicAtkEle,Ele_Ghost,100;
		bonus2 bSubEle,Ele_Neutral,-30;
		bonus2 bSubEle,Ele_Water,-30;
		bonus2 bSubEle,Ele_Earth,-30;
		bonus2 bSubEle,Ele_Fire,-30;
		bonus2 bSubEle,Ele_Wind,-30;
		bonus2 bSubEle,Ele_Poison,-30;
		bonus2 bSubEle,Ele_Holy,-30;
		bonus2 bSubEle,Ele_Dark,-30;
		bonus2 bSubEle,Ele_Ghost,-30;
		bonus2 bSubEle,Ele_Undead,-30;
	]]
},
[4577] = {
	AegisName = "Elvira_Card",
	Name = "Elvira Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bMagicAtkEle,Ele_Wind,20;
		bonus2 bMagicAtkEle,Ele_Ghost,20;
	]]
},
[4578] = {
	AegisName = "Pyuriel_Card",
	Name = "Angry Student Pyuriel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritAtkRate,30;
		bonus2 bSubRace, RC_All, -10;
	]]
},
[4579] = {
	AegisName = "Lora_Card",
	Name = "Warrior Lola Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		if(getiteminfo(getequipid(EQI_HAND_R),11)==8) {
			bonus bBaseAtk,20;
			bonus bCritical,10;
		}
		bonus bBaseAtk,getrefine();
		bonus bCritical,getrefine();
	]]
},
[4580] = {
	AegisName = "Kades_Card",
	Name = "Guardian Kades Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Water,50;
		bonus2 bSubEle,Ele_Earth,50;
		bonus2 bSubEle,Ele_Fire,50;
		bonus2 bSubEle,Ele_Wind,50;
		bonus2 bSubEle,Ele_Dark,50;
		bonus2 bSubEle,Ele_Undead,50;
		bonus2 bSubEle,Ele_Holy,-100;
		bonus2 bSubEle,Ele_Ghost,-100;
	]]
},
[4581] = {
	AegisName = "Rudo_Card",
	Name = "Rudo Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		autobonus "{ sc_start SC_MOVHASTE_HORSE, 3000, 25; bonus bAgi, 44; heal 0, -40; }", 3, 3000, 0, "{ specialeffect(EF_WIND, AREA, playerattached()); }";
	]]
},
[4582] = {
	AegisName = "Bungisngis_Card",
	Name = "Bungisngis Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[ bonus bMaxHPrate,getrefine()/2; ]]
},
[4583] = {
	AegisName = "Engkanto_Card",
	Name = "Engkanto Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus2 bAddEle,Ele_Poison,30;
		bonus2 bIgnoreDefRate,RC_Plant,30;
	]]
},
[4584] = {
	AegisName = "Manananggal_Card",
	Name = "Manananggal Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bSPDrainValue,1;
		bonus bMaxSPrate,-1;
	]]
},
[4585] = {
	AegisName = "Mangkukulam_Card",
	Name = "Mangkukulam Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxSPrate,10;
		bonus bHPGainValue,-666;
	]]
},
[4586] = {
	AegisName = "Tikbalang_Card",
	Name = "Tikbalang Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,10;
		bonus2 bMagicAtkEle,Ele_Wind,5;
		if(getrefine()>=9) {
			bonus2 bMagicAtkEle,Ele_Wind,5;
		}
	]]
},
[4587] = {
	AegisName = "Tiyanak_Card",
	Name = "Tiyanak Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus2 bCriticalAddRace,RC_DemiPlayer,12;
		bonus2 bCriticalAddRace,RC_Fish,12;
		bonus2 bCriticalAddRace,RC_Brute,12;
	]]
},
[4588] = {
	AegisName = "Wakwak_Card",
	Name = "Wakwak Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bBaseAtk,5*(readparam(bStr)/10); ]]
},
[4589] = {
	AegisName = "Jejeling_Card",
	Name = "Jejeling Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMaxHP,200*(readparam(bVit)/10); ]]
},
[4590] = {
	AegisName = "Bangungot_Card",
	Name = "Bangungot Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bInt,4;
		bonus5 bAutoSpellWhenHit,NPC_WIDESLEEP,3,2500,BF_MAGIC,0;
	]]
},
[4591] = {
	AegisName = "Bakonawa_Card",
	Name = "Bakonawa Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bStr,4;
		bonus2 bAddEffWhenHit,Eff_Bleeding,2000;
	]]
},
[4592] = {
	AegisName = "Buwaya_Card",
	Name = "Buwaya Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bVit,4;
		bonus5 bAutoSpellWhenHit,NPC_WIDESTONE,3,2500,BF_MAGIC,0;
	]]
},
[4593] = {
	AegisName = "Menblatt_Card",
	Name = "Menblatt Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bLongAtkRate,1*(readparam(bDex)/10); ]]
},
[4594] = {
	AegisName = "Petal_Card",
	Name = "Petal Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bCritAtkRate,2*(readparam(bLuk)/10); ]]
},
[4595] = {
	AegisName = "Cenere_Card",
	Name = "Cenere Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bAspdRate,2*(readparam(bAgi)/10);
		bonus bDelayrate,-2*(readparam(bAgi)/10);
	]]
},
[4596] = {
	AegisName = "AntiqueBook_Card",
	Name = "Antique Book Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[ bonus bMatk,5*(readparam(bInt)/10); ]]
},
[4597] = {
	AegisName = "LichternB_Card",
	Name = "Lichtern Blue Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,10;
		bonus2 bMagicAtkEle,Ele_Water,(getrefine()>=9)?10:5;
	]]
},
[4598] = {
	AegisName = "LichternY_Card",
	Name = "Lichtern Green Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,10;
		bonus2 bMagicAtkEle,Ele_Ghost,(getrefine()>=9)?10:5;
	]]
},
[4599] = {
	AegisName = "LichternR_Card",
	Name = "Lichtern Red Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,10;
		bonus2 bMagicAtkEle,Ele_Fire,(getrefine()>=9)?10:5;
	]]
},
[4600] = {
	AegisName = "LichternG_Card",
	Name = "Lichtern Yellow Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bMatk,10;
		bonus2 bMagicAtkEle,Ele_Earth,(getrefine()>=9)?10:5;
	]]
},
[4601] = {
	AegisName = "Amdarais_Card",
	Name = "Amdarais Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bAtkRate,15;
		bonus bMatkRate,15;
		bonus2 bHPLossRate,666,4000;
		bonus2 bSPLossRate,66,4000;
	]],
	OnUnequipScript = [[ heal -6666,-666; ]]
},
[4602] = {
	AegisName = "AmdaraisH_Card",
	Name = "Realized Amdarais Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bAtkRate,20;
		bonus bMatkRate,20;
		bonus2 bHPLossRate,666,6000;
		bonus2 bSPLossRate,66,6000;
	]],
	OnUnequipScript = [[ heal -6666,-666; ]]
},
[4603] = {
	AegisName = "CorruptionRoot_Card",
	Name = "Corruption Root Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,20;
		bonus5 bAutoSpellWhenHit,NPC_WIDESTONE,1,70,BF_WEAPON,0;
		bonus5 bAutoSpellWhenHit,NPC_WIDESLEEP,1,70,BF_WEAPON,0;
		bonus5 bAutoSpellWhenHit,NPC_WIDECURSE,1,70,BF_WEAPON,0;
	]]
},
[4604] = {
	AegisName = "CorruptionRootH_Card",
	Name = "Realized Corruption Root Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,30;
		bonus5 bAutoSpellWhenHit,NPC_WIDESTONE,2,70,BF_WEAPON,0;
		bonus5 bAutoSpellWhenHit,NPC_WIDESLEEP,2,70,BF_WEAPON,0;
		bonus5 bAutoSpellWhenHit,NPC_WIDECURSE,2,70,BF_WEAPON,0;
	]]
},
[4605] = {
	AegisName = "UndeadKnightM_Card",
	Name = "Agony Of Royal Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHPrate,-44;
		bonus bHPGainValue,200+10*getrefine();
	]]
},
[4606] = {
	AegisName = "UndeadKnightF_Card",
	Name = "Grudge of Royal Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bMaxSPrate,-44;
		bonus bSPGainValue,20+(getrefine()/2);
	]],
	OnUnequipScript = [[ heal 0,-444; ]]
},
[4607] = {
	AegisName = "FaithfulManager_Card",
	Name = "Faithful Manager Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,5;
		bonus bMatk,5;
		if(getiteminfo(getequipid(EQI_HAND_R),11) == 15) {
			if(getrefine()>=10) {
				bonus bBaseAtk,20;
				bonus bMatk,20;
			}
			if(getrefine()>=14) {
				bonus bBaseAtk,20;
				bonus bMatk,20;
			}
		}
	]]
},
[4608] = {
	AegisName = "White_Knightage_Card",
	Name = "White Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bBaseAtk,15;
		bonus2 bAddSize,Size_Medium,20;
		bonus2 bAddSize,Size_Large,20;
	]]
},
[4609] = {
	AegisName = "Khali_Knightage_Card",
	Name = "Khalitzburg Knight Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bDef,20;
		bonus2 bSubSize,Size_Medium,25;
		bonus2 bSubSize,Size_Large,25;
	]]
},
[4610] = {
	AegisName = "Sarah_Card",
	Name = "Sarah Card",
	Type = "IT_TYPE_CARD",
	Buy = 10,
	Weight = 10,
	Loc = "EQP_ARMOR",
},
[4625] = {
	AegisName = "Timeholder_Card",
	Name = "Timeholder Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bMatkRate,20;
		bonus bUseSPrate,10;
	]]
},
[4626] = {
	AegisName = "Big_Ben_Card",
	Name = "Big Ben Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bMagicAddRace,RC_Formless,5;
		bonus2 bMagicAddRace,RC_Demon,5;
	]]
},
[4627] = {
	AegisName = "Big_Bell_Card",
	Name = "Big Bell Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddRace,RC_Formless,10;
		bonus2 bAddRace,RC_Demon,10;
	]]
},
[4628] = {
	AegisName = "Neo_Punk_Card",
	Name = "Neo Punk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubRace,RC_Formless,20;
		bonus2 bSubRace,RC_Demon,20;
	]]
},
[4629] = {
	AegisName = "Arc_Elder_Card",
	Name = "Arc Elder Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Neutral,15;
		bonus2 bMagicAtkEle,Ele_Earth,(getrefine()*3);
	]]
},
[4630] = {
	AegisName = "Time_Keeper_Card",
	Name = "Time Keeper Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus3 bAutoSpell,NPC_WIDECURSE,2,20;
	]]
},
[4631] = {
	AegisName = "Owl_Viscount_Card",
	Name = "Owl Viscount Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bAspdRate,3;
	]]
},
[4632] = {
	AegisName = "Owl_Marquees_Card",
	Name = "Owl Marquees Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		if(getskilllv(SA_VIOLENTGALE)==5) {
			bonus5 bAutoSpell,SA_VIOLENTGALE,5,20,BF_WEAPON,0;
		}
		else bonus5 bAutoSpell,SA_VIOLENTGALE,1,20,BF_WEAPON,0;
	]]
},
[4633] = {
	AegisName = "P_Archer_Skeleton_Card",
	Name = "Enhanced Archer Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bLongAtkRate,10;
		if(BaseLevel>99) {
			bonus bLongAtkRate,2;
		}
	]]
},
[4634] = {
	AegisName = "P_Soldier_Skeleton_Card",
	Name = "Enhanced Soldier Skeleton Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus bCritical,9;
		if(BaseLevel>99) {
			bonus bCritical,1;
		}
	]]
},
[4635] = {
	AegisName = "P_Amdarais_Card",
	Name = "Enhanced Amdarais Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bDef,getequiprefinerycnt(EQI_ARMOR)*10;
		bonus bFlee,-(getequiprefinerycnt(EQI_ARMOR)*2);
		if(BaseLevel>99) {
			bonus bMaxHP,500;
		}
	]]
},
[4636] = {
	AegisName = "Bijou_Card",
	Name = "Bijou Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bResEff,Eff_Freeze,10000;
		bonus bAtkRate,10;
		bonus bMatkRate,10;
	]]
},
[4637] = {
	AegisName = "Immortal_Corpse_Card",
	Name = "Immortal Corps Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bHPGainValue,50;
		bonus bSPGainValue,5;
		bonus bHPrecovRate,-100;
	]],
	OnUnequipScript = [[ heal -1000,100; ]]
},
[4638] = {
	AegisName = "Watcher_Card",
	Name = "Watcher Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bAtk,30;
		/* When attacked by enemy, drain 5 SP from user. */
	]]
},
[4639] = {
	AegisName = "Taffy_Card",
	Name = "Taffy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bAtkRate,1;
	]]
},
[4640] = {
	AegisName = "Frozen_Wolf_Card",
	Name = "Frozen Wolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[
		bonus bMatkRate,1;
	]]
},
[4641] = {
	AegisName = "Zombie_Guard_Card",
	Name = "Zombie Guard Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus bSPrecovRate,-100;
		/*Each time you get a physical attack, recover SP by 1.*/
	]]
},
[4642] = {
	AegisName = "Min_Toad_Card",
	Name = "Infinite Toad Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bFlee2,2;
		if (getrefine() > 6) bonus bFlee2,2;
		if (getrefine() > 8) bonus bFlee2,3;
	]]
},
[4643] = {
	AegisName = "Min_Vagabond_Wolf_Card",
	Name = "Infinite Vagabond Wolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bAtk,10;
		if (getrefine() > 6) bonus bAtk,10;
		if (getrefine() > 8) bonus bAtk,15;
	]]
},
[4644] = {
	AegisName = "Min_Vocal_Card",
	Name = "Infinite Vocal Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMdef,5;
		if (getrefine() > 6) bonus bMdef,10;
		if (getrefine() > 8) bonus bMdef,15;
	]]
},
[4645] = {
	AegisName = "Min_Eclipse_Card",
	Name = "Infinite Eclipse Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMaxHP,300;
		if (getrefine() > 6) bonus bMaxHP,300;
		if (getrefine() > 8) bonus bMaxHP,400;
	]]
},
[4646] = {
	AegisName = "Min_Chimera_Card",
	Name = "Infinite Chimera Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bMaxHPrate,8; bonus bMaxSPrate,4;
	]]
},
[4647] = {
	AegisName = "Min_Osiris_Card",
	Name = "Infinite_Osiris_Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ACC",
	Script = [[ bonus bHPGainValue,300; ]]
},
[4648] = {
	AegisName = "Min_Eddga_Card",
	Name = "Infinite_Eddga_Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus3 bAutoSpellWhenHit,SM_PROVOKE,10,500; ]]
},
[4649] = {
	AegisName = "Min_Phreeoni_Card",
	Name = "Infinite Phreeoni Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bCritical,100; ]]
},
[4650] = {
	AegisName = "Min_Ork_Hero_Card",
	Name = "Infinite Orc Hero Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bVit,3;
		bonus3 bAddEffWhenHit,Eff_Stun,10000,BF_MAGIC; /* NOTE: Works only on monsters, going to test further in Official servers if also works on players. [Frost] */
	]]
},
[4651] = {
	AegisName = "Min_Tao_Gunka_Card",
	Name = "Infinite Tao Gunka Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxHP,10000;
		bonus bAgi,-10;
	]]
},
[4652] = {
	AegisName = "N_Amon_Ra_Card",
	Name = "Nightmare Amon Ra Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus2 bMagicAddEle,Ele_Dark,50;
		bonus2 bMagicAddEle,Ele_Undead,50;
		bonus2 bMagicAddRace,RC_Demon,50;
		bonus2 bMagicAddRace,RC_Undead,50;
	]]
},
[4653] = {
	AegisName = "N_Arclouse_Card",
	Name = "Nightmare Arclouse Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubRace,RC_Brute,20;
		bonus2 bSubRace,RC_Undead,20;
	]]
},
[4654] = {
	AegisName = "N_Mimic_Card",
	Name = "Nightmare Mimic Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bMagicAddRace,RC_Brute,5;
		bonus2 bMagicAddRace,RC_Undead,5;
	]]
},
[4655] = {
	AegisName = "N_Minorous_Card",
	Name = "Nightmare Minorous Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bAddRace,RC_Brute,10;
		bonus2 bAddRace,RC_Undead,10;
	]]
},
[4656] = {
	AegisName = "N_Mummy_Card",
	Name = "Nightmare Mummy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ /* When physically and magically attacked, chance to cause Sleep to all targets on 11x11 cells. */ ]]
},
[4657] = {
	AegisName = "N_Ancient_Mummy_Card",
	Name = "Nightmare Ancient Mummy Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus2 bSubEle,Ele_Neutral,15;
		bonus2 bMagicAtkEle,Ele_Fire,3+(getrefine()*3);
	]]
},
[4658] = {
	AegisName = "N_Verit_Card",
	Name = "Nightmare Verit Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[
		bonus bMatkRate,5;
		if (getrefine() > 6) bonus bMatkRate,3;
		if (getrefine() > 8) bonus bMatkRate,2;
	]]
},
[4659] = {
	AegisName = "Eggring_Card",
	Name = "Eggring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bLuk,2;
		bonus bMaxHP,50;
	]]
},
[4660] = {
	AegisName = "Scout_Basilisk_Card",
	Name = "Scout Basilisk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubSize,Size_Small,5;
		bonus2 bSubSize,Size_Medium,5;
	]]
},
[4661] = {
	AegisName = "Charge_Basilisk_Card",
	Name = "Charge Basilisk Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHIELD",
	Script = [[
		bonus2 bSubSize,Size_Small,-15;
		bonus2 bSubSize,Size_Medium,20;
		bonus2 bSubSize,Size_Large,20;
	]]
},
[4662] = {
	AegisName = "Big_Eggring_Card",
	Name = "Big Eggring Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		bonus bAtk,25;
		bonus bMatk,25;
		bonus bAspdRate,10;
		bonus bMaxHP,1000;
		bonus bLongAtkRate,5;
		bonus bCritAtkRate,10;
		bonus bAtk,-5/(readparam(bStr)*10);
		bonus bAspdRate,-2/(readparam(bAgi)*10);
		bonus bMatk,-5/(readparam(bInt)*10);
		bonus bMaxHP,-200/(readparam(bVit)*10);
		bonus bLongAtkRate,-1/(readparam(bDex)*10);
		bonus bCritAtkRate,-2/(readparam(bLuk)*10);
	]]
},
[4663] = {
	AegisName = "Leaf_Lunatic_Card",
	Name = "Leaf Lunatic Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxSP,5; ]]
},
[4664] = {
	AegisName = "Grass_Fabre_Card",
	Name = "Grass Fabre Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bLuk,1;
		bonus bMaxHP,100;
	]]
},
[4665] = {
	AegisName = "Wild_Hornet_Card",
	Name = "Wild Hornet Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[ bonus bAtk,5; ]]
},
[4666] = {
	AegisName = "Sweet_Rodafrog_Card",
	Name = "Swift Roda Frog Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_ARMOR",
	Script = [[
		bonus bMaxSP,10;
		bonus bMaxHP,300;
	]]
},
[4667] = {
	AegisName = "Hunter_Wolf_Card",
	Name = "Hunter Wolf Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_SHOES",
	Script = [[ bonus bMaxSP,30; ]]
},
[4668] = {
	AegisName = "Trance_Spore_Card",
	Name = "Trance Spore Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Script = [[
		bonus bVit,1;
		bonus bInt,1;
	]]
},
[4669] = {
	AegisName = "Jungle_Mandragora_Card",
	Name = "Jungle Mandragora Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bMagicAddEle,Ele_Wind,3;
		if (getrefine() > 6) bonus2 bMagicAddEle,Ele_Wind,5;
		if (getrefine() > 8) bonus2 bMagicAddEle,Ele_Wind,7;
	]]
},
[4670] = {
	AegisName = "Fruit_Pom_Spider_Card",
	Name = "Fruit Pom Spider",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bMagicAddEle,Ele_Fire,3;
		if (getrefine() > 6) bonus2 bMagicAddEle,Ele_Fire,5;
		if (getrefine() > 8) bonus2 bMagicAddEle,Ele_Fire,7;
	]]
},
[4671] = {
	AegisName = "V_Celia_Card",
	Name = "Sorcerer Celia Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Sorcerer || Class == Job_Sorcerer_T) {
			bonus bMaxHPrate,10;
			bonus bMatkRate,10;
		}
	]]
},
[4672] = {
	AegisName = "V_Chen_Card",
	Name = "Sura Chen Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Sura || Class == Job_Sura_T) {
			bonus bMaxHPrate,10;
			bonus bAtkRate,10;
		}
	]]
},
[4673] = {
	AegisName = "V_Alphoccio_Card",
	Name = "Minstrel Alphoccio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Minstrel || Class == Job_Minstrel_T) {
			bonus bMaxHPrate,15;
			bonus bMaxSPrate,10;
		}
	]]
},
[4674] = {
	AegisName = "V_Eremes_Card",
	Name = "Guillotine Cross Eremes Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Guillotine_Cross || Class == Job_Guillotine_Cross_T) {
			bonus bFlee2,10;
			bonus bAtkRate,15;
		}
	]]
},
[4675] = {
	AegisName = "V_Magaleta_Card",
	Name = "Arch Bishop Magaleta Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Arch_Bishop || Class == Job_Arch_Bishop_T) {
			bonus bMaxHPrate,10;
			bonus bHealPower,15;
		}
	]]
},
[4676] = {
	AegisName = "V_Shecil_Card",
	Name = "Ranger Cecil Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Ranger || Class == Job_Ranger_T) {
			bonus bCritical,20;
			bonus bLongAtkRate,15;
		}
	]]
},
[4677] = {
	AegisName = "V_Harword_Card",
	Name = "Merchanic Howard Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Mechanic || Class == Job_Mechanic_T) {
			bonus bHit,20;
			bonus bAtkRate,15;
		}
	]]
},
[4678] = {
	AegisName = "V_Katrinn_Card",
	Name = "Warlock Kathryne Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Warlock || Class == Job_Warlock_T) {
			bonus bMdef,80;
			bonus bMatkRate,15;
		}
	]]
},
[4679] = {
	AegisName = "V_Seyren_Card",
	Name = "Rune Knight Seyren Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Rune_Knight || Class == Job_Rune_Knight_T) {
			bonus bAspd,2;
			bonus bAtkRate,15;
		}
	]]
},
[4680] = {
	AegisName = "V_Randel_Card",
	Name = "Royal Guard Randel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Royal_Guard || Class == Job_Royal_Guard_T) {
			bonus bDef,350;
			bonus bAtkRate,10;
		}
	]]
},
[4681] = {
	AegisName = "V_Flamel_Card",
	Name = "Genetic Flamel Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Genetic || Class == Job_Genetic_T) {
			bonus bFlee,20;
			bonus bAtkRate,15;
		}
	]]
},
[4682] = {
	AegisName = "V_Gertie_Card",
	Name = "Shadow Chaser Gertie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Shadow_Chaser || Class == Job_Shadow_Chaser_T) {
			bonus bAtkRate,5;
			bonus bMatkRate,15;
		}
	]]
},
[4683] = {
	AegisName = "V_Trentini_Card",
	Name = "Wanderer Trentini Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_GARMENT",
	Script = [[
		if (BaseLevel == 175) bonus bAllStats,10;
		if (getrefine() >= 10) bonus bAllStats,10;
		if (Class == Job_Wanderer || Class == Job_Wanderer_T) {
			bonus bMaxHPrate,10;
			bonus bMaxSPrate,15;
		}
	]]
},
[4684] = {
	AegisName = "V_B_Eremes_Card",
	Name = "True Eremes Guile Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,GC_CROSSIMPACT,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,GC_CROSSIMPACT,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,GC_CROSSIMPACT,50;
	]]
},
[4685] = {
	AegisName = "V_B_Magaleta_Card",
	Name = "True Margaretha Sorin Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,AB_JUDEX,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,AB_JUDEX,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,AB_JUDEX,50;
	]]
},
[4686] = {
	AegisName = "V_B_Katrinn_Card",
	Name = "True Kathryne Keyron Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,WL_HELLINFERNO,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,WL_HELLINFERNO,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,WL_HELLINFERNO,50;
	]]
},
[4687] = {
	AegisName = "V_B_Shecil_Card",
	Name = "True Cecil Damon Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,RA_AIMEDBOLT,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,RA_AIMEDBOLT,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,RA_AIMEDBOLT,50;
	]]
},
[4688] = {
	AegisName = "V_B_Harword_Card",
	Name = "True Howard Alt-Eisen Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,NC_POWERSWING,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,NC_POWERSWING,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,NC_POWERSWING,50;
	]]
},
[4689] = {
	AegisName = "V_B_Seyren_Card",
	Name = "True Seyren Windsor Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,RK_SONICWAVE,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,RK_SONICWAVE,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,RK_SONICWAVE,50;
	]]
},
[4690] = {
	AegisName = "V_B_Randel_Card",
	Name = "True Randel Lawrence Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,LG_BANISHINGPOINT,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,LG_BANISHINGPOINT,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,LG_BANISHINGPOINT,50;
	]]
},
[4691] = {
	AegisName = "V_B_Flamel_Card",
	Name = "True Flamel Emure Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,GN_CARTCANNON,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,GN_CARTCANNON,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,GN_CARTCANNON,50;
	]]
},
[4692] = {
	AegisName = "V_B_Celia_Card",
	Name = "True Celia Alde Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,SO_CLOUD_KILL,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,SO_CLOUD_KILL,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,SO_CLOUDKILL,50;
	]]
},
[4693] = {
	AegisName = "V_B_Chen_Card",
	Name = "True Chen Liu Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,SR_DRAGONCOMBO,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,SR_DRAGONCOMBO,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,SR_DRAGONCOMBO,50;
	]]
},
[4694] = {
	AegisName = "V_B_Gertie_Card",
	Name = "True Gertie Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,SC_FEINTBOMB,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,SC_FEINTBOMB,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,SC_FEINTBOMB,50;
	]]
},
[4695] = {
	AegisName = "V_B_Trentini_Card",
	Name = "True Trentini Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk,WM_METALICSOUND,50;
		if (getequipweaponlv(EQI_HAND_R) == 4) bonus2 bSkillAtk,WM_METALICSOUND,50;
		if (getrefine() >= 10) bonus2 bSkillAtk,WM_METALICSOUND,50;
	]]
},
[4696] = {
	AegisName = "V_B_Alphoccio_Card",
	Name = "True Alphoccio Card",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = "EQP_WEAPON",
	Script = [[
		bonus2 bSkillAtk, WM_REVERBERATION_MELEE, 50;
		bonus2 bSkillAtk, WM_REVERBERATION_MAGIC, 50;
		if (getequipweaponlv(EQI_HAND_R) == 4) {
			bonus2 bSkillAtk, WM_REVERBERATION_MELEE, 50;
			bonus2 bSkillAtk, WM_REVERBERATION_MAGIC, 50;
		}
		if (getrefine() >= 10) {
			bonus2 bSkillAtk, WM_REVERBERATION_MELEE, 50;
			bonus2 bSkillAtk, WM_REVERBERATION_MAGIC, 50;
		}
	]]
},

--== Armor Enchant System ==================================
[4700] = {
	AegisName = "Strength1",
	Name = "STR,+1",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,1; ]]
},
[4701] = {
	AegisName = "Strength2",
	Name = "STR,+2",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,2; ]]
},
[4702] = {
	AegisName = "Strength3",
	Name = "STR,+3",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,3; ]]
},
[4703] = {
	AegisName = "Strength4",
	Name = "STR,+4",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,4; ]]
},
[4704] = {
	AegisName = "Strength5",
	Name = "STR,+5",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,5; ]]
},
[4705] = {
	AegisName = "Strength6",
	Name = "STR,+6",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,6; ]]
},
[4706] = {
	AegisName = "Strength7",
	Name = "STR,+7",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,7; ]]
},
[4707] = {
	AegisName = "Strength8",
	Name = "STR,+8",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,8; ]]
},
[4708] = {
	AegisName = "Strength9",
	Name = "STR,+9",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,9; ]]
},
[4709] = {
	AegisName = "Strength10",
	Name = "STR,+10",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,10; ]]
},
[4710] = {
	AegisName = "Inteligence1",
	Name = "INT,+1",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,1; ]]
},
[4711] = {
	AegisName = "Inteligence2",
	Name = "INT,+2",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,2; ]]
},
[4712] = {
	AegisName = "Inteligence3",
	Name = "INT,+3",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,3; ]]
},
[4713] = {
	AegisName = "Inteligence4",
	Name = "INT,+4",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,4; ]]
},
[4714] = {
	AegisName = "Inteligence5",
	Name = "INT,+5",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,5; ]]
},
[4715] = {
	AegisName = "Inteligence6",
	Name = "INT,+6",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,6; ]]
},
[4716] = {
	AegisName = "Inteligence7",
	Name = "INT,+7",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,7; ]]
},
[4717] = {
	AegisName = "Inteligence8",
	Name = "INT,+8",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,8; ]]
},
[4718] = {
	AegisName = "Inteligence9",
	Name = "INT,+9",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,9; ]]
},
[4719] = {
	AegisName = "Inteligence10",
	Name = "INT,+10",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,10; ]]
},
[4720] = {
	AegisName = "Dexterity1",
	Name = "DEX,+1",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,1; ]]
},
[4721] = {
	AegisName = "Dexterity2",
	Name = "DEX,+2",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,2; ]]
},
[4722] = {
	AegisName = "Dexterity3",
	Name = "DEX,+3",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,3; ]]
},
[4723] = {
	AegisName = "Dexterity4",
	Name = "DEX,+4",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,4; ]]
},
[4724] = {
	AegisName = "Dexterity5",
	Name = "DEX,+5",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,5; ]]
},
[4725] = {
	AegisName = "Dexterity6",
	Name = "DEX,+6",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,6; ]]
},
[4726] = {
	AegisName = "Dexterity7",
	Name = "DEX,+7",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,7; ]]
},
[4727] = {
	AegisName = "Dexterity8",
	Name = "DEX,+8",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,8; ]]
},
[4728] = {
	AegisName = "Dexterity9",
	Name = "DEX,+9",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,9; ]]
},
[4729] = {
	AegisName = "Dexterity10",
	Name = "DEX,+10",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,10; ]]
},
[4730] = {
	AegisName = "Agility1",
	Name = "AGI,+1",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,1; ]]
},
[4731] = {
	AegisName = "Agility2",
	Name = "AGI,+2",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,2; ]]
},
[4732] = {
	AegisName = "Agility3",
	Name = "AGI,+3",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,3; ]]
},
[4733] = {
	AegisName = "Agility4",
	Name = "AGI,+4",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,4; ]]
},
[4734] = {
	AegisName = "Agility5",
	Name = "AGI,+5",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,5; ]]
},
[4735] = {
	AegisName = "Agility6",
	Name = "AGI,+6",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,6; ]]
},
[4736] = {
	AegisName = "Agility7",
	Name = "AGI,+7",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,7; ]]
},
[4737] = {
	AegisName = "Agility8",
	Name = "AGI,+8",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,8; ]]
},
[4738] = {
	AegisName = "Agility9",
	Name = "AGI,+9",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,9; ]]
},
[4739] = {
	AegisName = "Agility10",
	Name = "AGI,+10",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,10; ]]
},
[4740] = {
	AegisName = "Vitality1",
	Name = "VIT,+1",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,1; ]]
},
[4741] = {
	AegisName = "Vitality2",
	Name = "VIT,+2",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,2; ]]
},
[4742] = {
	AegisName = "Vitality3",
	Name = "VIT,+3",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,3; ]]
},
[4743] = {
	AegisName = "Vitality4",
	Name = "VIT,+4",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,4; ]]
},
[4744] = {
	AegisName = "Vitality5",
	Name = "VIT,+5",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,5; ]]
},
[4745] = {
	AegisName = "Vitality6",
	Name = "VIT,+6",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,6; ]]
},
[4746] = {
	AegisName = "Vitality7",
	Name = "VIT,+7",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,7; ]]
},
[4747] = {
	AegisName = "Vitality8",
	Name = "VIT,+8",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,8; ]]
},
[4748] = {
	AegisName = "Vitality9",
	Name = "VIT,+9",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,9; ]]
},
[4749] = {
	AegisName = "Vitality10",
	Name = "VIT,+10",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,10; ]]
},
[4750] = {
	AegisName = "Luck1",
	Name = "LUK,+1",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,1; ]]
},
[4751] = {
	AegisName = "Luck2",
	Name = "LUK,+2",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,2; ]]
},
[4752] = {
	AegisName = "Luck3",
	Name = "LUK,+3",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,3; ]]
},
[4753] = {
	AegisName = "Luck4",
	Name = "LUK,+4",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,4; ]]
},
[4754] = {
	AegisName = "Luck5",
	Name = "LUK,+5",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,5; ]]
},
[4755] = {
	AegisName = "Luck6",
	Name = "LUK,+6",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,6; ]]
},
[4756] = {
	AegisName = "Luck7",
	Name = "LUK,+7",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,7; ]]
},
[4757] = {
	AegisName = "Luck8",
	Name = "LUK,+8",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,8; ]]
},
[4758] = {
	AegisName = "Luck9",
	Name = "LUK,+9",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,9; ]]
},
[4759] = {
	AegisName = "Luck10",
	Name = "LUK,+10",
	Type = "IT_TYPE_CARD",
	Buy = 20,
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,10; ]]
},
[4760] = {
	AegisName = "Matk1",
	Name = "MATK,+1%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatkRate,1;
		bonus bFixedCastrate,-1;
	]]
},
[4761] = {
	AegisName = "Matk2",
	Name = "MATK,+2%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatkRate,2;
		bonus bFixedCastrate,-1;
	]]
},
[4762] = {
	AegisName = "Evasion6",
	Name = "FLEE,+6",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee,6; ]]
},
[4763] = {
	AegisName = "Evasion12",
	Name = "FLEE,+12",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee,12; ]]
},
[4764] = {
	AegisName = "Critical5",
	Name = "CRI,+5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical,5; ]]
},
[4765] = {
	AegisName = "Critical7",
	Name = "CRI,+7",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical,7; ]]
},
[4766] = {
	AegisName = "Atk2",
	Name = "ATK,+2%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate,2; ]]
},
[4767] = {
	AegisName = "Atk3",
	Name = "ATK,+3%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate,3; ]]
},
[4768] = {
	AegisName = "Str1_J",
	Name = "Str1 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,1; ]]
},
[4769] = {
	AegisName = "Str2_J",
	Name = "Str2 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,2; ]]
},
[4770] = {
	AegisName = "Str3_J",
	Name = "Str3 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bStr,3; ]]
},
[4771] = {
	AegisName = "Int1_J",
	Name = "Int1 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,1; ]]
},
[4772] = {
	AegisName = "Int2_J",
	Name = "Int2 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,2; ]]
},
[4773] = {
	AegisName = "Int3_J",
	Name = "Int3 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bInt,3; ]]
},
[4774] = {
	AegisName = "Vit1_J",
	Name = "Vit1 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,1; ]]
},
[4775] = {
	AegisName = "Vit2_J",
	Name = "Vit2 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,2; ]]
},
[4776] = {
	AegisName = "Vit3_J",
	Name = "Vit3 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVit,3; ]]
},
[4777] = {
	AegisName = "Agi1_J",
	Name = "Agi1 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,1; ]]
},
[4778] = {
	AegisName = "Agi2_J",
	Name = "Agi2 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,2; ]]
},
[4779] = {
	AegisName = "Agi3_J",
	Name = "Agi3 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAgi,3; ]]
},
[4780] = {
	AegisName = "Dex1_J",
	Name = "Dex1 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,1; ]]
},
[4781] = {
	AegisName = "Dex2_J",
	Name = "Dex2 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,2; ]]
},
[4782] = {
	AegisName = "Dex3_J",
	Name = "Dex3 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDex,3; ]]
},
[4783] = {
	AegisName = "Luk1_J",
	Name = "Luk1 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,1; ]]
},
[4784] = {
	AegisName = "Luk2_J",
	Name = "Luk2 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,2; ]]
},
[4785] = {
	AegisName = "Luk3_J",
	Name = "Luk3 J",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLuk,3; ]]
},
[4786] = {
	AegisName = "Mdef2",
	Name = "MDEF,+2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef,2; ]]
},
[4787] = {
	AegisName = "Mdef4",
	Name = "MDEF,+4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef,4; ]]
},
[4788] = {
	AegisName = "Mdef6",
	Name = "MDEF,+6",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef,6; ]]
},
[4789] = {
	AegisName = "Mdef8",
	Name = "MDEF,+8",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef,8; ]]
},
[4790] = {
	AegisName = "Mdef10",
	Name = "MDEF,+10",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef,10; ]]
},
[4791] = {
	AegisName = "Def3",
	Name = "DEF,+3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef,3; ]]
},
[4792] = {
	AegisName = "Def6",
	Name = "DEF,+6",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef,6; ]]
},
[4793] = {
	AegisName = "Def9",
	Name = "DEF,+9",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef,9; ]]
},
[4794] = {
	AegisName = "Def12",
	Name = "DEF,+12",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef,12; ]]
},
[4795] = {
	AegisName = "HP100",
	Name = "HP,+100",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP,100; ]]
},
[4796] = {
	AegisName = "HP200",
	Name = "HP,+200",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP,200; ]]
},
[4797] = {
	AegisName = "HP300",
	Name = "HP,+300",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP,300; ]]
},
[4798] = {
	AegisName = "HP400",
	Name = "HP,+400",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP,400; ]]
},
[4799] = {
	AegisName = "HP500",
	Name = "HP,+500",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP,500; ]]
},
[4800] = {
	AegisName = "SP50",
	Name = "SP,+50",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSP,50; ]]
},
[4801] = {
	AegisName = "SP100",
	Name = "SP,+100",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSP,100; ]]
},
[4802] = {
	AegisName = "SP150",
	Name = "SP,+150",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSP,150; ]]
},
[4803] = {
	AegisName = "Highness_Heal_3sec",
	Name = "Cure1Lv.",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSkillCooldown,AB_HIGHNESSHEAL,-3000; ]]
},
[4804] = {
	AegisName = "Coluceo_Heal30",
	Name = "Catholic1Lv.",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSkillUseSP,AB_CHEAL,30; ]]
},
[4805] = {
	AegisName = "Heal_Amount2",
	Name = "Archbishop1Lv.",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bHealPower,3; ]]
},
[4806] = {
	AegisName = "Matk3",
	Name = "MATK,+3%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatkRate,3;
		bonus bFixedCastrate,-1;
	]]
},
[4807] = {
	AegisName = "Atk_Speed1",
	Name = "Atk Speed1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspd,1; ]]
},
[4808] = {
	AegisName = "Fighting_Spirit4",
	Name = "Fighting Spirit4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,15;
		bonus bHit,5;
	]]
},
[4809] = {
	AegisName = "Fighting_Spirit3",
	Name = "Fighting Spirit3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,12;
		bonus bHit,4;
	]]
},
[4810] = {
	AegisName = "Fighting_Spirit2",
	Name = "Fighting Spirit2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,9;
		bonus bHit,3;
	]]
},
[4811] = {
	AegisName = "Fighting_Spirit1",
	Name = "Fighting Spirit1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,6;
		bonus bHit,2;
	]]
},
[4812] = {
	AegisName = "Spell4",
	Name = "Spell4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,15;
		bonus bVariableCastrate,-10;
	]]
},
[4813] = {
	AegisName = "Spell3",
	Name = "Spell3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,12;
		bonus bVariableCastrate,-8;
	]]
},
[4814] = {
	AegisName = "Spell2",
	Name = "Spell2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,9;
		bonus bVariableCastrate,-6;
	]]
},
[4815] = {
	AegisName = "Spell1",
	Name = "Spell1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,6;
		bonus bVariableCastrate,-4;
	]]
},
[4816] = {
	AegisName = "Sharp3",
	Name = "Sharp3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritical,12;
		bonus bHit,4;
	]]
},
[4817] = {
	AegisName = "Sharp2",
	Name = "Sharp2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritical,9;
		bonus bHit,3;
	]]
},
[4818] = {
	AegisName = "Sharp1",
	Name = "Sharp1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritical,6;
		bonus bHit,2;
	]]
},
[4819] = {
	AegisName = "Atk1",
	Name = "Atk1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate,1; ]]
},
[4820] = {
	AegisName = "Fighting_Spirit5",
	Name = "Fighting Spirit5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,18;
		bonus bHit,5;
	]]
},
[4821] = {
	AegisName = "Fighting_Spirit6",
	Name = "Fighting Spirit6",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,21;
		bonus bHit,5;
	]]
},
[4822] = {
	AegisName = "Fighting_Spirit7",
	Name = "Fighting Spirit7",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,24;
		bonus bHit,5;
	]]
},
[4823] = {
	AegisName = "Fighting_Spirit8",
	Name = "Fighting Spirit8",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,27;
		bonus bHit,5;
	]]
},
[4824] = {
	AegisName = "Fighting_Spirit9",
	Name = "Fighting Spirit9",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,30;
		bonus bHit,5;
	]]
},
[4825] = {
	AegisName = "Fighting_Spirit10",
	Name = "Fighting Spirit10",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,50;
		bonus bHit,15;
	]]
},
[4826] = {
	AegisName = "Spell5",
	Name = "Spell5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,18;
		bonus bVariableCastrate,-10;
	]]
},
[4827] = {
	AegisName = "Spell6",
	Name = "Spell6",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,21;
		bonus bVariableCastrate,-10;
	]]
},
[4828] = {
	AegisName = "Spell7",
	Name = "Spell7",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,24;
		bonus bVariableCastrate,-10;
	]]
},
[4829] = {
	AegisName = "Spell8",
	Name = "Spell8",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,27;
		bonus bVariableCastrate,-10;
	]]
},
[4830] = {
	AegisName = "Spell9",
	Name = "Spell9",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,30;
		bonus bVariableCastrate,-10;
	]]
},
[4831] = {
	AegisName = "Spell10",
	Name = "Spell10",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk,50;
		bonus bVariableCastrate,-20;
	]]
},
[4832] = {
	AegisName = "Expert_Archer1",
	Name = "Expert Archer1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,2; ]]
},
[4833] = {
	AegisName = "Expert_Archer2",
	Name = "Expert Archer2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,4; ]]
},
[4834] = {
	AegisName = "Expert_Archer3",
	Name = "Expert Archer3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,6; ]]
},
[4835] = {
	AegisName = "Expert_Archer4",
	Name = "Expert Archer4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,8; ]]
},
[4836] = {
	AegisName = "Expert_Archer5",
	Name = "Expert Archer5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,10; ]]
},
[4837] = {
	AegisName = "Expert_Archer6",
	Name = "Expert Archer6",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,12; ]]
},
[4838] = {
	AegisName = "Expert_Archer7",
	Name = "Expert Archer7",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,14; ]]
},
[4839] = {
	AegisName = "Expert_Archer8",
	Name = "Expert Archer8",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,16; ]]
},
[4840] = {
	AegisName = "Expert_Archer9",
	Name = "Expert Archer9",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate,18; ]]
},
[4841] = {
	AegisName = "Expert_Archer10",
	Name = "Expert Archer10",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bLongAtkRate,20;
		bonus bAspd,1;
	]]
},
[4842] = {
	AegisName = "Atk_Speed2",
	Name = "Atk Speed2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspd,2; ]]
},
[4843] = {
	AegisName = "Sharp4",
	Name = "Sharp4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritical,14;
		bonus bHit,5;
	]]
},
[4844] = {
	AegisName = "Sharp5",
	Name = "Sharp5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritical,15;
		bonus bHit,6;
	]]
},
[4845] = {
	AegisName = "Sea_Energy",
	Name = "Strength Of Ocean",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
},
[4846] = {
	AegisName = "2011Valentin_Angel",
	Name = "Fully Loved Stone",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,10;
		bonus bMatk,10;
	]]
},
[4847] = {
	AegisName = "2011Valentin_Devil",
	Name = "Spelled Stone",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk,10;
		bonus bMatk,10;
	]]
},
[4848] = {
	AegisName = "Immuned1",
	Name = "Immune Level 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSubEle,Ele_Neutral,5; ]]
},
[4849] = {
	AegisName = "Cranial1",
	Name = "Cranial Level 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,5; ]]
},
[4850] = {
	AegisName = "Heal_Amount3",
	Name = "Heal Amount3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bHealPower,6;
		bonus bUseSPrate,5;
	]]
},
[4851] = {
	AegisName = "Heal_Amount4",
	Name = "Heal Amount4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bHealPower,12;
		bonus bUseSPrate,10;
	]]
},
[4852] = {
	AegisName = "Heal_Amount5",
	Name = "Heal Amount5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bHealPower,20;
		bonus bUseSPrate,15;
	]]
},
[4853] = {
	AegisName = "S_Str",
	Name = "Special Str",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bStr,1;
		if (getrefine() >= 8) {
			bonus bStr,3;
		}
		if (getrefine() >= 9) {
			bonus2 bAddRace, RC_All, 1;
		}
		if (getrefine() >= 12) {
			bonus bAspd,1;
			bonus bFixedCastrate,-7;
		}
	]]
},
[4854] = {
	AegisName = "S_Agi",
	Name = "Special Agi",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bAgi,1;
		if (getrefine() >= 8) {
			bonus bAgi,3;
		}
		if (getrefine() >= 9) {
			bonus2 bAddRace, RC_All, 1;
		}
		if (getrefine() >= 12) {
			bonus bAspd,1;
			bonus bFixedCastrate,-7;
		}
	]]
},
[4855] = {
	AegisName = "S_Vital",
	Name = "Special Vit",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bVit,1;
		if (getrefine() >= 8) {
			bonus bVit,3;
		}
		if (getrefine() >= 9) {
			bonus bMaxSPrate,1;
		}
		if (getrefine() >= 12) {
			bonus bAspd,1;
			bonus bFixedCastrate,-7;
		}
	]]
},
[4856] = {
	AegisName = "S_Int",
	Name = "Special Int",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bInt,1;
		if (getrefine() >= 8) {
			bonus bInt,3;
		}
		if (getrefine() >= 9) {
			bonus bMatkRate,1;
		}
		if (getrefine() >= 12) {
			bonus bAspd,1;
			bonus bFixedCastrate,-7;
		}
	]]
},
[4857] = {
	AegisName = "S_Dex",
	Name = "Special Dex",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bDex,1;
		if (getrefine() >= 8) {
			bonus bDex,3;
		}
		if (getrefine() >= 9) {
			bonus bMatkRate,1;
		}
		if (getrefine() >= 12) {
			bonus bAspd,1;
			bonus bFixedCastrate,-7;
		}
	]]
},
[4858] = {
	AegisName = "S_Luck",
	Name = "Special Luk",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bLuk,1;
		if (getrefine() >= 8) {
			bonus bLuk,3;
		}
		if (getrefine() >= 9) {
			bonus bMaxHPrate,1;
		}
		if (getrefine() >= 12) {
			bonus bAspd,1;
			bonus bFixedCastrate,-7;
		}
	]]
},
[4859] = {
	AegisName = "Evasion1",
	Name = "Evasion1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee,1; ]]
},
[4860] = {
	AegisName = "Evasion3",
	Name = "Evasion3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee,3; ]]
},
[4861] = {
	AegisName = "MHP1",
	Name = "MHP,+1%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHPrate,1; ]]
},
[4862] = {
	AegisName = "MHP2",
	Name = "MHP,+2%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHPrate,2; ]]
},
[4863] = {
	AegisName = "Fatal1",
	Name = "Fatal1Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritAtkRate, 4;
		bonus bCritical, 1;
	]]
},
[4864] = {
	AegisName = "Fatal2",
	Name = "Fatal2Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritAtkRate, 6;
		bonus bCritical, 2;
	]]
},
[4865] = {
	AegisName = "Fatal3",
	Name = "Fatal3Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritAtkRate, 8;
		bonus bCritical, 3;
	]]
},
[4866] = {
	AegisName = "Fatal4",
	Name = "Fatal4Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bCritAtkRate, 10;
		bonus bCritical, 4;
	]]
},
[4867] = {
	AegisName = "MHP3",
	Name = "MHP,+3%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHPrate,3; ]]
},
[4868] = {
	AegisName = "MHP4",
	Name = "MHP,+4%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHPrate,4; ]]
},
[4869] = {
	AegisName = "Attack_Delay_1",
	Name = "DelayafterAttack1Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspdRate, 4; ]]
},
[4870] = {
	AegisName = "SP25",
	Name = "SP,+25",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSP,25; ]]
},
[4871] = {
	AegisName = "SP75",
	Name = "SP,+75",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSP,75; ]]
},
[4872] = {
	AegisName = "Attack_Delay_2",
	Name = "DelayafterAttack2Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspdRate, 6; ]]
},
[4873] = {
	AegisName = "Attack_Delay_3",
	Name = "DelayafterAttack3Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspdRate, 8; ]]
},
[4875] = {
	AegisName = "Bears_Power",
	Name = "Strength of Bear",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ autobonus2 "{ bonus bStr, 200; bonus2 bHPLossRate, 500, 1000; montransform BIGFOOT, 5000; }", 20, 5000, BF_WEAPON, "{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); showscript \"?!!!!\"; }";s]],
	OnUnequipScript = [[ heal 0, -300; ]]
},
[4876] = {
	AegisName = "Runaway_Magic",
	Name = "Runaway Magic",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ autobonus "{ bonus bInt, 200; bonus2 bSPLossRate, 200, 1000; }", 15, 10000, BF_MAGIC, "{ specialeffect(EF_POTION_BERSERK, AREA, playerattached()); showscript \"YOooooooo!!!!!\"; }";s]],
	OnUnequipScript = [[ heal 0, -2000; ]]
},
[4877] = {
	AegisName = "Speed_Of_Light",
	Name = "Speed Of Light",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ autobonus "{ bonus bAspdRate, 100; bonus bFlee2, 100; bonus2 bHPLossRate, 400, 1000; bonus2 bSPLossRate, 40, 1000; }", 10, 5000, BF_WEAPON, "{ specialeffect(EF_FLASHER, AREA, playerattached()); }";s]],
	OnUnequipScript = [[ heal 0, -300; ]]
},
[4878] = {
	AegisName = "Muscle_Fool",
	Name = "Muscle Fool",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ autobonus2 "{ bonus bDef, 1000; bonus bMatkRate, -50; bonus bAtkRate, -50; }", 20, 5000, BF_WEAPON, "{ specialeffect(EF_MAGNUMBREAK, AREA, playerattached()); }";s]],
	OnUnequipScript = [[ heal 0, -300; ]]
},
[4879] = {
	AegisName = "Hawkeye",
	Name = "Hawkeye",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ autobonus "{ bonus bDex, 200; bonus2 bSPLossRate, 50, 1000; }", 30, 5000, BF_WEAPON, "{ specialeffect(EF_FLASHER, AREA, playerattached()); }";s]],
	OnUnequipScript = [[ heal 0, -300; ]]
},
[4880] = {
	AegisName = "Lucky_Day",
	Name = "Lucky Day",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		autobonus "{ bonus2 bAddMonsterDropItem, Treasure_Box, 10; bonus bLuk, 200; }", 15, 5000, BF_WEAPON | BF_MAGIC, "{ specialeffect(EF_MVP, AREA, playerattached()); }";
		autobonus2 "{ bonus2 bAddMonsterDropItem, Treasure_Box, 1; bonus bLuk, 200; }", 1, 5000, BF_WEAPON | BF_MAGIC, "{ specialeffect(EF_MVP, AREA, playerattached()); }";
	]],
	OnUnequipScript = [[ heal 0, -300; ]]
},
[4881] = {
	AegisName = "Attack_Delay_4",
	Name = "DelayafterAttack4Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspdRate, 10; ]]
},
[4882] = {
	AegisName = "Atk1p",
	Name = "ATK ,+ 1%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 1; ]]
},
[4883] = {
	AegisName = "Matk1p",
	Name = "MATK ,+ 1%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 1; ]]
},
[4884] = {
	AegisName = "HIT1",
	Name = "HIT ,+ 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bHit, 1; ]]
},
[4885] = {
	AegisName = "Conjure1",
	Name = "Spell 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk, 5;
		bonus bVariableCastrate, -3;
	]]
},
[4886] = {
	AegisName = "Conjure2",
	Name = "Spell 2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk, 10;
		bonus bVariableCastrate, -3;
	]]
},
[4887] = {
	AegisName = "Conjure3",
	Name = "Spell 3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk, 15;
		bonus bVariableCastrate, -3;
	]]
},
[4888] = {
	AegisName = "Conjure4",
	Name = "Spell 4",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk, 20;
		bonus bVariableCastrate, -3;
	]]
},
[4889] = {
	AegisName = "Conjure5",
	Name = "Spell 5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bMatk, 30;
		bonus bVariableCastrate, -5;
	]]
},
[4890] = {
	AegisName = "Mdef1",
	Name = "MDEF,+1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef, 1; ]]
},
[4891] = {
	AegisName = "Mdef3",
	Name = "MDEF,+3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef, 3; ]]
},
[4892] = {
	AegisName = "Mdef5",
	Name = "MDEF,+5",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMdef, 5; ]]
},
[4893] = {
	AegisName = "Def15",
	Name = "DEF,+15",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef, 15; ]]
},
[4894] = {
	AegisName = "Atk4p",
	Name = "ATK ,+ 4%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 4; ]]
},
[4895] = {
	AegisName = "Atk5p",
	Name = "ATK ,+ 5%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 5; ]]
},
[4896] = {
	AegisName = "Matk2p",
	Name = "MATK ,+ 2%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 2; ]]
},
[4897] = {
	AegisName = "Matk3p",
	Name = "MATK ,+ 3%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 3; ]]
},
[4898] = {
	AegisName = "Matk4p",
	Name = "MATK ,+ 4%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 4; ]]
},
[4899] = {
	AegisName = "Matk5p",
	Name = "MATK ,+ 5%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 5; ]]
},
[4900] = {
	AegisName = "MHP5",
	Name = "MHP,+5%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHPrate, 5; ]]
},
[4902] = {
	AegisName = "Def18",
	Name = "DEF,+18",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef, 18; ]]
},
[4903] = {
	AegisName = "Def21",
	Name = "DEF,+21",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef, 21; ]]
},
[4904] = {
	AegisName = "Atk6p",
	Name = "ATK,+6%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 6; ]]
},
[4905] = {
	AegisName = "Atk7p",
	Name = "ATK,+7%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 7; ]]
},
[4906] = {
	AegisName = "Matk6p",
	Name = "MATK,+6%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 6; ]]
},
[4907] = {
	AegisName = "Matk7p",
	Name = "MATK,+7%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 7; ]]
},
[4908] = {
	AegisName = "Force1",
	Name = "Essence Of Evil STR 1",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bStr, 1;
		bonus bBaseAtk, 3;
		bonus bInt, -1;
	]]
},
[4909] = {
	AegisName = "Force2",
	Name = "Essence Of Evil STR 2",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bStr, 2;
		bonus bBaseAtk, 6;
		bonus bInt, -2;
	]]
},
[4910] = {
	AegisName = "Force3",
	Name = "Essence Of Evil STR 3",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bStr, 4;
		bonus bBaseAtk, 12;
		bonus bInt, -4;
	]]
},
[4911] = {
	AegisName = "Intellect1",
	Name = "Essence Of Evil INT 1",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bInt, 1;
		bonus bMatk, 3;
		bonus bStr, -1;
	]]
},
[4912] = {
	AegisName = "Intellect2",
	Name = "Essence Of Evil INT 2",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bInt, 2;
		bonus bMatk, 6;
		bonus bStr, -2;
	]]
},
[4913] = {
	AegisName = "Intellect3",
	Name = "Essence Of Evil INT 3",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bInt, 4;
		bonus bMatk, 12;
		bonus bStr, -4;
	]]
},
[4914] = {
	AegisName = "Swiftness1",
	Name = "Essence Of Evil AGI 1",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bAgi, 1;
		bonus bFlee, 2;
		bonus bVit, -1;
	]]
},
[4915] = {
	AegisName = "Swiftness2",
	Name = "Essence Of Evil AGI 2",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bAgi, 2;
		bonus bFlee, 4;
		bonus bVit, -2;
	]]
},
[4916] = {
	AegisName = "Swiftness3",
	Name = "Essence Of Evil AGI 3",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bAgi, 4;
		bonus bFlee, 8;
		bonus bVit, -4;
	]]
},
[4917] = {
	AegisName = "Tough1",
	Name = "Essence Of Evil VIT 1",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bVit, 1;
		bonus bDef, 3;
		bonus bMdef, 2;
		bonus bAgi, -1;
	]]
},
[4918] = {
	AegisName = "Tough2",
	Name = "Essence Of Evil VIT 2",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bVit, 2;
		bonus bDef, 6;
		bonus bMdef, 4;
		bonus bAgi, -2;
	]]
},
[4919] = {
	AegisName = "Tough3",
	Name = "Essence Of Evil VIT 3",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bVit, 4;
		bonus bDef, 12;
		bonus bMdef, 8;
		bonus bAgi, -4;
	]]
},
[4920] = {
	AegisName = "Artful1",
	Name = "Essence Of Evil DEX 1",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bDex, 1;
		bonus bHit, 2;
		bonus bLuk, -1;
	]]
},
[4921] = {
	AegisName = "Artful2",
	Name = "Essence Of Evil DEX 2",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bDex, 2;
		bonus bHit, 4;
		bonus bLuk, -2;
	]]
},
[4922] = {
	AegisName = "Artful3",
	Name = "Essence Of Evil DEX 3",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bDex, 4;
		bonus bHit, 8;
		bonus bLuk, -4;
	]]
},
[4923] = {
	AegisName = "Fortune1",
	Name = "Essence Of Evil LUK 1",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bLuk, 1;
		bonus bCritical, 1;
		bonus bDex, -1;
	]]
},
[4924] = {
	AegisName = "Fortune2",
	Name = "Essence Of Evil LUK 2",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bLuk, 2;
		bonus bCritical, 2;
		bonus bDex, -2;
	]]
},
[4925] = {
	AegisName = "Fortune3",
	Name = "Essence Of Evil LUK 3",
	Type = "IT_TYPE_CARD",
	Weight = 10,
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bLuk, 4;
		bonus bCritical, 4;
		bonus bDex, -4;
	]]
},
[4926] = {
	AegisName = "Critical1",
	Name = "Critical1Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical, 1; ]]
},
[4927] = {
	AegisName = "HP50",
	Name = "HP,+50",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP, 50; ]]
},
[4928] = {
	AegisName = "SP10",
	Name = "SP,+10",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSP, 10; ]]
},
[4929] = {
	AegisName = "MSP1",
	Name = "MSP,+1%",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSPrate, 1; ]]
},
[4930] = {
	AegisName = "HEAL2",
	Name = "Increase Recovery",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bHPrecovRate, 2; ]]
},
[4931] = {
	AegisName = "HEALHP1",
	Name = "Healing 10",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bHPRegenRate, 10, 10000; ]]
},
[4932] = {
	AegisName = "HEALSP1",
	Name = "SP Recovery 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bSPGainValue, 1; ]]
},
[4933] = {
	AegisName = "Tolerance_Not1",
	Name = "Neutral Properties Lv1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSubEle, Ele_Neutral, 1; ]]
},
[4934] = {
	AegisName = "Tolerance_Not2",
	Name = "Neutral Properties Lv2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSubEle, Ele_Neutral, 2; ]]
},
[4935] = {
	AegisName = "Tolerance_Not3",
	Name = "Neutral Properties Lv3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSubEle, Ele_Neutral, 3; ]]
},
[4936] = {
	AegisName = "ATK_BIG1",
	Name = "Large Attack 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bAddSize, Size_Large, 1; ]]
},
[4937] = {
	AegisName = "ATK_MEDIUM1",
	Name = "Medium Attack 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bAddSize, Size_Medium, 1; ]]
},
[4938] = {
	AegisName = "ATK_SMALL1",
	Name = "Small Attack 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bAddSize, Size_Small, 1; ]]
},
[4939] = {
	AegisName = "Critical2",
	Name = "Critical2Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical, 2; ]]
},
[4940] = {
	AegisName = "Critical3",
	Name = "Critical3Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical, 4; ]]
},
[4941] = {
	AegisName = "Critical4",
	Name = "Critical4Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical, 6; ]]
},
[4942] = {
	AegisName = "Dodge1",
	Name = "Critical Lv1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bCritical, 3; ]]
},
[4943] = {
	AegisName = "Dodge2",
	Name = "Shedding2Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee2, 4; ]]
},
[4944] = {
	AegisName = "Dodge3",
	Name = "Shedding3Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee2, 5; ]]
},
[4945] = {
	AegisName = "Thrift1",
	Name = "Saving Lv1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bUseSPrate, -2; ]]
},
[4946] = {
	AegisName = "Thrift2",
	Name = "Saving Lv2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bUseSPrate, -4; ]]
},
[4947] = {
	AegisName = "Thrift3",
	Name = "Saving Lv3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bUseSPrate, -6; ]]
},
[4948] = {
	AegisName = "Skill_Delay1",
	Name = "Delay After Skill Lv1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDelayrate, -2; ]]
},
[4949] = {
	AegisName = "Skill_Delay2",
	Name = "Delay After Skill Lv2",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDelayrate, -4; ]]
},
[4950] = {
	AegisName = "Skill_Delay3",
	Name = "Delay After Skill Lv3",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDelayrate, -6; ]]
},
[4951] = {
	AegisName = "Darkness_Drop",
	Name = "Darkness Drop",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus3 bAddEle, Ele_Dark, 2, BF_WEAPON | BF_MAGIC;
		bonus2 bSubEle, Ele_Dark, 1;
	]]
},
[4952] = {
	AegisName = "Fire_Drop",
	Name = "Fire Drop",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus3 bAddEle, Ele_Fire, 2, BF_WEAPON | BF_MAGIC;
		bonus2 bSubEle, Ele_Fire, 1;
	]]
},
[4953] = {
	AegisName = "Water_Drop",
	Name = "Water Drop",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus3 bAddEle, Ele_Water, 2, BF_WEAPON | BF_MAGIC;
		bonus2 bSubEle, Ele_Water, 1;
	]]
},
[4954] = {
	AegisName = "Earth_Drop",
	Name = "Earth Drop",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus3 bAddEle, Ele_Earth, 2, BF_WEAPON | BF_MAGIC;
		bonus2 bSubEle, Ele_Earth, 1;
	]]
},
[4955] = {
	AegisName = "Light_Drop",
	Name = "Light Drop",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus3 bAddEle, Ele_Holy, 2, BF_WEAPON | BF_MAGIC;
		bonus2 bSubEle, Ele_Holy, 1;
	]]
},
[4956] = {
	AegisName = "Recovery_Drop",
	Name = "Recovery Drop",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSkillHeal, AL_HEAL, 2;
		bonus2 bSkillHeal, PR_SANCTUARY, 2;
		bonus2 bSkillHeal, AM_POTIONPITCHER, 2;
		bonus2 bSkillHeal, AB_HIGHNESS_HEAL, 2;
		bonus2 bSkillHeal, AB_CHEAL, 2;
		bonus2 bSkillHeal2, AL_HEAL, 2;
		bonus2 bSkillHeal2, PR_SANCTUARY, 2;
		bonus2 bSkillHeal2, AM_POTIONPITCHER, 2;
		bonus2 bSkillHeal2, AB_HIGHNESS_HEAL, 2;
		bonus2 bSkillHeal2, AB_CHEAL, 2;
		bonus bAddItemHealRate, 2;
	]]
},
[4957] = {
	AegisName = "The_Power_Of_Famitsu",
	Name = "The Power Of Famitsu",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHP, 832; ]]
},
[4958] = {
	AegisName = "Double_Pediatric_Palace",
	Name = "Double Pediatric Palace",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDelayrate, -1; ]]
},
[4959] = {
	AegisName = "Sagittarius",
	Name = "Sagittarius",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bLongAtkRate, 1; ]]
},
[4960] = {
	AegisName = "Aquarius",
	Name = "Aquarius",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bUseSPrate, -2; ]]
},
[4961] = {
	AegisName = "Aries",
	Name = "Aries",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatk, 10; ]]
},
[4962] = {
	AegisName = "Cancer",
	Name = "Cancer",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bBaseAtk, 3; ]]
},
[4963] = {
	AegisName = "Taurus",
	Name = "Taurus",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus bBaseAtk, 3;
		bonus bHit, 1;
	]]
},
[4964] = {
	AegisName = "Capricorn",
	Name = "Capricorn",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatkRate, 3; ]]
},
[4965] = {
	AegisName = "Pisces",
	Name = "Pisces",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bVariableCastrate, -2; ]]
},
[4966] = {
	AegisName = "Scorpio",
	Name = "Scorpio",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
},
[4967] = {
	AegisName = "Leo",
	Name = "Leo",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAtkRate, 3; ]]
},
[4968] = {
	AegisName = "Virgo",
	Name = "Virgo",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSkillHeal, AL_HEAL, 1;
		bonus2 bSkillHeal, PR_SANCTUARY, 1;
		bonus2 bSkillHeal, AM_POTIONPITCHER, 1;
		bonus2 bSkillHeal, AB_HIGHNESS_HEAL, 1;
		bonus2 bSkillHeal, AB_CHEAL, 1;
	]]
},
[4969] = {
	AegisName = "Libra",
	Name = "Libra",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSkillHeal2, AL_HEAL, 1;
		bonus2 bSkillHeal2, PR_SANCTUARY, 1;
		bonus2 bSkillHeal2, AM_POTIONPITCHER, 1;
		bonus2 bSkillHeal2, AB_HIGHNESS_HEAL, 1;
		bonus2 bSkillHeal2, AB_CHEAL, 1;
		bonus bAddItemHealRate, 1;
	]]
},
[4970] = {
	AegisName = "Fire_Property_Reactor",
	Name = "Fire Property Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDefEle, Ele_Fire; ]]
},
[4971] = {
	AegisName = "Water_Property_Reactor",
	Name = "Water Property Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDefEle, Ele_Water; ]]
},
[4972] = {
	AegisName = "Earth_Property_Reactor",
	Name = "Earth Property Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDefEle, Ele_Earth; ]]
},
[4973] = {
	AegisName = "Wind_Property_Reactor",
	Name = "Wind Property Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDefEle, Ele_Wind; ]]
},
[4974] = {
	AegisName = "Fire_Resistance_Reactor",
	Name = "Fire Resistance Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSubEle, Ele_Fire, 25;
		bonus2 bSubEle, Ele_Water, -25;
	]]
},
[4975] = {
	AegisName = "Water_Resistance_Reactor",
	Name = "Water Resistance Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSubEle, Ele_Water, 25;
		bonus2 bSubEle, Ele_Wind, -25;
	]]
},
[4976] = {
	AegisName = "Earth_Resistance_Reactor",
	Name = "Earth Resistance Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSubEle, Ele_Earth, 25;
		bonus2 bSubEle, Ele_Fire, -25;
	]]
},
[4977] = {
	AegisName = "Wind_Resistance_Reactor",
	Name = "Wind Resistance Reactor",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		bonus2 bSubEle, Ele_Wind, 25;
		bonus2 bSubEle, Ele_Earth, -25;
	]]
},
[4978] = {
	AegisName = "Restoration_Reactor_101",
	Name = "Restoration Reactor 101",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bHPRegenRate, (getrefine() >= 7) ? 100 : 50, 5000; ]]
},
[4979] = {
	AegisName = "Restoration_Reactor_102",
	Name = "Restoration Reactor 102",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSPRegenRate, (getrefine() >= 7) ? 5 : 3, 500; ]]
},
[4980] = {
	AegisName = "Restoration_Reactor_201",
	Name = "Restoration Reactor 201",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bHPrecovRate, (getrefine() >= 7) ? 100 : 50; ]]
},
[4981] = {
	AegisName = "Restoration_Reactor_202",
	Name = "Restoration Reactor 202",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bSPrecovRate, (getrefine() >= 7) ? 100 : 50; ]]
},
[4982] = {
	AegisName = "Auxiliary_Reactor_STR",
	Name = "Auxiliary Reactor STR",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (readparam(bStr) >= 10) bonus bBaseAtk, 5;
		if (getrefine() >= 7) bonus bBaseAtk, 10;
	]]
},
[4983] = {
	AegisName = "Auxiliary_Reactor_INT",
	Name = "Auxiliary Reactor INT",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (readparam(bInt) >= 10) bonus bMatk, 5;
		if (getrefine() >= 7) bonus bMatk, 10;
	]]
},
[4984] = {
	AegisName = "Auxiliary_Reactor_DEF",
	Name = "Auxiliary Reactor DEF",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bDef, 100; ]]
},
[4985] = {
	AegisName = "Auxiliary_Reactor_Perfect",
	Name = "Auxiliary Reactor Perfect",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bFlee2, 3; ]]
},
[4986] = {
	AegisName = "Auxiliary_Reactor_Attack",
	Name = "Auxiliary Reactor Attack",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bBaseAtk, 20; ]]
},
[4987] = {
	AegisName = "Auxiliary_Reactor_Magic",
	Name = "Auxiliary Reactor Magic",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMatk, 20; ]]
},
[4988] = {
	AegisName = "Auxiliary_Reactor_MaxHP",
	Name = "Auxiliary Reactor MaxHP",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxHPrate, 5; ]]
},
[4989] = {
	AegisName = "Auxiliary_Reactor_MaxSP",
	Name = "Auxiliary_Reactor_MaxHP",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bMaxSPrate, 3; ]]
},
[4990] = {
	AegisName = "Auxiliary_Reactor_Frozen",
	Name = "Auxiliary Reactor Frozen",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bResEff, Eff_Freeze, 10000; ]]
},
[4991] = {
	AegisName = "Auxiliary_Reactor_ASPD",
	Name = "Auxiliary Reactor ASPD",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus bAspd, 1; ]]
},
[4992] = {
	AegisName = "HPdrain1",
	Name = "HP Absorb 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bHPDrainRate, 1, 1; ]]
},
[4993] = {
	AegisName = "SPdrain1",
	Name = "SP Absorb 1",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[ bonus2 bSPDrainRate, 1, 1; ]]
},
[4994] = {
	AegisName = "Rune_Of_Might1",
	Name = "Rune Of Might 1Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (getrefine() >= 7) bonus bStr, 5;
		if (getrefine() >= 10) bonus bAtkRate, 10;
	]]
},
[4995] = {
	AegisName = "Rune_Of_Might2",
	Name = "Rune Of Might 2Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (getrefine() >= 7) bonus bStr, 6;
		if (getrefine() >= 11) {
			bonus bStr, 1;
			bonus bAtkRate, 7;
		}
	]]
},
[4996] = {
	AegisName = "Rune_Of_Might3",
	Name = "Rune Of Might 3Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (getrefine() >= 7) bonus bStr, 7;
		if (getrefine() >= 12) {
			bonus bStr, 1;
			bonus bAtkRate, 8;
		}
		if (getrefine() >= 13) {
			bonus bStr, 1;
			bonus bAtkRate, 2;
		}
	]]
},
[4997] = {
	AegisName = "Rune_Of_Agility1",
	Name = "Rune Of Agility 1Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (getrefine() >= 7) bonus bAgi, 5;
		if (getrefine() >= 10) bonus bFlee2, 5;
	]]
},
[4998] = {
	AegisName = "Rune_Of_Agility2",
	Name = "Rune Of Agility 2Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (getrefine() >= 7) bonus bAgi, 6;
		if (getrefine() >= 11) {
			bonus bAgi, 1;
			bonus bFlee2, 7;
		}
	]]
},
[4999] = {
	AegisName = "Rune_Of_Agility3",
	Name = "Rune Of Agility 3Lv",
	Type = "IT_TYPE_CARD",
	Loc = { "EQP_HELM", "EQP_ARMS", "EQP_GARMENT", "EQP_ACC", "EQP_ARMOR", "EQP_SHOES" },
	Script = [[
		if (getrefine() >= 7) bonus bAgi, 7;
		if (getrefine() >= 12) {
			bonus bAgi, 1;
			bonus bFlee2, 5;
		}
		if (getrefine() >= 13) {
			bonus bAgi, 1;
			bonus bFlee2, 5;
		}
	]]
},

--== More Headgears ========================================
[5001] = {
	AegisName = "Headset",
	Name = "Headset",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 87,
	Script = [[ bonus2 bResEff,Eff_Curse,1000; ]]
},
[5002] = {
	AegisName = "Gemmed_Crown",
	Name = "Jewel Crown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 9,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 60,
	ViewSprite = 88,
	Script = [[
		bonus bInt,2;
		bonus bLuk,1;
		bonus bMdef,3;
	]]
},
[5003] = {
	AegisName = "Joker_Jester",
	Name = "Joker Jester",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 89,
	Script = [[
		bonus bLuk,2;
		bonus bMdef,5;
	]]
},
[5004] = {
	AegisName = "Oxygen_Mask",
	Name = "Oxygen Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 90,
	Script = [[ bonus2 bResEff,Eff_Poison,2000; ]]
},
[5005] = {
	AegisName = "Gas_Mask",
	Name = "Gas Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 91,
	Script = [[ bonus2 bResEff,Eff_Poison,3000; ]]
},
[5006] = {
	AegisName = "Machoman_Glasses",
	Name = "Machoman's Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 36000,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 92,
},
[5007] = {
	AegisName = "Loard_Circlet",
	Name = "Grand Circlet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 7,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 55,
	ViewSprite = 93,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
		bonus bLuk,1;
		bonus bMdef,4;
	]]
},
[5008] = {
	AegisName = "Puppy_Love",
	Name = "Puppy Love",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 94,
},
[5009] = {
	AegisName = "Safety_Helmet",
	Name = "Safety Helmet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 7,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 95,
	Script = [[
		bonus bMdef,3;
		bonus bUnbreakableHelm,0;
	]]
},
[5010] = {
	AegisName = "Indian_Hair_Piece",
	Name = "Indian Fillet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 96,
},
[5011] = {
	AegisName = "Antenna",
	Name = "Aerial",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 97,
},
[5012] = {
	AegisName = "Ph_D_Hat",
	Name = "Ph.D Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 98,
},
[5013] = {
	AegisName = "Horn_Of_Lord_Kaho",
	Name = "Lord Kaho's Horn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 30,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 99,
	Script = [[
		bonus bMdef,10;
		bonus bStr,5;
		bonus bAgi,10;
		bonus bVit,10;
		bonus bInt,5;
		bonus bLuk,20;
	]]
},
[5014] = {
	AegisName = "Fin_Helm",
	Name = "Fin Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = "EQP_HEAD_MID",
	EquipLv = 65,
	Refine = false,
	ViewSprite = 100,
},
[5015] = {
	AegisName = "Egg_Shell",
	Name = "Egg Shell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 6,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 101,
},
[5016] = {
	AegisName = "Boys_Cap",
	Name = "Boy's Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 102,
},
[5017] = {
	AegisName = "Bone_Helm",
	Name = "Bone Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 15,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 70,
	ViewSprite = 103,
	Script = [[ bonus2 bSubEle,Ele_Dark,-15; ]]
},
[5018] = {
	AegisName = "Feather_Bonnet",
	Name = "Feather Bonnet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 8,
	Job = {
		Archer = true,
		Hunter = true,
		Bard = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 104,
	Script = [[ bonus bAgi,1; ]]
},
[5019] = {
	AegisName = "Corsair",
	Name = "Corsair",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 11,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 105,
	Script = [[ bonus bVit,1; ]]
},
[5020] = {
	AegisName = "Kafra_Band",
	Name = "Kafra Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 106,
	Script = [[ bonus bMdef,3; ]]
},
[5021] = {
	AegisName = "Bankruptcy_Of_Heart",
	Name = "Grief for Greed",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1200,
	Def = 8,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 38,
	ViewSprite = 107,
	Script = [[
		bonus bInt,1;
		bonus bDex,1;
	]]
},
[5022] = {
	AegisName = "Helm_Of_Sun",
	Name = "Hat of the Sun God",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2400,
	Def = 4,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 138,
	Script = [[
		bonus bStr,3;
		bonus bInt,2;
	]]
},
[5023] = {
	AegisName = "Hat_Of_Bundle",
	Name = "Parcel Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Job = {
		Merchant = true,
		Blacksmith = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 108,
},
[5024] = {
	AegisName = "Hat_Of_Cake",
	Name = "Cake Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 109,
},
[5025] = {
	AegisName = "Helm_Of_Angel",
	Name = "Helm of Angel",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1600,
	Def = 10,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 74,
	ViewSprite = 110,
	Script = [[
		bonus bAgi,1;
		bonus bLuk,1;
		bonus bMdef,3;
	]]
},
[5026] = {
	AegisName = "Hat_Of_Cook",
	Name = "Chef Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 111,
	Script = [[ bonus bDex,1; ]]
},
[5027] = {
	AegisName = "Wizardry_Hat",
	Name = "Mage Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 2,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 112,
	Script = [[
		bonus bInt,2;
		bonus bMaxSP,150;
	]]
},
[5028] = {
	AegisName = "Candle",
	Name = "Candle",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 113,
},
[5029] = {
	AegisName = "Spore_Hat",
	Name = "Spore Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 20,
	ViewSprite = 114,
},
[5030] = {
	AegisName = "Panda_Cap",
	Name = "Panda Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 40,
	ViewSprite = 115,
},
[5031] = {
	AegisName = "Mine_Helm",
	Name = "Mine Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1500,
	Def = 9,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 55,
	ViewSprite = 116,
	Script = [[ bonus bDex,2; ]]
},
[5032] = {
	AegisName = "Picnic_Hat",
	Name = "Sunday Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 117,
},
[5033] = {
	AegisName = "Smokie_Hat",
	Name = "Raccoon Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 118,
},
[5034] = {
	AegisName = "Light_Bulb_Band",
	Name = "Bulb Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 119,
},
[5035] = {
	AegisName = "Poring_Hat",
	Name = "Poring Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 38,
	ViewSprite = 120,
},
[5036] = {
	AegisName = "Cross_Band",
	Name = "Cross Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 250,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	ViewSprite = 121,
},
[5037] = {
	AegisName = "Fruit_Shell",
	Name = "Nut Shell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Def = 8,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 5,
	Refine = false,
	ViewSprite = 122,
},
[5038] = {
	AegisName = "Deviruchi_Cap",
	Name = "Deviruchi Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 64,
	ViewSprite = 123,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
	]]
},
[5039] = {
	AegisName = "Mottled_Egg_Shell",
	Name = "Rainbow Eggshell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 8,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 19,
	Refine = false,
	ViewSprite = 124,
},
[5040] = {
	AegisName = "Blush",
	Name = "Blush",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 125,
},
[5041] = {
	AegisName = "Heart_Hair_Pin",
	Name = "Heart Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 126,
},
[5042] = {
	AegisName = "Hair_Protector",
	Name = "Bao Bao",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 14,
	ViewSprite = 127,
},
[5043] = {
	AegisName = "Opera_Ghost_Mask",
	Name = "Opera Phantom Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	EquipLv = 20,
	Refine = false,
	ViewSprite = 128,
},
[5044] = {
	AegisName = "Devils_Wing",
	Name = "Evil Wing Ears",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 350,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 129,
	Script = [[ bonus bVit,1; ]]
},
[5045] = {
	AegisName = "Magician_Hat",
	Name = "Magician Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 6,
	Job = {
		Magician = true,
		Acolyte = true,
		Priest = true,
		Wizard = true,
		Monk = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 130,
	Script = [[
		bonus bDex,1;
		bonus bAgi,1;
		bonus bMaxSP,50;
	]]
},
[5046] = {
	AegisName = "Bongun_Hat",
	Name = "Bongun Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 139,
},
[5047] = {
	AegisName = "Fashion_Sunglass",
	Name = "Fashionable Glasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 131,
},
[5048] = {
	AegisName = "First_Moon_Hair_Pin",
	Name = "Cresent Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 132,
},
[5049] = {
	AegisName = "Stripe_Band",
	Name = "Striped Hairband",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 133,
},
[5050] = {
	AegisName = "Mystery_Fruit_Shell",
	Name = "Wonder Nutshell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 10,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	Refine = false,
	ViewSprite = 134,
},
[5051] = {
	AegisName = "Kitty_Bell",
	Name = "Pussy Cat Bell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 135,
},
[5052] = {
	AegisName = "Blue_Hair_Band",
	Name = "Blue Hairband",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 136,
},
[5053] = {
	AegisName = "Spinx_Helm",
	Name = "Sphinx Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3000,
	Def = 5,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP" },
	EquipLv = 65,
	Refine = false,
	ViewSprite = 137,
	Script = [[ bonus bStr,2; ]]
},
[5054] = {
	AegisName = "Assasin_Mask",
	Name = "Assassin Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		Priest = true,
		Assassin = true,
	},
	Loc = "EQP_HEAD_LOW",
	EquipLv = 70,
	Refine = false,
	ViewSprite = 180,
},
[5055] = {
	AegisName = "Novice_Egg_Cap",
	Name = "Novice False Eggshell",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 1,
	Def = 6,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 101,
},
[5056] = {
	AegisName = "Love_Berry",
	Name = "Fruit of Love",
	Type = "IT_TYPE_ARMOR",
	Buy = 1,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 140,
},
[5057] = {
	AegisName = "Ear_Of_Black_Cat",
	Name = "Black Cat Ears",
	Type = "IT_TYPE_ARMOR",
	Buy = 16000,
	Weight = 200,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 141,
},
[5058] = {
	AegisName = "Drooping_Kitty",
	Name = "Drooping Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 250000,
	Weight = 500,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 142,
	Script = [[
		bonus bMdef,15;
		bonus2 bResEff,Eff_Curse,3000;
	]]
},
[5059] = {
	AegisName = "Brown_Bear_Cap",
	Name = "Teddybear Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 6,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 143,
},
[5060] = {
	AegisName = "Party_Hat",
	Name = "Party Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 144,
	Script = [[ bonus bLuk,1; ]]
},
[5061] = {
	AegisName = "Flower_Hairpin",
	Name = "Flower Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 145,
},
[5062] = {
	AegisName = "Straw_Hat",
	Name = "Straw Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 6,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 146,
	Script = [[ bonus bAgi,1; ]]
},
[5063] = {
	AegisName = "Plaster",
	Name = "Giant Band Aid",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 147,
},
[5064] = {
	AegisName = "Leaf_Headgear",
	Name = "Smokie Leaf",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 148,
},
[5065] = {
	AegisName = "Fish_On_Head",
	Name = "Blue Fish",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 149,
	Script = [[ bonus2 bAddRace,RC_Fish,10; ]]
},
[5066] = {
	AegisName = "Horn_Of_Succubus",
	Name = "Succubus Horn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 7,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 70,
	ViewSprite = 150,
	Script = [[
		bonus bInt,1;
		bonus bMdef,10;
	]]
},
[5067] = {
	AegisName = "Sombrero",
	Name = "Sombrero",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 350,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 151,
	Script = [[ bonus bAgi,1; ]]
},
[5068] = {
	AegisName = "Ear_Of_Devils_Wing",
	Name = "Evil Wing Ears",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_MID",
	EquipLv = 70,
	Refine = false,
	ViewSprite = 152,
	Script = [[ bonus bStr,1; ]]
},
[5069] = {
	AegisName = "Mask_Of_Fox",
	Name = "Kitsune Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 153,
	Script = [[
		bonus bAgi,1;
		bonus bLuk,1;
	]]
},
[5070] = {
	AegisName = "Headband_Of_Power",
	Name = "Hot-blooded Headband",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 154,
	Script = [[ bonus bStr,2; ]]
},
[5071] = {
	AegisName = "Indian_Headband",
	Name = "Indian Headband",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 155,
	Script = [[ bonus bDex,1; ]]
},
[5072] = {
	AegisName = "Inccubus_Horn",
	Name = "Incubus Horn",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 7,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 70,
	ViewSprite = 156,
	Script = [[
		bonus bAgi,1;
		bonus bMdef,10;
	]]
},
[5073] = {
	AegisName = "Cap_Of_Concentration",
	Name = "Model Training Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 157,
	Script = [[ bonus bDex, 2; ]]
},
[5074] = {
	AegisName = "Ear_Of_Angels_Wing",
	Name = "Angel Wing Ears",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_MID",
	EquipLv = 70,
	Refine = false,
	ViewSprite = 158,
	Script = [[ bonus bStr,1; ]]
},
[5075] = {
	AegisName = "Cowboy_Hat",
	Name = "Cowboy Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 8,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 159,
},
[5076] = {
	AegisName = "Fur_Hat",
	Name = "Beanie",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 350,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 160,
	Script = [[ bonus bLuk,1; ]]
},
[5077] = {
	AegisName = "Tulip_Hairpin",
	Name = "Tulip Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 161,
},
[5078] = {
	AegisName = "Sea_Otter_Cap",
	Name = "Sea-Otter Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 6,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 162,
	Script = [[ bonus bVit,1; ]]
},
[5079] = {
	AegisName = "Crossed_Hair_Band",
	Name = "X Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 163,
},
[5080] = {
	AegisName = "Headgear_Of_Queen",
	Name = "Crown of Ancient Queen",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 8,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 164,
},
[5081] = {
	AegisName = "Mistress_Crown",
	Name = "Crown of Mistress",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 75,
	ViewSprite = 165,
	Script = [[
		bonus bMaxSP,100;
		bonus bInt,2;
		bonus bUnbreakableHelm,0;
	]]
},
[5082] = {
	AegisName = "Mushroom_Band",
	Name = "Decorative Mushroom",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 166,
},
[5083] = {
	AegisName = "Red_Tailed_Ribbon",
	Name = "Red Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 167,
	Script = [[ bonus bMdef,10; ]]
},
[5084] = {
	AegisName = "Lazy_Raccoon",
	Name = "Lazy Smokie",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 168,
	Script = [[ bonus2 bResEff,Eff_Sleep,2000; ]]
},
[5085] = {
	AegisName = "Pair_Of_Red_Ribbon",
	Name = "Small Ribbons",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_MID",
	EquipLv = 45,
	Refine = false,
	ViewSprite = 169,
},
[5086] = {
	AegisName = "Alarm_Mask",
	Name = "Alarm Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 170,
	Script = [[ bonus2 bResEff,Eff_Blind,5000; ]]
},
[5087] = {
	AegisName = "Goblin_Mask_01",
	Name = "Poker Face",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 171,
},
[5088] = {
	AegisName = "Goblin_Mask_02",
	Name = "Surprised Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 172,
},
[5089] = {
	AegisName = "Goblin_Mask_03",
	Name = "Annoyed Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 173,
},
[5090] = {
	AegisName = "Goblin_Mask_04",
	Name = "Goblin Leader Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 174,
},
[5091] = {
	AegisName = "Big_Golden_Bell",
	Name = "Decorative Golden Bell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 35,
	ViewSprite = 175,
},
[5092] = {
	AegisName = "Blue_Coif",
	Name = "Coif",
	Type = "IT_TYPE_ARMOR",
	Buy = 150000,
	Weight = 300,
	Def = 5,
	Job = {
		Priest = true,
		Assassin = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 65,
	ViewSprite = 176,
},
[5093] = {
	AegisName = "Blue_Coif_",
	Name = "Coif",
	Type = "IT_TYPE_ARMOR",
	Buy = 150000,
	Weight = 300,
	Def = 5,
	Slots = 1,
	Job = {
		Priest = true,
		Assassin = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 65,
	ViewSprite = 177,
	Script = [[ bonus bMaxSP,100; ]]
},
[5094] = {
	AegisName = "Orc_Hero_Helm",
	Name = "Helmet of Orc Hero",
	Type = "IT_TYPE_ARMOR",
	Buy = 500000,
	Weight = 900,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 55,
	ViewSprite = 178,
	Script = [[
		bonus bStr,2;
		bonus bVit,1;
	]]
},
[5095] = {
	AegisName = "Orc_Hero_Helm_",
	Name = "Helmet of Orc Hero",
	Type = "IT_TYPE_ARMOR",
	Buy = 800000,
	Weight = 1000,
	Def = 5,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 55,
	ViewSprite = 179,
	Script = [[
		bonus bStr,2;
		bonus bVit,1;
	]]
},
[5096] = {
	AegisName = "Assassin_Mask_",
	Name = "Assassin Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 1,
	Job = {
		Priest = true,
		Assassin = true,
	},
	Loc = "EQP_HEAD_LOW",
	EquipLv = 70,
	Refine = false,
	ViewSprite = 180,
},
[5097] = {
	AegisName = "Cone_Hat_",
	Name = "Holiday Hat",
	Type = "IT_TYPE_ARMOR",
	Weight = 400,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 144,
},
[5098] = {
	AegisName = "Tiger_Mask",
	Name = "Tiger Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 2,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 50,
	Refine = false,
	ViewSprite = 181,
	Script = [[
		bonus bStr,3;
		bonus bMaxHP,100;
	]]
},
[5099] = {
	AegisName = "Cat_Hat",
	Name = "Neko Mimi",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 182,
	Script = [[
		bonus bLuk,2;
		bonus bMdef,10;
		bonus2 bAddRaceTolerance,RC_Brute,5;
	]]
},
[5100] = {
	AegisName = "Sales_Signboard",
	Name = "Sales Banner",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 75,
	ViewSprite = 183,
	Script = [[
		bonus bStr,1;
		bonus bAgi,1;
		bonus bLuk,1;
	]]
},
[5101] = {
	AegisName = "Takius_Blindfold",
	Name = "Takius Blindfold",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 184,
	Script = [[
		bonus bInt,2;
		bonus bDef,1;
	]]
},
[5102] = {
	AegisName = "Round_Eyes",
	Name = "Blank Eyes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 185,
},
[5103] = {
	AegisName = "Sunflower_Hairpin",
	Name = "Sunflower Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 600,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	Refine = false,
	ViewSprite = 186,
	Script = [[
		bonus bAgi,2;
		bonus bCriticalRate,5;
	]]
},
[5104] = {
	AegisName = "Dark_Blindfold",
	Name = "Dark Blinder",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 187,
	Script = [[
		bonus2 bResEff,Eff_Blind,10000;
		bonus2 bResEff,Eff_Stun,200;
	]]
},
[5105] = {
	AegisName = "Hat_Of_Cake_",
	Name = "2nd Anniversary Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 24,
	ViewSprite = 109,
	Script = [[
		bonus bMaxSP,60;
		bonus3 bAddMonsterDropItem,7864,7,50;
	]]
},
[5106] = {
	AegisName = "Cone_Hat_INA",
	Name = "2nd Anniversary Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 10,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 144,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[
		bonus bLuk,1;
		bonus bMatkRate,3;
		bonus bFlee,3;
		bonus bHit,3;
		bonus bFlee2,3;
	]]
},
[5107] = {
	AegisName = "Well_Baked_Toast",
	Name = "Crunch Toast",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 188,
},
[5108] = {
	AegisName = "Detective_Hat",
	Name = "Renown Detective's Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 350,
	Def = 6,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 189,
},
[5109] = {
	AegisName = "Red_Bonnet",
	Name = "Red Bonnet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 190,
},
[5110] = {
	AegisName = "Baby_Pacifier",
	Name = "Baby Pacifier",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 191,
},
[5111] = {
	AegisName = "Galapago_Cap",
	Name = "Galapago Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 55,
	ViewSprite = 192,
	Script = [[ bonus2 bAddMonsterDropItem,605,100; ]]
},
[5112] = {
	AegisName = "Super_Novice_Hat",
	Name = "Super Novice Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 8500,
	Weight = 400,
	Def = 8,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_HEAD_TOP",
	EquipLv = 40,
	ViewSprite = 193,
	Script = [[ bonus bAllStats,1; ]]
},
[5113] = {
	AegisName = "Angry_Mouth",
	Name = "Angry Snarl",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 50,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 194,
},
[5114] = {
	AegisName = "Fedora",
	Name = "Bucket Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 6000,
	Weight = 300,
	Def = 6,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 195,
},
[5115] = {
	AegisName = "Winter_Hat",
	Name = "Winter Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 196,
	Script = [[ bonus2 bResEff,Eff_Freeze,1000; ]]
},
[5116] = {
	AegisName = "Banana_Hat",
	Name = "Banana Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 197,
	Script = [[ bonus3 bAutoSpell,SM_PROVOKE,3,30; ]]
},
[5117] = {
	AegisName = "Mistic_Rose",
	Name = "Mystic Rose",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 198,
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,2; ]]
},
[5118] = {
	AegisName = "Ear_Of_Puppy",
	Name = "Puppy Headband",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 199,
},
[5119] = {
	AegisName = "Super_Novice_Hat_",
	Name = "Super Novice Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 8500,
	Weight = 400,
	Def = 8,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_HEAD_TOP",
	EquipLv = 40,
	ViewSprite = 193,
	Script = [[ bonus bAllStats,1; ]]
},
[5120] = {
	AegisName = "Fedora_",
	Name = "Bucket Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 6000,
	Weight = 300,
	Def = 6,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 195,
},
[5121] = {
	AegisName = "Zherlthsh_Mask",
	Name = "Zealotus Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 70,
	ViewSprite = 200,
	Script = [[
		bonus2 bAddRace,RC_DemiPlayer,5;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,5;
	]]
},
[5122] = {
	AegisName = "Magni_Cap",
	Name = "Magni's Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 1000,
	Def = 9,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 65,
	ViewSprite = 250,
	Script = [[ bonus bStr,2; ]]
},
[5123] = {
	AegisName = "Ulle_Cap",
	Name = "Ulle's Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 6,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 65,
	ViewSprite = 254,
	Script = [[
		bonus bDex,2;
		bonus bAgi,1;
	]]
},
[5124] = {
	AegisName = "Fricca_Circlet",
	Name = "Fricca's Circlet",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 300,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 65,
	ViewSprite = 251,
	Script = [[
		bonus bMdef,10;
		bonus bInt,2;
		bonus bMaxSP,50;
	]]
},
[5125] = {
	AegisName = "Kiss_Of_Angel",
	Name = "Angel's Kiss",
	Type = "IT_TYPE_ARMOR",
	Buy = 10000,
	Weight = 300,
	Def = 6,
	Slots = 1,
	Job = {
		Novice = true,
	},
	Upper = { "ITEMUPPER_NORMAL", "ITEMUPPER_UPPER", "ITEMUPPER_BABY", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 255,
	Script = [[ bonus bSPrecovRate,3; ]]
},
[5126] = {
	AegisName = "Morpheuss_Hood",
	Name = "Morpheus's Hood",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 200,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 33,
	ViewSprite = 256,
	Script = [[ bonus bInt,2; ]]
},
[5127] = {
	AegisName = "Morriganes_Helm",
	Name = "Morrigane's Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 61,
	ViewSprite = 257,
	Script = [[
		bonus bLuk,2;
		bonus bBaseAtk,3;
	]]
},
[5128] = {
	AegisName = "Goibnes_Helmet",
	Name = "Goibne's Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 10,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 54,
	ViewSprite = 258,
	Script = [[
		bonus bVit,3;
		bonus bMdef,3;
	]]
},
[5129] = {
	AegisName = "Bird_Nest",
	Name = "Bird Nest",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	Refine = false,
	ViewSprite = 201,
	Script = [[
		bonus bAgi,2;
		bonus2 bAddRaceTolerance,RC_Brute,10;
	]]
},
[5130] = {
	AegisName = "Lion_Mask",
	Name = "Lion Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Job = {
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 75,
	ViewSprite = 202,
	Script = [[
		bonus2 bAddEffWhenHit,Eff_Silence,500;
		bonus bMdef,1;
	]]
},
[5131] = {
	AegisName = "Close_Helmet",
	Name = "Close Helmet",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1200,
	Def = 8,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 75,
	ViewSprite = 203,
	Script = [[
		bonus bVit,3;
		bonus bMaxHPrate,3;
	]]
},
[5132] = {
	AegisName = "Angeling_Hat",
	Name = "Angeling Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 204,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,10; ]]
},
[5133] = {
	AegisName = "Sheep_Hat",
	Name = "Sheep Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Def = 3,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 205,
	Script = [[ bonus bShortWeaponDamageReturn,5; ]]
},
[5134] = {
	AegisName = "Pumpkin_Hat",
	Name = "Pumpkin-Head",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 206,
	Script = [[ bonus bAllStats,3; ]]
},
[5135] = {
	AegisName = "Cyclops_Visor",
	Name = "Cyclop's Eye",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_MID",
	EquipLv = 75,
	Refine = false,
	ViewSprite = 207,
	Script = [[ bonus bMaxSP,50; ]]
},
[5136] = {
	AegisName = "Santas_Hat_",
	Name = "Antonio's Santa Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 20,
	Script = [[ bonus bMdef,2; ]]
},
[5137] = {
	AegisName = "Alice_Doll",
	Name = "Alice Doll",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 1,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	Refine = false,
	ViewSprite = 208,
	Script = [[
		bonus bStr,1;
		bonus2 bAddRace,RC_DemiPlayer,10;
		bonus2 bAddEff2,Eff_Sleep,10;
	]]
},
[5138] = {
	AegisName = "Magic_Eyes",
	Name = "Magic Eyes",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 3,
	Job = {
		Magician = true,
		Wizard = true,
		Sage = true,
		Soul_Linker = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	ViewSprite = 209,
	Script = [[
		bonus bMdef,5;
		bonus bVariableCastrate,-10;
		bonus bUseSPrate,20;
	]]
},
[5139] = {
	AegisName = "Hibiscus",
	Name = "Hibiscus",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	Refine = false,
	ViewSprite = 210,
	Script = [[
		bonus bDex,1;
		bonus bInt,1;
		bonus bMdef,5;
	]]
},
[5140] = {
	AegisName = "Charming_Ribbon",
	Name = "Charming Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 2,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	ViewSprite = 211,
	Script = [[
		bonus2 bAddRaceTolerance,RC_Undead,5;
		bonus2 bAddRaceTolerance,RC_Demon,5;
	]]
},
[5141] = {
	AegisName = "Marionette_Doll",
	Name = "Marionette Doll",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 1,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	ViewSprite = 212,
	Script = [[ bonus bStr,1; ]]
},
[5142] = {
	AegisName = "Crescent_Helm",
	Name = "Crescent Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 48000,
	Weight = 3000,
	Def = 20,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 50,
	ViewSprite = 213,
	Script = [[
		bonus bVit,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,5;
	]]
},
[5143] = {
	AegisName = "Kabuki_Mask",
	Name = "Kabuki Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 50000,
	Weight = 1000,
	Def = 5,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 30,
	ViewSprite = 214,
	Script = [[ bonus2 bResEff,Eff_Silence,3000; ]]
},
[5144] = {
	AegisName = "Gambler_Hat",
	Name = "Gamble Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 16,
	Script = [[ bonus bLuk,5; ]]
},
[5145] = {
	AegisName = "Carnival_Joker_Jester",
	Name = "Carnival Joker Jester",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 89,
},
[5146] = {
	AegisName = "Elephant_Hat",
	Name = "Elephant Hat",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 215,
	Script = [[
		bonus bVit,1;
		skill WZ_WATERBALL,1;
		if(getrefine()>8) bonus3 bAutoSpell,BS_GREED,1,10;
	]]
},
[5147] = {
	AegisName = "Baseball_Cap",
	Name = "Baseball Cap",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 5,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 216,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[5148] = {
	AegisName = "Phrygian_Cap",
	Name = "Phrygian Cap",
	Type = "IT_TYPE_ARMOR",
	Weight = 500,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 217,
	Script = [[ bonus bInt,2; ]]
},
[5149] = {
	AegisName = "Silver_Tiara",
	Name = "Silver Tiara",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 218,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,2; ]]
},
[5150] = {
	AegisName = "Joker_Jester_",
	Name = "Joker Jester",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 219,
	Script = [[ bonus bSpeedRate,25; ]]
},
[5151] = {
	AegisName = "Headset_OST",
	Name = "Note Headphone",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 4,
	Slots = 1,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 220,
	Script = [[
		bonus bMdef,3;
		bonus2 bResEff,Eff_Stun,1000;
		bonus2 bResEff,Eff_Freeze,1000;
	]]
},
[5152] = {
	AegisName = "Chinese_Crown",
	Name = "Chinese Crown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 2000,
	Def = 2,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 221,
	Script = [[
		bonus bMdef,2;
		bonus2 bResEff,Eff_Stun,1000;
		bonus bInt,1;
	]]
},
[5153] = {
	AegisName = "Angeling_Hairpin",
	Name = "Angeling Hairpin",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 700,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 222,
	Script = [[ bonus bFlee,5; ]]
},
[5154] = {
	AegisName = "Sunglasses_F",
	Name = "Father's Sunglasses",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 12,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	}
},
[5155] = {
	AegisName = "Granpa_Beard_F",
	Name = "Father's White Moustache",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 25,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bBaseAtk,20; ]]
},
[5156] = {
	AegisName = "Flu_Mask_F",
	Name = "Father's Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 8,
	Trade = {
		nodrop = true,
		notrade = true,
		noselltonpc = true,
		nocart = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bMatkRate,1; ]]
},
[5157] = {
	AegisName = "Viking_Helm_",
	Name = "Orc Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 9,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 86,
},
[5158] = {
	AegisName = "Holy_Bonnet_",
	Name = "Monk Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Def = 10,
	Slots = 1,
	Job = {
		Acolyte = true,
		Priest = true,
		Monk = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 35,
	Script = [[ bonus bMdef,3; ]]
},
[5159] = {
	AegisName = "Golden_Gear_",
	Name = "Golden Gear",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 900,
	Def = 9,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 40,
	ViewSprite = 30,
	Script = [[ bonus bUnbreakableHelm,0; ]]
},
[5160] = {
	AegisName = "Magestic_Goat_",
	Name = "Magestic Goat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 9,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 41,
	Script = [[ bonus bStr,1; ]]
},
[5161] = {
	AegisName = "Sharp_Gear_",
	Name = "Spiky Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 12,
	Slots = 1,
	Job = {
		Swordsman = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Rogue = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 43,
},
[5162] = {
	AegisName = "Bone_Helm_",
	Name = "Bone Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 15,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 70,
	ViewSprite = 103,
	Script = [[ bonus2 bSubEle,Ele_Dark,-15; ]]
},
[5163] = {
	AegisName = "Corsair_",
	Name = "Corsair",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 10,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 105,
	Script = [[ bonus bVit,1; ]]
},
[5164] = {
	AegisName = "Tiara_",
	Name = "Tiara",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 7,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 19,
	Script = [[ bonus bInt,1; ]]
},
[5165] = {
	AegisName = "Crown_",
	Name = "Crown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 400,
	Def = 7,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Gender = "IT_GENDER_MALE",
	Loc = "EQP_HEAD_TOP",
	EquipLv = 45,
	ViewSprite = 45,
	Script = [[ bonus bInt,1; ]]
},
[5166] = {
	AegisName = "Spinx_Helm_",
	Name = "Sphinx Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 3000,
	Def = 5,
	Slots = 1,
	Job = {
		Swordsman = true,
		Knight = true,
		Crusader = true,
	},
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP" },
	EquipLv = 65,
	Refine = false,
	ViewSprite = 137,
	Script = [[ bonus bStr,2; ]]
},
[5167] = {
	AegisName = "Munak_Turban_",
	Name = "Munak Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Slots = 1,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 51,
	Script = [[ bonus2 bAddRaceTolerance,RC_Undead,10; ]]
},
[5168] = {
	AegisName = "Bongun_Hat_",
	Name = "Bongun Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 5,
	Slots = 1,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 139,
},
[5169] = {
	AegisName = "Bride_Mask",
	Name = "Bride Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 4,
	Slots = 1,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 40,
	ViewSprite = 223,
	Script = [[
		if(BaseClass==Job_Taekwon) {
			bonus bLuk,2;
			bonus bCritical,5;
		}
	]]
},
[5170] = {
	AegisName = "Feather_Beret",
	Name = "Feather Beret",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 600,
	Def = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 224,
	Script = [[
		bonus bMdef,1;
		bonus2 bAddRaceTolerance,RC_DemiPlayer,10;
	]]
},
[5171] = {
	AegisName = "Valkyrie_Helm",
	Name = "Valkyrie Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 100000,
	Weight = 1000,
	Def = 10,
	Slots = 1,
	Job = {
		Swordsman = true,
		Magician = true,
		Archer = true,
		Acolyte = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Priest = true,
		Wizard = true,
		Blacksmith = true,
		Hunter = true,
		Assassin = true,
		Crusader = true,
		Monk = true,
		Sage = true,
		Rogue = true,
		Alchemist = true,
		Bard = true,
	},
	Upper = { "ITEMUPPER_UPPER", "ITEMUPPER_THIRD", "ITEMUPPER_THIRDUPPER", "ITEMUPPER_THIRDBABY" },
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 225,
	Script = [[ bonus bMdef,5; ]]
},
[5172] = {
	AegisName = "Beret",
	Name = "Beret",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 700,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 226,
	Script = [[ bonus2 bAddRaceTolerance,RC_DemiPlayer,10; ]]
},
[5173] = {
	AegisName = "Satto_Hat",
	Name = "Magistrate Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 400,
	Def = 6,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 60,
	ViewSprite = 227,
	Script = [[
		if(BaseClass==Job_Taekwon) {
			bonus bAgi,1;
			bonus bHPrecovRate,3;
		}
	]]
},
[5174] = {
	AegisName = "Ayam",
	Name = "Ayam",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 400,
	Def = 6,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 60,
	ViewSprite = 228,
	Script = [[
		if(BaseClass==Job_Taekwon) {
			bonus bInt,1;
			bonus bSPrecovRate,3;
		}
	]]
},
[5175] = {
	AegisName = "Censor_Bar",
	Name = "Censor Bar",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Loc = "EQP_HEAD_MID",
	Refine = false,
	ViewSprite = 229,
	Script = [[
		bonus2 bResEff,Eff_Curse,500;
		bonus bMdef,1;
		bonus bHit,-5;
	]]
},
[5176] = {
	AegisName = "Hahoe_Mask",
	Name = "Hahoe Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 100,
	Def = 2,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	EquipLv = 30,
	Refine = false,
	ViewSprite = 230,
	Script = [[
		if(BaseClass==Job_Taekwon) {
			bonus bLuk,1;
			bonus bFlee2,2;
		}
	]]
},
[5177] = {
	AegisName = "Guardian_Lion_Mask",
	Name = "Mythical Lion Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 30000,
	Weight = 500,
	Def = 5,
	Slots = 1,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 40,
	ViewSprite = 231,
	Script = [[
		if(BaseClass==Job_Taekwon) {
			bonus bDex,2;
			bonus bBaseAtk,2*getrefine();
			bonus3 bAddEff,Eff_Stun,1000,ATF_SHORT;
		}
	]]
},
[5178] = {
	AegisName = "Candle_",
	Name = "Candle",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 150,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 113,
	Script = [[ bonus bAllStats,1; ]]
},
[5179] = {
	AegisName = "Gold_Tiara",
	Name = "Golden Tiara",
	Type = "IT_TYPE_ARMOR",
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 232,
	Trade = {
		nodrop = true,
		notrade = true,
		nocart = true,
		nostorage = true,
		nogstorage = true,
		nomail = true,
		noauction = true,
	},
	Script = [[ bonus bInt,2; ]]
},
[5180] = {
	AegisName = "Phrygian_Cap_",
	Name = "France Holiday Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 217,
	Script = [[ bonus bVit,1; ]]
},
[5181] = {
	AegisName = "Helm_Of_Darkness",
	Name = "Helm of Darkness",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 3,
	Slots = 1,
	Job = {
		Swordsman = true,
		Merchant = true,
		Thief = true,
		Knight = true,
		Blacksmith = true,
		Assassin = true,
		Crusader = true,
		Rogue = true,
		Alchemist = true,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 50,
	ViewSprite = 233,
	Script = [[ bonus bStr,2; ]]
},
[5182] = {
	AegisName = "Puppy_Hat",
	Name = "Puppy Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	Refine = false,
	ViewSprite = 234,
	Script = [[
		bonus bAgi,1;
		bonus3 bAutoSpell,PR_GLORIA,1,10+20*(readparam(bAgi)>=77);
	]]
},
[5183] = {
	AegisName = "Bird_Nest_Hat",
	Name = "Bird Nest Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	ViewSprite = 235,
	Script = [[
		bonus bDex,1;
		bonus bAgi,1;
		bonus2 bResEff,Eff_Stun,1000;
	]]
},
[5184] = {
	AegisName = "Captain_Hat",
	Name = "Captain's Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 8,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	ViewSprite = 236,
	Script = [[ bonus2 bSubEle,Ele_Water,5; ]]
},
[5185] = {
	AegisName = "Laurel_Wreath",
	Name = "Laurel Wreath",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	ViewSprite = 237,
	Script = [[
		bonus bLuk,3;
		bonus2 bResEff,Eff_Blind,500;
		bonus2 bResEff,Eff_Curse,500;
	]]
},
[5186] = {
	AegisName = "Geographer_Band",
	Name = "Geographer Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 2,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	Refine = false,
	ViewSprite = 238,
	Script = [[
		bonus bInt,1;
		bonus3 bAutoSpellWhenHit,AL_HEAL,1,50;
	]]
},
[5187] = {
	AegisName = "Twin_Ribbon",
	Name = "Twin Red Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 6,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	ViewSprite = 239,
	Script = [[
		bonus bMaxSP,30;
		bonus bMdef,3;
		bonus3 bAutoSpellWhenHit,NPC_STONESKIN,6,10;
		bonus5 bAutoSpellWhenHit,NPC_ANTIMAGIC,6,120,BF_MAGIC,0;
	]]
},
[5188] = {
	AegisName = "Minstrel_Hat",
	Name = "Creative Convention Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 240,
	Script = [[
		bonus bInt,1;
		bonus bDex,1;
	]]
},
[5189] = {
	AegisName = "Fallen_Leaves",
	Name = "Autumn Leaves",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 241,
	Script = [[
		bonus bMaxHP,40;
		bonus bMaxSP,40;
	]]
},
[5190] = {
	AegisName = "Baseball_Cap_",
	Name = "Independence Memorial Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 20,
	Def = 5,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 216,
},
[5191] = {
	AegisName = "Ribbon_Black",
	Name = "Black Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 242,
	Script = [[ bonus bMdef,3; ]]
},
[5192] = {
	AegisName = "Ribbon_Yellow",
	Name = "Yellow Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 243,
	Script = [[ bonus bMdef,3; ]]
},
[5193] = {
	AegisName = "Ribbon_Green",
	Name = "Green Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 244,
	Script = [[ bonus bMdef,3; ]]
},
[5194] = {
	AegisName = "Ribbon_Pink",
	Name = "Pink Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 245,
	Script = [[ bonus bMdef,3; ]]
},
[5195] = {
	AegisName = "Ribbon_Red",
	Name = "Red Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 246,
	Script = [[ bonus bMdef,3; ]]
},
[5196] = {
	AegisName = "Ribbon_Orange",
	Name = "Orange Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 247,
	Script = [[ bonus bMdef,3; ]]
},
[5197] = {
	AegisName = "Ribbon_White",
	Name = "White Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 800,
	Weight = 100,
	Def = 1,
	Slots = 1,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 248,
	Script = [[ bonus bMdef,3; ]]
},
[5198] = {
	AegisName = "Drooping_Bunny",
	Name = "Evolved Drooping Bunny",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 100,
	Def = 3,
	Gender = "IT_GENDER_FEMALE",
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 249,
	Script = [[
		bonus bDex,1;
		bonus bFlee,2;
	]]
},
[5199] = {
	AegisName = "Baseball_Cap_I",
	Name = "Baseball Cap",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 5,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 216,
},
[5200] = {
	AegisName = "Coppola",
	Name = "Coppola",
	Type = "IT_TYPE_ARMOR",
	Buy = 10,
	Weight = 300,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 252,
},
[5201] = {
	AegisName = "Party_Hat_B",
	Name = "Party Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 144,
	Script = [[ bonus bAllStats,3; ]]
},
[5202] = {
	AegisName = "Pumpkin_Hat_",
	Name = "Fantastic Pumpkin-Head",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 206,
	Script = [[ bonus2 bAddRaceTolerance,RC_Demon,5; ]]
},
[5203] = {
	AegisName = "Tongue_Mask",
	Name = "Smiling Mask",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Loc = { "EQP_HEAD_LOW", "EQP_HEAD_MID" },
	Refine = false,
	ViewSprite = 253,
	Script = [[ bonus bSpeedRate,25; ]]
},
[5204] = {
	AegisName = "Event_Pierrot_Nose",
	Name = "Rudolph's Nose",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 49,
	Script = [[
		bonus2 bResEff,Eff_Blind,3000;
		bonus2 bAddMonsterDropItem,12130,30;
	]]
},
[5205] = {
	AegisName = "Wreath",
	Name = "Emperor's Laurel Crown",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 1000,
	Def = 3,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 261,
	Script = [[
		bonus bAllStats,1;
		bonus bMdef,3;
	]]
},
[5206] = {
	AegisName = "Romantic_White_Flower",
	Name = "Romantic White Flower",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 259,
	Script = [[ bonus2 bAddRaceTolerance,RC_Plant,3; ]]
},
[5207] = {
	AegisName = "Gold_Spirit_Chain",
	Name = "Angel Blessing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Loc = "EQP_HEAD_TOP",
	Refine = false,
	ViewSprite = 260,
	Script = [[
		bonus bLuk,1;
		bonus2 bSubEle,Ele_Holy,5;
	]]
},
[5208] = {
	AegisName = "Rideword_Hat",
	Name = "Rideword Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 3,
	Slots = 1,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 40,
	ViewSprite = 262,
	Script = [[
		bonus2 bHPDrainRate,50,8;
		bonus2 bSPDrainRate,10,4;
		bonus2 bHPLossRate,10,5000;
	]]
},
[5209] = {
	AegisName = "Yellow_Baseball_Cap",
	Name = "Love Dad Cap",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 263,
},
[5210] = {
	AegisName = "Flying_Angel",
	Name = "Flapping Angel Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 300,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	ViewSprite = 264,
	Script = [[
		bonus bVariableCastrate,-3;
		bonus bAspdRate,3;
		bonus bInt,1;
		bonus bAgi,1;
	]]
},
[5211] = {
	AegisName = "Dress_Hat",
	Name = "Dress Hat",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 3,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 20,
	ViewSprite = 265,
	Script = [[
		bonus bMdef,7;
		bonus bStr,1;
		bonus bInt,1;
		bonus2 bAddRace, RC_All, 2;
		bonus bMatkRate,2;
		bonus bHealPower,5;
		if (getrefine() >= 7) {
			bonus2 bAddRace, RC_All, 1;
			bonus bMatkRate,1;
			bonus bHealPower,1;
		}
	]]
},
[5212] = {
	AegisName = "Satellite_Hairband",
	Name = "Satellite Hairband",
	Type = "IT_TYPE_ARMOR",
	Weight = 1000,
	Def = 6,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 30,
	ViewSprite = 266,
	Script = [[
		bonus bMaxHP,50;
		bonus bMaxSP,10;
		skill AL_RUWACH,1;
	]],
	OnUnequipScript = [[ sc_end SC_RUWACH; ]]
},
[5213] = {
	AegisName = "Black_Bunny_Band",
	Name = "Sheila Hairnet",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 267,
	Script = [[
		bonus bAgi,2;
		bonus bMdef,3;
	]]
},
[5214] = {
	AegisName = "Moonlight_Flower_Hat",
	Name = "Moonlight Flower Hat",
	Type = "IT_TYPE_ARMOR",
	Weight = 200,
	Def = 3,
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	ViewSprite = 268,
	Script = [[
		bonus bDex,2;
		bonus3 bAutoSpell,AL_INCAGI,1,50;
	]]
},
[5215] = {
	AegisName = "Angelic_Chain_",
	Name = "Evolved Angel Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 38,
	Script = [[
		bonus bMdef,3;
		bonus bDex,1;
		bonus bInt,1;
		bonus2 bAddRaceTolerance,RC_Demon,3;
	]]
},
[5216] = {
	AegisName = "Satanic_Chain_",
	Name = "Evolved Evil Wing",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 6,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 39,
	Script = [[
		bonus bStr,1;
		bonus bAgi,1;
		bonus bFlee,3;
		bonus2 bAddRaceTolerance,RC_Angel,3;
	]]
},
[5217] = {
	AegisName = "Magestic_Goat_TW",
	Name = "Evolved Magestic Goat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 10,
	Job = {
		Swordsman = true,
		Merchant = true,
		Knight = true,
		Blacksmith = true,
		Crusader = true,
		Alchemist = true,
		Taekwon = true,
		Star_Gladiator = true,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 41,
	Script = [[ bonus bStr,2; ]]
},
[5218] = {
	AegisName = "Bunny_Band_",
	Name = "Evolved Bunny Band",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 3,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 15,
	Script = [[ bonus bInt,2; ]]
},
[5219] = {
	AegisName = "Drooping_Kitty_",
	Name = "Evolved Drooping Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 250000,
	Weight = 500,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 142,
	Script = [[
		bonus bMdef,18;
		bonus bFlee,3;
	]]
},
[5220] = {
	AegisName = "Smoking_Pipe_",
	Name = "Evolved Pipe",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_LOW",
	Refine = false,
	ViewSprite = 55,
	Script = [[
		bonus bVit,1;
		bonus2 bAddRaceTolerance,RC_Brute,5;
	]]
},
[5221] = {
	AegisName = "Pair_Of_Red_Ribbon_",
	Name = "Evolved Pair of Red Ribbon",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 100,
	Def = 2,
	Loc = "EQP_HEAD_MID",
	EquipLv = 45,
	Refine = false,
	ViewSprite = 169,
	Script = [[ bonus bFlee,5; ]]
},
[5222] = {
	AegisName = "Fish_On_Head_",
	Name = "Evolved Blue Fish",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 500,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 50,
	ViewSprite = 149,
	Script = [[
		bonus bAgi,1;
		bonus bDex,1;
	]]
},
[5223] = {
	AegisName = "Big_Golden_Bell_",
	Name = "Evolved Big Golden Bell",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 2,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 35,
	ViewSprite = 175,
	Script = [[ bonus bAgi,2; ]]
},
[5224] = {
	AegisName = "Orc_Hero_Helm_TW",
	Name = "Evolved Orc Hero Helm",
	Type = "IT_TYPE_ARMOR",
	Buy = 500000,
	Weight = 900,
	Def = 5,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = { "EQP_HEAD_TOP", "EQP_HEAD_MID" },
	EquipLv = 55,
	ViewSprite = 178,
	Script = [[
		bonus bStr,2;
		bonus bVit,1;
		bonus bMaxHPrate,10;
	]]
},
[5225] = {
	AegisName = "Marcher_Hat",
	Name = "Parade Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 4,
	Slots = 1,
	Loc = "EQP_HEAD_TOP",
	EquipLv = 10,
	ViewSprite = 269,
	Script = [[
		bonus bMdef,2;
		bonus bStr,2;
		bonus4 bAutoSpellWhenHit,AL_ANGELUS,5,30,0;
		bonus4 bAutoSpellWhenHit,HP_ASSUMPTIO,1,1,0;
		bonus2 bResEff,Eff_Stun,1000;
		if(BaseClass==Job_Acolyte) bonus4 bAutoSpellOnSkill,AL_HEAL,PR_LEXAETERNA,1,1000;
	]]
},
[5226] = {
	AegisName = "Mini_Propeller_",
	Name = "Mini Propeller",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 200,
	Def = 4,
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 270,
	Script = [[
		bonus bAgi,2;
		bonus bDex,1;
		bonus bFlee,10;
		bonus bVariableCastrate,-getrefine();
	]]
},
[5227] = {
	AegisName = "Red_Deviruchi_Cap",
	Name = "Red Deviruchi Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 64,
	ViewSprite = 271,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
	]]
},
[5228] = {
	AegisName = "White_Deviruchi_Cap",
	Name = "Gray Deviruchi Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 64,
	ViewSprite = 272,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
	]]
},
[5229] = {
	AegisName = "Gray_Deviruchi_Cap",
	Name = "Brown Deviruchi Hat",
	Type = "IT_TYPE_ARMOR",
	Buy = 20,
	Weight = 800,
	Def = 4,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	EquipLv = 64,
	ViewSprite = 273,
	Script = [[
		bonus bStr,1;
		bonus bInt,1;
	]]
},
[5230] = {
	AegisName = "White_Drooping_Kitty",
	Name = "Gray Drooping Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 250000,
	Weight = 500,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 274,
	Script = [[
		bonus2 bResEff,Eff_Curse,3000;
		bonus bMdef,15;
	]]
},
[5231] = {
	AegisName = "Gray_Drooping_Kitty",
	Name = "Brown Drooping Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 250000,
	Weight = 500,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 275,
	Script = [[
		bonus2 bResEff,Eff_Curse,3000;
		bonus bMdef,15;
	]]
},
[5232] = {
	AegisName = "Pink_Drooping_Kitty",
	Name = "Pink Drooping Cat",
	Type = "IT_TYPE_ARMOR",
	Buy = 250000,
	Weight = 500,
	Def = 3,
	Job = {
		All = true,
		Novice = false,
	},
	Loc = "EQP_HEAD_TOP",
	ViewSprite = 276,
	Script = [[
		bonus2 bResEff,Eff_Curse,3000;
		bonus bMdef,15;
	]]
},
[5233] = {
	AegisName = "Blue_Drooping_Kitty",
	Name = "Blue Drooping Cat",
	Buy = 250000,
	},
