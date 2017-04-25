#!/bin/sh

mongo <<EOF 
use customersdb

db.createCollection('employeCollection', {size: 25});

for (var i = 0; i < 25; i++) {
   db.employeCollection.insert( { nom: "marecat " + i, prenom: "gaetan " + i, salaire: Math.floor(Math.random() * (15000 - 1000 + 1)) + 1000 });
}

var i = 1;
db.employeCollection.find().sort({salaire: 1}).forEach(function(employe) {
    if (i >= 25-23) {
        db.employeCollection.remove( employe );
    }
    i++;
});

db.employeCollection.find().pretty().sort({salaire: 1});

db.employeCollection.find().forEach(function(employe) {
    employe.salaire += 500;
});

db.employeCollection.find().pretty().sort({salaire: 1});

EOF