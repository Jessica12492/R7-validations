class Order < ApplicationRecord
  
 belongs_to :customer
 accepts_nested_attributes_for :customer

  validates :product_name, presence: true
  validates :product_count, presence: true
  validates_associated :customer
end
