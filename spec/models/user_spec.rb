require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end


        it "emailが空では登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

       it "passwordが空では登録できないこと" do
         @user.password = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("Password can't be blank")
       end

       it "last_nameが空では登録できないこと" do
         @user.last_name = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name can't be blank")
       end

       it "first_nameが空では登録できないこと" do
         @user.first_name = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("First name can't be blank")
       end

       it "last_name_kanaが空では登録できないこと" do
         @user.last_name_kana = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kana can't be blank")
       end

       it "first_name_kanaが空では登録できないこと" do
         @user.first_name_kana = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kana can't be blank")
       end

       it "birthdayが空では登録できないこと" do
         @user.birthday = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("Birthday can't be blank")
       end
    
       it "メールアドレスは、@を含まないと登録できないこと" do
         @user.email = "testexample"
         @user.valid?
         expect(@user.errors.full_messages).to include("Email is invalid")
       end

       it "passwordが5文字以下であれば登録できないこと" do
         @user.password = "12345"
         @user.password_confirmation = "12345"
         @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end

       it "パスワードとパスワード（確認用）、値が一致がしないと登録できないこと" do
         @user.password = "123456"
         @user.password_confirmation = "1234567"
         @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end

       it "重複したemailが存在する場合登録できないこと" do
         @user.save
         another_user = FactoryBot.build(:user, email: @user.email)
         another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
       end

       it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須でないと登録できないこと" do
        @user.last_name = /\A[ぁ-んァ-ン一-龥]+\z/
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
       end

       it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須でないと登録できないこと" do
        @user.last_name_kana = /\A[ァ-ヶー－]+\z/
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
       end
      end
    end
  end
end