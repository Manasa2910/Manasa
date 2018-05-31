class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :movie_id
      t.string :comment
      t.references :user, foreign_key: true
      t.string :user_email

      t.timestamps
    end
  end
end
