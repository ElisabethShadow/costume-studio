class ChangeDescriptionToTextFromCostumes < ActiveRecord::Migration[6.1]
  def change
    change_column :costumes, :description, :text
  end
end
