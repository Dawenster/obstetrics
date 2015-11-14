class CreateMajorSections < ActiveRecord::Migration
  def change
    create_table :major_sections do |t|
      t.string :name
      t.integer :row_order

      t.timestamps
    end
  end
end
