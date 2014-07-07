class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.data :published
      t.string :description
      t.string :rating

      t.timestamps
    end
  end
end
