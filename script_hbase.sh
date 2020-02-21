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
