show_debug_overlay(true);

enum GAME_STATE {
	IDLE, CREATE_DUNGEON, BATTLE, WAR, LOG,
	BATTLE_INTRO, BATTLE_END,
}	

randomize();
GameData();
CardData();

state		= GAME_STATE.CREATE_DUNGEON;
player		= oPlayer;
enemy		= noone;
enemies		= ds_queue_create();
playerCard	= noone;
enemyCard	= noone;

warCardsCollected = 0;
warCardsToCollect = 3;

battleLog	= ds_list_create();

gw	= room_width / global.unitW;
gh	= room_height / global.unitW;
dungeonGrid = ds_grid_create(gw, gh);
startedCreatingDungeon = false;
createdDungeon = false;