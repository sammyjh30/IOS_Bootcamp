import Foundation


class Deck : NSObject {
    static let allSpades :[Card] = Value.allValues.map({Card(Color:Color.Spades, Value:$0)});
    static let allDiamonds :[Card] = Value.allValues.map({Card(Color:Color.Diamonds, Value:$0)});
    static let allHearts :[Card] = Value.allValues.map({Card(Color:Color.Hearts, Value:$0)});
    static let allClubs :[Card] = Value.allValues.map({Card(Color:Color.Clubs, Value:$0)});

    static let allCards = allSpades + allDiamonds + allHearts + allClubs
}

extension Array {
    /** Randomizes the order of an array's elements. */
    // https://gist.github.com/ijoshsmith/5e3c7d8c2099a3fe8dc3
    mutating func shuffle()
    {
        //How many times it's shuffled
        for _ in 0..<20
        {
            sort { (_,_) in arc4random() < arc4random() }
            //arc4random - random no from 0 to 4 million
        }
    }
}
