assert = chai.assert
expect = chai.expect

describe 'Hand', ->
  deck = new Deck()
  hand = new Hand()

  beforeEach ->
    # deck = new Deck()
    # hand = new Hand()
    sinon.spy(hand, 'trigger')

  describe "intital player blackjack", ->
    hand.add({rank: 11, suit: 'Hearts'}, {rank: 1, suit: 'Hearts'})
    console.log hand

    it "should trigger stand if player has 21 upon deal", =>
    expect(hand.trigger).to.have.been.calledWith('stand', hand)

     