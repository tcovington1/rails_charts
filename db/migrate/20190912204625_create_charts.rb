class CreateCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :charts do |t|
      t.string :chart_name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
