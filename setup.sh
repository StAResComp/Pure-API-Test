#!/bin/bash

config_file=~/.pureApiTestConfig

# Variables to hold config values with defaults
data_dir="~/pure_api_test_data"
pure_url="https://riswebtest.st-andrews.ac.uk"
api_key=""

# Create config file if it doesn't exist
if [ ! -f "$config_file" ]
then
    echo "Config file not found at ${config_file}. Creating it now"

    echo -n "Data directory location (default ${data_dir}): "
    read entered_data_dir
    [[ ! -z "${entered_data_dir// }" ]] && data_dir=$entered_data_dir

    echo -n "Pure URL domain (default ${pure_url}): "
    read entered_pure_url
    [[ ! -z "${entered_pure_url// }" ]] && pure_url=$entered_pure_url

    echo -n "Pure API Key: "
    read entered_api_key
    api_key=$entered_api_key

    echo "data_dir=${data_dir}" >> $config_file
    echo "pure_url=${pure_url}" >> $config_file
    echo "api_key=${api_key}" >> $config_file

    echo ""
    echo ""
    echo "Contents of ${config_file}:"
    echo ""
    cat "$config_file"
    echo ""
fi


# Read the data directory config file
data_dir="$(grep '^data_dir' $config_file | cut -d'=' -f2)"

# Avoid tilde expansion issues later on
data_dir="$(eval echo ${data_dir})"

# Create data directory if necessary
if [ ! -d "$data_dir" ]
then
    echo "Data directory ${data_dir} doesn't exist. Creating it now"
    mkdir "$data_dir"
fi

# Create database if necessary
db_file="pureApiTest.sqlite"
db_path="$data_dir/$db_file"
if [ ! -f "$db_path" ]
then
    echo "Database file ${db_path} doesn't exist. Creating it now"
    sqlite3 "$db_path" < create_db.sql
fi

# Create responses directory if necessary
res_dir="responses"
res_path="$data_dir/$res_dir"
if [ ! -d "$res_path" ]
then
    echo "Responses directory ${res_path} doesn't exist. Creating it now"
    mkdir "$res_path"
fi
