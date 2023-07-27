class HelloController < ApplicationController
  def index
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
