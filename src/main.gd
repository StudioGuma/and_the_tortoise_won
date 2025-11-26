# And the Tortoise Won
# Copyright (C) 2025 StudioGuma

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

class_name Main
extends Node

static var _singleton: Main = null

var _hare: Hare
var _tortoise: Tortoise

var _dialogue: bool
var _cur_state: Globals.State
var _fullscreen: bool = true

var _main_text_box: Label
var _title_screen: TileMapLayer

var _cur_map: TileMapLayer
var _map_key: String
var _right_map: String
var _left_map: String
var _top_map: String
var _bottom_map: String

var _dialogue_key: String
var _dialogue_idx: int
var _triggers: int

var _sound_player: AudioStreamPlayer = AudioStreamPlayer.new()
var _music_player: AudioStreamPlayer = AudioStreamPlayer.new()
var _music_key: String

func _init() -> void:
	if (_singleton == null or _singleton == self):
		_singleton = self

		add_child(_sound_player)
		add_child(_music_player)

		print("And the Tortoise Won v1.1 by StudioGuma")
		print("https://godotengine.org/license")

	else:
		queue_free()

func _ready() -> void:
	set_state(Globals.State.TITLE_STATE)

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_PREDELETE:
			print_orphan_nodes()

		NOTIFICATION_WM_CLOSE_REQUEST:
			queue_free()
			get_tree().quit()

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("fullscreen")):
		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_WINDOWED if (_fullscreen)
			else DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
		)
		_fullscreen = not _fullscreen

	if (Input.is_action_just_pressed("confirm") or Input.is_action_pressed("cancel")):
		if (_cur_state == Globals.State.TITLE_STATE):
			set_state(Globals.State.GAME_STATE)
		elif (is_dialogue()):
			step_dialogue(_dialogue_key)

static func get_singleton() -> Main:
	if (_singleton == null):
		_singleton = Main.new()

	return _singleton

func is_dialogue() -> bool:
	return _dialogue

func set_dialogue(opt: bool) -> void:
	_dialogue = opt
	_main_text_box.set_visible(_dialogue)

func set_state(state: Globals.State) -> void:
	_cur_state = state

	match _cur_state:
		Globals.State.TITLE_STATE:
			_title_screen = preload("res://map/map_title_screen.tscn").instantiate()
			add_child(_title_screen)

			play_music("mus_lost")

		Globals.State.GAME_STATE:
			_title_screen.queue_free()
			_title_screen = null

			_hare = preload("res://src/hare.tscn").instantiate()
			add_child(_hare)
			_tortoise = preload("res://src/tortoise.tscn").instantiate()
			add_child(_tortoise)

			_main_text_box = preload("res://src/text_box.tscn").instantiate()
			_main_text_box.set_size(Vector2i(Globals.SCREEN_SIZE.x, 0b110000))
			_main_text_box.set_position(Vector2(
				0, Globals.SCREEN_SIZE.y - _main_text_box.get_size().y
			))
			add_child(_main_text_box)
			move_child(_main_text_box, -1)

			init_scene("opening")

func get_map_key() -> String:
	return _map_key

func set_map(key: String) -> void:
	if not (key.is_empty()):
		if (_cur_map):
			_cur_map.queue_free()

		var map_dict: Dictionary = Globals.MAPS_JSON.get(key)

		if (key == "map_blank"):
			_cur_map = null

		else:
			_map_key = key

			var map_path: String = map_dict.get("path")
			_cur_map = (load(map_path) as PackedScene).instantiate()
			add_child(_cur_map)
			move_child(_cur_map, 0)

		_right_map = map_dict.get("right_map")
		_left_map = map_dict.get("left_map")
		_top_map = map_dict.get("top_map")
		_bottom_map = map_dict.get("bottom_map")

		if not (key == "map_blank"):
			_tortoise.set_visible(
				_map_key.contains("map_0") or _map_key.contains("map_111")
			)

			_tortoise.get_child(1).set_deferred(
				"disabled", (not _tortoise.is_visible())
			)
		
			if (_map_key.contains("map_111")):
				init_event(Globals.Event.NOTHING_PERSONNEL_KID)
				init_event(Globals.Event.STOP_MUSIC)

func get_right_map() -> String:
	return _right_map
func get_left_map() -> String:
	return _left_map
func get_top_map() -> String:
	return _top_map
func get_bottom_map() -> String:
	return _bottom_map

func init_event(event: Globals.Event) -> void:
	match event:
		Globals.Event.BLANK_MAP:
			set_map("map_blank")
		
		Globals.Event.HARE_LOST:
			_hare.get_hare_sprite().play("lost")

		Globals.Event.SFX_GO:
			play_sound("sfx_go")

		Globals.Event.RESET_HARE:
			_hare.set_position(Vector2i(
				Globals.SCREEN_SIZE.x >> 1, Globals.SCREEN_SIZE.y >> 1
			))
			_hare.set_visible(true)

		Globals.Event.HIDE_SPRITES:
			_hare.set_visible(false)
			_tortoise.set_visible(false)

		Globals.Event.UNBLANK_MAP:
			set_map(_map_key)
			_hare.set_visible(true)

		Globals.Event.LOOP_0:
			set_map("map_0")
			_triggers = 0

		Globals.Event.LOOP_1:
			set_map("map_0_loop1")
			_triggers = 0
			_tortoise.set_visible(true)
			_hare.half_speed()

		Globals.Event.HARE_NORMAL:
			_hare.get_hare_sprite().play("up")

		Globals.Event.LOOP_2:
			set_map("map_0_loop2")
			_triggers = 0
			_tortoise.set_visible(true)
			_hare.half_speed()

		Globals.Event.RESET_TORTOISE:
			_tortoise.set_position(Vector2i(
				Globals.SCREEN_SIZE.x >> 0b10, Globals.SCREEN_SIZE.y >> 1
			))

		Globals.Event.LOOP_3:
			set_map("map_0_loop3")
			_triggers = 0
			_tortoise.set_visible(true)
			_hare.half_speed()

		Globals.Event.LOOP_4:
			set_map("map_0_loop4")
			_triggers = 0
			_tortoise.set_visible(true)
			_hare.half_speed()

		Globals.Event.NOTHING_PERSONNEL_KID:
			_tortoise.set_position(Vector2i(
				Globals.SCREEN_SIZE.x >> 1, Globals.SCREEN_SIZE.y >> 0b10
			))
			_tortoise.set_visible(true)

		Globals.Event.STOP_MUSIC:
			_music_player.set_stream_paused(true)

		Globals.Event.SFX_CAR:
			play_sound("sfx_car")

		Globals.Event.SFX_GO_SLOW:
			play_sound("sfx_go", 0.5)

		Globals.Event.MUS_LOST:
			play_music("mus_lost")

		Globals.Event.MUS_BREAK:
			play_music("mus_break")

		Globals.Event.MUS_RACE:
			play_music("mus_race")

		Globals.Event.MUS_LOST_SLOW:
			play_music("mus_lost", 0.25)

		Globals.Event.EXIT_GAME:
			notification(NOTIFICATION_WM_CLOSE_REQUEST)

func step_dialogue(key: String) -> void:
	if not (_dialogue_key == key):
		_dialogue_key = key
	var cur_scene_arr: Array = Globals.TEXT_JSON.get(_dialogue_key)

	if (_dialogue_idx >= cur_scene_arr.size()):
		set_dialogue(false)

	else:
		if not (is_dialogue()):
			set_dialogue(true)

		var dialogue_dict: Dictionary = cur_scene_arr[_dialogue_idx]
		var event_arr: PackedInt32Array = dialogue_dict.get("events")
		for i: int in event_arr.size():
			init_event(event_arr[i])

		var text: String = dialogue_dict.get("text")
		if (text.is_empty()):
			set_dialogue(false)
		else:
			_main_text_box.set_text(text)
			_dialogue_idx += 1

func init_scene(key: String) -> void:
	_dialogue_idx = 0
	step_dialogue(key)

func init_map_scene() -> void:
	var map_dict: Dictionary = Globals.MAPS_JSON.get(_map_key)
	var scene: Array = map_dict.get("scene")
	if (scene.size() == 0b10):
		if (scene[1] == _triggers):
			_triggers += 1
			var scene_key: String = scene[0]
			init_scene(scene_key)

func play_sound(key: String, speed: float = 1.0) -> void:
	var path: String = Globals.SFX_JSON.get(key)
	var stream: AudioStreamWAV = load(path)
	_sound_player.set_stream(stream)
	_sound_player.set_pitch_scale(speed)
	_sound_player.play()

func play_music(key: String, speed: float = 1.0) -> void:
	if (_music_key == key):
		_music_player.set_stream_paused(false)

	else:
		_music_key = key

		var music_dict: Dictionary = Globals.MUSIC_JSON.get(_music_key)
		var path: String = music_dict.get("path")
		var loop: float = music_dict.get("loop")

		var stream: AudioStreamOggVorbis = load(path)
		stream.set_loop(true)
		stream.set_loop_offset(loop)
		
		_music_player.set_stream(stream)
		_music_player.set_pitch_scale(speed)
		_music_player.play()
