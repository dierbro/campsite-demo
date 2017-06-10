require "rails_helper"

RSpec.feature "Activity selector", type: :feature do
  let(:campsite) { create(:campsite) }

  context "With activities" do
    before :each do
      @activity = create(:activity, name: "ActivityA", campsite: campsite)
      visit campsite_activities_path(campsite)
    end

    scenario "User can select a secific activity" do
      click_link "ActivityA"
      expect(current_path).to eq(campsite_activity_children_path(campsite, @activity))
    end

    scenario "User can select all activities" do
      click_link "All Activities"
      expect(current_path).to eq(campsite_activity_children_path(campsite, :all))
    end
  end

  context "Without activities" do
    scenario "User gets a message for no activities" do
      visit campsite_activities_path(campsite)
      expect(page).to have_text("There are no activities available.")
    end
  end
end
