class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.text :comment
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
