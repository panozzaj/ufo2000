AddXcomItem {
	index = 0,
	cost = 75,
	name = "PISTOL",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 3),
	health = 100,
	importance = 5,
	width = 1,
	height = 2,
	ammo = {"PISTOL CLIP"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	accuracy = {0, 60, 0},
	time = {0, 20, 0},
	rounds = 8,
	weight = 3,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	sound = "cv-pistol-shot",
}

AddXcomItem {
	index = 1,
	cost = 25,
	name = "PISTOL CLIP",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 4),
	pMap = pck_image("$(xcom)/units/floorob.pck", 4),
	health = 100,
	damage = 45,
	dDeviation = 50,
	importance = 3,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 0,
	rounds = 7,
	disappear = 0,
	weight = 1,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-bullet-hit",
}

AddXcomItem {
	index = 2,
	cost = 100,
	name = "RIFLE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 1),
	pMap = pck_image("$(xcom)/units/floorob.pck", 1),
	health = 100,
	importance = 6,
	width = 1,
	height = 3,
	ammo = {"RIFLE CLIP"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	accuracy = {65, 0, 0},
	time = {12, 0, 0},
	autoShots = 5,
	rounds = 10,
	weight = 4,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "cv-rifle-shot",
}

AddXcomItem {
	index = 3,
	cost = 25,
	name = "RIFLE CLIP",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 2),
	pMap = pck_image("$(xcom)/units/floorob.pck", 2),
	health = 100,
	damage = 30,
	dDeviation = 60,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 0,
	rounds = 15,
	disappear = 0,
	weight = 2,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-bullet-hit",
}

AddXcomItem {
	index = 4,
	cost = 80,
	name = "HEAVY CANNON",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 11),
	pMap = pck_image("$(xcom)/units/floorob.pck", 11),
	health = 100,
	importance = 14,
	width = 2,
	height = 3,
	ammo = {"CANNON AP-AMMO", "CANNON HE-AMMO", "CANNON I-AMMO"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 24, 8),
	accuracy = {0, 60, 90},
	time = {0, 33, 80},
	rounds = 10,
	weight = 18,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "cv-heavy-cannon-shot",
}

AddXcomItem {
	index = 5,
	cost = 60,
	name = "CANNON AP-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 12),
	pMap = pck_image("$(xcom)/units/floorob.pck", 8),
	health = 100,
	damage = 72,
	dDeviation = 50,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 0,
	rounds = 6,
	disappear = 0,
	weight = 6,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-cannon-AP-hit",
}

AddXcomItem {
	index = 6,
	cost = 80,
	name = "CANNON HE-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 13),
	pMap = pck_image("$(xcom)/units/floorob.pck", 9),
	health = 100,
	damage = 60,
	dDeviation = 50,
	exploRange = 4,
	smokeRange = 4,
	smokeTime = 2,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 6,
	disappear = 0,
	weight = 6,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-cannon-HE-hit",
}

AddXcomItem {
	index = 7,
	cost = 70,
	name = "CANNON I-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 14),
	pMap = pck_image("$(xcom)/units/floorob.pck", 10),
	health = 100,
	damage = 52,
	dDeviation = 50,
	exploRange = 4,
	smokeRange = 5,
	smokeTime = 2,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 1,
	rounds = 6,
	disappear = 0,
	weight = 6,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-cannon-IN-hit",
}

AddXcomItem {
	index = 8,
	cost = 100,
	name = "AUTO-CANNON",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 7),
	pMap = pck_image("$(xcom)/units/floorob.pck", 7),
	health = 80,
	importance = 16,
	width = 2,
	height = 3,
	ammo = {"AUTO-CANNON AP-AMMO", "AUTO-CANNON HE-AMMO", "AUTO-CANNON I-AMMO"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 32, 8),
	accuracy = {32, 56, 0},
	time = {14, 33, 0},
	autoShots = 3,
	rounds = 10,
	weight = 20,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "cv-auto-cannon-shot",
}

AddXcomItem {
	index = 9,
	cost = 80,
	name = "AUTO-CANNON AP-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 8),
	pMap = pck_image("$(xcom)/units/floorob.pck", 12),
	health = 100,
	damage = 60,
	dDeviation = 50,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 0,
	rounds = 14,
	disappear = 0,
	weight = 5,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-cannon-AP-hit",
}

AddXcomItem {
	index = 10,
	cost = 100,
	name = "AUTO-CANNON HE-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 9),
	pMap = pck_image("$(xcom)/units/floorob.pck", 13),
	health = 100,
	damage = 48,
	dDeviation = 50,
	exploRange = 3,
	smokeRange = 3,
	smokeTime = 2,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 14,
	disappear = 0,
	weight = 5,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-cannon-HE-hit",
}

AddXcomItem {
	index = 11,
	cost = 90,
	name = "AUTO-CANNON I-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 10),
	pMap = pck_image("$(xcom)/units/floorob.pck", 14),
	health = 100,
	damage = 44,
	dDeviation = 50,
	exploRange = 3,
	smokeRange = 4,
	smokeTime = 2,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 1,
	rounds = 14,
	disappear = 0,
	weight = 5,
	isAmmo = 1,
	reloadTime = 15,
	sound = "cv-cannon-IN-hit",
}

AddXcomItem {
	index = 12,
	cost = 100,
	name = "ROCKET LAUNCHER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 15),
	pMap = pck_image("$(xcom)/units/floorob.pck", 15),
	health = 80,
	importance = 18,
	width = 2,
	height = 3,
	ammo = {"SMALL ROCKET", "LARGE ROCKET", "INCENDIARY ROCKET"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 72, 8),
	accuracy = {0, 55, 115},
	time = {0, 45, 75},
	rounds = 10,
	weight = 10,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "rl-launch",
}

AddXcomItem {
	index = 13,
	cost = 200,
	name = "SMALL ROCKET",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 16),
	pMap = pck_image("$(xcom)/units/floorob.pck", 16),
	health = 100,
	damage = 75,
	dDeviation = 50,
	exploRange = 6,
	smokeRange = 6,
	smokeTime = 2,
	importance = 5,
	width = 1,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 80, 8),
	damageType = 2,
	rounds = 1,
	disappear = 1,
	weight = 6,
	isAmmo = 1,
	reloadTime = 15,
	sound = "small-rocket-hit",
}

AddXcomItem {
	index = 14,
	cost = 300,
	name = "LARGE ROCKET",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 17),
	pMap = pck_image("$(xcom)/units/floorob.pck", 17),
	health = 100,
	damage = 100,
	dDeviation = 50,
	exploRange = 7,
	smokeRange = 7,
	smokeTime = 2,
	importance = 6,
	width = 1,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 80, 8),
	damageType = 2,
	rounds = 1,
	disappear = 1,
	weight = 8,
	isAmmo = 1,
	reloadTime = 15,
	sound = "HE-rocket-hit",
}

AddXcomItem {
	index = 15,
	cost = 250,
	name = "INCENDIARY ROCKET",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 18),
	pMap = pck_image("$(xcom)/units/floorob.pck", 18),
	health = 100,
	damage = 90,
	dDeviation = 50,
	exploRange = 6,
	smokeRange = 8,
	smokeTime = 2,
	importance = 7,
	width = 1,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 80, 8),
	damageType = 1,
	rounds = 1,
	disappear = 1,
	weight = 7,
	isAmmo = 1,
	reloadTime = 15,
	sound = "IN-rocket-hit",
}

AddXcomItem {
	index = 16,
	cost = 150,
	name = "LASER PISTOL",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 5),
	pMap = pck_image("$(xcom)/units/floorob.pck", 5),
	health = 70,
	damage = 40,
	dDeviation = 50,
	importance = 4,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 112, 8),
	damageType = 3,
	accuracy = {28, 40, 0},
	time = {6, 20, 0},
	autoShots = 4,
	rounds = 10,
	weight = 6,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	sound = "laser-pistol-shot",
}

AddXcomItem {
	index = 17,
	cost = 250,
	name = "LASER RIFLE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 0),
	pMap = pck_image("$(xcom)/units/floorob.pck", 0),
	health = 70,
	damage = 60,
	dDeviation = 50,
	importance = 7,
	width = 1,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 8, 8),
	damageType = 3,
	accuracy = {46, 65, 100},
	time = {12, 25, 60},
	autoShots = 3,
	rounds = 10,
	weight = 8,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "laser-rifle-shot",
}

AddXcomItem {
	index = 18,
	cost = 300,
	name = "HEAVY LASER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 6),
	pMap = pck_image("$(xcom)/units/floorob.pck", 6),
	health = 70,
	damage = 75,
	dDeviation = 50,
	importance = 12,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 16, 8),
	damageType = 3,
	accuracy = {0, 50, 120},
	time = {0, 33, 66},
	rounds = 10,
	weight = 19,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "laser-heavy-shot",
}

AddXcomItem {
	index = 19,
	cost = 70,
	name = "GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 19),
	pMap = pck_image("$(xcom)/units/floorob.pck", 19),      
	health = 50,
	damage = 50,
	dDeviation = 50,
	exploRange = 3,
	smokeRange = 3,
	smokeTime = 2,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 10,
	weight = 2,
}

AddXcomItem {
	index = 20,
	cost = 20,
	name = "SMOKE GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 20),
	pMap = pck_image("$(xcom)/units/floorob.pck", 20),
	health = 50,
	exploRange = 0,
	smokeRange = 5,
	smokeTime = 4,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 10,
	weight = 2,
}

AddXcomItem {
	index = 21,
	cost = 80,
	name = "PROXIMITY GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 21),
	pMap = pck_image("$(xcom)/units/floorob.pck", 21),
	health = 40,
	damage = 70,
	dDeviation = 50,
	exploRange = 3,
	smokeRange = 3,
	smokeTime = 2,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 10,
	weight = 3,
}

AddXcomItem {
	index = 22,
	cost = 105,
	name = "HIGH EXPLOSIVE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 22),
	pMap = pck_image("$(xcom)/units/floorob.pck", 22),
	health = 40,
	damage = 110,
	dDeviation = 50,
	exploRange = 6,
	smokeRange = 6,
	smokeTime = 2,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 10,
	weight = 6,
}

AddXcomItem {
	index = 23,
	cost = 0,
	name = "MOTION SCANNER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 23),
	pMap = pck_image("$(xcom)/units/floorob.pck", 23),
	health = 20,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	rounds = 10,
	weight = 3,
}

AddXcomItem {
	index = 24,
	cost = 0,
	name = "MEDI-KIT",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 24),
	pMap = pck_image("$(xcom)/units/floorob.pck", 24),
	health = 30,
	importance = 4,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	rounds = 10,
	weight = 5,
}

AddXcomItem {
	index = 25,
	cost = 0,
	name = "PSI-AMP",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 33),
	pMap = pck_image("$(xcom)/units/floorob.pck", 32),
	health = 40,
	importance = 6,
	width = 1,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 88, 8),
	rounds = 10,
	weight = 8,
}

AddXcomItem {
	index = 26,
	cost = 100,
	name = "STUN ROD",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 26),
	pMap = pck_image("$(xcom)/units/floorob.pck", 26),
	health = 80,
	damage = 100,
	dDeviation = 25,
	importance = 6,
	width = 1,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 80, 8),
	damageType = 5,
	rounds = 65,
	weight = 3,
	isWeapon = 1,
	twoHanded = 1,
}

AddXcomItem {
	index = 27,
	cost = 0,
	name = "Flare",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 55),
	pMap = pck_image("$(xcom)/units/floorob.pck", 72),
	health = 100,
	importance = 2,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	weight = 1,
}

AddXcomItem {
	index = 31,
	cost = 0,
	name = "CORPSE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 45),
	pMap = pck_image("$(xcom)/units/floorob.pck", 39),
	health = 20,
	importance = 20,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	weight = 22,
}

AddXcomItem {
	index = 32,
	cost = 0,
	name = "CORPSE & ARMOUR",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 28),
	pMap = pck_image("$(xcom)/units/floorob.pck", 40),
	health = 30,
	importance = 22,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	weight = 24,
}

AddXcomItem {
	index = 33,
	cost = 0,
	name = "CORPSE & POWER SUIT",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 44),
	pMap = pck_image("$(xcom)/units/floorob.pck", 41),
	health = 50,
	importance = 24,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	weight = 26,
}

AddXcomItem {
	index = 34,
	cost = 300,
	name = "Heavy Plasma",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 30),
	pMap = pck_image("$(xcom)/units/floorob.pck", 29),
	health = 60,
	importance = 10,
	width = 2,
	height = 3,
	ammo = {"Heavy Plasma Clip"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 40, 8),
	accuracy = {0, 55, 110},
	time = {0, 30, 55},
	rounds = 10,
	weight = 10,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	isAlien = 1,
	sound = "plasma-heavy-shot",
}

AddXcomItem {
	index = 35,
	cost = 75,
	name = "Heavy Plasma Clip",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 25),
	pMap = pck_image("$(xcom)/units/floorob.pck", 33),
	health = 60,
	damage = 115,
	dDeviation = 25,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 4,
	rounds = 10,
	disappear = 0,
	weight = 3,
	isAmmo = 1,
	reloadTime = 15,
	isAlien = 1,
	sound = "plasma-hit",
}

AddXcomItem {
	index = 36,
	cost = 400,
	name = "Plasma Rifle",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 31),
	pMap = pck_image("$(xcom)/units/floorob.pck", 30),
	health = 60,
	importance = 6,
	width = 1,
	height = 3,
	ammo = {"Plasma Rifle Clip"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 48, 8),
	accuracy = {55, 86, 100},
	time = {12, 30, 60},
	autoShots = 3,
	rounds = 10,
	weight = 5,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	isAlien = 1,
	sound = "plasma-rifle-shot",
}

AddXcomItem {
	index = 37,
	cost = 100,
	name = "Plasma Rifle Clip",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 41),
	pMap = pck_image("$(xcom)/units/floorob.pck", 33),
	health = 60,
	damage = 80,
	dDeviation = 25,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 4,
	rounds = 28,
	disappear = 0,
	weight = 3,
	isAmmo = 1,
	reloadTime = 15,
	isAlien = 1,
	sound = "plasma-hit",
}

AddXcomItem {
	index = 38,
	cost = 170,
	name = "Plasma Pistol",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 32),
	pMap = pck_image("$(xcom)/units/floorob.pck", 31),
	health = 60,
	importance = 4,
	width = 1,
	height = 2,
	ammo = {"Plasma Pistol Clip"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 104, 8),
	accuracy = {50, 65, 0},
	time = {10, 30, 0},
	autoShots = 3,
	rounds = 10,
	weight = 3,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	isAlien = 1,
	sound = "plasma-pistol-shot",
}

AddXcomItem {
	index = 39,
	cost = 40,
	name = "Plasma Pistol Clip",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 34),
	pMap = pck_image("$(xcom)/units/floorob.pck", 33),
	health = 60,
	damage = 52,
	dDeviation = 25,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 4,
	rounds = 26,
	disappear = 0,
	weight = 2,
	isAmmo = 1,
	reloadTime = 15,
	isAlien = 1,
	sound = "plasma-hit",
}

AddXcomItem {
	index = 40,
	cost = 0,
	name = "BLASTER LAUNCHER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 35),
	pMap = pck_image("$(xcom)/units/floorob.pck", 34),
	health = 50,
	importance = 16,
	width = 2,
	height = 3,
	ammo = {"BLASTER BOMB"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 56, 8),
	accuracy = {0, 0, 120},
	time = {0, 0, 80},
	rounds = 10,
	weight = 16,
	isShootable = 1,
	isWeapon = 1,
	twoHanded = 1,
	wayPoints = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 41,
	cost = 0,
	name = "BLASTER BOMB",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 36),
	pMap = pck_image("$(xcom)/units/floorob.pck", 35),     
	health = 60,
	damage = 200,
	dDeviation = 50,
	exploRange = 10,
	smokeRange = 6,
	smokeTime = 2,
	importance = 3,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 1,
	disappear = 1,
	weight = 3,
	isAmmo = 1,
	reloadTime = 15,
	isAlien = 1,
}

AddXcomItem {
	index = 42,
	cost = 100,
	name = "SMALL LAUNCHER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 37),
	pMap = pck_image("$(xcom)/units/floorob.pck", 36),
	health = 60,
	importance = 7,
	width = 2,
	height = 2,
	ammo = {"STUN MISSILE"},
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 64, 8),
	accuracy = {0, 65, 110},
	time = {0, 40, 75},
	rounds = 10,
	weight = 10,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	isAlien = 1,
	sound = "alien-small-launch",
}

AddXcomItem {
	index = 43,
	cost = 80,
	name = "STUN MISSILE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 38),
	pMap = pck_image("$(xcom)/units/floorob.pck", 37),   
	health = 60,
	damage = 90,
	dDeviation = 50,
	exploRange = 4,
	smokeRange = 4,
	smokeTime = 2,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 5,
	rounds = 1,
	disappear = 1,
	weight = 3,
	isAmmo = 1,
	reloadTime = 15,
	isAlien = 1,
}

AddXcomItem {
	index = 44,
	cost = 125,
	name = "ALIEN GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 39),
	pMap = pck_image("$(xcom)/units/floorob.pck", 38),
	health = 60,
	damage = 90,
	dDeviation = 50,
	exploRange = 6,
	smokeRange = 6,
	smokeTime = 2,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	damageType = 2,
	rounds = 10,
	weight = 3,
	isAlien = 1,
}

AddXcomItem {
	index = 45,
	cost = 0,
	name = "ELERIUM-115",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 56),
	pMap = pck_image("$(xcom)/units/floorob.pck", 37),
	health = 5,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	rounds = 10,
	weight = 3,
	isAlien = 1,
}

AddXcomItem {
	index = 46,
	cost = 0,
	name = "MIND PROBE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 29),
	pMap = pck_image("$(xcom)/units/floorob.pck", 28),
	health = 40,
	importance = 7,
	width = 2,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	weight = 5,
	isAlien = 1,
}

AddXcomItem {
	index = 50,
	cost = 0,
	name = "Sectoid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 46),
	pMap = pck_image("$(xcom)/units/floorob.pck", 42),
	health = 5,
	importance = 30,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 30,
}

AddXcomItem {
	index = 51,
	cost = 0,
	name = "Snakeman Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 50),
	pMap = pck_image("$(xcom)/units/floorob.pck", 46),
	health = 25,
	importance = 40,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 40,
}

AddXcomItem {
	index = 52,
	cost = 0,
	name = "Ethereal Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 49),
	pMap = pck_image("$(xcom)/units/floorob.pck", 45),
	health = 5,
	importance = 35,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 25,
}

AddXcomItem {
	index = 53,
	cost = 0,
	name = "Muton Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 48),
	pMap = pck_image("$(xcom)/units/floorob.pck", 44),
	health = 40,
	importance = 40,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 40,
}

AddXcomItem {
	index = 54,
	cost = 0,
	name = "Floater Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 52),
	pMap = pck_image("$(xcom)/units/floorob.pck", 48),
	health = 20,
	importance = 22,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 20,
}

AddXcomItem {
	index = 55,
	cost = 0,
	name = "Celatid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 47),
	pMap = pck_image("$(xcom)/units/floorob.pck", 43),
	health = 5,
	importance = 35,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 35,
}

AddXcomItem {
	index = 56,
	cost = 0,
	name = "Silacoid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 51),
	pMap = pck_image("$(xcom)/units/floorob.pck", 47),
	health = 5,
	importance = 40,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 40,
}

AddXcomItem {
	index = 57,
	cost = 0,
	name = "Chryssalid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 53),
	pMap = pck_image("$(xcom)/units/floorob.pck", 49),
	health = 90,
	importance = 40,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 40,
}

AddXcomItem {
	index = 58,
	cost = 0,
	name = "reaper corpse 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 53),
	pMap = pck_image("$(xcom)/units/floorob.pck", 52),
	health = 80,
	importance = 50,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 50,
}

AddXcomItem {
	index = 59,
	cost = 0,
	name = "reaper corpse 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 49),
	pMap = pck_image("$(xcom)/units/floorob.pck", 55),
	health = 80,
	importance = 50,
	width = 2,
	height = 3,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 0, 8),
	weight = 50,
}

AddXcomItem {
	index = 60,
	cost = 0,
	name = "reaper corpse 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 54),  
	health = 80,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 61,
	cost = 0,
	name = "reaper corpse 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 53),
	health = 80,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 62,
	cost = 0,
	name = "cyber 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 56),        
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 63,
	cost = 0,
	name = "cyber 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 57),
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 64,
	cost = 0,
	name = "cyber 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 58),
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 65,
	cost = 0,
	name = "cyber 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 59),
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 66,
	cost = 0,
	name = "secto 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 60),
	health = 150,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 67,
	cost = 0,
	name = "secto 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 61),
	health = 150,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 68,
	cost = 0,
	name = "secto 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 62),
	health = 150,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 69,
	cost = 0,
	name = "secto 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 63),
	health = 150,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 70,
	cost = 0,
	name = "hover 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 64),
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 71,
	cost = 0,
	name = "hover 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 65), 
	health = 100,        
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 72,
	cost = 0,
	name = "hover 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 66),
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 73,
	cost = 0,
	name = "hover 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 67),
	health = 100,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 74,
	cost = 0,
	name = "TANK1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 68),
	health = 80,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 75,
	cost = 0,
	name = "TANK 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 69),
	health = 80,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 76,
	cost = 0,
	name = "TANK 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 70),
	health = 80,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 77,
	cost = 0,
	name = "TANK 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 71),
	health = 80,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 50,
}

AddXcomItem {
	index = 78,
	cost = 0,
	name = "CIVM",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 50),
	health = 20,
	importance = 30,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 96, 8),
	weight = 30,
}

AddXcomItem {
	index = 79,
	cost = 0,
	name = "CIVF",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 51),
	health = 20,
	importance = 50,
	width = 1,
	height = 2,
	pHeld = pck_image_set("$(xcom)/units/handob.pck", 120, 8),
	weight = 50,
}
