class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string       :title
      t.string       :author
      t.string       :cuisine
      t.datetime  :publication_date

      t.timestamps
    end
  end
end
