
class InitialSchema < ActiveRecord::Migration[5.1]
  def change

    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password
      t.string :bio
      t.string :photo
    end

    create_table :events do |t|
      t.references :user, foreign_key: {to_table: :users}, index: true
      t.string :photo
      t.string :name
    end

    create_table :reviews do |t|
      t.references :user, foreign_key: {to_table: :users}, index: true
      t.references :event, foreign_key: {to_table: :events}, index: true
      t.string :content
      t.string :vote
      t.datetime :created_at
    end
  end
end
