# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  city       :string           not null
#  num        :integer          not null
#  street     :string           not null
#  street_num :string
#  zip_code   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
class Address < ApplicationRecord
  belongs_to :user
end
