class MajorSection < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  after_create :rank_as_first

  has_many :articles
  has_many :minor_sections

  def rank_as_first
    self.update_attribute :row_order_position, 0
  end
end