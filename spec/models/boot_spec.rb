require 'spec_helper'

describe Boot do
  before(:each) do
    @grasshopper_cohort = mock_model(Cohort)
    @grasshopper_cohort.stub(start_date: start_date, socrates_cohort_id: 5 )
  end

  let(:start_date) { Date.new(2013,6,24) }
  let(:name) { "John Smith" }
  let(:socrates_id) { 15 }
  let(:boot) do
    boot = Boot.new(name: name, socrates_id: socrates_id)
    boot.cohort = @grasshopper_cohort
    boot
  end

  describe "validations" do
    it "passes validations of presence and uniqueness" do
      boot = Boot.new(name: "John Smith", socrates_id: 5)
      boot.cohort = @grasshopper_cohort
      boot.save!(:validate => false)
      
      should validate_presence_of(:name)
      should validate_presence_of(:socrates_id)
      should validate_uniqueness_of(:socrates_id)
      should validate_uniqueness_of(:name)

    end
  end

  describe "associations" do
    it { should belong_to(:cohort) }
    it { should have_many(:resources) }
    it { should have_many(:posts).through(:resources) }
  end

  describe '#initialize' do
    it { should be_an_instance_of(Boot) }
  end

  describe '#current_phase' do
    before(:each) do
      start_date = Date.new(2013,6,24)
      @date1 = start_date - 1.week
      @date2 = start_date + 2.weeks
      @date3 = start_date + 4.weeks
      @date4 = start_date + 7.weeks
      @date5 = start_date + 10.weeks 
      @date6 = start_date + 25.weeks
    end

    it 'should return phase 0 when before start date' do
      boot.current_phase(@date1).should eq(0)
    end

    it 'should return phase 1 when it is the first 3 weeks of DBC' do
      boot.current_phase(@date2).should eq(1)
    end

    it 'should return phase 2 when it is week 3-6 of DBC' do
      boot.current_phase(@date3).should eq(2)
    end

    it 'should return phase 3 when it is weeks 7-9 of DBC' do
      boot.current_phase(@date4).should eq(3)
    end

    it 'should return phase 4 when it is weeks 9-12 of DBC' do
      boot.current_phase(@date5).should eq(4)
    end

    it 'should return phase 5 when it is after 12 weeks of DBC' do
      boot.current_phase(@date6).should eq(5)
    end
  end

  describe '#current_week' do
    before(:each) do
      start_date = Date.new(2013,6,24)
      @date1 = start_date - 1.week
      @date2 = start_date + 3.weeks
      @date3 = start_date + 25.weeks
    end

    it 'should be a date object' do
      @date1.should be_an_instance_of(Date)
    end
    it 'should return week 0 if it is before the first week' do
      boot.current_week(@date1).should eq(0)
    end

    it 'should return appropriate week if it is between one week to 12 weeks after the start date' do
      boot.current_week(@date2).should eq(3)
    end

    it 'should return week 13 if it is more than 12 weeks after the start date' do
      boot.current_week(@date3).should eq(13)
    end

  end
end
