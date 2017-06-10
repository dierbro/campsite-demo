require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should belong_to(:campsite) }
  it { should have_many(:children) }

  it { should validate_presence_of(:name) }
end
