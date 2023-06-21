extends Area2D

@onready var coin = get_node("AnimatedSprite2D")

func _ready():
	coin.play("Idle")

func _on_body_entered(body):
	if body.name == "Player":
		Game.gold += 1
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, 15), 0.2)
		tween.tween_property(self, "modulate:a", 0, 0.2)
		tween.tween_callback(queue_free)
		Utils.saveGame()
