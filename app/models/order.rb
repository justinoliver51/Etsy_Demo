class Order < ActiveRecord::Base
  validates :address, :city, :state, presence: true

  # Links listings with users (after adding to database a user_id in Listings)
  belongs_to :listing

  #
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
end
