class_name Player
extends CharacterBody2D

@export var speed : float

@onready var animation_player : AnimationPlayer = %AnimationPlayer
@onready var player_sprite : Sprite2D = $Sprite2D

func _process(_delta: float) -> void:
	var direction = Input.get_vector("p1_left", "p1_right", "p1_up", "p1_down");
	velocity = direction * speed
	
	if velocity.length() > 0:
		animation_player.play("running")
	else:
		animation_player.play("idle")
		
	if velocity.x < 0:
		player_sprite.flip_h = true
	else: 
		player_sprite.flip_h = false
		
	move_and_slide()
