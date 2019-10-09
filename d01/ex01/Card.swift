import Foundation

class Card : NSObject {
    let color :Color
    let value :Value


init(Color :Color, Value :Value) {
    self.color = Color
    self.value = Value
}

    override var description: String {
        return "\(self.value) of \(self.color)"
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? Card {
            return (self.color == other.color && self.value == other.value)
        } else {
            return false
        }
    }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return (lhs.color == rhs.color && lhs.value == rhs.value)
    }
}

