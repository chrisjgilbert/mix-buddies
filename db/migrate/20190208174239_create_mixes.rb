# frozen_string_literal: true

class CreateMixes < ActiveRecord::Migration[5.2]
  def change
    create_table :mixes do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
