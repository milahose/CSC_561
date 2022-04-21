#!/usr/bin/env bash

#Add your curl statements here
HOST="http://couchdb:5984"

curl -i -X PUT $HOST/restaurants

curl -i -X POST "$HOST/restaurants" -H "Content-Type: application/json" -d '{ "_id": "in_n_out_burger", "name": "In-N-Out Burger", "food_type": ["Fast Food", "Burgers"], "phonenumber": "(800) 786-1000", "website": "in-n-out.com" }'
curl -i -X POST "$HOST/restaurants" -H "Content-Type: application/json" -d '{ "_id": "hummus_bean", "name": "Hummus Bean", "food_type": ["Mediterranean", "Lebanese"], "phonenumber": "(714) 603-7571", "website": "hummusbean.com" }'
curl -i -X POST "$HOST/restaurants" -H "Content-Type: application/json" -d '{ "_id": "outback_steakhouse", "name": "Outback Steakhouse", "food_type": ["Steak", "Seafood"], "phonenumber": "(714) 663-1107", "website": "outback.com" }'


#DO NOT REMOVE
curl -Ssf -X PUT http://couchdb:5984/restaurants/_design/docs -H "Content-Type: application/json" -d '{"views": {"all": {"map": "function(doc) {emit(doc._id, {rev:doc._rev, name:doc.name, food_type:doc.food_type, phonenumber:doc.phonenumber, website:doc.website})}"}}}'
curl -Ssf -X GET http://couchdb:5984/restaurants/_design/docs/_view/all
