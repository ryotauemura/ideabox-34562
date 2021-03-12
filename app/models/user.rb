class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

     has_many :ideas
     has_many :comments
     has_many :likes, dependent: :destroy
     has_many :like_ideas, through: :likes, source: :idea

  with_options presence: true do
    validates :nickname,:last_name,:first_name,:last_name_kana,:first_name_kana,:birthday
  end
  
  validates :last_name,:first_name , format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters."}
  validates :last_name_kana,:first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid."}

end
