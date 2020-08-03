class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

# The 'to' number would need to be changed to the phone number param that comes in from the Schoology/AWS request
  def call
    client = Twilio::REST::Client.new
    body = @message.body
    
    @message.recipients.each do |rec|
      client.messages.create({
        from: Rails.application.secrets.twilio_phone_number,
        to: rec,
        body: body
      })
    end
  end
end
