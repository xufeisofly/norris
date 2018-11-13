class Games::BlueSpaceSceneRelationsController < ApplicationController
  def destroy
    @relation = Games::BlueSpaceSceneRelation.find(params[:id])
    @relation.destroy

    redirect_to games_blue_space_scenes_url
  end
end
