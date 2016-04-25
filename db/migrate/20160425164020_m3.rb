class M3 < ActiveRecord::Migration
  def change
    remove_column :students, :test
  end
end
