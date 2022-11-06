# frozen_string_literal: true

class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.integer :length
      t.string :str_elem

      t.timestamps
    end
  end
end
