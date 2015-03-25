class Item < ActiveRecord::Base
  belongs_to :user
  validates :item, length: { maximum: 100 }
end
