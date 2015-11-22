class AddMajorAndMinorSectionsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :major_section_id, :integer
    add_column :articles, :minor_section_id, :integer
  end
end
