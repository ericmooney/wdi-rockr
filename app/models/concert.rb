class Concert < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :artist_name, :performing_on, :venue_id

  def self.ordered
    self.order("performing_on ASC")
  end
end
