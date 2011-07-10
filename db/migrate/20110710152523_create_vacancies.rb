class CreateVacancies < ActiveRecord::Migration
  def self.up
    create_table :vacancies do |t|
      t.integer :user_id
      t.string :title
      t.string :text
      t.datetime :active_unit

      t.timestamps
    end
    add_index :vacancies, :user_id
    add_index :vacancies, :active_unit
  end

  def self.down
    drop_table :vacancies
  end
end
