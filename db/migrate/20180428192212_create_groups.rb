class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :nombre
      t.integer :sexo
      t.integer :quota
      t.integer :extended_quota
      t.integer :initial_age
      t.integer :maximun_age

      t.timestamps null: false
    end
  end
end
