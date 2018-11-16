class Games::BlueSpacesController < ApplicationController
  layout 'blue_space'

  def index
  end

  def show
    @game = Games::BlueSpace.find(params[:id])
  end

  def answer
    @game = Games::BlueSpace.find(params[:id])
    if @game.current_scene.answer_valid?(params[:content])
      Games::BlueSpaceSendMsgJob.perform_later(params[:content], @game.id)
      @game.next_scene!(params[:content])
      @game.process
    end

    if @game.logs.nil? && params[:content] == '开始'
      @game.init_game
      @game.process
    end
    head :no_content
  end

  def create
    @game = Games::BlueSpace.create(player_id: nil)
    @game.init_game

    render @game
  end
end
