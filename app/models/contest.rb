# == Schema Information
#
# Table name: contests
#
#  id                    :integer          not null, primary key
#  year                  :integer
#  host_country_id       :integer          not null
#  host_city             :string
#  slogan                :string
#  first_semifinal_date  :datetime
#  second_semifinal_date :datetime
#  grand_final_date      :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_contests_on_host_country_id  (host_country_id)
#
# Foreign Keys
#
#  host_country_id  (host_country_id => countries.id)
#
class Contest < ApplicationRecord
  belongs_to :host_country, class_name: 'Country'
end
