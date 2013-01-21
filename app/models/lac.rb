class Lac < ActiveRecord::Base
  attr_accessible :longitude, :name, :initial_volume
  has_many :lac_temperatures
  has_many :lac_fish_by_dates

  validates :name, :presence => true, :uniqueness => true
  validates :initial_volume, :numericality => true, :presence => true
  validates :longitude, :numericality => true, :presence => true
end
