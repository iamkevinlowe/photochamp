class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :win
      t.integer :loss
      t.integer :tie
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
