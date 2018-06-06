# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Registration.destroy_all
Group.destroy_all
User.destroy_all

users = [{:nombre => 'Denisse Usuario',:email => 'denissev@gmail.com',:password => "12341234", :password_confirmation => "12341234", :tipo => '2', :habilitado => 'true'},
         {:nombre => 'Denisse Admin',:email => 'admin@cursosonline.com', :password => "12341234", :password_confirmation => "12341234", :tipo => '1', :habilitado => 'true'}
     ]

users.each do |user|
   User.create!(user)
end

groups = [{:nombre => 'group0 v',:sexo => '1',:quota => '10', :extended_quota => '1', :initial_age => '3', :maximun_age => '4'},
          {:nombre => 'group1 m',:sexo => '2',:quota => '10', :extended_quota => '1', :initial_age => '5', :maximun_age => '6'},
          {:nombre => 'group3 mix',:sexo => '3',:quota => '10', :extended_quota => '1', :initial_age => '7', :maximun_age => '8'},
          {:nombre => 'group4 v',:sexo => '1',:quota => '10', :extended_quota => '1', :initial_age => '9', :maximun_age => '10'},
          {:nombre => 'group5 m',:sexo => '2', :quota => '10', :extended_quota => '1', :initial_age => '11', :maximun_age => '12'}
     ]

groups.each do |group|
   Group.create!(group)
end

alumnos = [
   {:alumno_name => 'Pepito Algo',
    :alumno_age => '10',
    :alumno_birtday => '11/04/2005',
    :alumno_gender => '1',
    :alumno_dni => '37455687-1',
    :alumno_address => 'La casa 2376 Piso 1 Depto 3',
    :alumno_telephone => '123123123',
    :alumno_email => '1pepe@gmail.com',
    :alumno_school_name => '',
    :alumno_grade => '5',
    :alumno_medical_insurance => 'Colmena',
    :alumno_medical_observation => 'asma',
    :i_attest => 'true',
    :status => 1,
    :group_id => '4'
  },
  { :alumno_name => 'Sebastián Pascual',
    :alumno_age => '9',
    :alumno_birtday => '1/07/2006',
    :alumno_gender => '1',
    :alumno_dni => '38412871-4',
    :alumno_address => 'Av Italia 5343 Piso 1 Depto 3',
    :alumno_telephone => '123123123',
    :alumno_email => '2pepe@gmail.com',
    :alumno_school_name => 'Sagrado Corazón',
    :alumno_grade => '4',
    :alumno_medical_insurance => 'Mas Vida',
    :alumno_medical_observation => 'otro',
    :i_attest => 'true',
    :status => 2,
    :group_id => '4'
  },
  { :alumno_name => 'José Joselito',
    :alumno_age => '9',
    :alumno_birtday => '9/03/2006',
    :alumno_gender => '1',
    :alumno_dni => '38475325-6',
    :alumno_address => 'Las camelias 3741 Piso 8 Depto 3',
    :alumno_telephone => '123123123',
    :alumno_email => '3pepe@gmail.com',
    :alumno_school_name => 'Escuela primaria Nº 1',
    :alumno_grade => '4',
    :alumno_medical_insurance => 'Cruz Blanca',
    :alumno_medical_observation => 'insuficiencia cardiaca',
    :i_attest => true,
    :status => 3,
    :group_id => '4'
  },
  { :alumno_name => 'Eva de América',
    :alumno_age => '5',
    :alumno_birtday => '9/03/2010',
    :alumno_gender => '2',
    :alumno_dni => '40875325-7',
    :alumno_address => 'Luis María San Martín 47413',
    :alumno_telephone => '123123123',
    :alumno_email => '4pepe@gmail.com',
    :alumno_school_name => 'Colegio Superior San Martín',
    :alumno_grade => '5',
    :alumno_medical_insurance => 'Fonasa',
    :alumno_medical_observation => 'alergia',
    :i_attest => true,
    :status => 1,
    :group_id => '2'
  },
  { :alumno_name => 'Mabel Mabela',
    :alumno_age => '9',
    :alumno_birtday => '9/03/2006',
    :alumno_gender => '2',
    :alumno_dni => '37845235-8',
    :alumno_address => 'Alcántara 5313',
    :alumno_telephone => '123123123',
    :alumno_email => '5pepe@gmail.com',
    :alumno_school_name => 'Instituto 1',
    :alumno_grade => '5',
    :alumno_medical_insurance => 'Colmena',
    :alumno_medical_observation => 'nada',
    :i_attest => 'true',
    :status => 2,
    :group_id => ''
  }
]

alumnos.each do |alumno|
  Registration.create!(alumno)
end
