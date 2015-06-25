class CreateCategoriesAndBlogs < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :title

    	t.timestamps
    end

    create_table :blogs do |t|
    	t.string     :title
        t.attachment :cover_photo
    	t.string     :intro
        t.string     :status
        t.boolean    :published
        t.references :category
        t.references :author
    	t.text       :content

    	t.timestamps
    end
  end
end
