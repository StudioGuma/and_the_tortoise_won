class_name Tortoise
extends CharacterBody2D

var _tortoise_sprite: AnimatedSprite2D

func _init() -> void:
	set_motion_mode(MOTION_MODE_FLOATING)

func _ready() -> void:
	_tortoise_sprite = get_child(0)
	set_position(Vector2i(
		Globals.SCREEN_SIZE.x >> 0b10, Globals.SCREEN_SIZE.y - (Globals.SCREEN_SIZE.y >> 0b11)
	))

func _physics_process(_delta: float) -> void:
	if (
		Main.get_singleton().get_map_key().contains("map_111")
		or Main.get_singleton().get_map_key() == "map_1_loop4"
	):
		_tortoise_sprite.play("down")

	else:
		set_position(get_position() - Vector2(0, 0.03125))
		_tortoise_sprite.play("up_walk")
