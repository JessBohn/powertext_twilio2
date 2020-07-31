class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message.body
  end

# The 'to' number would need to be changed to the phone number param that comes in from the Schoology/AWS request
  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.secrets.twilio_phone_number,
      to: '+19379039593',
      body: message
    })
  end
end
