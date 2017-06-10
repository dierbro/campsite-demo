class ChildrenController < ApplicationController
  before_action :load_parents, only: [:index]

  def index
    @children = ChildrenSearchService.new(@campsite, @activity, params[:q]).run

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @child = Child.find(params[:id])
    @child.toggle_state
  end

  private

  def load_parents
    @campsite = Campsite.find(params[:campsite_id])
    unless params[:activity_id] == "all"
      @activity = @campsite.activities.find(params[:activity_id])
    end
    @only_count = params[:only_count]
  end
end
