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

var moveScale = 1;
if (x > nextX) x -= global.unitW / moveScale ;
if (x < nextX) x += global.unitW / moveScale ;
if (y > nextY) y -= global.unitW / moveScale ;
if (y < nextY) y += global.unitW / moveScale ;