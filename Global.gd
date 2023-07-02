extends Node

const CHARACTER_SPEED_MARS_OUTDOORS: float = 150.0
const CHARACTER_JUMP_MARS_OUTDOORS: float = -400.0
var GRAVITY_EARTH: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var GRAVITY_MARS: float = GRAVITY_EARTH / 2.64

const RADIATION_MARS: int = 100
const CHARACTER_MAX_HEALTH: int = 100
const CHARACTER_MAX_STRENGTH: int = 100
