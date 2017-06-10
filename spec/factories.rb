FactoryGirl.define do
  factory :child do
    name "MyString"
    activity nil
  end
  factory :activity do
    name "MyString"
    campsite nil
  end
  factory :campsite do
    name "MyString"
  end
end
