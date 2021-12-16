class CreateEnterprises < ActiveRecord::Migration[6.1]
  def change
    create_table :enterprises do |t|
      t.references :user
      t.string :name
      t.string :nationality
      t.timestamps
    end
  end
end
