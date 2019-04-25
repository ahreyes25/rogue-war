/// @param cardEnum1
/// @param cardEnum2

var _card1 = argument0;
var _card2 = argument1;

var _card1Value = global.cardData[_card1, PROP.VALUE];
var _card2Value = global.cardData[_card2, PROP.VALUE];

// Raw Value Check
// ***[no class or buff checks, insert those here]***

if (_card1Value > _card2Value)
	return ">";
else if (_card1Value < _card2Value)
	return "<";
else if (_card1Value == _card2Value)
	return "=";
else
	return "!=";