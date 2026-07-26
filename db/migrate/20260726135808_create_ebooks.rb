class CreateEbooks < ActiveRecord::Migration[8.1]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :file_type
      t.integer :file_size

      t.timestamps
    end
  end
end
