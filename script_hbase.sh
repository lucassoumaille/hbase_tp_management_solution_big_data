#!/bin/bash

# Création table CUSTOMER et familles associées
echo "create 'CUSTOMER', {NAME=> 'civ', VERSIONS=>2}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The create table CUSTOMER and family civ may have failed."
fi

echo "alter 'CUSTOMER', {NAME=> 'acc', VERSIONS=>1}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command alter table CUSTOMER and family acc may have failed."
fi

echo "alter 'CUSTOMER', {NAME=> 'add', VERSIONS=>2}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command alter table CUSTOMER and family add may have failed."
fi

echo "alter 'CUSTOMER', {NAME=> 'addC', VERSIONS=>2}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command alter table CUSTOMER and family addC may have failed."
fi

# Création table FILM et familles associées
echo "create 'FILM', {NAME=> 'mov', VERSIONS=>1}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The create table FILM and family mov may have failed."
fi

echo "alter 'FILM', {NAME=> 'dis', VERSIONS=>1}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command alter table FILM and family dis may have failed."
fi

# Création table ACTOR et familles accosiées
echo "create 'ACTOR', {NAME=> 'civA', VERSIONS=>1}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command create table ACTOR and family civA may have failed."
fi

# Création table RENTAL et familles accosiées
echo "create 'RENTAL', {NAME=> 'ren', VERSIONS=>1}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command create table RENTAL and family ren may have failed."
fi

echo "alter 'RENTAL', {NAME=> 'renP', VERSIONS=>1}" | hbase shell -n
status_code=$?
if [ ${status_code} -ne 0 ]; then
  echo "The command alter table RENTAL and family renP may have failed."
fi


# Exemples d'inserts sur première table
# put 'CUSTOMER','mollusque@palourde.com','civ:first_name','Bernard'
# put 'CUSTOMER','mollusque@palourde.com','civ:last_name','LERMITE'
# put 'CUSTOMER','mollusque@palourde.com','acc:email','mollusque@palourde.com'
# put 'CUSTOMER','mollusque@palourde.com','acc:phone','0606060606'
# put 'CUSTOMER','mollusque@palourde.com','acc:active','1'