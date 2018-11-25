# frozen_string_literal: true

class Games::BlueSpaceConversationsController < ApplicationController
  before_action :set_scene, only: [:index]
  before_action :set_conversation, only: [:edit, :update, :destroy]

  def index
    @conversations = @scene.conversations.order(id: :asc)
  end

  def new
    @conversation = Games::BlueSpaceConversation.new
    @scene = Games::BlueSpaceScene.find(params[:scene_id])
  end

  def edit
  end

  def create
    @conversation = Games::BlueSpaceConversation.new(conversation_params)
    last_conversation = @conversation.scene.conversations.find_by(next_id: nil)

    if @conversation.save
      last_conversation && last_conversation.update(next_id: @conversation.id)

      redirect_to games_blue_space_conversations_url(scene_id: @conversation.scene_id)
    else
      render new_games_blue_space_conversation_url(scene_id: conversation_params[:scene_id])
    end
  end

  def update
    @conversation.update(conversation_params)
    redirect_to games_blue_space_conversations_url(scene_id: @conversation.scene_id)
  end

  def destroy
    @conversation.destroy
    redirect_to games_blue_space_conversations_url(scene_id: @conversation.scene_id)
  end

  private

  def set_scene
    @scene = Games::BlueSpaceScene.find_by(id: params[:scene_id])
  end

  def set_conversation
    @conversation = Games::BlueSpaceConversation.find(params[:id])
  end

  def conversation_params
    params.require(:games_blue_space_conversation).permit(:content, :category, :scene_id, :delay, :next_id)
  end
end
