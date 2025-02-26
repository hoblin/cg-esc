# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  ip_address :string
#  user_agent :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#

# @!attribute [r] id
#   @return [Integer] the unique identifier for the session
# @!attribute [rw] ip_address
#   @return [String] the IP address from which the session was created
# @!attribute [rw] user_agent
#   @return [String] the browser/device user agent string
# @!attribute [rw] user_id
#   @return [Integer] foreign key reference to the user who owns this session
# @!attribute [r] created_at
#   @return [DateTime] when the record was created
# @!attribute [r] updated_at
#   @return [DateTime] when the record was last updated
#
# @!method user
#   @return [User] the user who owns this session
class Session < ApplicationRecord
  belongs_to :user
end
