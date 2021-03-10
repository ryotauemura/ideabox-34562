class Idea < ApplicationRecord
  belongs_to :user
  #has_many_to :comment

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :title,:purpose,:description
  end

  validates :category_id,numericality: { other_than: 1 }

end
