class Condition < ApplicationRecord
  has_many :items

  def to_s
    name
  end
end
