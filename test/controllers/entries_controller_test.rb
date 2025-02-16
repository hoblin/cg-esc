require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url
    assert_response :success
  end

  test "should get new" do
    get new_entry_url
    assert_response :success
  end

  test "should create entry" do
    assert_difference("Entry.count") do
      post entries_url, params: { entry: { artist_name: @entry.artist_name, contest_id: @entry.contest_id, country_id: @entry.country_id, en_lyrics: @entry.en_lyrics, final_order: @entry.final_order, lyrics: @entry.lyrics, qualified: @entry.qualified, semifinal: @entry.semifinal, semifinal_order: @entry.semifinal_order, song_title: @entry.song_title } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test "should show entry" do
    get entry_url(@entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_entry_url(@entry)
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { artist_name: @entry.artist_name, contest_id: @entry.contest_id, country_id: @entry.country_id, en_lyrics: @entry.en_lyrics, final_order: @entry.final_order, lyrics: @entry.lyrics, qualified: @entry.qualified, semifinal: @entry.semifinal, semifinal_order: @entry.semifinal_order, song_title: @entry.song_title } }
    assert_redirected_to entry_url(@entry)
  end

  test "should destroy entry" do
    assert_difference("Entry.count", -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end
end
