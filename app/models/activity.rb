class Activity < ApplicationRecord
  belongs_to :campsite
  has_many :children

  validates :name, presence: true
end
