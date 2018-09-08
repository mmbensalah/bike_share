class Station < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates_presence_of :dock_count, :city, :installation_date
  before_save :generate_slug

  def to_param
    slug
  end

  private
    def generate_slug
      self.slug = name.parameterize
    end
end
