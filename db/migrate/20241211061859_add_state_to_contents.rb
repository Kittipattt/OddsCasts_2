class AddStateToContents < ActiveRecord::Migration[8.0]
  def change
    add_column :contents, :state_integer, :string
  end
end
