class HelloController < ApplicationController
  def index
  end

  def chat_gpt
    cache = Rails.cache.read :conversation
    @conversation = cache || []
    if params[:message_to_chat].present?
      response_from_chat = ChatGptService.new(message: params[:message_to_chat]).call
      @conversation.append(params[:message_to_chat])
      @conversation.append(response_from_chat)
    end
    Rails.cache.write :conversation, @conversation, expires_in: 15.minutes
  end

  def greeting
    @greeting = "Hello Rails"
  end

  def rails_version
    authorize current_user
    @rails_version = Rails.version
  end

  def hello
    HelloJob.perform_at(30.seconds.from_now)
  end
end
