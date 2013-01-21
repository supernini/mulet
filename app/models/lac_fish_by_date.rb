class LacFishByDate < ActiveRecord::Base
  belongs_to :lac
  attr_accessible :date, :fish_volume
end
