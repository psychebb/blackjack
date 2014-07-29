require 'spec_helper'
require 'blackjack'

describe Blackjack do

  let(:bj){Blackjack.new}

  context "Cards with normal number" do
    it "should return self number if only 1 card in hand" do
      expect(bj.getscore(["4"])).to eq(4)
    end

    it "should return sum of all cards" do
      expect(bj.getscore(%w{3 6 9})).to eq(18)
    end
  end

  context "Cards with Jack, Queen and King" do
    it "should return 10 if only 1 special card" do
      expect(bj.getscore(%w{J})).to eq(10)
      expect(bj.getscore(%w{Q})).to eq(10)
      expect(bj.getscore(%w{K})).to eq(10)
    end

    it "should return correct score with mixed number and 'JQK'" do
      expect(bj.getscore(%w{3 5 J K})).to eq(28)
    end
  end

  context "Cards with Ace" do
    it "should be counted as 11 if score is smaller than 21" do
      expect(bj.getscore(%w{3 5 A})).to eq(19)
    end

    it "should be counted as 1 if score exceeds 21" do
      expect(bj.getscore(%w{1 J A})).to eq(12)
    end

    it "should be counted as 11 if score == 21" do
      expect(bj.getscore(%w{K A})).to eq(21)
    end
  end
end