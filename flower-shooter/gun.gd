extends Node2D

@onready var RotationOffset: Node2D = $RotationOffset
@onready var SpriteShadow: Marker2D = $RotationOffset/Sprite2D/Shadow
@onready var ShootPos: Marker2D = $RotationOffset/Sprite2D/shoot_pos

var time_between_shot: float = 0.25
var can_shoot: bool = true
