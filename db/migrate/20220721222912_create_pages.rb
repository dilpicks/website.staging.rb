class CreatePages < ActiveRecord::Migration[7.0]
  def up
    drop_table :pages, if_exists: true
  end
end
