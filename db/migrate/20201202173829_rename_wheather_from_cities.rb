class RenameWheatherFromCities < ActiveRecord::Migration[6.0]
  def change
    rename_column :cities, :wheather, :weather
  end
end
