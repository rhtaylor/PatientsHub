# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 

 Patient.create([
{name: 'The Dude', email:"idontknowman@gmail.com", age: 42},
{name: 'Dan Abronovvv', email:"boygenius@gmail.com", age: 20}, 
{name: 'Randy Taylor', email: "randyisbusy@gmail.com", age: 35}
]) 
Provider.create([
{ name: "Dr Strange", email: "Avergers@avengermail.com", job: "Dr MD/Surgeon"},
{ name: "Super RN", email: "bestrn@rnmail.com", job: "RN"}, 
{name: "Dr SuperMentalSmartGuy", email: "universnumberonemd@med.com", job: "Surgeon General"}
]) 

VirtualChart.create([ 
    {date: 6302020, note: "this is a really long nooooot!", patient_id: 1, provider_id: 1 }, 
    {date: 7132020, note: "today I turn in my final project for flatiron!", patient_id: 3, provider_id: 3}
])