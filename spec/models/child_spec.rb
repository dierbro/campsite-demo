require 'rails_helper'

RSpec.describe Child, type: :model do
  it { should belong_to(:activity) }

  it { should validate_presence_of(:name) }

  context "toggle_state" do
    it "transitions to the next state" do
      child = create(:child)
      expect(child).to be_pending

      child.toggle_state
      expect(child).to be_checked_in

      child.toggle_state
      expect(child).to be_checked_out

      child.toggle_state
      expect(child).to be_pending
    end
  end
end
