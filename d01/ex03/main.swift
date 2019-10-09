// let cardSpades:[Card] = Deck.allSpades
// let cardHearts:[Card] = Deck.allHearts
// let cardClubs:[Card] = Deck.allClubs
// let cardDiamonds:[Card] = Deck.allDiamonds
var cardDeck:[Card] = Deck.allCards

// print("Spades : ")
// print(cardSpades)
// print("\nDiamonds : ")
// print(cardDiamonds)
// print("\nHearts : ")
// print(cardHearts)
// print("\nClubs : ")
// print(cardClubs)
print("\nOriginal : ")
print(cardDeck)

cardDeck.shuffle()

print("\nShuffled : ")
print(cardDeck)