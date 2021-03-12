class Like < ApplicationRecord
  belongs_to :idea, counter_cache: :likes_count
  belongs_to :user
end
