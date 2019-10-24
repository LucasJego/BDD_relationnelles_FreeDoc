class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.belongs_to :doctor, index: true # Va créer un id_doctor dans la table appointments
      t.belongs_to :patient, index: true # Va créer un id_patient dans la table appointments
      t.belongs_to :city, index: true # Va créer un id_city dans la table appointments

      t.timestamps
    end
  end
end
