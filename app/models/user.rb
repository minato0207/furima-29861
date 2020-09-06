class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   

  with_options presence: {message "が空です！"} do
   
    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
      validates :first_mane
      validates :last_name
      validates :first_mane_kana
      validates :last_name_kana
     end

   validates :nickname, presence: {message "が空です！"}
   validates :email, presence: {message "が空です！"}
   validates :password, presence: {message "が空です！"}
   validates :birthday, presence: {message "が空です！"}
  end
end

   















end
