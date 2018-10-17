class Restaurant < ApplicationRecord

  # validates :name, :presence => true

  belongs_to :user
  has_many :menus

  self.per_page = 3
end
