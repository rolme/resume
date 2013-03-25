class AddAuthenticationableColumnToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :authenticationable_id, :integer
    add_column :authentications, :authenticationable_type, :string
  end
end
