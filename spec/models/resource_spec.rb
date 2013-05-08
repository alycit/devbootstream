require 'spec_helper'

describe Resource do

  it { should belong_to(:boot) }
  it { should have_many(:posts) }

  context "#valid_account?" do

    it "should return false if there are no Twitter users matching that alias"

    it "should return false if the user has a protected Twitter account"

    it "should return true if the user's Twitter handle exists and it is not protected"
  end

  context "create_identifier_id" do
  end

  context "#oldest_tweet_id" do

    context 'user has tweets in database already' do
      it "should return the oldest tweet in the db"
    end

    context 'user does not have tweets in database' do
      it "should call the API for the user's most recent tweet"
    end

  end

end
