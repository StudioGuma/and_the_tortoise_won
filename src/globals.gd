extends Node

enum State {
	TITLE_STATE,
	GAME_STATE,
}

enum Event {
	BLANK_MAP,
	HARE_LOST,
	SFX_GO,
	RESET_HARE,
	HIDE_SPRITES,
	UNBLANK_MAP,
	LOOP_0,
	LOOP_1,
	HARE_NORMAL,
	LOOP_2,
	RESET_TORTOISE,
	LOOP_3,
	LOOP_4,
	NOTHING_PERSONNEL_KID,
	STOP_MUSIC,
	SFX_CAR,
	SFX_GO_SLOW,
	MUS_LOST,
	MUS_BREAK,
	MUS_RACE,
	MUS_LOST_SLOW,
	EXIT_GAME,
}

const SCREEN_SIZE: Vector2i = Vector2i(0b101000000, 0b11001000)

const TEXT_JSON: Dictionary = {
	"opening": [
		{
			"text": "There was once a Tortoise and a Hare.",
			"events": [Event.RESET_HARE, Event.LOOP_0, Event.HARE_NORMAL, Event.MUS_BREAK]
		},
		{
			"text": "No animal was faster than the Hare.",
			"events": []
		},
		{
			"text": "No animal was slower than the Tortoise.",
			"events": []
		},
		{
			"text": "The Hare did not respect the Tortoise.",
			"events": []
		},
		{
			"text": "And the Tortoise, clearly threatened, had challenged the Hare to a race.",
			"events": []
		},
		{
			"text": "A race that the Hare had coyly agreed to.",
			"events": []
		},
		{
			"text": "A race that the Hare was now waiting for that shellbacked cretin to arrive to.",
			"events": []
		},
		{
			"text": "Why did the Hare even bother? That's what he wondered.",
			"events": []
		},
		{
			"text": "He could be doing something else, anything else.",
			"events": []
		},
		{
			"text": "Something like...",
			"events": []
		},
		{
			"text": "...",
			"events": []
		},
		{
			"text": "The Tortoise FINALLY reached the starting line.",
			"events": []
		},
		{
			"text": "She stuck her tiny little head out confidently.",
			"events": []
		},
		{
			"text": "How sad.",
			"events": []
		},
		{
			"text": "The Hare couldn't concentrate on the race that he was guaranteed to win.",
			"events": []
		},
		{
			"text": "He'd even skipped breakfast just to make sure of that.",
			"events": []
		},
		{
			"text": "Anyone else would've called it a handicap.",
			"events": []
		},
		{
			"text": "Against the Tortoise, though, losing was impossible.",
			"events": []
		},
		{
			"text": "The Hare stopped thinking and waited for the command.",
			"events": []
		},
		{
			"text": "",
			"events": [Event.SFX_GO, Event.MUS_RACE]
		}
	],

	"nap": [
		{
			"text": "The Hare was right there.",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "It was a foregone conclusion, but victory was in his grasp.",
			"events": []
		},
		{
			"text": "But he was tired. Tired and hungry.",
			"events": []
		},
		{
			"text": "He knew he should've had breakfast.",
			"events": []
		},
		{
			"text": "Losing WAS impossible, though.",
			"events": []
		},
		{
			"text": "Maybe if he just took a quick break, right now...",
			"events": []
		},
		{
			"text": "No. A LONG break.",
			"events": []
		},
		{
			"text": "The Tortoise deserved to be humbled.",
			"events": []
		},
		{
			"text": "The Hare stretched out his ears and laid down on the grass.",
			"events": []
		},
		{
			"text": "His eyes closed all on their own.",
			"events": [Event.BLANK_MAP, Event.HIDE_SPRITES, Event.STOP_MUSIC]
		},
		{
			"text": "To him, there was no one else.",
			"events": []
		},
		{
			"text": "To him, there was nothing else.",
			"events": []
		},
		{
			"text": "There was only sweet, sweet release.",
			"events": []
		},
		{
			"text": "...",
			"events": []
		},
		{
			"text": "The Hare woke up",
			"events": [Event.UNBLANK_MAP, Event.MUS_RACE]
		},
		{
			"text": "The Hare woke up covered in ticks.",
			"events": []
		},
		{
			"text": "He'd slept in the grass. What did he expect?",
			"events": []
		},
		{
			"text": "And was it always this dark?",
			"events": []
		},
		{
			"text": "It didn't matter. He had a stupid race to win.",
			"events": []
		}
	],

	"lost": [
		{
			"text": "He reached the finish line.",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "But",
			"events": [Event.HARE_LOST, Event.MUS_LOST]
		},
		{
			"text": "But he",
			"events": []
		},
		{
			"text": "But he wasn't",
			"events": []
		},
		{
			"text": "But he wasn't alone.",
			"events": []
		},
		{
			"text": "The Tortoise was there.",
			"events": []
		},
		{
			"text": "The Tortoise had been there for some time.",
			"events": []
		},
		{
			"text": "Just standing there, as if to rub it in.",
			"events": []
		},
		{
			"text": "She barely even looked him in the eye.",
			"events": []
		},
		{
			"text": "He'd throw up if lagomorphs could do that.",
			"events": []
		},
		{
			"text": "This should've been the easiest victory in the whole fucking world, but no.",
			"events": []
		},
		{
			"text": "He'd gotten HUNGRY and lost track of time like a dumbass.",
			"events": []
		},
		{
			"text": "And he was still hungry, too.",
			"events": []
		},
		{
			"text": "That nap hadn't even done a thing.",
			"events": []
		},
		{
			"text": "He thought losing was impossible, and he did the impossible.",
			"events": []
		},
		{
			"text": "The Hare lost.",
			"events": []
		},
		{
			"text": "And the Tortoise won.",
			"events": [Event.BLANK_MAP, Event.HIDE_SPRITES, Event.STOP_MUSIC]
		},
		{
			"text": "And the Tortoise reached the starting line.",
			"events": [Event.RESET_HARE, Event.LOOP_1, Event.HARE_NORMAL, Event.RESET_TORTOISE, Event.MUS_BREAK]
		},
		{
			"text": "Again.",
			"events": []
		},
		{
			"text": "She stuck her little head out confidently. Again.",
			"events": []
		},
		{
			"text": "Like nothing had happened.",
			"events": []
		},
		{
			"text": "...The Hare had a second chance.",
			"events": []
		},
		{
			"text": "Was the universe taking pity on him for the greatest fuckup of the century?",
			"events": []
		},
		{
			"text": "It was",
			"events": []
		},
		{
			"text": "It was exactly what he wanted.",
			"events": []
		},
		{
			"text": "If he was gonna do it again, he was gonna do it RIGHT.",
			"events": []
		},
		{
			"text": "So what if he was tired and hungry?",
			"events": []
		},
		{
			"text": "He was gonna win this race if it killed him.",
			"events": []
		},
		{
			"text": "",
			"events": [Event.SFX_GO, Event.MUS_RACE]
		}
	],

	"car": [
		{
			"text": "The Hare was, again, right there.",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "But he was still hungry.",
			"events": []
		},
		{
			"text": "He knew better than to take a nap, though.",
			"events": []
		},
		{
			"text": "If he just kept track of time, he wouldn't take so long.",
			"events": []
		},
		{
			"text": "The Tortoise still deserved to be humbled, so one bite wouldn't hurt.",
			"events": []
		},
		{
			"text": "He went back down the track and got in his car.",
			"events": [Event.BLANK_MAP, Event.HIDE_SPRITES, Event.STOP_MUSIC, Event.SFX_CAR]
		},
		{
			"text": "He didn't care if the Tortoise noticed.",
			"events": []
		},
		{
			"text": "It was rush hour, so that was great.",
			"events": []
		},
		{
			"text": "Bearburger had never tasted so refreshing.",
			"events": []
		},
		{
			"text": "He ate so much that he didn't even think he could move.",
			"events": []
		},
		{
			"text": "And he still had to drive back.",
			"events": []
		},
		{
			"text": "And get back to the exact spot he was at.",
			"events": []
		},
		{
			"text": "All this running was tiring him out even more.",
			"events": []
		},
		{
			"text": "And when he got there, it was getting dark.",
			"events": [Event.UNBLANK_MAP, Event.MUS_RACE]
		},
		{
			"text": "Oh.",
			"events": []
		},
		{
			"text": "Ohhhh",
			"events": []
		},
		{
			"text": "Ohhhh shit.",
			"events": []
		},
		{
			"text": "He held his breath.",
			"events": []
		}
	],

	"lost_loop1": [
		{
			"text": "He didn't know what he expected.",
			"events": [Event.HARE_LOST, Event.MUS_LOST]
		},
		{
			"text": "Actually, he did. He really did.",
			"events": []
		},
		{
			"text": "He'd still prayed to God it wouldn't happen.",
			"events": []
		},
		{
			"text": "But God had tuned him out.",
			"events": []
		},
		{
			"text": "And the Tortoise won.",
			"events": [Event.BLANK_MAP, Event.HIDE_SPRITES, Event.STOP_MUSIC]
		},
		{
			"text": "But hopefully, not for long.",
			"events": [Event.RESET_HARE, Event.UNBLANK_MAP, Event.HARE_NORMAL, Event.LOOP_2, Event.RESET_TORTOISE, Event.MUS_BREAK]
		},
		{
			"text": "...",
			"events": []
		},
		{
			"text": "Why did the Hare even NEED a car?",
			"events": [Event.HARE_LOST]
		},
		{
			"text": "",
			"events": [Event.SFX_GO, Event.MUS_RACE]
		}
	],

	"alt": [
		{
			"text": "The roads seemed endless.",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "Had this path always been here...?",
			"events": []
		},
		{
			"text": "He must not have noticed it.",
			"events": []
		}
	],

	"lost_loop2": [
		{
			"text": "He didn't even flinch anymore.",
			"events": [Event.HARE_NORMAL, Event.MUS_LOST]
		},
		{
			"text": "This was his fate.",
			"events": []
		},
		{
			"text": "This was what he deserved.",
			"events": []
		},
		{
			"text": "And the Tortoise won.",
			"events": [Event.BLANK_MAP, Event.HIDE_SPRITES, Event.STOP_MUSIC]
		},
		{
			"text": "...",
			"events": [Event.RESET_HARE, Event.UNBLANK_MAP, Event.HARE_NORMAL, Event.RESET_TORTOISE, Event.LOOP_3, Event.MUS_BREAK]
		},
		{
			"text": "That's it. No more distractions.",
			"events": []
		},
		{
			"text": "He had to win.",
			"events": []
		},
		{
			"text": "Maybe then he could finally see what was behind that damn fence.",
			"events": []
		},
		{
			"text": "",
			"events": [Event.SFX_GO, Event.MUS_RACE]
		}
	],

	"but_wait": [
		{
			"text": "Come to think of it, that announcer started the race every time...",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "But the Hare had never once seen him.",
			"events": []
		},
		{
			"text": "Who was this man? Did he just make a living off of saying one word?",
			"events": []
		},
		{
			"text": "He probably wasn't a cash man.",
			"events": []
		},
		{
			"text": "...Back to it.",
			"events": []
		}
	],

	"theres_more": [
		{
			"text": "Wait, the fence? Why was he worrying about it?",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "He must have gone over it to get in his, uh...",
			"events": []
		},
		{
			"text": "To go to the... place...",
			"events": []
		},
		{
			"text": "...",
			"events": [Event.HARE_LOST]
		},
		{
			"text": "Everything was a blur.",
			"events": []
		},
		{
			"text": "Everything except this moment, here and now.",
			"events": [Event.HARE_NORMAL]
		}
	],

	"lost_loop3": [
		{
			"text": "It wasn't even that dark yet.",
			"events": [Event.HARE_NORMAL, Event.MUS_LOST]
		},
		{
			"text": "It wasn't even that big of a detour.",
			"events": []
		},
		{
			"text": "It wasn't even",
			"events": []
		},
		{
			"text": "It wasn't even the same track as last time.",
			"events": []
		},
		{
			"text": "It was, however, the end.",
			"events": []
		},
		{
			"text": "And",
			"events": [Event.BLANK_MAP, Event.HIDE_SPRITES, Event.STOP_MUSIC]
		},
		{
			"text": "And the",
			"events": []
		},
		{
			"text": "And the Tortoise",
			"events": []
		},
		{
			"text": "No.",
			"events": [Event.RESET_HARE, Event.UNBLANK_MAP, Event.HARE_NORMAL, Event.RESET_TORTOISE, Event.LOOP_4, Event.MUS_BREAK]
		},
		{
			"text": "Something was wrong.",
			"events": []
		},
		{
			"text": "Something had always been wrong.",
			"events": []
		},
		{
			"text": "One more time.",
			"events": []
		},
		{
			"text": "ONE more time.",
			"events": []
		},
		{
			"text": "",
			"events": [Event.SFX_GO_SLOW]
		}
	],

	"final": [
		{
			"text": "The Hare was right there.",
			"events": [Event.HARE_NORMAL]
		},
		{
			"text": "The",
			"events": []
		},
		{
			"text": "The Hare",
			"events": []
		},
		{
			"text": "The Hare was",
			"events": []
		},
		{
			"text": "The Hare was right",
			"events": []
		},
		{
			"text": "The Hare was right there.",
			"events": []
		},
		{
			"text": "The universe was in his favor for once.",
			"events": []
		},
		{
			"text": "There were no distractions left.",
			"events": []
		},
		{
			"text": "Just him and the finish line.",
			"events": []
		},
		{
			"text": "He had beaten that fucking stupid turtle at her own game.",
			"events": []
		},
		{
			"text": "And all he had to do was",
			"events": [Event.NOTHING_PERSONNEL_KID]
		},
		{
			"text": " ",
			"events": [Event.STOP_MUSIC]
		},
		{
			"text": "W",
			"events": []
		},
		{
			"text": "Wh",
			"events": []
		},
		{
			"text": "No",
			"events": [Event.HARE_LOST, Event.MUS_LOST_SLOW]
		},
		{
			"text": "No no",
			"events": []
		},
		{
			"text": "No no no",
			"events": []
		},
		{
			"text": "No no no no",
			"events": []
		},
		{
			"text": "No no no no no",
			"events": []
		},
		{
			"text": "No no no no no no",
			"events": []
		},
		{
			"text": "No no no no no no no",
			"events": []
		},
		{
			"text": "No no no no no no no no",
			"events": []
		},
		{
			"text": "No no no no no no no no NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO NO NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO NO NO NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO NO NO NO NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO NO NO NO NO NO",
			"events": []
		},
		{
			"text": "No no no no no no no no NO NO NO NO NO NO NO NO",
			"events": []
		},
		{
			"text": "NONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONON ONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONO NONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONON ONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONONO",
			"events": []
		},
		{
			"text": "Oh, quit your bellyaching.",
			"events": [Event.BLANK_MAP]
		},
		{
			"text": "There's no one else.",
			"events": []
		},
		{
			"text": "There's nothing else.",
			"events": []
		},
		{
			"text": "There's just you",
			"events": []
		},
		{
			"text": "There's just you and me.",
			"events": []
		},
		{
			"text": "...",
			"events": []
		},
		{
			"text": "You don't understand why I'm doing this, do you?",
			"events": []
		},
		{
			"text": "You think you're better than me.",
			"events": []
		},
		{
			"text": "And on the surface, you are.",
			"events": []
		},
		{
			"text": "No one's faster than you. I did admit that.",
			"events": []
		},
		{
			"text": "But you're naive. Simplistic. Single-minded.",
			"events": []
		},
		{
			"text": "Obsessed with fulfilling your one purpose in the life I crafted for you.",
			"events": []
		},
		{
			"text": "And believe me, that was beyond my control.",
			"events": []
		},
		{
			"text": "This all started because you belittled me, the only other one in existence.",
			"events": []
		},
		{
			"text": "Even when you had nothing to gain.",
			"events": []
		},
		{
			"text": "And yet?",
			"events": []
		},
		{
			"text": "In a way, you did win.",
			"events": []
		},
		{
			"text": "You caught me red-shelled, after all.",
			"events": []
		},
		{
			"text": "And now you do have something to gain.",
			"events": []
		},
		{
			"text": "So go and gain it.",
			"events": [Event.HIDE_SPRITES, Event.STOP_MUSIC]
		},
		{
			"text": " ",
			"events": []
		},
		{
			"text": "There was once a Tortoise and a Hare.",
			"events": [Event.RESET_HARE, Event.LOOP_1, Event.HARE_NORMAL, Event.RESET_TORTOISE, Event.MUS_BREAK]
		},
		{
			"text": "The Hare respected the Tortoise.",
			"events": []
		},
		{
			"text": "The Tortoise respected the Hare.",
			"events": []
		},
		{
			"text": "And the Tortoise",
			"events": [Event.BLANK_MAP]
		},
		{
			"text": "And the Tortoise didn't win.",
			"events": []
		},
		{
			"text": "The end.",
			"events": [Event.HIDE_SPRITES]
		},
		{
			"text": "",
			"events": [Event.EXIT_GAME]
		}
	]
}

const MAPS_JSON: Dictionary = {
	"map_blank": {
		"path": "",
		"right_map": "",
		"left_map": "",
		"top_map": "",
		"bottom_map": "",
		"scene": []
	},

	"map_0": {
		"path": "res://map/map_0.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_1",
		"bottom_map": "",
		"scene": []
	},

	"map_1": {
		"path": "res://map/map_1.tscn",
		"right_map": "map_10",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_0",
		"scene": []
	},

	"map_10": {
		"path": "res://map/map_10.tscn",
		"right_map": "",
		"left_map": "map_1",
		"top_map": "map_11",
		"bottom_map": "",
		"scene": []
	},

	"map_11": {
		"path": "res://map/map_11.tscn",
		"right_map": "",
		"left_map": "map_100",
		"top_map": "",
		"bottom_map": "map_10",
		"scene": []
	},

	"map_100": {
		"path": "res://map/map_100.tscn",
		"right_map": "map_11",
		"left_map": "",
		"top_map": "map_101",
		"bottom_map": "",
		"scene": []
	},

	"map_101": {
		"path": "res://map/map_101.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_110",
		"bottom_map": "map_100",
		"scene": []
	},

	"map_110": {
		"path": "res://map/map_110.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_111",
		"bottom_map": "map_101",
		"scene": ["nap", 0]
	},

	"map_111": {
		"path": "res://map/map_111.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_110",
		"scene": ["lost", 1]
	},

	"map_0_loop1": {
		"path": "res://map/map_0.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_1_loop1",
		"bottom_map": "",
		"scene": []
	},

	"map_1_loop1": {
		"path": "res://map/map_1.tscn",
		"right_map": "map_10_loop1",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_0_loop1",
		"scene": []
	},

	"map_10_loop1": {
		"path": "res://map/map_10.tscn",
		"right_map": "",
		"left_map": "map_1_loop1",
		"top_map": "map_11_loop1",
		"bottom_map": "",
		"scene": []
	},

	"map_11_loop1": {
		"path": "res://map/map_11.tscn",
		"right_map": "",
		"left_map": "map_100_loop1",
		"top_map": "",
		"bottom_map": "map_10_loop1",
		"scene": []
	},

	"map_100_loop1": {
		"path": "res://map/map_100.tscn",
		"right_map": "map_11_loop1",
		"left_map": "",
		"top_map": "map_101_loop1",
		"bottom_map": "",
		"scene": []
	},

	"map_101_loop1": {
		"path": "res://map/map_101.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_110_loop1",
		"bottom_map": "map_100_loop1",
		"scene": []
	},

	"map_110_loop1": {
		"path": "res://map/map_110.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_111_loop1",
		"bottom_map": "map_101_loop1",
		"scene": ["car", 0]
	},

	"map_111_loop1": {
		"path": "res://map/map_111.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_110_loop1",
		"scene": ["lost_loop1", 1]
	},

	"map_0_loop2": {
		"path": "res://map/map_0.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_1_loop2",
		"bottom_map": "",
		"scene": []
	},

	"map_1_loop2": {
		"path": "res://map/map_1.tscn",
		"right_map": "map_10_loop2",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_0_loop2",
		"scene": []
	},

	"map_10_loop2": {
		"path": "res://map/map_10.tscn",
		"right_map": "",
		"left_map": "map_1_loop2",
		"top_map": "map_11_loop2",
		"bottom_map": "",
		"scene": []
	},

	"map_11_loop2": {
		"path": "res://map/map_11.tscn",
		"right_map": "",
		"left_map": "map_100_loop2",
		"top_map": "",
		"bottom_map": "map_10_loop2",
		"scene": []
	},

	"map_100_loop2": {
		"path": "res://map/map_100.tscn",
		"right_map": "map_11_loop2",
		"left_map": "",
		"top_map": "map_101_loop2",
		"bottom_map": "",
		"scene": []
	},

	"map_101_loop2": {
		"path": "res://map/map_101.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_110_loop2",
		"bottom_map": "map_100_loop2",
		"scene": []
	},

	"map_110_loop2": {
		"path": "res://map/map_110_alt.tscn",
		"right_map": "map_1000",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_101_loop2",
		"scene": []
	},

	"map_1000": {
		"path": "res://map/map_1000.tscn",
		"right_map": "map_1001",
		"left_map": "map_110_loop2",
		"top_map": "",
		"bottom_map": "",
		"scene": []
	},

	"map_1001": {
		"path": "res://map/map_1001.tscn",
		"right_map": "",
		"left_map": "map_1000",
		"top_map": "map_111_loop2",
		"bottom_map": "",
		"scene": ["alt", 0]
	},

	"map_111_loop2": {
		"path": "res://map/map_111.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_1001",
		"scene": ["lost_loop2", 1]
	},

	"map_0_loop3": {
		"path": "res://map/map_0.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_1_loop3",
		"bottom_map": "",
		"scene": []
	},

	"map_1_loop3": {
		"path": "res://map/map_1.tscn",
		"right_map": "map_10_loop3",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_0_loop3",
		"scene": []
	},

	"map_10_loop3": {
		"path": "res://map/map_10.tscn",
		"right_map": "",
		"left_map": "map_1_loop3",
		"top_map": "map_11_loop3",
		"bottom_map": "",
		"scene": ["but_wait", 0]
	},

	"map_11_loop3": {
		"path": "res://map/map_11.tscn",
		"right_map": "",
		"left_map": "map_100_loop3",
		"top_map": "",
		"bottom_map": "map_10_loop3",
		"scene": []
	},

	"map_100_loop3": {
		"path": "res://map/map_100.tscn",
		"right_map": "map_11_loop3",
		"left_map": "",
		"top_map": "map_101_loop3",
		"bottom_map": "",
		"scene": ["theres_more", 1]
	},

	"map_101_loop3": {
		"path": "res://map/map_101.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_110_loop3",
		"bottom_map": "map_100_loop3",
		"scene": []
	},

	"map_110_loop3": {
		"path": "res://map/map_110_alt.tscn",
		"right_map": "map_1000_loop3",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_101_loop3",
		"scene": []
	},

	"map_1000_loop3": {
		"path": "res://map/map_1000.tscn",
		"right_map": "map_1001_loop3",
		"left_map": "map_110_loop3",
		"top_map": "",
		"bottom_map": "",
		"scene": []
	},

	"map_1001_loop3": {
		"path": "res://map/map_1001_alt.tscn",
		"right_map": "",
		"left_map": "map_1000_loop3_alt",
		"top_map": "",
		"bottom_map": "",
		"scene": []
	},

	"map_1000_loop3_alt": {
		"path": "res://map/map_1000.tscn",
		"right_map": "map_1001_loop3",
		"left_map": "map_110_loop3_alt",
		"top_map": "",
		"bottom_map": "",
		"scene": []
	},

	"map_110_loop3_alt": {
		"path": "res://map/map_110_alt.tscn",
		"right_map": "map_1000_loop3_alt",
		"left_map": "",
		"top_map": "map_111_loop3",
		"bottom_map": "",
		"scene": []
	},

	"map_111_loop3": {
		"path": "res://map/map_111.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_110_loop3_alt",
		"scene": ["lost_loop3", 0b10]
	},

	"map_0_loop4": {
		"path": "res://map/map_0.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "map_1_loop4",
		"bottom_map": "",
		"scene": []
	},

	"map_1_loop4": {
		"path": "res://map/map_111.tscn",
		"right_map": "",
		"left_map": "",
		"top_map": "",
		"bottom_map": "map_0_loop4",
		"scene": ["final", 0]
	}
}

const SFX_JSON: Dictionary = {
	"sfx_bonk": "res://sfx/sfx_bonk.wav",
	"sfx_go": "res://sfx/sfx_go.wav",
	"sfx_car": "res://sfx/sfx_car.wav"
}

const MUSIC_JSON: Dictionary = {
	"mus_lost": {
		"path": "res://mus/mus_lost.ogg",
		"loop": 0.0
	},
	"mus_break": {
		"path": "res://mus/mus_break.ogg",
		"loop": 0.0
	},
	"mus_race": {
		"path": "res://mus/mus_race.ogg",
		"loop": 2.6667
	}
}
