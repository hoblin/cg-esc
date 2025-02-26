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

# @!attribute [r] id
#   @return [Integer] the unique identifier for the contest
# @!attribute [rw] year
#   @return [Integer] the year in which the contest was held
# @!attribute [rw] host_country_id
#   @return [Integer] foreign key reference to the country hosting the contest
# @!attribute [rw] host_city
#   @return [String] the name of the city hosting the contest
# @!attribute [rw] slogan
#   @return [String] the official slogan for the contest
# @!attribute [rw] first_semifinal_date
#   @return [DateTime] the date and time when the first semifinal was held
# @!attribute [rw] second_semifinal_date
#   @return [DateTime] the date and time when the second semifinal was held
# @!attribute [rw] grand_final_date
#   @return [DateTime] the date and time when the grand final was held
# @!attribute [r] created_at
#   @return [DateTime] when the record was created
# @!attribute [r] updated_at
#   @return [DateTime] when the record was last updated
#
# @!method host_country
#   @return [Country] the country that hosted this contest
# @!method entries
#   @return [ActiveRecord::Relation<Entry>] all entries participating in this contest
class Contest < ApplicationRecord
  belongs_to :host_country, class_name: "Country"
  has_many :entries
end
