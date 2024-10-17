extends CharacterBody2D

const SPEED = 100

@onready var anims: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if !is_multiplayer_authority(): return
	var direction = Input.get_vector("IZQUIERDA","DERECHA","ARRIBA","ABAJO")
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _process(delta):
	if !is_multiplayer_authority(): return
	if velocity != Vector2.ZERO:
		anims.play("walk")
	else:
		anims.play("idle")
	if velocity.x > 0 :
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true

