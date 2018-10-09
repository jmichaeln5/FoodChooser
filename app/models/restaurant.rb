class Restaurant < ApplicationRecord

  belongs_to :user
  has_many :menus
  
  self.per_page = 3
end
