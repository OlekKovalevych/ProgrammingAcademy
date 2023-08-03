class ChatGptService
    BadResponseError = Class.new(StandardError)

    API_URL = 'https://api.openai.com/v1/chat/completions'
    MODEL = 'gpt-3.5-turbo'

    def initialize(message:)
        @message = message
    end

    def call
        response = HTTParty.post(API_URL, body: body.to_json, headers: headers)
        raise BadResponseError, response['error']['message'] unless response.code == 200
        response_text_parser(response)
    end

    private

    attr_reader :message

    def body
        {
            model: MODEL,
            messages: [{role: 'user', content: message}]
        }
    end

    def headers
        {
            'Content-Type' => 'application/json',
            'Authorization' => "Bearer #{ENV.fetch('CHAT_GPT_API_KEY', '')}"
        }
    end

    def response_text_parser(response)
        response['choices'].first.dig('message', 'content')
    end
end 
