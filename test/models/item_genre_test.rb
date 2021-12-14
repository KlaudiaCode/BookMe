# == Schema Information
#
# Table name: item_genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer
#  item_id    :integer
#
# Indexes
#
#  index_item_genres_on_genre_id  (genre_id)
#  index_item_genres_on_item_id   (item_id)
#
require "test_helper"

class ItemGenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
