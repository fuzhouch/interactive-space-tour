extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    $Player.emit_signal("env_radiation_changed", Global.RADIATION_MARS)
    $Player.emit_signal("env_gravity_changed", Global.GRAVITY_MARS)
    $Player.emit_signal("strength_changed", -50)
