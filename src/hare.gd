class_name Hare
extends CharacterBody2D

var _hare_sprite: AnimatedSprite2D

var _collided: bool
var _collided_prev: bool

var _speed: int = 0b100000000

func _ready() -> void:
	_hare_sprite = get_child(0)

func _process(_delta: float) -> void:
	if not (Main.get_singleton().is_dialogue()):
		if (Input.is_action_just_released("down")):
			_hare_sprite.play("down")

		elif (Input.is_action_just_released("up")):
			_hare_sprite.play("up")

		elif (Input.is_action_just_released("right")):
			_hare_sprite.set_flip_h(false)
			_hare_sprite.play("side")

		elif (Input.is_action_just_released("left")):
			_hare_sprite.set_flip_h(true)
			_hare_sprite.play("side")

		if (Input.is_action_pressed("down")):
			_hare_sprite.play("down_run")

		elif (Input.is_action_pressed("up")):
			_hare_sprite.play("up_run")

		elif (Input.is_action_pressed("right")):
			_hare_sprite.set_flip_h(false)
			_hare_sprite.play("side_run")

		elif (Input.is_action_pressed("left")):
			_hare_sprite.set_flip_h(true)
			_hare_sprite.play("side_run")

func _physics_process(_delta: float) -> void:
	if not (Main.get_singleton().is_dialogue()):
		_collided_prev = _collided
		_collided = false

		set_velocity(Input.get_vector("left", "right", "up", "down")*_speed)
		_collided = move_and_slide()

		if (_collided and not _collided_prev):
			Main.get_singleton().play_sound("sfx_bonk")

		if (get_position().x < 0):
			set_position(Vector2(
				get_position().x + Globals.SCREEN_SIZE.x,
				get_position().y
			))

			Main.get_singleton().set_map(Main.get_singleton().get_left_map())

		elif (get_position().x > Globals.SCREEN_SIZE.x):
			set_position(Vector2(
				get_position().x - Globals.SCREEN_SIZE.x,
				get_position().y
			))

			Main.get_singleton().set_map(Main.get_singleton().get_right_map())

		if (get_position().y < 0):
			set_position(Vector2(
				get_position().x,
				get_position().y + Globals.SCREEN_SIZE.y
			))

			Main.get_singleton().set_map(Main.get_singleton().get_top_map())

		elif (get_position().y >= Globals.SCREEN_SIZE.y):
			set_position(Vector2(
				get_position().x,
				get_position().y - Globals.SCREEN_SIZE.y
			))

			Main.get_singleton().set_map(Main.get_singleton().get_bottom_map())

		if (abs((get_position().y as int) - (Globals.SCREEN_SIZE.y >> 1)) < 0b10000):
			Main.get_singleton().init_map_scene()

func get_hare_sprite() -> AnimatedSprite2D:
	return _hare_sprite

func half_speed() -> void:
	_speed = _speed >> 1
