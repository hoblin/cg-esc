require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
  setup do
    @entry = entries(:one)
  end

  test "visiting the index" do
    visit entries_url
    assert_selector "h1", text: "Entries"
  end

  test "should create entry" do
    visit entries_url
    click_on "New entry"

    fill_in "Artist name", with: @entry.artist_name
    fill_in "Contest", with: @entry.contest_id
    fill_in "Country", with: @entry.country_id
    fill_in "En lyrics", with: @entry.en_lyrics
    fill_in "Final order", with: @entry.final_order
    fill_in "Lyrics", with: @entry.lyrics
    check "Qualified" if @entry.qualified
    fill_in "Semifinal", with: @entry.semifinal
    fill_in "Semifinal order", with: @entry.semifinal_order
    fill_in "Song title", with: @entry.song_title
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "should update Entry" do
    visit entry_url(@entry)
    click_on "Edit this entry", match: :first

    fill_in "Artist name", with: @entry.artist_name
    fill_in "Contest", with: @entry.contest_id
    fill_in "Country", with: @entry.country_id
    fill_in "En lyrics", with: @entry.en_lyrics
    fill_in "Final order", with: @entry.final_order
    fill_in "Lyrics", with: @entry.lyrics
    check "Qualified" if @entry.qualified
    fill_in "Semifinal", with: @entry.semifinal
    fill_in "Semifinal order", with: @entry.semifinal_order
    fill_in "Song title", with: @entry.song_title
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Entry" do
    visit entry_url(@entry)
    click_on "Destroy this entry", match: :first

    assert_text "Entry was successfully destroyed"
  end
end
