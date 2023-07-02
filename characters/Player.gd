extends CharacterBody2D

# =====================================================================
# Character physics
# =====================================================================
var speed: float = Global.CHARACTER_SPEED_MARS_OUTDOORS
var jump_velocity: float = Global.CHARACTER_JUMP_MARS_OUTDOORS
var gravity: float = Global.GRAVITY_MARS
var radiation: int = Global.GRAVITY_EARTH
# =====================================================================
# Character health
# =====================================================================
var health: int = Global.CHARACTER_MAX_HEALTH
var strength: int = Global.CHARACTER_MAX_STRENGTH
var starving: bool = false

@export var is_suite_on: bool = true
const RADIATION_SAFE_LINE: int = 20
const RADIATION_SUITE_PROTECTION: int = 99
const RADIATION_NOSUITE_PROTECTION: int = 10
 # 0-100, 100 = no radiation damage, see _on_health_check_timer_timeout()
var radiation_protection: int = RADIATION_SUITE_PROTECTION
# =====================================================================
# Character status
# =====================================================================
const STATUS_IDLE: int = 0
const STATUS_WALK: int = 1
const STATUS_JUMP: int = 2
const STATUS_DIE: int = 3
const STATUS_NOSUITE_IDLE: int = 4
const STATUS_NOSUITE_WALK: int = 5
const STATUS_NOSUITE_JUMP: int = 6
const STATUS_NOSUITE_DIE: int = 7
var action_status: int = STATUS_IDLE
var action_animation: Array = [
    "idle", "walk", "jump", "die",
    "nosuite_idle", "nosuite_walk", "nosuite_jump", "nosuite_die"
]

# =====================================================================
# Character interaction
# =====================================================================
signal health_changed(health_point_delta)
signal strength_changed(strength_delta)
signal suite_changed(suite_on)
signal env_radiation_changed(new_radiation_value)
signal env_gravity_changed(new_gravity_value)
# =====================================================================
# Action processors
# =====================================================================
func _is_left(direction: float) -> bool:
    return direction < 0

func _is_right(direction: float) -> bool:
    return direction > 0

func _adjust_walk_speed() -> void:
    # Character's strenth decides how fast our player can move
    velocity.x = velocity.x * (strength / 100.0)

func _adjust_health_by_env() -> void:
    pass

func _check_health() -> void:
    if health <= 0:
        if is_suite_on:
            action_status = STATUS_DIE
        else:
            action_status = STATUS_NOSUITE_DIE
        velocity.x = 0
        $HealthCheckTimer.stop()

func _physics_process(delta: float) -> void:

    var direction = Input.get_axis("ui_left", "ui_right")
    if direction:
        velocity.x = direction * speed
        if is_suite_on:
            action_status = STATUS_WALK
        else:
            action_status = STATUS_NOSUITE_WALK
    else:
        velocity.x = move_toward(velocity.x, 0, speed)
        if is_suite_on:
            action_status = STATUS_IDLE
        else:
            action_status = STATUS_NOSUITE_IDLE

    if not is_on_floor():
        velocity.y += gravity * delta
        if is_suite_on:
            action_status = STATUS_JUMP
        else:
            action_status = STATUS_NOSUITE_JUMP

    # Let's leave ui_accept (space) for interaction.
    if Input.is_action_just_pressed("ui_up") and is_on_floor():
        velocity.y = jump_velocity

    _adjust_walk_speed()
    _check_health()
    move_and_slide()

    $AnimatedSprite2D.flip_h = _is_left(direction)
    $AnimatedSprite2D.play(action_animation[action_status])

func _on_animated_sprite_2d_animation_finished() -> void:
    if action_status == STATUS_DIE or action_status == STATUS_NOSUITE_DIE:
        queue_free()

# =====================================================================
# Response to in-scene interaction
# =====================================================================

func _on_health_check_timer_timeout() -> void:
    var health_lost: int = 0
    if radiation - radiation_protection >= RADIATION_SAFE_LINE:
        health_lost += 10
    if starving:
        health_lost += 1
    if health_lost > 0:
        self.emit_signal("health_changed", -health_lost)

func _on_health_changed(health_point_delta: int) -> void:
    health += health_point_delta

func _on_strength_changed(strength_delta) -> void:
    if strength + strength_delta <= 5:
        strength = 5 # We allow a minimal movement.
        starving = true # But start costing health
    else:
        strength += strength_delta
        starving = false

func _on_suite_changed(suite_on: bool) -> void:
    is_suite_on = suite_on
    if is_suite_on:
        radiation_protection = RADIATION_SUITE_PROTECTION
    else:
        radiation_protection = RADIATION_NOSUITE_PROTECTION

func _on_env_radiation_changed(new_radiation_value: int) -> void:
    radiation = new_radiation_value


func _on_env_gravity_changed(new_gravity_value: int) -> void:
    gravity = new_gravity_value
