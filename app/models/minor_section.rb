class MinorSection < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  after_create :rank_as_first

  has_many :articles
  belongs_to :major_article

  def rank_as_first
    self.update_attribute :row_order_position, 0
  end
end