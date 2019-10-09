import Foundation


class Deck : NSObject {
    static let allSpades :[Card] = Value.allValues.map({Card(Color:Color.Spades, Value:$0)});
    static let allDiamonds :[Card] = Value.allValues.map({Card(Color:Color.Diamonds, Value:$0)});
    static let allHearts :[Card] = Value.allValues.map({Card(Color:Color.Hearts, Value:$0)});
    static let allClubs :[Card] = Value.allValues.map({Card(Color:Color.Clubs, Value:$0)});

    var cards :[Card] = []
    var discards :[Card] = []
    var outs :[Card] = []

    static let allCards = allSpades + allDiamonds + allHearts + allClubs

    init(sorted :Bool) {
        self.cards = Deck.allCards
        if sorted == false {
            self.cards.shuffle()
        }
    }

    override var description: String {
        return "\(self.cards.description)"
    }

    func draw() -> Card? {
        var top :Card?
        top = self.cards.removeFirst()
        self.outs.append(top!)
        return top
    }

    func fold(c: Card) {
        if self.outs.contains(c) {
            if let index = self.outs.firstIndex(of: c) {
                self.outs.remove(at: index)
            }
            self.discards.append(c)
        }
    }
}

extension Array {
    /** Randomizes the order of an array's elements. */
    // https://gist.github.com/ijoshsmith/5e3c7d8c2099a3fe8dc3
    mutating func shuffle()
    {
        for _ in 0..<20
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
