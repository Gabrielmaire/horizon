class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorite_cities
  has_many :favorite_pois
  has_many :pois, through: :favorite_pois
  has_many :reviews
  has_one_attached :avatar

  def favorite_poi?(poi)
    favorite_pois.map(&:poi_id).include?(poi.id)
  end
end
