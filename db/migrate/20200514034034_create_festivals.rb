class CreateFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :festivals do |t|
      t.string :name
      t.string :theme
      t.string :description
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
