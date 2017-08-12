class AddColumnToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :year_completed, :string
  end
end
