require "rails_helper"

RSpec.feature "Children search", type: :feature, js: true do
  let(:campsite) { create(:campsite) }
  let(:activity) { create(:activity, campsite: campsite) }

  context "With children" do
    before :each do
      create(:child, name: "APreChildA", activity: activity)
      create(:child, name: "BPreChildB", activity: activity)
      create(:child, name: "CPreChildC", activity: activity)
    end

    scenario "User can search children by name" do
      visit campsite_activity_children_path(campsite, activity)
      fill_in "child-search", with: "APre"
      expect(page).to have_text("APreChildA")
      expect(page).to_not have_text("BPreChildB")
      expect(page).to_not have_text("CPreChildC")
    end
  end
end
