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
class Entry < ApplicationRecord
  belongs_to :contest
  belongs_to :country
end
