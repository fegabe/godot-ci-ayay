extends Node2D

@onready var cowboy_shout: Sprite2D = $CowboyShout
@onready var version_label: Label = $Version

var _is_shouting = false

func _ready():
	var version = ProjectSettings.get_setting("application/config/version")
	version_label.text = str(version)
	cowboy_shout.visible = false
	call_deferred("_load_fmod_banks")

func _load_fmod_banks():
	FmodServer.load_bank("res://fmod/Master.strings.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)
	FmodServer.load_bank("res://fmod/Master.bank", FmodServer.FMOD_STUDIO_LOAD_BANK_NORMAL)

func _process(_delta):
	var shout = Input.is_anything_pressed()
	if _change_shouting(shout) and shout:
		FmodServer.play_one_shot("event:/scream", self)

func _change_shouting(shout: bool) -> bool:
	if _is_shouting == shout: return false
	cowboy_shout.visible = shout
	_is_shouting = shout
	return true
