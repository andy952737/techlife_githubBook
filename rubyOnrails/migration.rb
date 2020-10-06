# 新增Model
class CreateTransacConnectRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :transac_connect_records do |t|
      t.integer :transac_id, index: true  
      t.integer :user_id, index: true  
      t.text :contact, default: 1   
      t.integer :status, default: 1
      t.timestamps
    end
  end
end

# 新增欄位
class AddMobileToUsers < ActiveRecord::Migration[5.1]
  def up
      add_column :users, :mobile, :string,after: :approve
      add_column :users, :address, :string,after: :approve 
      add_column :users, :level, :integer, default: 100,after: :approve
      add_column :users, :avatar, :string, after: :approve
  end  
  def down   
      remove_column :users, :mobile
      remove_column :users, :level
      remove_column :users, :address 
      remove_column :users, :avatar  
  end 
end