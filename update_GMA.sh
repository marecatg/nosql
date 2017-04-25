#!/bin/sh

mongo <<EOF 
use customersdb

db.createCollection('employeCollection', {size: 25});

for (var i = 0; i < 25; i++) {
   db.employeCollection.insert( { nom: "nameTest", prenom: "prenomTest", salaire: Math.floor(Math.random() * (15000 - 1000 + 1)) + 1000 });
}

db.employeCollection.find().pretty();

EOF