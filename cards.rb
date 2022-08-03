#!/usr/bin/env ruby

require 'net/http'
require 'json'

uri = URI('https://api.magicthegathering.io/v1/cards')
res = Net::HTTP.get_response(uri)

response = JSON.parse(res.body)
cards = response["cards"]

def acceptance_criteria1(cards)
  cards.group_by { |card| card["set"] }
end

def acceptance_criteria2(cards_set)
  hash = {}
  cards_set.each do |key,value|
    hash["key"] = value.group_by{ |set| set["rarity"] }
  end
  hash["key"]
end

def acceptance_criteria3(cards_set)
  begin
    cards_set.select{|card| card["colors"] = "red" && card["colors"] = "blue" }
  rescue
    "Card set is not available."
  end
end

cards_set = acceptance_criteria1(cards)
puts cards_set
puts acceptance_criteria2(cards_set)
puts acceptance_criteria3(cards_set["10E"])
