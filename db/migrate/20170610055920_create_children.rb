class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.string :name
      t.references :activity, foreign_key: true
      t.string :state, default: :pending
      t.datetime :checked_in_at
      t.datetime :checked_out_at

      t.timestamps
    end
  end
end
