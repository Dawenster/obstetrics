class Article < ActiveRecord::Base
  include RankedModel
  ranks :row_order

  validates :title, presence: true
  validates :content, presence: true
  validate :must_belong_to_a_section

  after_create :rank_as_first

  belongs_to :major_section
  belongs_to :minor_section

  scope :ordered, -> { rank(:row_order) }

  def rank_as_first
    self.update_attribute :row_order_position, 0
  end

  private

  def must_belong_to_a_section
    if major_section_id.nil? && minor_section_id.nil?
      errors.add(:base, "Article must belong to a major or a minor section")
    end
  end
end