require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should be_valid}

  describe "when user_id is no present" do
	  before { @micropost.user_id = nil }
	  it { should_not be_valid }
  end

  describe "with content taht is too long" do
    before { @micropost.content = "a"*141 }
    it { should_not be_valid }
  end
end