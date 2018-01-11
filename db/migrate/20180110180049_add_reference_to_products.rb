class AddReferenceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :trademark, foreign_key: true
  end
end
