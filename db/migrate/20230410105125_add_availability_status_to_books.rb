class AddAvailabilityStatusToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :availability_status, :string, default: 'available'
  end
end
