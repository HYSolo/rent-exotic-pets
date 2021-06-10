class RenameLocationColumnAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column(:pets, :location, :address)
  end
end
