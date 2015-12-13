# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model


  initialize: ->
    @set 'endGameMsg', ''
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand bust', => @get('dealerHand').hitDealer()
    @get('dealerHand').on 'endGame', => 
      playerScore = @get('playerHand').scores()
      dealerScore = @get('dealerHand').scores()
      if playerScore > 21
        @set 'endGameMsg', "Busted! Dealer wins"
      else
        if dealerScore > 21
          @set 'endGameMsg', "You win!"
        else 
          if playerScore > dealerScore
            @set 'endGameMsg', "You win!"
          else if playerScore < dealerScore
            @set 'endGameMsg', "Dealer wins!"
          else 
            @set 'endGameMsg', "Push"
