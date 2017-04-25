#!/bin/sh

echo "Création du dossier data dans /"
mkdir /data
echo "Création du dossier db dans /data" 
mkdir /data/db

mongo <<EOF
use customersdb
db.createUser({
    user: "brad",
    pwd:"1234",
    roles:["readWrite", "dbAdmin"]
});
db.createCollection('customers');
db.customers.insert([
    {
    first_name:"John",
    last_name:"Doe",
    num_ss:"LDKFNGHTJS"
},
{
    first_name:"Apple",
    last_name:"Truc",
    gender: "male",
    num_ss: "47582734857"
},
{
    first_name:"Jean",
    last_name:"Neymar",
    num_ss: "FJ4576839R"
},
{
    first_name:"Body",
    last_name:"Bulder",
    gender: "male",
    num_ss: "DJR5IEUR95"
},
{
    first_name:"Chuck",
    last_name:"Berry",
    gender: "male",
    num_ss:"DJF583HFJ4"
},
{
    first_name:"Johny",
    last_name:"BGood",
    gender: "male",
    num_ss: "DJFHG45KLS"
},
{
    first_name:"Tennis",
    last_name:"Mario",
    gender: "male",
    num_ss: "SHDKFJS234K"
}
]);
db.customers.find();
db.customers.find().pretty();
db.customers.update({first_name:"John"}, 
    {first_name:"John", last_name:"Doe", gender:"male", num_ss="DKRJR3384JT"});
db.customers.update({first_name:"Jean"}, {$set:{gender:"male"}});
db.customers.update({first_name:"Jean"}, {$set:{age:45}});
db.customers.update({first_name:"Jean"}, {$inc:{age:5}});
db.customers.update({first_name:"Jean"}, {$unset:{gender:1}});
db.customers.update({first_name:"Mary"}, {first_name:"Mary", last_name:"Samson"}, {upsert: true});
EOF
