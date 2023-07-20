require 'net/http'

class SendNotification
  def initialize(message:)
    @message = message
  end

  def send
    # Put there the url of the channel you want to send the message to
    uri = URI('https://discordapp.com/api/webhooks/1131490584595533844/EfHrDReupmhhD9W-JEmX6T4xxvgFH8YlJuuBGTD1nROyq3Ke47-HfNyAhkYAurW8BcFw')
    res = Net::HTTP.post_form(uri, content: message )
    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      "Congratulation!"
    else
      res.body
    end
  end

  private 

  attr_reader :message
end
