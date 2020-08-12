require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての値が正しく入力されていれば登録できること" do
          expect(@user).to be_valid
        end

        it "passwordが6文字以上であれば登録できること" do
          @user.password = "123456"
          @user.password_confirmation = "123456"
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "family_nameが空では登録できないこと" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "phonetic_family_nameが空では登録できないこと" do
          @user.phonetic_family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic family name can't be blank")
        end

        it "phonetic_first_nameが空では登録できないこと" do
          @user.phonetic_first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic first name can't be blank")
        end

        it "birthdayが空では登録できないこと" do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
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

        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが5文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'family_nameが全角でないと登録できないこと' do
          @user.family_name = "nomura"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name Full-width characters")
        end

        it 'first_nameが全角でないと登録できないこと' do
          @user.first_name = "pon"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end

        it "phonetic_family_nameがカナでないと登録できないこと" do
          @user.phonetic_family_name = "野村"
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic family name Full-width katakana characters")
        end

        it "phonetic_first_nameがカナでないと登録できないこと" do
          @user.phonetic_first_name = "ぽん"
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic first name Full-width katakana characters")
        end
      end
    end
  end
end
