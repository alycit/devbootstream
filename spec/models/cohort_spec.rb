require 'spec_helper'

describe Cohort do
  describe "validations" do
    cohort = Cohort.new(name: "Golden Bears", start_date: DateTime.now, socrates_cohort_id: 5)
    cohort.save!(:validate => false)

    it "passes validations for presence and uniqueness of 'name'" do
      should validate_uniqueness_of(:name)
      should validate_presence_of(:name)
    end
  end

  describe "associations" do
    it { should have_many(:boots) }
  end

  describe "#initialize" do
    it { should be_an_instance_of(Cohort) }
  end

end
