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
      head :no_content
    else
      render json: { error: '请输入指定答案' }
    end
  end

  def create
    @game = Games::BlueSpace.create(player_id: nil)
    @game.init_game
  end
end
