class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  WillPaginate.per_page = 15
end
