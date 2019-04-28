switch(state) {
	case CHAR_STATE.IDLE:
		break;
		
	case CHAR_STATE.BATTLE:
		break;
		
	case CHAR_STATE.WAR:
		break;
		
	case CHAR_STATE.DEAD:
		instance_destroy();
		break;
}

if (x > nextX) x -= global.unitW / 2;
if (x < nextX) x += global.unitW / 2;
if (y > nextY) y -= global.unitW / 2;
if (y < nextY) y += global.unitW / 2;