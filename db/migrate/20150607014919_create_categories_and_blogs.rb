class CreateCategoriesAndBlogs < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :title

    	t.timestamps
    end

    create_table :blogs do |t|
    	t.string  :title
    	t.string  :intro
    	t.text    :content
        t.integer :category_id

    	t.timestamps
    end
  end
end
