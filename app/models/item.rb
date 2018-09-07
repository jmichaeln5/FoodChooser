class Item < ApplicationRecord
  belongs_to :menu
  
  self.per_page = 3
end
