class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :technology, :default  => 0
      t.integer :art, :default => 0
      t.integer :science, :default  => 0
      t.integer :medicine, :default  => 0
      t.integer :movies, :default  => 0

      t.timestamps
    end
  end
end
