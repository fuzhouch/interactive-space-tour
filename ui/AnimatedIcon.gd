extends AnimatedSprite2D

@export var animation_icon_name = "suite_on"

signal icon_changed(icon_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    self.play(animation_icon_name)


func _on_icon_changed(icon_name) -> void:
    animation_icon_name = icon_name
