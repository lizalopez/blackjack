class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @scores() > 21 then @trigger "bust"
    if @scores( is 21 then @trigger "stand"
    @last()

  stand: ->
    if !@isDealer
      @trigger "stand"

  hitDealer: ->
    @at(0).flip()
    @hit() while @scores() < 17
    @trigger "endGame"

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    possScore = [@minScore(), @minScore() + 10 * @hasAce()]
    if possScore[1] > 21 then possScore[0] else possScore[1]

   message: (msg)->
     alert msg
