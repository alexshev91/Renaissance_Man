class Comment < ActiveRecord::Base

  belongs_to :article

  # validates :content,
  #   length: {minimum: 200,
  #     maximum:  1000}

end
