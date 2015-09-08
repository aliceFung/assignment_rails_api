class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string  :reviewer_name
      t.string  :title
      t.text  :review_text
      t.references :movie
      t.datetime  :review_date
      t.timestamps null: false
    end
  end
end
