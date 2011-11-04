class User < ActiveRecord::Base
  attr_accessible :login, :first_name, :last_name, :last_login, :last_login_ip, :can_login
  has_many :items
  has_many :tickets
  belongs_to :area
  validates_uniqueness_of :login
  def full_name
    [first_name, last_name].join(" ")
  end
  
  
  def reverse_name
    [last_name, first_name].join(", ")
  end

  def to_s
    full_name
  end
end
