require 'rails_helper'

RSpec.describe Campsite, type: :model do
  it { should have_many(:activities) }
end
