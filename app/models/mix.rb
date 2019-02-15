# frozen_string_literal: true

class Mix < ApplicationRecord
  validates_presence_of :name, :url, :tag_list
  belongs_to :user, dependent: :destroy
  acts_as_taggable
  before_save :format_website

  private

  def format_website
    self.url = "http://#{url}" unless url[/^https?/]
  end
end
