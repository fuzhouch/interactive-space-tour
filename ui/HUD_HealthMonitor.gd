extends CanvasLayer

var player: Node2D = null
var suited: bool = true
signal player_connected(new_player)

signal health_updated(new_value)
signal strength_updated(new_value)
signal radiation_env_updated(new_value)
signal radiation_to_human_updated(new_value)

func _on_health_updated(new_value) -> void:
    $Panel/Gauge_Health.emit_signal("gauge_updated", new_value)

func _on_strength_updated(new_value: int) -> void:
    $Panel/Gauge_Strength.emit_signal("gauge_updated", new_value)

func _on_radiation_to_human_updated(new_value) -> void:
    $Panel/Gauge_Radiation_ToHuman.emit_signal("gauge_updated", new_value)

func _on_radiation_env_updated(new_value) -> void:
    $Panel/Gauge_Radiation_Env.emit_signal("gauge_updated", new_value)

# TOOD
# For an unknown reason, we can't put UserInput_SuiteOff
# in range of Panel. It appears Panel "accepts" all mouse click
# event and DOES NOT pass to child items. This may caused by
# some unknown knowledge when mixing use of Godot's Control and Node
# systems.
#
# I can't really find a fix here. A workaround should be available
# by using a picture as background instead of a Panel. I didn't do
# it just because it's a bit crumbsome when more UI elements are added.
func _on_user_input_suite_off_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if event is InputEventMouseButton and event.is_pressed():
        if player != null:
            suited = not suited
            player.emit_signal("suite_changed", suited)
            if suited:
                $Panel/Icon_Suite.emit_signal("icon_changed", "suite_on")
            else:
                $Panel/Icon_Suite.emit_signal("icon_changed", "suite_off")
  
func _on_player_connected(new_player: Node2D) -> void:
    player = new_player
