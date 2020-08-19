class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FULL_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  FULL_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze

  with_options presence: true do
    validates :family_name, :first_name, format: { with: FULL_NAME_REGEX, message: 'Full-width characters' }
    validates :phonetic_family_name, :phonetic_first_name, format: { with: FULL_NAME_KANA_REGEX, message: 'Full-width katakana characters' }
    validates :nickname, :birthday
  end
  validates_uniqueness_of :nickname, case_sensitive: true
  validates :password, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }
end
