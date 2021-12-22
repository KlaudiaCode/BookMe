# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bio             :string
#  email           :string           not null
#  is_admin        :boolean
#  latitude        :decimal(, )
#  longitude       :decimal(, )
#  name            :string           not null
#  password_digest :string
#  phone           :integer
#  place           :string
#  surname         :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :items
  has_secure_password
  has_many :trades

  validates :name, :surname, :username, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: true
end
