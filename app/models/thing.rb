class Thing < ActiveRecord::Base
  attr_accessible :box_id, :desc


  belongs_to :box

  
end
