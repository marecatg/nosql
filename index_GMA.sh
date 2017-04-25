#!/bin/sh

mongo <<EOF 
use customersdb 
db.customers.createIndex( { last_name: 1 } ); 
db.customers.createIndex( {gender: 1, first_name: -1} );
db.customers.createIndex( { num_ss: 1}, { unique: true }); 
db.customers.getIndexes(); 
db.customers.find({gender: 'male'}).hint({gender: 1, first_name: -1}).explain("executionStats");
db.customers.insert ([
 {
    first_name:"Boby",
    last_name:"James",
    gender: "male",
    num_ss: "AAAA"
},
{
    first_name:"Harley",
    last_name:"Choupi",
    gender: "female",
    num_ss: "AAAA"
},
]);
EOF
