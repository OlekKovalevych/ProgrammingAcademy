class HelloController < ApplicationController
  def index
  end

  def greeting
    @greeting = "Hello Rails"
  end
end
