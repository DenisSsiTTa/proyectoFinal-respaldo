class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.string :alumno_name
      t.integer :alumno_age
      t.date :alumno_birtday
      t.integer  :alumno_gender
      t.integer :alumno_dni
      t.string :alumno_address
      t.string :alumno_telephone
      t.string :alumno_email
      t.string :alumno_school_name
      t.integer :alumno_grade
      t.string :alumno_medical_insurance
      t.boolean :alumno_medical_observation
      t.boolean :i_attest
      t.integer :status, default: 1, null: false #1 pendiente, 2 aprobado, 3 rechazado
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
