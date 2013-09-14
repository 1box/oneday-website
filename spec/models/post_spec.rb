# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Post do

  let(:admin) { FactoryGirl.create(:admin) }
  before do
    @post = admin.posts.build(title: "post title", content: "My first post!")
    # @post = Post.new(content: "My first post!", post_by: user.id)
  end

  subject { @post }

  it { should respond_to(:id) }
  it { should respond_to(:title) }
  it { should respond_to(:content)}
  it { should respond_to(:post_by) }
  it { should respond_to(:admin) }

  its(:admin) { should == admin }

  it { should be_valid }

  describe "when content is not present" do
    before { @post.content = nil }
    it { should_not be_valid }
  end

  describe "when post_by is not present" do
    before { @post.post_by = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @post.title = nil }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @post.title = "a" * 51 }
    it { should_not be_valid }
  end

  describe "accesiable attributes" do
    it "should not allow access post_by" do
      expect do
        Post.new(post_by: admin.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  # let(:user)  { FactoryGirl.create(:user) }
  # describe "post authorization" do
  #   it "should not allow post by not admin user" do
  #     expect do
  #     end.should raise_error
  #   end
  # end
end
