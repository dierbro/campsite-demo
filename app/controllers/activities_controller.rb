class ActivitiesController < ApplicationController
  def index
    @campsite = Campsite.find(params[:campsite_id])
    @activities = @campsite.activities
  end
end
