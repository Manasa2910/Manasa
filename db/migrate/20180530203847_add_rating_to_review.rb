class AddRatingToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :movie_title, :string
  end
end
