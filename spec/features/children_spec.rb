require "rails_helper"

RSpec.feature "Children check in/out", type: :feature, js: true do
  let(:campsite) { create(:campsite) }
  let(:activity) { create(:activity, campsite: campsite) }

  context "With children" do
    before :each do
      @child_a = create(:child, name: "ChildA", activity: activity)
      @child_b = create(:child, name: "ChildB", activity: activity, state: :checked_in)
      @child_c = create(:child, name: "ChildC", activity: activity, state: :checked_out)
    end

    scenario "User can check in a child" do
      Timecop.freeze do
        visit campsite_activity_children_path(campsite, activity)
        click_link "ChildA"
        @child_a.reload
        expect(@child_a).to be_checked_in
        expect(@child_a.checked_in_at).to eq(Time.now)
      end
    end

    scenario "User can check out a child" do
      Timecop.freeze do
        visit campsite_activity_children_path(campsite, activity)
        click_link "ChildB"
        @child_b.reload
        expect(@child_b).to be_checked_out
        expect(@child_b.checked_out_at).to eq(Time.now)
      end
    end

    context "Reset" do
      scenario "User can reset a child" do
        visit campsite_activity_children_path(campsite, activity)
        click_link "ChildC"
        click_button "Accept"
        @child_c.reload
        expect(@child_c).to be_pending
        expect(@child_c.checked_in_at).to be_nil
        expect(@child_c.checked_out_at).to be_nil
      end

      scenario "User can abort reset" do
        visit campsite_activity_children_path(campsite, activity)
        click_link "ChildC"
        click_button "Cancel"
        @child_c.reload
        expect(@child_c).to be_checked_out
      end
    end
  end

  context "Without children" do
    scenario "User gets a message for no children" do
      visit campsite_activity_children_path(campsite, activity)
      expect(page).to have_text("There are no children available.")
    end
  end
end
