require 'spec_helper'

describe User do
  describe "#admin?" do
    let(:user) { FactoryGirl.create(:user, role: 'user')  }
    context "when role is admin" do
      it "should return true" do
        user.role = 'admin'
        user.admin?.should be_true
      end
    end
    context "when role is user" do
      it "should return false" do
        user.role = 'user'
        user.admin?.should be_false
      end
    end
  end
end
