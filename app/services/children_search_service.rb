class ChildrenSearchService
  attr_accessor :campsite, :activity, :needle

  def initialize(campsite, activity, needle)
    self.campsite = campsite
    self.activity = activity
    self.needle = needle
  end

  def run
    children = if @activity.nil?
                 Child.where(activity: @campsite.activities)
               else
                 @activity.children
               end

    return children if needle.blank?

    children.search_by_name(needle)
  end
end
