class MinorSection < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  validates :name, presence: true
  validates :major_section_id, presence: true

  after_create :rank_as_first

  has_many :articles, dependent: :destroy
  belongs_to :major_section

  scope :ordered, -> { rank(:row_order) }

  def rank_as_first
    self.update_attribute :row_order_position, 0
  end
end