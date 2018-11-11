# frozen_string_literal: true

module Games
  class BlueSpaceConversationsController < ApplicationController
    before_action :set_scene, only: [:index]
    before_action :set_conversation, only: [:edit, :update, :destroy]

    def index
      @conversations = @scene&.conversations.order(id: :asc)
    end

    def show
    end

    def new
      @conversation = Games::BlueSpaceConversation.new
      @scene = Games::BlueSpaceScene.find(params[:scene_id])
    end

    def create
      last_conversation = Games::BlueSpaceConversation.find_by(next_id: nil)
      @conversation = Games::BlueSpaceConversation.new(conversation_params)
      if @conversation.save
        last_conversation && last_conversation.update(next_id: @conversation.id)

        redirect_to games_blue_space_conversations_url(scene_id: @conversation.scene_id)
      end
    end

    def update
      @conversation.update(conversation_params)
      redirect_to games_blue_space_conversations_url(scene_id: @conversation.scene_id)
    end

    def destroy
      if @conversation.destroy
        redirect_to games_blue_space_conversations_url(scene_id: @conversation.scene_id)
      end
    end

    private

    def set_scene
      @scene = Games::BlueSpaceScene.find_by(id: params[:scene_id])
    end

    def set_conversation
      @conversation = Games::BlueSpaceConversation.find(params[:id])
    end

    def conversation_params
      params.require(:games_blue_space_conversation).permit(:content, :category, :scene_id)
    end
  end
end
