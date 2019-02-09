class Mix < ApplicationRecord
  validates_presence_of :name, :url
  acts_as_taggable
  before_save :format_website

private

  def format_website
    self.url = "http://#{self.url}" unless self.url[/^https?/]
  end

end
