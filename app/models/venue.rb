class Venue < ActiveRecord::Base
  attr_accessible :name

  has_many :concerts, :dependent => :destroy

  validates :name, :presence => true

  def self.ordered
    self.order("name ASC")
  end
end
