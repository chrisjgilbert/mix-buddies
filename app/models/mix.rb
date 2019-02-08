class Mix < ApplicationRecord
  validates_presence_of :name, :url
  acts_as_taggable
  acts_as_taggable_on :tags
end
