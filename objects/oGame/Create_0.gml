show_debug_overlay(true);

enum GAME_STATE {
	IDLE, LOAD_DATA, BATTLE, WAR,
}	

GameData();
CardData();
randomize();

state		= GAME_STATE.LOAD_DATA;
player		= oPlayer;
enemy		= oEnemy;
playerCard	= noone;
enemyCard	= noone;

warCardsCollected = 0;
warCardsToCollect = 3;