class Thing < ActiveRecord::Base
  attr_accessible :box_id, :desc, :things_attributes


  belongs_to :box
end
