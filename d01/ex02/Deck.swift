import Foundation


class Deck : NSObject {
    static let allSpades :[Card] = Value.allValues.map({Card(Color:Color.Spades, Value:$0)});
    static let allDiamonds :[Card] = Value.allValues.map({Card(Color:Color.Diamonds, Value:$0)});
    static let allHearts :[Card] = Value.allValues.map({Card(Color:Color.Hearts, Value:$0)});
    static let allClubs :[Card] = Value.allValues.map({Card(Color:Color.Clubs, Value:$0)});

    static let allCards = allSpades + allDiamonds + allHearts + allClubs
}
