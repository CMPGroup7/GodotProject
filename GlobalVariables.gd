extends Node

var life = 3

var collected = 0

var cur_door = null

var cur_cam = null


var jjokji1 = true
var jjokji2 = true
var jjokji3 = true
var jjokji4 = true
var jjokji5 = true
var jjokji6 = true
var jjokji7 = true

var master_sound = AudioServer.get_bus_index("Master")

var finish_timing = false

func cheat():
	jjokji1 = false
	jjokji2 = false
	jjokji3 = false
	jjokji4 = false
	jjokji5 = false
	jjokji6 = false
	jjokji7 = false
