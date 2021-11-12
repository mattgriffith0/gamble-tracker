class User < ApplicationRecord
  has_many :games
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def image_location
    if image.nil?
      'https://cdn.shopify.com/s/files/1/1476/1216/products/d6-big-transparent-blue_500x.png?v=1586987170'
    else
      image
    end
  end
end
