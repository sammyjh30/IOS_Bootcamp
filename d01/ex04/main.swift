var cardDeck:[Card] = Deck.allCards
var theDeck = Deck(sorted: false)

print("\nOriginal : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

var draw1 :Card = theDeck.draw()!
var draw2 :Card = theDeck.draw()!
var draw3 :Card = theDeck.draw()!

print("\nNew : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

theDeck.fold(c: draw1)

print("\nNew 2 : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

theDeck.fold(c: draw3)

print("\nNew 2 : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)


theDeck.fold(c: draw2)

print("\nNew 2 : ")
print("cards : ")
print(theDeck.cards)
print("outs : ")
print(theDeck.outs)
print("discards : ")
print(theDeck.discards)

print(theDeck)
print(theDeck.description)