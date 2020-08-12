class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :phonetic_family_name, :phonetic_first_name, format: { with:/\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :nickname, :birthday
  end
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Include both letters and numbers"}
end