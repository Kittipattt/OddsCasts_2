class Article < ApplicationRecord
  include Contentable
  has_one_attached :cover_image
end
