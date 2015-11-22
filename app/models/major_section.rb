class MajorSection < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  validates :name, presence: true

  after_create :rank_as_first

  has_many :articles, dependent: :destroy
  has_many :minor_sections, dependent: :destroy

  def rank_as_first
    self.update_attribute :row_order_position, 0
  end
end