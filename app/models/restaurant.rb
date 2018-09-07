class Restaurant < ApplicationRecord

  belongs_to :user

  has_many :menus, dependent: :destroy
  # has_many :items, through: :menus

  self.per_page = 3
end
