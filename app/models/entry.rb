# == Schema Information
#
# Table name: entries
#
#  id              :integer          not null, primary key
#  artist_name     :string
#  en_lyrics       :text
#  final_order     :integer
#  lyrics          :text
#  qualified       :boolean
#  semifinal       :integer
#  semifinal_order :integer
#  song_title      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contest_id      :integer          not null
#  country_id      :integer          not null
#
# Indexes
#
#  index_entries_on_contest_id  (contest_id)
#  index_entries_on_country_id  (country_id)
#
# Foreign Keys
#
#  contest_id  (contest_id => contests.id)
#  country_id  (country_id => countries.id)
#

# @!attribute [r] id
#   @return [Integer] the unique identifier for the entry
# @!attribute [rw] artist_name
#   @return [String] the name of the performing artist or group
# @!attribute [rw] en_lyrics
#   @return [Text] English translation of the song lyrics
# @!attribute [rw] final_order
#   @return [Integer] the performance order number in the grand final
# @!attribute [rw] lyrics
#   @return [Text] the original lyrics of the song
# @!attribute [rw] qualified
#   @return [Boolean] whether the entry qualified for the grand final
# @!attribute [rw] semifinal
#   @return [Integer] which semifinal the entry competed in (1 or 2)
# @!attribute [rw] semifinal_order
#   @return [Integer] the performance order number in the semifinal
# @!attribute [rw] song_title
#   @return [String] the title of the song
# @!attribute [rw] contest_id
#   @return [Integer] foreign key reference to the contest this entry participated in
# @!attribute [rw] country_id
#   @return [Integer] foreign key reference to the country this entry represents
# @!attribute [r] created_at
#   @return [DateTime] when the record was created
# @!attribute [r] updated_at
#   @return [DateTime] when the record was last updated
#
# @!method contest
#   @return [Contest] the contest this entry participated in
# @!method country
#   @return [Country] the country this entry represents
class Entry < ApplicationRecord
  belongs_to :contest
  belongs_to :country
end
