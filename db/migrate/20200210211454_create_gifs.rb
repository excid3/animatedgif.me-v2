class CreateGifs < ActiveRecord::Migration[6.0]
  def change
    create_table :gifs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
