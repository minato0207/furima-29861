require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、birthdayとlast_mane,first_nameとlast_name_kana,first_name_kanaが存在すれば登録できる" do
       expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "00000ai"
        @user.password_confirmation = "00000ai"
        expect(@user).to be_valid
      end
      it "last_nameとfirst_nameが全角であれば登録できる"do
        @user.last_name = "とっとこ"
        @user.first_name = "はむ太郎"
        expect(@user).to be_valid
      end
      it "last_name_kanaとfirst_name_kanaが全角カナであれば登録できる"do
        @user.last_name_kana = "トットコ"
        @user.first_name_kana = "ハムタロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
         @user.save
         another_user = FactoryBot.build(:user)
         another_user.email = @user.email
         another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
         
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password ="00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない"do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
      end
      it "first_nameが空では登録できない"do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
      end
      it "last_nameとfirst_nameが半角,カナであると登録できない"do
        @user.last_name = "tottoko"
        @user.first_name = "hamuタロウ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")

      end
      it "last_name_kanaが空では登録できない"do
        @user.last_name_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角カナを使用してください")
      end
      it "first_name_kanaが空では登録できない"do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナを使用してください")
        
      end
      it "last_name_kanaとfirst_name_kanaが漢字、平仮名であると登録できない"do
         @user.last_name_kana = "取っとこ"
         @user.first_name_kana ="はむ太郎"
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください", "Last name kana 全角カナを使用してください")
      end
      it "birthdayが空では登録できない"do
        @user.birthday = ""
        @user.valid?
         expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end