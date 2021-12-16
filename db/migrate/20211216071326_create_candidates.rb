class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.references :user
      t.string :name
      t.string :lastname
      t.date :birth_date
      t.string :observations
      t.timestamps
    end
  end
end
