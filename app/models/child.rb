class Child < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_name, against: :name,
                                   using: { tsearch: { prefix: true } }

  default_scope { order(name: :asc) }
  scope :checked_in, (-> { where(state: :checked_in) })
  scope :not_checked_out, (-> { where.not(state: :checked_out) })

  belongs_to :activity

  validates :name, presence: true

  state_machine initial: :pending do
    before_transition on: :check_in do |child|
      child.checked_in_at = Time.now
    end

    before_transition on: :check_out do |child|
      child.checked_out_at = Time.now
    end

    before_transition on: :reset do |child|
      child.checked_in_at = nil
      child.checked_out_at = nil
    end

    event :check_in do
      transition pending: :checked_in
    end

    event :check_out do
      transition checked_in: :checked_out
    end

    event :reset do
      transition checked_out: :pending
    end
  end

  def toggle_state
    if pending?
      check_in
    elsif checked_in?
      check_out
    else
      reset
    end
  end
end
