class Listing < ActiveRecord::Base
  if Rails.env.development?
  	has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpeg"
  else
  	has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpeg",
  					  :storage => :dropbox,
    				  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    				  :path => ":style/:id_:filename"
    				  #:dropbox_options => {...}
   end

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0}

  # Links listings with users (after adding to database a user_id in Listings)
  belongs_to :user

  # Links listing with orders (users can order multiple items of the same listing)
  has_many :orders
end