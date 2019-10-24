# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all
City.destroy_all
JoinTableDoctorSpecialty.destroy_all

doctors_array = []
patients_array = []
cities_array = []
specialties_array = ["Généraliste", "Dentiste", "Podologue", "Kiné", "Ophtalmo"]
specialties_array2 =[]

# Création de 5 villes que l'on met dans le tableau cities_array
5.times do
	city = City.create(name: Faker::Address.city)
	cities_array << city
end

# Création de 5 spécialités
5.times do
	specialty = Specialty.create(name: specialties_array.sample)
  specialties_array2 << specialty
end



# Création de 5 patients que l'on met dans le tableau doctors_array
# Idem avec les patients que l'on met dans le tableau patients_array
5.times do
	doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,  zip_code: Faker::Address.zip_code, city: cities_array.sample)
	doctors_array << doctor
	patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cities_array.sample)
  patients_array << patient
end
puts "5 docteurs et 5 patients ont été créés"



# Création de 5 appointments à partir des instances précédentes

5.times do
	Appointment.create(date: Faker::Date.forward(days: 10), doctor: doctors_array.sample, patient: patients_array.sample, city: cities_array.sample)
	JoinTableDoctorSpecialty.create(doctor: doctors_array.sample, specialty: specialties_array2.sample)
end
puts "5 rdv ont été créés"