extends Node
var XP = 0
var LVL = 1
var BOOST = 20

var ply_max_health = 100
var ply_speed_boost = 0
var ply_dmg = 1

func _process(delta):
	if bullet_speed < 0.1:
		bullet_speed = 0.1
var bullet_speed = 0.5


var selected = []

var bombe = false
var glue = false
var plume = true

var X = 0
var Y = 0


var bulle:bool = false
var bultime:float = 2.5

var degats:float = 5

var shaders = true
var lifebar = true
