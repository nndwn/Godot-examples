extends Area2D

export var speed = 400.0 #export menampilkan input configuration pada game engine dengan nilai default 400
var screen_size = Vector2.ZERO #menampikan nilai x = 0 dan y = 0 

func _ready(): #_ready adalah function jika game disat dijalankan
	screen_size = get_viewport().size #mengambil nilai ukuran view pada screen 
	print(screen_size) #output hasil dari nilai x dan y

func _process(delta): #_process adalah function defaault dari godot untuk memproses suatu object
	var direction = Vector2.ZERO #menampikan nilai x = 0 dan y = 0 
	if Input.is_action_pressed("move_right"): #Input.is_action_pressed jika tombol di tekan maka nilai terus diproses
		direction.x += 1 #direction adalah sebuah nilai posisi x dan y
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if direction.length() > 0: #jika total jumlah direction lebih  dari satu maka true 
		direction = direction.normalized() #sebuh fungsi normalised directon sehingga tombol atau key hany dapat berjalaan salah satu
		$AnimatedSprite.play() # get_node("AnimatedSprite").play()
	else:
		$AnimatedSprite.stop()
	position += direction * speed * delta #buaat object menjadi berpindah posisi berdasarkan nilai key
	position.x =  clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if direction.x != 0:
		$AnimatedSprite.animation ="right"
		$AnimatedSprite.flip_h = direction.x < 0
		$AnimatedSprite.flip_v = false
	elif direction.y !=0:
		$AnimatedSprite.animation ="up"
		$AnimatedSprite.flip_v = direction.y > 0
	
