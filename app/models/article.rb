class Article < ActiveRecord::Base

  has_many :comments

  validates :title,
    presence: true,
    numericality: false

  validates :url,
    presence: true

  validates :category,
    presence: true,
    inclusion: %w(art technology science movies medicine)


end
