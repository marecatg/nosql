#!/bin/sh

mongo <<EOF 
use customersdb

var size = 25;
var nbToRemove = 23;

db.createCollection('employeCollection', {size: size});

print("Insert");
for (var i = 0; i < size; i++) {
   db.employeCollection.insert( { nom: "marecat " + i, prenom: "gaetan " + i, salaire: Math.floor(Math.random() * (15000 - 1000 + 1)) + 1000 });
}

print("Remove");
var i = 0;
db.employeCollection.find().sort({salaire: 1}).forEach(function(employe) {
    if (i >= size-nbToRemove) {
        db.employeCollection.remove( employe );
    }
    i++;
});

db.employeCollection.find().pretty().sort({salaire: 1});

print("Update");
db.employeCollection.find().forEach(function(employe) {

    db.employeCollection.update(
        { _id: employe._id }, 
        {nom: employe.nom, prenom: employe.prenom, salaire : employe.salaire + 500 }
    );
});

db.employeCollection.find().pretty().sort({salaire: 1});

EOF