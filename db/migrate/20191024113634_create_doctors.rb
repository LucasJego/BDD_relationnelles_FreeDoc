class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :speciality
      t.string :zip_code
      t.belongs_to :city, index: true # Va créer un id_city dans la table doctors

      t.timestamps
    end
  end
end
