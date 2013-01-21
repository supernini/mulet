class LacFishByDatesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @lac_fish_by_date = LacFishByDate.new()
  end

  def search
    @lac_fish_by_date = LacFishByDate.new(params[:lac_fish_by_date])
    @lac_fish_by_dates = LacFishByDate.where(["date = ?", params[:lac_fish_by_date][:date]]).order('date DESC, fish_volume DESC')
  end
end
