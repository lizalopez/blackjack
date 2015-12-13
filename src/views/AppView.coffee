class window.AppView extends Backbone.View
  template: _.template '
    <button class="play-button">Play</button> <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
      <div id="results"><h2><%= endGameMsg %></h2></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .play-button': ->
      @model.get('playerHand').reset(null)
      @model.get('dealerHand').reset(null)

  initialize: ->
    @model.get('dealerHand').on "endGame", =>
      @render()
      @$('.play-button').toggle()
      @$('.hit-button').toggle()

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

