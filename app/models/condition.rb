# == Schema Information
#
# Table name: conditions
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Condition < ApplicationRecord
  has_many :items, dependent: :nullify

  validates :name, presence: true

  def to_s
    name
  end
end
