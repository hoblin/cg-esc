# Provides thread-isolated attributes for the current request cycle
# using ActiveSupport::CurrentAttributes
#
# @!attribute [rw] session
#   @return [Session, nil] the current session for the request
# @!attribute [r] user
#   @return [User, nil] the current user for the request, derived from session
class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :user, to: :session, allow_nil: true
end
