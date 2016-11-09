# Two-way SMS for customer engagement

A Sinatra (Ruby) app showing how to implement two-way customer engagement over SMS using the Nexmo SMS API.

## Prerequisites

* [A Nexmo account](https://dashboard.nexmo.com/sign-up)
* [Ruby 2.1+](https://www.ruby-lang.org/) and [Bundler](http://bundler.io/)

## Getting started

```sh
# clone this repository
git clone git@github.com:Nexmo/ruby-customer-engagement.git
# change to folder
cd ruby-sms-customer-engagement
# install dependencies
bundle install
# create a .env
cp .env.example .env
```

Next you will need to sign up for a Nexmo account, get your API credentials from the API dashboard, register a SMS number, and put all of these details in your `.env` file.


Then you can start the server.

```sh
ruby app.rb
```

Finally make sure to link the callback URL for your number to your app. For this you will need a public IP or a tool like [ngrok](https://ngrok.com/). We highly recommend using the [Nexmo CLI](https://github.com/Nexmo/nexmo-cli) to link your number up to the callback URL:

```sh
> nexmo link:sms [your_nexmo_number] http://[your.domain.com]/inbound
Number updated
```

## Usage

Once your server is started:

* Visit [localhost:4567](http://localhost:4567/)
* Fill in your phone number without any leading 0's or +'s (e.g. `445555666777`)
* You will receive a message in seconds, respond to it by typing "1", "2" or "3"
* Your app will receive the incoming message in and respond back to your phone with a confirmation in seconds.

As this is a very simple starter app this app does not verify or store your response.

## License

This project is licensed under the [MIT license](LICENSE).
