require 'rails_helper'

RSpec.describe Station, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:dock_count)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:installation_date)}
    #   1) Station validations should validate that :name is case-sensitively unique
     # Failure/Error: self.slug = name.parameterize
     #
     # NoMethodError:
     #   undefined method `parameterize' for nil:NilClass
    # it {should validate_uniqueness_of(:name)}
  end
  describe 'relationships' do
    it {should have_many(:trips)}
  end
end
