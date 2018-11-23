class Games::BlueSpacesController < ApplicationController
  layout 'blue_space'
  skip_before_action :verify_authenticity_token, only: :answer

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

    if @game.logs.empty? && params[:content] == 'start'
      @game.init_game
      @game.process
    elsif @game.logs.any? && params[:content] == 'reset'
      @game.logs.destroy_all
      @game.init_game
      @game.process
    end

    render nothing: true
  end

  def create
    @game = Games::BlueSpace.create(player_id: nil)
    @game.init_game

    render @game
  end
end
