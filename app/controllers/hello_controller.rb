class HelloController < ApplicationController
  def index
  end

  def greeting
    @greeting = "Hello Ruby"
  end
end
