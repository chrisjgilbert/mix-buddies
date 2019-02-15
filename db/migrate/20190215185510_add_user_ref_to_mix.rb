class AddUserRefToMix < ActiveRecord::Migration[5.2]
  def change
    add_reference :mixes, :user, foreign_key: true
  end
end
