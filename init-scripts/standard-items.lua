AddXcomItem {
	index = 0,
	cost = 51,
	name = "PISTOL",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 3),
	importance = 5,
	width = 1,
	height = 2,
	ammo = {"PISTOL CLIP"},
	pHeld = 12,
	accuracy = {0, 60, 78},
	time = {0, 18, 30},
	rounds = 8,
	weight = 5,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	sound = "cv-pistol-shot",
}

AddXcomItem {
	index = 1,
	cost = 51,
	name = "PISTOL CLIP",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 4),
	pMap = pck_image("$(xcom)/units/floorob.pck", 4),
	damage = 26,
	importance = 3,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 0,
	rounds = 12,
	weight = 3,
	isAmmo = 1,
	sound = "cv-bullet-hit",
}

AddXcomItem {
	index = 2,
	cost = 68,
	name = "RIFLE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 1),
	pMap = pck_image("$(xcom)/units/floorob.pck", 1),
	importance = 6,
	width = 1,
	height = 3,
	ammo = {"RIFLE CLIP"},
	pHeld = 0,
	accuracy = {35, 60, 110},
	time = {35, 25, 80},
	rounds = 10,
	weight = 8,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "cv-rifle-shot",
}

AddXcomItem {
	index = 3,
	cost = 68,
	name = "RIFLE CLIP",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 2),
	pMap = pck_image("$(xcom)/units/floorob.pck", 2),
	damage = 30,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 0,
	rounds = 20,
	weight = 3,
	isAmmo = 1,
	sound = "cv-bullet-hit",
}

AddXcomItem {
	index = 4,
	cost = 50,
	name = "HEAVY CANNON",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 11),
	pMap = pck_image("$(xcom)/units/floorob.pck", 11),
	importance = 14,
	width = 2,
	height = 3,
	ammo = {"CANNON AP-AMMO", "CANNON HE-AMMO", "CANNON I-AMMO"},
	pHeld = 3,
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
	cost = 50,
	name = "CANNON AP-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 12),
	pMap = pck_image("$(xcom)/units/floorob.pck", 8),
	damage = 56,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
	damageType = 0,
	rounds = 6,
	weight = 6,
	isAmmo = 1,
	sound = "cv-cannon-AP-hit",
}

AddXcomItem {
	index = 6,
	cost = 50,
	name = "CANNON HE-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 13),
	pMap = pck_image("$(xcom)/units/floorob.pck", 9),
	damage = 52,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
	damageType = 2,
	rounds = 6,
	weight = 6,
	isAmmo = 1,
	sound = "cv-cannon-HE-hit",
}

AddXcomItem {
	index = 7,
	cost = 50,
	name = "CANNON I-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 14),
	pMap = pck_image("$(xcom)/units/floorob.pck", 10),
	damage = 60,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
	damageType = 1,
	rounds = 6,
	weight = 6,
	isAmmo = 1,
	sound = "cv-cannon-IN-hit",
}

AddXcomItem {
	index = 8,
	cost = 75,
	name = "AUTO-CANNON",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 7),
	pMap = pck_image("$(xcom)/units/floorob.pck", 7),
	importance = 16,
	width = 2,
	height = 3,
	ammo = {"AUTO-CANNON AP-AMMO", "AUTO-CANNON HE-AMMO", "AUTO-CANNON I-AMMO"},
	pHeld = 4,
	accuracy = {32, 56, 82},
	time = {40, 33, 80},
	rounds = 10,
	weight = 19,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "cv-auto-cannon-shot",
}

AddXcomItem {
	index = 9,
	cost = 75,
	name = "AUTO-CANNON AP-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 8),
	pMap = pck_image("$(xcom)/units/floorob.pck", 12),
	damage = 42,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
	damageType = 0,
	rounds = 14,
	weight = 5,
	isAmmo = 1,
	sound = "cv-cannon-AP-hit",
}

AddXcomItem {
	index = 10,
	cost = 75,
	name = "AUTO-CANNON HE-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 9),
	pMap = pck_image("$(xcom)/units/floorob.pck", 13),
	damage = 44,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
	damageType = 2,
	rounds = 14,
	weight = 5,
	isAmmo = 1,
	sound = "cv-cannon-HE-hit",
}

AddXcomItem {
	index = 11,
	cost = 75,
	name = "AUTO-CANNON I-AMMO",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 10),
	pMap = pck_image("$(xcom)/units/floorob.pck", 14),
	damage = 48,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
	damageType = 1,
	rounds = 14,
	weight = 5,
	isAmmo = 1,
	sound = "cv-cannon-IN-hit",
}

AddXcomItem {
	index = 12,
	cost = 72,
	name = "ROCKET LAUNCHER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 15),
	pMap = pck_image("$(xcom)/units/floorob.pck", 15),
	importance = 18,
	width = 2,
	height = 3,
	ammo = {"SMALL ROCKET", "LARGE ROCKET", "INCENDIARY ROCKET"},
	pHeld = 9,
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
	cost = 72,
	name = "SMALL ROCKET",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 16),
	pMap = pck_image("$(xcom)/units/floorob.pck", 16),
	damage = 75,
	importance = 5,
	width = 1,
	height = 3,
	pHeld = 10,
	damageType = 2,
	rounds = 1,
	weight = 6,
	isAmmo = 1,
	twoHanded = 1,
	sound = "small-rocket-hit",
}

AddXcomItem {
	index = 14,
	cost = 72,
	name = "LARGE ROCKET",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 17),
	pMap = pck_image("$(xcom)/units/floorob.pck", 17),
	damage = 100,
	importance = 6,
	width = 1,
	height = 3,
	pHeld = 10,
	damageType = 2,
	rounds = 1,
	weight = 8,
	isAmmo = 1,
	twoHanded = 1,
	sound = "HE-rocket-hit",
}

AddXcomItem {
	index = 15,
	cost = 72,
	name = "INCENDIARY ROCKET",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 18),
	pMap = pck_image("$(xcom)/units/floorob.pck", 18),
	damage = 90,
	importance = 7,
	width = 1,
	height = 3,
	pHeld = 10,
	damageType = 1,
	rounds = 1,
	weight = 8,
	isAmmo = 1,
	twoHanded = 1,
	sound = "IN-rocket-hit",
}

AddXcomItem {
	index = 16,
	cost = 101,
	name = "LASER PISTOL",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 5),
	pMap = pck_image("$(xcom)/units/floorob.pck", 5),
	damage = 46,
	importance = 4,
	width = 1,
	height = 2,
	pHeld = 14,
	damageType = 3,
	accuracy = {28, 40, 68},
	time = {25, 20, 55},
	rounds = 10,
	weight = 7,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	sound = "laser-pistol-shot",
}

AddXcomItem {
	index = 17,
	cost = 173,
	name = "LASER GUN",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 0),
	pMap = pck_image("$(xcom)/units/floorob.pck", 0),
	damage = 60,
	importance = 7,
	width = 1,
	height = 3,
	pHeld = 1,
	damageType = 3,
	accuracy = {46, 65, 100},
	time = {34, 25, 50},
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
	cost = 75,
	name = "HEAVY LASER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 6),
	pMap = pck_image("$(xcom)/units/floorob.pck", 6),
	damage = 85,
	importance = 12,
	width = 2,
	height = 3,
	pHeld = 2,
	damageType = 3,
	accuracy = {0, 50, 84},
	time = {0, 33, 75},
	rounds = 10,
	weight = 18,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	sound = "laser-heavy-shot",
}

AddXcomItem {
	index = 19,
	cost = 50,
	name = "GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 19),
	pMap = pck_image("$(xcom)/units/floorob.pck", 19),
	damage = 50,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 2,
	rounds = 10,
	weight = 3,
}

AddXcomItem {
	index = 20,
	cost = 30,
	name = "SMOKE GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 20),
	pMap = pck_image("$(xcom)/units/floorob.pck", 20),
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 2,
	rounds = 10,
	weight = 3,
}

AddXcomItem {
	index = 21,
	cost = 30,
	name = "PROXIMITY GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 21),
	pMap = pck_image("$(xcom)/units/floorob.pck", 21),
	damage = 70,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 2,
	rounds = 10,
	weight = 3,
}

AddXcomItem {
	index = 22,
	cost = 110,
	name = "HIGH EXPLOSIVE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 22),
	pMap = pck_image("$(xcom)/units/floorob.pck", 22),
	damage = 110,
	importance = 4,
	width = 2,
	height = 1,
	pHeld = 15,
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
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	rounds = 10,
	weight = 3,
}

AddXcomItem {
	index = 24,
	cost = 0,
	name = "MEDI-KIT",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 24),
	pMap = pck_image("$(xcom)/units/floorob.pck", 24),
	importance = 4,
	width = 1,
	height = 2,
	pHeld = 15,
	rounds = 10,
	weight = 5,
}

AddXcomItem {
	index = 25,
	cost = 0,
	name = "PSI-AMP",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 33),
	pMap = pck_image("$(xcom)/units/floorob.pck", 32),
	importance = 6,
	width = 1,
	height = 3,
	pHeld = 11,
	rounds = 10,
	weight = 8,
	twoHanded = 1,
}

AddXcomItem {
	index = 26,
	cost = 100,
	name = "STUN ROD",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 26),
	pMap = pck_image("$(xcom)/units/floorob.pck", 26),
	damage = 100,
	importance = 6,
	width = 1,
	height = 3,
	pHeld = 10,
	damageType = 5,
	rounds = 65,
	weight = 6,
	isWeapon = 1,
	twoHanded = 1,
}

AddXcomItem {
	index = 27,
	cost = 0,
	name = "Flare",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 55),
	pMap = pck_image("$(xcom)/units/floorob.pck", 72),
	importance = 2,
	width = 1,
	height = 1,
	pHeld = 15,
	weight = 3,
}

AddXcomItem {
	index = 31,
	cost = 0,
	name = "CORPSE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 45),
	pMap = pck_image("$(xcom)/units/floorob.pck", 39),
	importance = 20,
	width = 2,
	height = 3,
	pHeld = 15,
	weight = 22,
	twoHanded = 1,
}

AddXcomItem {
	index = 32,
	cost = 0,
	name = "CORPSE & ARMOUR",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 28),
	pMap = pck_image("$(xcom)/units/floorob.pck", 40),
	importance = 22,
	width = 2,
	height = 3,
	pHeld = 15,
	weight = 24,
	twoHanded = 1,
}

AddXcomItem {
	index = 33,
	cost = 0,
	name = "CORPSE & POWER SUIT",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 44),
	pMap = pck_image("$(xcom)/units/floorob.pck", 41),
	importance = 24,
	width = 2,
	height = 3,
	pHeld = 15,
	weight = 26,
}

AddXcomItem {
	index = 34,
	cost = 166,
	name = "Heavy Plasma",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 30),
	pMap = pck_image("$(xcom)/units/floorob.pck", 29),
	importance = 10,
	width = 2,
	height = 3,
	ammo = {"Heavy Plasma Clip"},
	pHeld = 5,
	accuracy = {0, 75, 110},
	time = {0, 30, 60},
	rounds = 10,
	weight = 8,
	isShootable = 1,
	isWeapon = 1,
	isGun = 1,
	twoHanded = 1,
	isAlien = 1,
	sound = "plasma-heavy-shot",
}

AddXcomItem {
	index = 35,
	cost = 166,
	name = "Heavy Plasma Clip",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 25),
	pMap = pck_image("$(xcom)/units/floorob.pck", 33),
	damage = 115,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 4,
	rounds = 35,
	weight = 3,
	isAmmo = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 36,
	cost = 243,
	name = "Plasma Rifle",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 31),
	pMap = pck_image("$(xcom)/units/floorob.pck", 30),
	importance = 6,
	width = 1,
	height = 3,
	ammo = {"Plasma Rifle Clip"},
	pHeld = 6,
	accuracy = {55, 86, 100},
	time = {36, 30, 60},
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
	cost = 243,
	name = "Plasma Rifle Clip",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 41),
	pMap = pck_image("$(xcom)/units/floorob.pck", 33),
	damage = 80,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 4,
	rounds = 28,
	weight = 3,
	isAmmo = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 38,
	cost = 149,
	name = "Plasma Pistol",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 32),
	pMap = pck_image("$(xcom)/units/floorob.pck", 31),
	importance = 4,
	width = 1,
	height = 2,
	ammo = {"Plasma Pistol Clip"},
	pHeld = 13,
	accuracy = {50, 65, 85},
	time = {30, 30, 60},
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
	cost = 149,
	name = "Plasma Pistol Clip",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 34),
	pMap = pck_image("$(xcom)/units/floorob.pck", 33),
	damage = 52,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 4,
	rounds = 26,
	weight = 3,
	isAmmo = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 40,
	cost = 100,
	name = "BLASTER LAUNCHER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 35),
	pMap = pck_image("$(xcom)/units/floorob.pck", 34),
	importance = 16,
	width = 2,
	height = 3,
	ammo = {"BLASTER BOMB"},
	pHeld = 7,
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
	cost = 100,
	name = "BLASTER BOMB",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 36),
	pMap = pck_image("$(xcom)/units/floorob.pck", 35),
	damage = 200,
	importance = 3,
	width = 1,
	height = 2,
	pHeld = 15,
	damageType = 2,
	rounds = 1,
	weight = 3,
	isAmmo = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 42,
	cost = 93,
	name = "SMALL LAUNCHER",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 37),
	pMap = pck_image("$(xcom)/units/floorob.pck", 36),
	importance = 7,
	width = 2,
	height = 2,
	ammo = {"STUN MISSILE"},
	pHeld = 8,
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
	cost = 93,
	name = "STUN MISSILE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 38),
	pMap = pck_image("$(xcom)/units/floorob.pck", 37),
	damage = 90,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
	damageType = 5,
	rounds = 1,
	weight = 3,
	isAmmo = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 44,
	cost = 90,
	name = "ALIEN GRENADE",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 39),
	pMap = pck_image("$(xcom)/units/floorob.pck", 38),
	damage = 90,
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
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
	importance = 1,
	width = 1,
	height = 1,
	pHeld = 15,
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
	importance = 7,
	width = 2,
	height = 2,
	pHeld = 15,
	weight = 5,
	twoHanded = 1,
	isAlien = 1,
}

AddXcomItem {
	index = 50,
	cost = 0,
	name = "Sectoid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 46),
	pMap = pck_image("$(xcom)/units/floorob.pck", 42),
	importance = 30,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 30,
	twoHanded = 1,
}

AddXcomItem {
	index = 51,
	cost = 0,
	name = "Snakeman Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 50),
	pMap = pck_image("$(xcom)/units/floorob.pck", 46),
	importance = 40,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 40,
	twoHanded = 1,
}

AddXcomItem {
	index = 52,
	cost = 0,
	name = "Ethereal Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 49),
	pMap = pck_image("$(xcom)/units/floorob.pck", 45),
	importance = 35,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 25,
	twoHanded = 1,
}

AddXcomItem {
	index = 53,
	cost = 0,
	name = "Muton Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 48),
	pMap = pck_image("$(xcom)/units/floorob.pck", 44),
	importance = 40,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 40,
	twoHanded = 1,
}

AddXcomItem {
	index = 54,
	cost = 0,
	name = "Floater Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 52),
	pMap = pck_image("$(xcom)/units/floorob.pck", 48),
	importance = 22,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 20,
	twoHanded = 1,
}

AddXcomItem {
	index = 55,
	cost = 0,
	name = "Celatid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 47),
	pMap = pck_image("$(xcom)/units/floorob.pck", 43),
	importance = 35,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 35,
	twoHanded = 1,
}

AddXcomItem {
	index = 56,
	cost = 0,
	name = "Silacoid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 51),
	pMap = pck_image("$(xcom)/units/floorob.pck", 47),
	importance = 40,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 40,
	twoHanded = 1,
}

AddXcomItem {
	index = 57,
	cost = 0,
	name = "Chryssalid Corpse",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 53),
	pMap = pck_image("$(xcom)/units/floorob.pck", 49),
	importance = 40,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 40,
	twoHanded = 1,
}

AddXcomItem {
	index = 58,
	cost = 0,
	name = "reaper corpse 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 53),
	pMap = pck_image("$(xcom)/units/floorob.pck", 52),
	importance = 50,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 50,
	twoHanded = 1,
}

AddXcomItem {
	index = 59,
	cost = 0,
	name = "reaper corpse 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 49),
	pMap = pck_image("$(xcom)/units/floorob.pck", 55),
	importance = 50,
	width = 2,
	height = 3,
	pHeld = 0,
	weight = 50,
	twoHanded = 1,
}

AddXcomItem {
	index = 60,
	cost = 0,
	name = "reaper corpse 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 54),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
	twoHanded = 1,
}

AddXcomItem {
	index = 61,
	cost = 0,
	name = "reaper corpse 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 53),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
	twoHanded = 1,
}

AddXcomItem {
	index = 62,
	cost = 0,
	name = "cyber 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 56),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 63,
	cost = 0,
	name = "cyber 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 57),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 64,
	cost = 0,
	name = "cyber 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 58),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 65,
	cost = 0,
	name = "cyber 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 59),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 66,
	cost = 0,
	name = "secto 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 60),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 67,
	cost = 0,
	name = "secto 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 61),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 68,
	cost = 0,
	name = "secto 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 62),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 69,
	cost = 0,
	name = "secto 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 63),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 70,
	cost = 0,
	name = "hover 1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 64),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 71,
	cost = 0,
	name = "hover 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 65),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 72,
	cost = 0,
	name = "hover 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 66),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 73,
	cost = 0,
	name = "hover 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 67),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 74,
	cost = 0,
	name = "TANK1",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 68),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 75,
	cost = 0,
	name = "TANK 2",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 69),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 76,
	cost = 0,
	name = "TANK 3",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 70),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 77,
	cost = 0,
	name = "TANK 4",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 71),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 50,
}

AddXcomItem {
	index = 78,
	cost = 0,
	name = "CIVM",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 50),
	importance = 30,
	width = 1,
	height = 2,
	pHeld = 12,
	weight = 30,
}

AddXcomItem {
	index = 79,
	cost = 0,
	name = "CIVF",
	pInv = pck_image("$(xcom)/units/bigobs.pck", 3),
	pMap = pck_image("$(xcom)/units/floorob.pck", 51),
	importance = 50,
	width = 1,
	height = 2,
	pHeld = 15,
	weight = 50,
}
