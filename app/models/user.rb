class User < ApplicationRecord
  include Omniauthenticable

  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  has_many :company_sales, dependent: :destroy

  validates_presence_of :email

  validates_uniqueness_of :email, case_sensitive: true
end