class InitialSchema < ActiveRecord::Migration[5.1]
  def change
  end
end



class BuildInitialSchema < ActiveRecord::Migration[5.1]
  def change

    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password
      t.string :bio
    end

    create_table :events do |t|
      t.references :user, foreign_key: {to_table: :users}, index: true
      t.references :question, foreign_key: {to_table: :questions }, index:true
      t.integer :guess
    end

    create_table :review do |t|
      t.references
  end
end
