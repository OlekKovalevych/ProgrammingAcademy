class HelloJob < ApplicationJob
  queue_as :default
  def perform
    puts "Hi! The job is done!"
  end
end
