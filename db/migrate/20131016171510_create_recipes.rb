class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string   :title
      t.string   :chapter
      t.integer :page_number
      t.text      :directions
      t.string   :image

      t.timestamps
    end
  end
end
