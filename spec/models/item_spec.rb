require "rails_helper"

describe Item, type: :model do
  describe "validations" do
    it { should validiate_presence_of(:title)}
    it { should validiate_presence_of(:price)}
    it { should validiate_presence_of(:image)}
    it { should validiate_presence_of(:description)}
    it { should validiate_presence_of(:status)}
  end
end
