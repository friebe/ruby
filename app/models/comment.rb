class Comment < ApplicationRecord
  belongs_to :project

  validates :body, presence: true, allow_blank: false
  validates :author, presence: true, allow_blank: false
end
