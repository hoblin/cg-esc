# Base class for all models in the application.
# Inherits from ActiveRecord::Base and defines common functionality.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
