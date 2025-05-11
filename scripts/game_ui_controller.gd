extends Control

func update_ui():
	$MainUI/ScoreContainer/HBoxContainer/ScoreLabel.text = str(Globals.score)
	$MainUI/LivesContainer/HBoxContainer/LivesLabel.text = str(Globals.lives)
	$GameOverUI/FinalScoreLabel.text = "Final Score: %d" % Globals.score
	
	if(Globals.lives <= 0): 
		$MainUI.visible = false
		$GameOverUI.visible = true
