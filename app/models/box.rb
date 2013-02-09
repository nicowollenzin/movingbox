class Box < ActiveRecord::Base
  attr_accessible :link, :name, :things_attributes

  has_many :things, :dependent => :destroy
  accepts_nested_attributes_for :things, :reject_if => lambda { |a| a[:desc].blank? }
end
