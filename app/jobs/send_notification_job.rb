class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform
    SendNotification.new(message: "Remember about daily dose of coding!").send
  end
end
