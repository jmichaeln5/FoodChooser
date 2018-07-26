class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy

  self.per_page = 3
end
