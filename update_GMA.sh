#!/bin/sh

mongo <<EOF 
use customersdb

customersdb.createCollection('employeCollection', {size: 25});

for (var i = 0; i < 25; i++) {
   customersdb.employeCollection.insert( { nom: "nameTest", prenom: "prenomTest", salaire: Math.floor(Math.random() * (15000 - 1000 + 1)) + 1000 });
}

db.employeCollection.find().pretty();

EOF