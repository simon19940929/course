class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :name
    	t.string :time
    	t.string :classroom
    	t.string :teacher
    	t.integer :credit
	t.timestamps null: false
    end
  end
end
