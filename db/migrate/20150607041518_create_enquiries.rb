class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :title
    	t.text :message

    	t.timestamps
    end
  end
end
