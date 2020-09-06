class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   

  # with_options presence: {message "が空です！"} do
   
  #   with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  #     validates :first_mane
  #     validates :last_name
  #     validates :first_mane_kana
  #     validates :last_name_kana
  #   end

  #   validates :nickname
  #   validates :email
  #   validates :password, presence: {message "が空です！"},length: { minimum: 6}
  #   validates :birthday
  # end


  validates :nickname, :first_name, :last_name, :birthday, presence: true
  validates :password, presence: true, length: { minimum: 7 }, 
            # 英数字のみ可
            format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :email, presence: true, 
            # 重複不可
            uniqueness: { case_sensitive: false }, 
            # 英数字のみ可,@を挟んだemailの形になっているか
            # /^\S+@\S+\.\S+$/   /\A[a-z0-9]+\z/i  /^[a-zA-Z0-9]+$/
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  validates :first_mane_kana, :last_name_kana, presence: true, 
            # カナのみ可
            format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
            has_many :sns_credentials


















end
