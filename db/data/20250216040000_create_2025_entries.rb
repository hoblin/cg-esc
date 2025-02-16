# frozen_string_literal: true

class Create2025Entries < ActiveRecord::Migration[8.0]
  PARTICIPANTS = {
    'ALB' => { artist: 'Shkodra Elektronike', song: 'Zjerm' }, # Albania
    'ARM' => { artist: '', song: '' }, # Armenia
    'AUS' => { artist: '', song: '' }, # Australia
    'AUT' => { artist: 'JJ', song: '' }, # Austria
    'AZE' => { artist: 'Mamagama', song: '' }, # Azerbaijan
    'BEL' => { artist: 'Red Sebastian', song: 'Strobe Lights' }, # Belgium
    'HRV' => { artist: '', song: '' }, # Croatia
    'CYP' => { artist: 'Theo Evan', song: '' }, # Cyprus
    'CZE' => { artist: 'ADONXS', song: 'Kiss Kiss Goodbye' }, # Czech Republic
    'DNK' => { artist: '', song: '' }, # Denmark
    'EST' => { artist: '', song: '' }, # Estonia
    'FIN' => { artist: 'Erika Vikman', song: 'Ich Komme' }, # Finland
    'FRA' => { artist: 'Louane', song: '' }, # France
    'GEO' => { artist: '', song: '' }, # Georgia
    'DEU' => { artist: '', song: '' }, # Germany
    'GRC' => { artist: 'Klavdia', song: 'Asteromáta' }, # Greece
    'ISL' => { artist: '', song: '' }, # Iceland
    'IRL' => { artist: 'EMMY', song: 'Laika Party' }, # Ireland
    'ISR' => { artist: 'Yuval Raphael', song: '' }, # Israel
    'ITA' => { artist: '', song: '' }, # Italy
    'LVA' => { artist: 'Tautumeitas', song: 'Bur man laimi' }, # Latvia
    'LTU' => { artist: '', song: '' }, # Lithuania
    'LUX' => { artist: 'Laura Thorn', song: 'La Poupée Monte Le Son' }, # Luxembourg
    'MLT' => { artist: 'Miriana Conte', song: 'Kant' }, # Malta
    'MNE' => { artist: 'Nina Žižić', song: 'Dobrodošli' }, # Montenegro
    'NLD' => { artist: 'Claude', song: '' }, # Netherlands
    'NOR' => { artist: '', song: '' }, # Norway
    'POL' => { artist: 'Justyna Steczkowska', song: 'GAJA' }, # Poland
    'PRT' => { artist: '', song: '' }, # Portugal
    'SMR' => { artist: '', song: '' }, # San Marino
    'SRB' => { artist: '', song: '' }, # Serbia
    'SVN' => { artist: 'Klemen', song: 'How Much Time Do We Have Left' }, # Slovenia
    'ESP' => { artist: 'Melody', song: 'Esa Diva' }, # Spain
    'SWE' => { artist: '', song: '' }, # Sweden
    'CHE' => { artist: '', song: '' }, # Switzerland
    'UKR' => { artist: 'Ziferblat', song: 'Bird of Pray' }, # Ukraine
    'GBR' => { artist: '', song: '' }  # United Kingdom
  }.freeze

  def up
    contest = Contest.find_by!(year: 2025)

    PARTICIPANTS.each do |code, details|
      p "Creating entry for #{code}..."
      country = Country.find_by!(code: code)
      Entry.create!(
        contest: contest,
        country: country,
        artist_name: details[:artist],
        song_title: details[:song]
      )
    end
  end

  def down
    contest = Contest.find_by!(year: 2025)
    contest.entries.destroy_all
  end
end
