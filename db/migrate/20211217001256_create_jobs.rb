class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :enterprise
      t.string :name
      t.string :description
      t.string :requirements
      t.string :time
      t.boolean :enable, :default => true
      t.timestamps
    end
  end
end
