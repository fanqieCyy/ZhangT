extends CharacterBody2D
const RUN_SPEED:= 160
const floor_ACCELERATION:=RUN_SPEED/0.2	
const air_ACCELERATION=RUN_SPEED/0.02
const JUMP_VELOCITY:=-400.0
var gravity:=ProjectSettings.get("physics/2d/default_gravity") as float
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var coyote_timer: Timer=$coyoteTimer
@onready var request_timer: Timer=$JumpRequestTimer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		request_timer.start()
	if event.is_action_released("jump") and velocity.y<JUMP_VELOCITY/2:
		velocity.y=JUMP_VELOCITY/2
func _physics_process(delta: float) -> void: 
	var direction:=Input.get_axis("move_left","move_right")
	var acceleration:=floor_ACCELERATION if is_on_floor() else air_ACCELERATION	
	velocity.x=move_toward(velocity.x,direction*RUN_SPEED,acceleration*delta)
	velocity.y+=gravity*delta
	
	var can_jump:=is_on_floor() or coyote_timer.time_left >0
	var should_jump:=can_jump and request_timer.time_left>0
	
	if should_jump:
		velocity.y=JUMP_VELOCITY
		coyote_timer.stop()
		request_timer.stop()
		
	if is_on_floor():
		if is_zero_approx(direction) and is_zero_approx(velocity.x):
			animation_player.play("dile")
		else:
			animation_player.play("running") 
	else:
		animation_player.play("jump")
		
	if not is_zero_approx(direction):
		sprite_2d.flip_h=direction<0
	var was_on_floor:=is_on_floor()
	if was_on_floor!=is_on_floor():
		if was_on_floor and not should_jump:
			coyote_timer.start()
		else:
			coyote_timer.stop()
	move_and_slide()
