class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :name
      t.string :surname
      t.integer :age
      t.text :bio
      t.string :avatar
      t.timestamps
    end
  end
end
