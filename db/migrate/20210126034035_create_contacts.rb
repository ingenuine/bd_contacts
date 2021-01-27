class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :address
      t.string :case_id, index: true, null: false

      t.timestamps
    end
  end
end
