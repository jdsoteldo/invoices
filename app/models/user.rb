class User < ApplicationRecord

  has_many :businesses, class_name: "Business", foreign_key: "user_id"
  has_many :invoices
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
