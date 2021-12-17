class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :job
      t.references :candidate
      t.string :state
      t.timestamps
    end
  end
end
