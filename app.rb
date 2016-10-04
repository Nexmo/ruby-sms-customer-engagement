# web server and flash messages
require 'sinatra'

# load environment variables
# from .env file
require 'dotenv'
Dotenv.load

# specify a layout file
set :erb, layout: :layout

# nexmo library
require 'nexmo'
nexmo = Nexmo::Client.new(
  key: ENV['NEXMO_API_KEY'],
  secret: ENV['NEXMO_API_SECRET']
)

# Index
# - collects a phone number
#
get '/' do
  erb :index
end

# Notify
# - Send the user their delivery
#   notification, asking them
#   to respond back if they
#   want to make any changes
#
post '/notify' do
  notification = "Your delivery is scheduled for tomorrow between " +
                 "8am and 2pm. If you wish to change the delivery date please " +
                 "reply by typing 1 (tomorrow), 2 (Thursday) or 3 (deliver to"
                 "post office) below.\n\n";

  nexmo.send_message(
    from: ENV['NEXMO_NUMBER'],
    to: params['number'],
    text: notification
  )

  "Notification sent to #{params['number']}"
end

# Receive incoming message
#
# - Receives incoming SMS
#   message, stores it, and
#   notifies sender
#
get '/update' do
  choice = params['text']
  number = params['msisdn']

  # You can store or validate
  # the choice made here

  message = "Thank you for picking option #{choice}. " +
            "Your delivery is now fully scheduled in."

  nexmo.send_message(
    from: ENV['NEXMO_NUMBER'],
    to: number,
    text: message
  )

  body ''
end
