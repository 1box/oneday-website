# == Schema Information
#
# Table name: relationships
#
#  id          :integer         not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Relationship do

  let (:follower) { FactoryGirl.create(:user) }
  let (:followed) { FactoryGirl.create(:user) }
  let (:relationship) do
    follower.relationships.build(followed_id: followed.id)
  end

  subject { relationship }

  describe "accessible attributes" do
    it "should not allow access to follower_id" do
      expect do
        Relationship.new(follower_id: follower.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end

