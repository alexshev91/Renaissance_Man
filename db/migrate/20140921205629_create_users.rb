class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :technology
      t.integer :art
      t.integer :science
      t.integer :medicine
      t.integer :movies

      t.timestamps
    end
  end
end
