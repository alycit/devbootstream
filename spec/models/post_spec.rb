require 'spec_helper'

describe Post do
  let(:post) { Post.new(media_type: 'string', posted_at: DateTime.now) }


  before(:each) do
    @cohort = mock_model(Cohort)
    @cohort.stub(name: "Golden Bears")

    @boot = mock_model(Boot)
    @boot.stub(current_phase: "6", cohort: @cohort)

    @resource = mock_model(Resource)
    @resource.stub(profile_pic_url: "www.google.com/avatar.jpg", boot: @boot, source: "instagram")

    post.resource = @resource
    post.phase_id = 5
  end

  it { should belong_to(:resource) }

  context '#twitter?' do
    it 'should respond true when it is a twitter post' do
      expect { post.twitter? }.to be_true
    end
  end

  context '#update_twitter_profile_pic' do
    describe 'matching pictures' do
      before { post.data = {"user" => {"profile_image_url" => "www.google.com/avatar.jpg"}} }

      it "should NOT change the picture" do
        expect { post.update_twitter_profile_pic }.not_to change{ post.resource.profile_pic_url }
      end
    end

    # INCOMPLETE
    # describe 'not matching pictures' do
    #   before { post.data = {"user" => {"profile_image_url" => "www.google.com/weezy.jpg"}} }
    #   it "SHOULD change to picture" do
    #     post.update_twitter_profile_pic.should_receive(:update_attributes)
    #   end
    # end
  end

  context '#add_phase_stamp' do
    describe 'when resource belongs to a boot' do
      it 'should change the phase id of the boot' do
        expect { post.add_phase_stamp }.to change{ post.phase_id }.to(6)
      end
    end
  end

  context '#add_cohort' do
    it "should assign the cohort's name to the post object" do
      expect { post.add_cohort }.to change{ post.cohort }.to("Golden Bears")
    end
  end

  context '#add_source' do
    it "should assign the resource's source name to the post object" do
      expect { post.add_source }.to change{ post.source }.to("instagram")
    end
  end

end
