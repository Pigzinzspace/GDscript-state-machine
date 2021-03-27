extends Object

func _ready():
	pass # Replace with function body.
#SFM_execute вызывается из метода _process() юнита 
func SFM_execute(unit,unit_stage,unit_signal=""): 
	call(unit_stage,unit,unit_signal)  

func select_target_weapon_attack(unit,unit_signal):
	if unit_signal == "did not find enemies":
		unit.stage = "move_to_rally_point"
		unit.move_to_rally_point()
	elif unit_signal == "found a target":
		unit.stage = "move_to_attack_distance"
		unit.move_to_attack_distance()
	else :
		unit.select_target_weapon_attack()
		
func move_to_rally_point(unit,unit_signal):
	if unit_signal == "i see enemies":
		unit.stage = "select_target_weapon_attack"
		unit.select_target_weapon_attack()
	else :
		unit.move_to_rally_point()
	
func move_to_attack_distance(unit,unit_signal):
	if unit_signal == "did not find enemies":
		unit.stage = "move_to_rally_point"
		unit.move_to_rally_point()
	elif unit_signal == "found a target":
		unit.stage = "move_to_attack_distance"
		unit.move_to_attack_distance()
	else :
		unit.select_target_weapon_attack()
		
func run_away(unit,unit_signal):
	if unit_signal == "i ran away":
		unit.stage = "select_target_weapon_attack"
		unit.select_target_weapon_attack()
	else :
		unit.run_away()
		
func use_attack(unit,unit_signal):
	if unit_signal == "finished attack":
		unit.stage = "select_target_weapon_attack"
		unit.select_target_weapon_attack()
	elif unit_signal == "target lost":
		unit.stage = "move_to_attack_distance"
		unit.select_target_weapon_attack()
	elif unit_signal == "i want to run away":
		unit.stage = "run_away"
		unit.run_away()
	elif unit_signal == "i started dying":
		unit.stage = "start_to_die"
		unit.start_to_die()
	else :
		unit.use_attack()
		
func start_to_die(unit,unit_signal):
	unit.start_to_die()
