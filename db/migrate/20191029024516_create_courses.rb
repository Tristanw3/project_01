class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.text :course_name
      t.text :image
      t.text :link
      t.integer :user_id

      t.timestamps
    end
  end
end
