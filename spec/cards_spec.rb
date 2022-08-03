require './cards.rb'
require 'net/http'
require 'json'

uri = URI('https://api.magicthegathering.io/v1/cards')
res = Net::HTTP.get_response(uri)

response = JSON.parse(res.body)
cards = response["cards"]
cards_set = acceptance_criteria1(cards)
set = acceptance_criteria3(cards_set["10E"])

context 'acceptance_criteria1' do
  it "check" do
    expect(cards_set.keys).to include("10E")
  end
end

context 'acceptance_criteria2' do
  it "check" do  
    expect(acceptance_criteria2(cards_set).keys).to include("Uncommon", "Common", "Rare")
  end
end

context 'acceptance_criteria3' do
  if set.nil?
    it "if set not present" do
      expect(set).to eql("Card set is not available.")
    end
  else
    it "if set present" do
      set = set.first
      expect(set["colors"]).to eql("blue").or eq("red")
    end
  end
end
