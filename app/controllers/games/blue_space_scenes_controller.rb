class Games::BlueSpaceScenesController < ApplicationController
  before_action :set_scene, only: [:edit, :update, :destroy]

  def index
    @scenes = Games::BlueSpaceScene.all.order(id: :asc)
  end

  def new
    @scene = Games::BlueSpaceScene.new
  end

  def create
    @scene = Games::BlueSpaceScene.new(scene_params)
    if @scene.save
      redirect_to games_blue_space_scenes_url
    else
      render new_games_blue_space_scene_url
    end
  end

  def edit
  end

  def update
    @scene.update(scene_params)
    redirect_to games_blue_space_scenes_url
  end

  def destroy
    @scene.destroy
    redirect_to games_blue_space_scenes_url
  end

  private

  def set_scene
    @scene = Games::BlueSpaceScene.find_by(id: params[:id])
  end

  def scene_params
    params.require(:games_blue_space_scene).permit(:name, :next_id)
  end
end
