class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :course_id
      t.text :review_text
      t.integer :user_id

      t.timestamps
    end
  end
end
