class Post < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :choices

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end

end
