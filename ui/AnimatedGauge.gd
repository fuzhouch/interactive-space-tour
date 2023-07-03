extends AnimatedSprite2D

@export var reverse_display: bool = false

var gauge: int = 100
var gauge_animation: String = "percentage_100"
signal gauge_updated(new_value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _on_gauge_updated(new_value: int) -> void:
    if new_value < 0:
        new_value = 0
    if new_value > 100:
        new_value = 100

    gauge = new_value
    if gauge == 0:
        if reverse_display:
            gauge_animation = "reverse_percentage_00"
        else:
            gauge_animation = "percentage_00"
    elif gauge > 0 and gauge <= 10:
        if reverse_display:
            gauge_animation = "reverse_percentage_10"
        else:
            gauge_animation = "percentage_10"
    elif gauge > 10 and gauge <= 20:
        if reverse_display:
            gauge_animation = "reverse_percentage_20"
        else:
            gauge_animation = "percentage_20"
    elif gauge > 20 and gauge <= 30:
        if reverse_display:
            gauge_animation = "reverse_percentage_30"
        else:
            gauge_animation = "percentage_30"
    elif gauge > 30 and gauge <= 40:
        if reverse_display:
            gauge_animation = "reverse_percentage_40"
        else:
            gauge_animation = "percentage_40"
    elif gauge > 40 and gauge <= 50:
        if reverse_display:
            gauge_animation = "reverse_percentage_50"
        else:
            gauge_animation = "percentage_50"
    elif gauge > 50 and gauge <= 60:
        if reverse_display:
            gauge_animation = "reverse_percentage_60"
        else:
            gauge_animation = "percentage_60"
    elif gauge > 60 and gauge <= 70:
        if reverse_display:
            gauge_animation = "reverse_percentage_70"
        else:
            gauge_animation = "percentage_70"
    elif gauge > 70 and gauge <= 80:
        if reverse_display:
            gauge_animation = "reverse_percentage_80"
        else:
            gauge_animation = "percentage_80"
    elif gauge > 70 and gauge <= 90:
        if reverse_display:
            gauge_animation = "reverse_percentage_90"
        else:
            gauge_animation = "percentage_90"
    elif gauge > 90:
        if reverse_display:
            gauge_animation = "reverse_percentage_100"
        else:
            gauge_animation = "percentage_100"
    self.play(gauge_animation)
