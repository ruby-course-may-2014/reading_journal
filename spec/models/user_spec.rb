require 'spec_helper'

describe User do
  context "valid_user" do
    let(:user1) {User.create(email: '123@qwe.qwe', password: '123')}
    let(:user2) {User.create(email: '123@qwe.qwe', password: '123')}
    let(:user3) {User.create(email: '123qwe.qwe', password: '123')}
    let(:user4) {User.create(email: '12@qwe.e', password: '123')}
    let(:user5) {User.create(email: '', password: '123')}
    let(:user6) {User.create(email: '456@qwe.qwe', password: '12')}
    let(:user7) {User.create(email: '123456@qwe.qwe', password: '')}
    let(:user8) {User.create(email: '123@qweqwe', password: '123')}

    it 'should require a email' do
      expect(user1).to be_valid
      expect(user5).not_to be_valid
    end

    it "is not valid without a uniqueness email" do
      expect(user1).to be_valid
      expect(user2).not_to be_valid
    end

    it "is not valid without a email format" do
      expect(user1).to be_valid
      expect(user3).not_to be_valid
      expect(user4).not_to be_valid
      expect(user8).not_to be_valid
    end

    it 'should require a password' do
      expect(user1).to be_valid
      expect(user7).not_to be_valid
    end

    it 'should require a password length' do
      expect(user1).to be_valid
      expect(user6).not_to be_valid
    end
  end
end
