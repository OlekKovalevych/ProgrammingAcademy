class HelloController < ApplicationController
  def index
  end

  def greeting
    @greeting = "Hello Rails"
  end

  def hello
    HelloJob.perform_at(30.seconds.from_now)
  end
end
