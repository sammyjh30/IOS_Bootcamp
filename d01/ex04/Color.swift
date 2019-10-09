enum Color :String {
    case Hearts = "red"
    case Diamonds = "blue"
    case Spades = "black"
    case Clubs = "green"
    // https://en.wikipedia.org/wiki/Standard_52-card_deck
    static let allColors: [Color] = [Hearts, Diamonds, Spades, Clubs]
}
