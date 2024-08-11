class Post < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
end
