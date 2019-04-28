var scrollSpeed = 20;

switch (state) {
	case BATTLE_CHAR_STATE.EASE_IN:
		if (x < targetX - scrollSpeed)
			x += scrollSpeed;
		else if (x > targetX + scrollSpeed)
			x -= scrollSpeed; 
		else
			x = targetX;
		break;
	
	case BATTLE_CHAR_STATE.EASE_OUT:
		if (x < startX - scrollSpeed)
			x += scrollSpeed;
		else if (x > startX + scrollSpeed)
			x -= scrollSpeed; 
		else 
			instance_destroy();
		break;
}