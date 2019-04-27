enum card {
	heart2, heart3, heart4, heart5, heart6, heart7, heart8, heart9, heart10, heartJ, heartQ, heartK, heartA,
	diamond2, diamond3, diamond4, diamond5, diamond6, diamond7, diamond8, diamond9, diamond10, diamondJ, diamondQ, diamondK, diamondA,
	spade2, spade3, spade4, spade5, spade6, spade7, spade8, spade9, spade10, spadeJ, spadeQ, spadeK, spadeA,
	club2, club3, club4, club5, club6, club7, club8, club9, club10, clubJ, clubQ, clubK, clubA,
}

enum PROP {
	VALUE, NAME
}

#region Basic Cards

// Heart
global.cardData[card.heart2, PROP.VALUE]	= 2;
global.cardData[card.heart2, PROP.NAME]		= "Two of Hearts";
global.cardData[card.heart3, PROP.VALUE]	= 3;
global.cardData[card.heart3, PROP.NAME]		= "Three of Hearts";
global.cardData[card.heart4, PROP.VALUE]	= 4;
global.cardData[card.heart4, PROP.NAME]		= "Four of Hearts";
global.cardData[card.heart5, PROP.VALUE]	= 5;
global.cardData[card.heart5, PROP.NAME]		= "Five of Hearts";
global.cardData[card.heart6, PROP.VALUE]	= 6;
global.cardData[card.heart6, PROP.NAME]		= "Six of Hearts";
global.cardData[card.heart7, PROP.VALUE]	= 7;
global.cardData[card.heart7, PROP.NAME]		= "Seven of Hearts";
global.cardData[card.heart8, PROP.VALUE]	= 8;
global.cardData[card.heart8, PROP.NAME]		= "Eight of Hearts";
global.cardData[card.heart9, PROP.VALUE]	= 9;
global.cardData[card.heart9, PROP.NAME]		= "Nine of Hearts";
global.cardData[card.heart10, PROP.VALUE]	= 10;
global.cardData[card.heart10, PROP.NAME]	= "Ten of Hearts";
global.cardData[card.heartJ, PROP.VALUE]	= 11;
global.cardData[card.heartJ, PROP.NAME]		= "Jack of Hearts";
global.cardData[card.heartQ, PROP.VALUE]	= 12;
global.cardData[card.heartQ, PROP.NAME]		= "Queen of Hearts";
global.cardData[card.heartK, PROP.VALUE]	= 13;
global.cardData[card.heartK, PROP.NAME]		= "King of Hearts";
global.cardData[card.heartA, PROP.VALUE]	= 14;
global.cardData[card.heartA, PROP.NAME]		= "Ace of Hearts";

// Diamond
global.cardData[card.diamond2, PROP.VALUE]	= 2;
global.cardData[card.diamond2, PROP.NAME]	= "Two of Diamonds";
global.cardData[card.diamond3, PROP.VALUE]	= 3;
global.cardData[card.diamond3, PROP.NAME]	= "Three of Diamonds";
global.cardData[card.diamond4, PROP.VALUE]	= 4;
global.cardData[card.diamond4, PROP.NAME]	= "Four of Diamonds";
global.cardData[card.diamond5, PROP.VALUE]	= 5;
global.cardData[card.diamond5, PROP.NAME]	= "Five of Diamonds";
global.cardData[card.diamond6, PROP.VALUE]	= 6;
global.cardData[card.diamond6, PROP.NAME]	= "Six of Diamonds";
global.cardData[card.diamond7, PROP.VALUE]	= 7;
global.cardData[card.diamond7, PROP.NAME]	= "Seven of Diamonds";
global.cardData[card.diamond8, PROP.VALUE]	= 8;
global.cardData[card.diamond8, PROP.NAME]	= "Eight of Diamonds";
global.cardData[card.diamond9, PROP.VALUE]	= 9;
global.cardData[card.diamond9, PROP.NAME]	= "Nine of Diamonds";
global.cardData[card.diamond10, PROP.VALUE]	= 10;
global.cardData[card.diamond10, PROP.NAME]	= "Ten of Diamonds";
global.cardData[card.diamondJ, PROP.VALUE]	= 11;
global.cardData[card.diamondJ, PROP.NAME]	= "Jack of Diamonds";
global.cardData[card.diamondQ, PROP.VALUE]	= 12;
global.cardData[card.diamondQ, PROP.NAME]	= "Queen of Diamonds";
global.cardData[card.diamondK, PROP.VALUE]	= 13;
global.cardData[card.diamondK, PROP.NAME]	= "King of Diamonds";
global.cardData[card.diamondA, PROP.VALUE]	= 14;
global.cardData[card.diamondA, PROP.NAME]	= "Ace of Diamonds";

// CONTINUE RENAMING CARDS HERE ... vvv

// Spade
global.cardData[card.spade2, PROP.VALUE]	= 2;
global.cardData[card.spade2, PROP.NAME]		= "Two of Spades";
global.cardData[card.spade3, PROP.VALUE]	= 3;
global.cardData[card.spade3, PROP.NAME]		= "Three of Spades";
global.cardData[card.spade4, PROP.VALUE]	= 4;
global.cardData[card.spade4, PROP.NAME]		= "Four of Spades";
global.cardData[card.spade5, PROP.VALUE]	= 5;
global.cardData[card.spade5, PROP.NAME]		= "Five of Spades";
global.cardData[card.spade6, PROP.VALUE]	= 6;
global.cardData[card.spade6, PROP.NAME]		= "Six of Spades";
global.cardData[card.spade7, PROP.VALUE]	= 7;
global.cardData[card.spade7, PROP.NAME]		= "Seven of Spades";
global.cardData[card.spade8, PROP.VALUE]	= 8;
global.cardData[card.spade8, PROP.NAME]		= "Eight of Spades";
global.cardData[card.spade9, PROP.VALUE]	= 9;
global.cardData[card.spade9, PROP.NAME]		= "Nine of Spades";
global.cardData[card.spade10, PROP.VALUE]	= 10;
global.cardData[card.spade10, PROP.NAME]	= "Ten of Spades";
global.cardData[card.spadeJ, PROP.VALUE]	= 11;
global.cardData[card.spadeJ, PROP.NAME]		= "Jack of Spades";
global.cardData[card.spadeQ, PROP.VALUE]	= 12;
global.cardData[card.spadeQ, PROP.NAME]		= "Queen of Spades";
global.cardData[card.spadeK, PROP.VALUE]	= 13;
global.cardData[card.spadeK, PROP.NAME]		= "King of Spades";
global.cardData[card.spadeA, PROP.VALUE]	= 14;
global.cardData[card.spadeA, PROP.NAME]		= "Ace of Spades";

// Club
global.cardData[card.club2, PROP.VALUE]		= 2;
global.cardData[card.club2, PROP.NAME]		= "Two of Clubs";
global.cardData[card.club3, PROP.VALUE]		= 3;
global.cardData[card.club3, PROP.NAME]		= "Three of Clubs";
global.cardData[card.club4, PROP.VALUE]		= 4;
global.cardData[card.club4, PROP.NAME]		= "Four of Clubs";
global.cardData[card.club5, PROP.VALUE]		= 5;
global.cardData[card.club5, PROP.NAME]		= "Five of Clubs";
global.cardData[card.club6, PROP.VALUE]		= 6;
global.cardData[card.club6, PROP.NAME]		= "Six of Clubs";
global.cardData[card.club7, PROP.VALUE]		= 7;
global.cardData[card.club7, PROP.NAME]		= "Seven of Clubs";
global.cardData[card.club8, PROP.VALUE]		= 8;
global.cardData[card.club8, PROP.NAME]		= "Eight of Clubs";
global.cardData[card.club9, PROP.VALUE]		= 9;
global.cardData[card.club9, PROP.NAME]		= "Nine of Clubs";
global.cardData[card.club10, PROP.VALUE]	= 10;
global.cardData[card.club10, PROP.NAME]		= "Ten of Clubs";
global.cardData[card.clubJ, PROP.VALUE]		= 11;
global.cardData[card.clubJ, PROP.NAME]		= "Jack of Clubs";
global.cardData[card.clubQ, PROP.VALUE]		= 12;
global.cardData[card.clubQ, PROP.NAME]		= "Queen of Clubs";
global.cardData[card.clubK, PROP.VALUE]		= 13;
global.cardData[card.clubK, PROP.NAME]		= "King of Clubs";
global.cardData[card.clubA, PROP.VALUE]		= 14;
global.cardData[card.clubA, PROP.NAME]		= "Ace of Clubs";

#endregion