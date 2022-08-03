# magic-cards

# An HTTP client API for Ruby

reference link: `https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html`

step1: You have loaded Net::HTTP with: `require 'net/http'`

step2: Get Response Data:
      - `uri = URI('https://api.magicthegathering.io/v1/cards')`
      - `res = Net::HTTP.get_response(uri)`


# Convert the response into JSON formate:
 
step1: Firstly require json.
      - `require 'json'`

step2: Then convert it into JSON through JSON.parse.
      - `response = JSON.parse(res.body)`


# Building your command line application in ruby:

reference link: `https://flatironschool.com/blog/building-your-first-command-line-application-in-ruby/`

step1: Now let’s create a file – for now let's just call it `cards.rb`, and     let’s put the following code into it to get us the simplest possible CLI application.
      - `#!/usr/bin/env ruby`

step2: Then we need to make the file executable, so run the below command in project directory:
      - `chmod +x cards.rb`

step3: And then try running the file (note the preceding `./` – you’ll need that to make this work)
      - `./cards.rb`

# Install rspec gem inside ruby application:

step1: Create a file named `Gemfile` inside project directory.
step2: Add the gem
      - `gem 'rspec'`
step3: bundle install
      - `bundle install`
step4: To generating spec_helper.rb from rspec to run the below command:
      - `rspec --init`
step5: To run the spec, run the below commond inside project directory.
      - `rspec spec/cards_spec.rb`
