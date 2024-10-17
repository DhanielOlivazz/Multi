extends Node

var peer : ENetMultiplayerPeer = ENetMultiplayerPeer.new()
@onready var hud: CenterContainer = $CenterContainer

func _on_host_pressed():
	peer.create_server(3500,2)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	_on_peer_connected()
	hud.hide()


func _on_join_pressed():
	peer.create_client("localhost",3500)
	multiplayer.multiplayer_peer = peer
	hud.hide()

func _on_peer_connected(id: int = 1):
	var player_scene = load("res://Players/ElWey.tscn")
	var player_instance = player_scene.instantiate()
	player_instance.name = str(id)
	add_child(player_instance, true)
