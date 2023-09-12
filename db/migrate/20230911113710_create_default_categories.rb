class CreateDefaultCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :default_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
