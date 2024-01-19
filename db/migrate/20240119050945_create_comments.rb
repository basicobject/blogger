class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :like_count, default: 0
      t.integer :dislike_count, default: 0
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
