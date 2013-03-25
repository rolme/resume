class AddHandleColumnToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :handle, :string, :limit => 64
  end
end
