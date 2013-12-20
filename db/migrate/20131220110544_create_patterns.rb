class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :description

      t.timestamps
    end
  end
end
