FactoryGirl.define do
  factory :child do
    name "MyString"
    activity nil
    state "MyString"
    checked_in_at "2017-06-10 07:59:20"
    checked_out_at "2017-06-10 07:59:20"
  end
  factory :activity do
    name "MyString"
    campsite nil
  end
  factory :campsite do
    name "MyString"
  end
end
