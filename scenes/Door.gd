extends Area2D

const STATUS_IDLE: int = 0
const STATUS_DETECTED: int = 1
const STATUS_OPEN: int = 2
const STATUS_CLOSE: int = 3
const STATUS_WELCOME: int = 4
var action_status = STATUS_IDLE
var animation_status = ["idle", "detected", "open", "close", "welcome"]

signal door_open_requested(player)

# =====================================================================
# Action processors
# =====================================================================

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    $AnimatedSprite2D.play(animation_status[action_status])

# =====================================================================
# Response to in-scene interaction
# =====================================================================

func _on_body_entered(player: Node2D) -> void:
    action_status = STATUS_DETECTED
    player.emit_signal("door_area_entered", self)

func _on_body_exited(player: Node2D) -> void:
    if action_status == STATUS_OPEN or action_status == STATUS_WELCOME:
        action_status = STATUS_CLOSE
    player.emit_signal("door_area_exited", self)

func _on_animated_sprite_2d_animation_finished() -> void:
    if action_status == STATUS_CLOSE:
        action_status = STATUS_IDLE
    elif action_status == STATUS_OPEN:
        action_status = STATUS_WELCOME

func _on_door_open_requested(player) -> void:
    if action_status == STATUS_DETECTED:
        action_status = STATUS_OPEN
