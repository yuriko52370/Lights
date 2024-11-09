class Favorite < ApplicationRecord

belongs_to :user
belongs_to :choice
belongs_to :post

validates :user_id, uniqueness: {scope: :choice_id}


end
