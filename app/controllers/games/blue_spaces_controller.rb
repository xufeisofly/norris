class Games::BlueSpacesController < ApplicationController
  layout 'blue_space'

  def index
  end

  def show
    @game = Games::BlueSpace.find(params[:id])
  end
end
