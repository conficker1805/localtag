class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 		 :name
      t.attachment :avatar
      t.text 			 :description
      t.string 		 :type, default: :author

      t.timestamps
    end
  end
end
