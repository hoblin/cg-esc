# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  code       :string
#  flag       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# @!attribute [r] id
#   @return [Integer] the unique identifier for the country
# @!attribute [rw] code
#   @return [String] the ISO country code (three-letter code)
# @!attribute [rw] flag
#   @return [String] emoji representation of the country's flag
# @!attribute [rw] name
#   @return [String] the full name of the country
# @!attribute [r] created_at
#   @return [DateTime] when the record was created
# @!attribute [r] updated_at
#   @return [DateTime] when the record was last updated
#
# @!method entries
#   @return [ActiveRecord::Relation<Entry>] all entries submitted by this country
class Country < ApplicationRecord
  # Automatic qualifiers for the Eurovision final
  BIG_FIVE = [
    { name: "France", code: "FRA", flag: "🇫🇷" },
    { name: "Germany", code: "DEU", flag: "🇩🇪" },
    { name: "Italy", code: "ITA", flag: "🇮🇹" },
    { name: "Spain", code: "ESP", flag: "🇪🇸" },
    { name: "United Kingdom", code: "GBR", flag: "🇬🇧" }
  ].freeze

  # Western European countries
  WESTERN_EUROPEAN_COUNTRIES = [
    { name: "Austria", code: "AUT", flag: "🇦🇹" },
    { name: "Belgium", code: "BEL", flag: "🇧🇪" },
    { name: "Ireland", code: "IRL", flag: "🇮🇪" },
    { name: "Luxembourg", code: "LUX", flag: "🇱🇺" },
    { name: "Netherlands", code: "NLD", flag: "🇳🇱" },
    { name: "Switzerland", code: "CHE", flag: "🇨🇭" }
  ].freeze

  # Nordic countries
  NORDIC_COUNTRIES = [
    { name: "Sweden", code: "SWE", flag: "🇸🇪" },
    { name: "Denmark", code: "DNK", flag: "🇩🇰" },
    { name: "Norway", code: "NOR", flag: "🇳🇴" },
    { name: "Finland", code: "FIN", flag: "🇫🇮" },
    { name: "Iceland", code: "ISL", flag: "🇮🇸" }
  ].freeze

  # Mediterranean countries
  MEDITERRANEAN_COUNTRIES = [
    { name: "Portugal", code: "PRT", flag: "🇵🇹" },
    { name: "Malta", code: "MLT", flag: "🇲🇹" },
    { name: "Cyprus", code: "CYP", flag: "🇨🇾" },
    { name: "Greece", code: "GRC", flag: "🇬🇷" },
    { name: "San Marino", code: "SMR", flag: "🇸🇲" }
  ].freeze

  # Central and Eastern European countries
  EASTERN_EUROPEAN_COUNTRIES = [
    { name: "Poland", code: "POL", flag: "🇵🇱" },
    { name: "Czech Republic", code: "CZE", flag: "🇨🇿" },
    { name: "Slovakia", code: "SVK", flag: "🇸🇰" },
    { name: "Hungary", code: "HUN", flag: "🇭🇺" },
    { name: "Romania", code: "ROU", flag: "🇷🇴" },
    { name: "Moldova", code: "MDA", flag: "🇲🇩" },
    { name: "Bulgaria", code: "BGR", flag: "🇧🇬" },
    { name: "Estonia", code: "EST", flag: "🇪🇪" },
    { name: "Latvia", code: "LVA", flag: "🇱🇻" },
    { name: "Lithuania", code: "LTU", flag: "🇱🇹" },
    { name: "Ukraine", code: "UKR", flag: "🇺🇦" }
  ].freeze

  # Balkan countries
  BALKAN_COUNTRIES = [
    { name: "Croatia", code: "HRV", flag: "🇭🇷" },
    { name: "Serbia", code: "SRB", flag: "🇷🇸" },
    { name: "Slovenia", code: "SVN", flag: "🇸🇮" },
    { name: "Montenegro", code: "MNE", flag: "🇲🇪" },
    { name: "North Macedonia", code: "MKD", flag: "🇲🇰" },
    { name: "Albania", code: "ALB", flag: "🇦🇱" }
  ].freeze

  # Countries from the Caucasus region
  CAUCASUS_COUNTRIES = [
    { name: "Armenia", code: "ARM", flag: "🇦🇲" },
    { name: "Azerbaijan", code: "AZE", flag: "🇦🇿" },
    { name: "Georgia", code: "GEO", flag: "🇬🇪" }
  ].freeze

  # Non-European participating countries
  SPECIAL_PARTICIPANTS = [
    { name: "Israel", code: "ISR", flag: "🇮🇱" },
    { name: "Australia", code: "AUS", flag: "🇦🇺" }
  ].freeze

  # Former participants
  HISTORICAL_PARTICIPANTS = [
    { name: "Morocco", code: "MAR", flag: "🇲🇦" },
    { name: "Monaco", code: "MCO", flag: "🇲🇨" },
    { name: "Turkey", code: "TUR", flag: "🇹🇷" },
    { name: "Bosnia and Herzegovina", code: "BIH", flag: "🇧🇦" },
    { name: "Russia", code: "RUS", flag: "🇷🇺" },
    { name: "Belarus", code: "BLR", flag: "🇧🇾" },
    { name: "Andorra", code: "AND", flag: "🇦🇩" }
  ].freeze

  has_many :entries

  # @return [Array<Hash>] Returns an array of all countries that have participated in Eurovision
  # @note This method combines all country categories into a single array
  def self.all_countries
    BIG_FIVE +
      WESTERN_EUROPEAN_COUNTRIES +
      NORDIC_COUNTRIES +
      MEDITERRANEAN_COUNTRIES +
      EASTERN_EUROPEAN_COUNTRIES +
      BALKAN_COUNTRIES +
      CAUCASUS_COUNTRIES +
      SPECIAL_PARTICIPANTS +
      HISTORICAL_PARTICIPANTS
  end

  # @return [String] Returns the country name prefixed with its flag emoji
  def name_with_flag
    "#{flag} #{name}"
  end
end
