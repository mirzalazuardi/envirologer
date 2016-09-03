class AddNumberToServer < ActiveRecord::Migration
  def change
    add_column :servers, :number, :integer
  end
end
