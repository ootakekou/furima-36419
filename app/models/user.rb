class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true, format: { with: /\A[ァ-ンー－]+\z/ }
  validates :last_kana, presence: true, format: {with: /\A[ァ-ンー－]+\z/ }
  validates :birthday, presence: true
end
