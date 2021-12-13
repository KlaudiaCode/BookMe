# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  is_admin        :boolean
#  name            :string           not null
#  password_digest :string
#  phone           :integer
#  surname         :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :items
  has_one :address
  has_secure_password
  has_many :trades

  validates :name, :surname, :username, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, uniqueness: true
end
