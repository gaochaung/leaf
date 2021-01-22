#!/bin/bash

source $SECRETS

i2b2datahome=/opt/i2b2data

export host=$I2B2_DB_HOST

dbtype=$SERVER_TYPE
dbdriver=$DB_DRIVER_CLASS
dbproject=demo

##############################

dbusername=SA
dbpassword=$i2b2_db_pass_CRC
dburl="$CON_URL;databaseName=i2b2"

cd $i2b2datahome/edu.harvard.i2b2.data/Release_1-7/NewInstall/Crcdata

echo $dburl

sed -i "s#db.type=.*#db.type=$dbtype#g" db.properties
sed -i "s#db.username=.*#db.username=$dbusername#g" db.properties
sed -i "s#db.password=.*#db.password=$dbpassword#g" db.properties
sed -i "s#db.driver=.*#db.driver=$dbdriver#g" db.properties
sed -i "s#db.url=.*#db.url=$dburl#g" db.properties
sed -i "s#db.project=.*#db.project=$dbproject#g" db.properties


/opt/ant/bin/ant -f data_build.xml create_crcdata_tables_release_1-7
/opt/ant/bin/ant -f data_build.xml create_procedures_release_1-7
/opt/ant/bin/ant -f data_build.xml db_demodata_load_data


##############################

dbusername=SA
dbpassword=$i2b2_db_pass_HIVE
dburl="$CON_URL;databaseName=i2b2"


cd $i2b2datahome/edu.harvard.i2b2.data/Release_1-7/NewInstall/Hivedata


sed -i "s#db.type=.*#db.type=$dbtype#g" db.properties
sed -i "s#db.username=.*#db.username=$dbusername#g" db.properties
sed -i "s#db.password=.*#db.password=$dbpassword#g" db.properties
sed -i "s#db.driver=.*#db.driver=$dbdriver#g" db.properties
sed -i "s#db.url=.*#db.url=$dburl#g" db.properties
sed -i "s#db.project=.*#db.project=$dbproject#g" db.properties

sed -i "s#public#i2b2demodata#g" scripts/crc_db_lookup_postgresql_insert_data.sql
sed -i "s#public#i2b2imata#g" scripts/im_db_lookup_postgresql_insert_data.sql
sed -i "s#public#i2b2metadata#g" scripts/ont_db_lookup_postgresql_insert_data.sql
sed -i "s#public#i2b2workdata#g" scripts/work_db_lookup_postgresql_insert_data.sql



/opt/ant/bin/ant -f data_build.xml create_hivedata_tables_release_1-7
/opt/ant/bin/ant -f data_build.xml db_hivedata_load_data

##############################

dbusername=SA
dbpassword=$i2b2_db_pass_IM
dburl="$CON_URL;databaseName=i2b2"

cd $i2b2datahome/edu.harvard.i2b2.data/Release_1-7/NewInstall/Imdata


sed -i "s#db.type=.*#db.type=$dbtype#g" db.properties
sed -i "s#db.username=.*#db.username=$dbusername#g" db.properties
sed -i "s#db.password=.*#db.password=$dbpassword#g" db.properties
sed -i "s#db.driver=.*#db.driver=$dbdriver#g" db.properties
sed -i "s#db.url=.*#db.url=$dburl#g" db.properties
sed -i "s#db.project=.*#db.project=$dbproject#g" db.properties


/opt/ant/bin/ant -f data_build.xml create_imdata_tables_release_1-7
/opt/ant/bin/ant -f data_build.xml db_imdata_load_data


##############################
dbusername=SA
dbpassword=$i2b2_db_pass_ONT
dburl="$CON_URL;databaseName=i2b2"

cd $i2b2datahome/edu.harvard.i2b2.data/Release_1-7/NewInstall/Metadata


sed -i "s#db.type=.*#db.type=$dbtype#g" db.properties
sed -i "s#db.username=.*#db.username=$dbusername#g" db.properties
sed -i "s#db.password=.*#db.password=$dbpassword#g" db.properties
sed -i "s#db.driver=.*#db.driver=$dbdriver#g" db.properties
sed -i "s#db.url=.*#db.url=$dburl#g" db.properties
sed -i "s#db.project=.*#db.project=$dbproject#g" db.properties


/opt/ant/bin/ant -f data_build.xml create_metadata_tables_release_1-7
/opt/ant/bin/ant -f data_build.xml db_metadata_load_data


##############################

dbusername=SA
dbpassword=$i2b2_db_pass_PM
dburl="$CON_URL;databaseName=i2b2"


cd $i2b2datahome/edu.harvard.i2b2.data/Release_1-7/NewInstall/Pmdata


sed -i "s#db.type=.*#db.type=$dbtype#g" db.properties
sed -i "s#db.username=.*#db.username=$dbusername#g" db.properties
sed -i "s#db.password=.*#db.password=$dbpassword#g" db.properties
sed -i "s#db.driver=.*#db.driver=$dbdriver#g" db.properties
sed -i "s#db.url=.*#db.url=$dburl#g" db.properties
sed -i "s#db.project=.*#db.project=$dbproject#g" db.properties


/opt/ant/bin/ant -f data_build.xml create_pmdata_tables_release_1-7
/opt/ant/bin/ant -f data_build.xml db_pmdata_load_data

##############################

dbusername=SA
dbpassword=$i2b2_db_pass_WORK
dburl="$CON_URL;databaseName=i2b2"


cd $i2b2datahome/edu.harvard.i2b2.data/Release_1-7/NewInstall/Workdata


sed -i "s#db.type=.*#db.type=$dbtype#g" db.properties
sed -i "s#db.username=.*#db.username=$dbusername#g" db.properties
sed -i "s#db.password=.*#db.password=$dbpassword#g" db.properties
sed -i "s#db.driver=.*#db.driver=$dbdriver#g" db.properties
sed -i "s#db.url=.*#db.url=$dburl#g" db.properties
sed -i "s#db.project=.*#db.project=$dbproject#g" db.properties


/opt/ant/bin/ant -f data_build.xml create_workdata_tables_release_1-7
/opt/ant/bin/ant -f data_build.xml db_workdata_load_data

