# == Schema Information
#
# Table name: contests
#
#  id                    :integer          not null, primary key
#  first_semifinal_date  :datetime
#  grand_final_date      :datetime
#  host_city             :string
#  second_semifinal_date :datetime
#  slogan                :string
#  year                  :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  host_country_id       :integer          not null
#
# Indexes
#
#  index_contests_on_host_country_id  (host_country_id)
#
# Foreign Keys
#
#  host_country_id  (host_country_id => host_countries.id)
#
require "test_helper"

class ContestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
