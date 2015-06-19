class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 		 :name
      t.attachment :avatar
      t.text 			 :description
      t.string 		 :role, default: :author

      t.timestamps
    end
  end
end
