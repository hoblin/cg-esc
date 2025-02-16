json.extract! entry, :id, :contest_id, :country_id, :artist_name, :song_title, :lyrics, :en_lyrics, :semifinal, :semifinal_order, :final_order, :qualified, :created_at, :updated_at
json.url entry_url(entry, format: :json)
