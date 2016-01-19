class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :drug, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
