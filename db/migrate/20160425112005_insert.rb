class Insert < ActiveRecord::Migration
  def change
    add_column :students, :test, :string
  end
end