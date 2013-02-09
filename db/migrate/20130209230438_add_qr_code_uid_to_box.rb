class AddQrCodeUidToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :qr_code_uid,  :string
  end
end
