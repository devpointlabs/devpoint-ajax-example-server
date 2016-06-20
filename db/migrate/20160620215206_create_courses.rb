class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :code
      t.text :description
      t.boolean :active, default: true
      t.text :extra_resources

      t.timestamps null: false
    end
  end
end
