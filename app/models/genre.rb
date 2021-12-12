# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  group      :boolean
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  has_many :item_genres
  has_many :items, through: :item_genres
end
