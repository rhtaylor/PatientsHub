# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 

 Patient.create([
{name: 'The Dude', email:"idontknowman@gmail.com", age: 42, diagnosis: 'eldudearino'},
{name: 'Dan Abronovvv', email:"boygenius@gmail.com", age: 20, diagnosis: 'insanely smart'}, 
{name: 'Randy Taylor', email: "randyisbusy@gmail.com", age: 35, diagnosis: 'who knows...'}


]) 
Provider.create([
{ name: "Dr Strange", email: "Avergers@avengermail.com", job: "Dr MD/Surgeon", password: '123', password_confirmation: '123'},
{ name: "Super RN", email: "bestrn@rnmail.com", job: "RN", password: '1234', password_confirmation: '1234'}, 
{name: "Dr SuperMentalSmartGuy", email: "universnumberonemd@med.com", job: "Surgeon General", password: '12345', password_confirmation: '12345'}
]) 

VirtualChart.create([ 
    {date: Date.today, note: "this is a really long nooooot!", patient_id: 1, provider_id: 1 }, 
    {date: Date.today, note: "today I turn in my final project for flatiron!", patient_id: 3, provider_id: 3},
    {date: Date.today, note: "but what happens when I write forever and ever and ever and ever and neve stop typing", patient_id: 1, provider_id: 1 }, 
    {date: Date.today, note: "test test test", patient_id: 3, provider_id: 2}

])