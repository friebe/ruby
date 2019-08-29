class Project < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  validates :name, presence: true, allow_blank: false
end
