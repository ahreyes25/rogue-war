enum card {
	heart2, heart3, heart4, heart5, heart6, heart7, heart8, heart9, heart10, heartJ, heartQ, heartK, heartA,
	diamond2, diamond3, diamond4, diamond5, diamond6, diamond7, diamond8, diamond9, diamond10, diamondJ, diamondQ, diamondK, diamondA,
	spade2, spade3, spade4, spade5, spade6, spade7, spade8, spade9, spade10, spadeJ, spadeQ, spadeK, spadeA,
	club2, club3, club4, club5, club6, club7, club8, club9, club10, clubJ, clubQ, clubK, clubA,
}

enum PROP {
	VALUE
}

#region Basic Cards

// Heart
global.cardData[card.heart2, PROP.VALUE] = 2;
global.cardData[card.heart3, PROP.VALUE] = 3;
global.cardData[card.heart4, PROP.VALUE] = 4;
global.cardData[card.heart5, PROP.VALUE] = 5;
global.cardData[card.heart6, PROP.VALUE] = 6;
global.cardData[card.heart7, PROP.VALUE] = 7;
global.cardData[card.heart8, PROP.VALUE] = 8;
global.cardData[card.heart9, PROP.VALUE] = 9;
global.cardData[card.heart10, PROP.VALUE] = 10;
global.cardData[card.heartJ, PROP.VALUE] = 11;
global.cardData[card.heartQ, PROP.VALUE] = 12;
global.cardData[card.heartK, PROP.VALUE] = 13;
global.cardData[card.heartA, PROP.VALUE] = 14;

// Diamond
global.cardData[card.diamond2, PROP.VALUE] = 2;
global.cardData[card.diamond3, PROP.VALUE] = 3;
global.cardData[card.diamond4, PROP.VALUE] = 4;
global.cardData[card.diamond5, PROP.VALUE] = 5;
global.cardData[card.diamond6, PROP.VALUE] = 6;
global.cardData[card.diamond7, PROP.VALUE] = 7;
global.cardData[card.diamond8, PROP.VALUE] = 8;
global.cardData[card.diamond9, PROP.VALUE] = 9;
global.cardData[card.diamond10, PROP.VALUE] = 10;
global.cardData[card.diamondJ, PROP.VALUE] = 11;
global.cardData[card.diamondQ, PROP.VALUE] = 12;
global.cardData[card.diamondK, PROP.VALUE] = 13;
global.cardData[card.diamondA, PROP.VALUE] = 14;

// Spade
global.cardData[card.spade2, PROP.VALUE] = 2;
global.cardData[card.spade3, PROP.VALUE] = 3;
global.cardData[card.spade4, PROP.VALUE] = 4;
global.cardData[card.spade5, PROP.VALUE] = 5;
global.cardData[card.spade6, PROP.VALUE] = 6;
global.cardData[card.spade7, PROP.VALUE] = 7;
global.cardData[card.spade8, PROP.VALUE] = 8;
global.cardData[card.spade9, PROP.VALUE] = 9;
global.cardData[card.spade10, PROP.VALUE] = 10;
global.cardData[card.spadeJ, PROP.VALUE] = 11;
global.cardData[card.spadeQ, PROP.VALUE] = 12;
global.cardData[card.spadeK, PROP.VALUE] = 13;
global.cardData[card.spadeA, PROP.VALUE] = 14;

// Club
global.cardData[card.club2, PROP.VALUE] = 2;
global.cardData[card.club3, PROP.VALUE] = 3;
global.cardData[card.club4, PROP.VALUE] = 4;
global.cardData[card.club5, PROP.VALUE] = 5;
global.cardData[card.club6, PROP.VALUE] = 6;
global.cardData[card.club7, PROP.VALUE] = 7;
global.cardData[card.club8, PROP.VALUE] = 8;
global.cardData[card.club9, PROP.VALUE] = 9;
global.cardData[card.club10, PROP.VALUE] = 10;
global.cardData[card.clubJ, PROP.VALUE] = 11;
global.cardData[card.clubQ, PROP.VALUE] = 12;
global.cardData[card.clubK, PROP.VALUE] = 13;
global.cardData[card.clubA, PROP.VALUE] = 14;

#endregion