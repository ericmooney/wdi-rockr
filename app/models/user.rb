class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create!(provider: auth["provider"], uid: auth["uid"], name: auth["info"]["nickname"])
  end
end