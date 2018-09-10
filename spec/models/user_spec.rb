require "rails_helper"

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password)}

    it { should validate_uniqueness_of(:email)}
    it { should validate_uniqueness_of(:username)}
  end

  describe 'roles' do
    it 'is created as default user' do
      user = create(:user)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it 'can be created as admin' do
      user = create(:user, role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end
  end
end
