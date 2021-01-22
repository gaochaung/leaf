FROM microsoft/mssql-server-linux:2017-latest

ARG sapw
ENV I2B2_DB_HOST=localhost
ENV I2B2_DB_PORT=1433
ENV POSTGRES_DB=i2b2
ENV CON_URL=jdbc:sqlserver://$I2B2_DB_HOST:$I2B2_DB_PORT
ENV DB_DRIVER_CLASS=com.microsoft.sqlserver.jdbc.SQLServerDriver
ENV DB_DRIVER=mssql-jdbc-6.2.2.jre8.jar
ENV SERVER_TYPE=sqlserver

ENV POSTGRES_USER=i2b2
ENV POSTGRES_PASSWORD=GAOchuang900529
ENV I2B2_HOST=i2b2app
ENV I2B2_PORT=8080


ENV PM_HOST=$I2B2_HOST
ENV PM_PORT=$I2B2_PORT


ENV ONT_HOST=$I2B2_HOST
ENV ONT_PORT=$I2B2_PORT


ENV CRC_HOST=$I2B2_HOST
ENV CRC_PORT=$I2B2_PORT


ENV FR_HOST=$I2B2_HOST
ENV FR_PORT=$I2B2_PORT


ENV WORK_HOST=$I2B2_HOST
ENV WORK_PORT=$I2B2_PORT

ENV i2b2_db_user_HIVE=i2b2hive
ENV i2b2_db_pass_HIVE=GAOchuang900529
ENV i2b2_db_schema_HIVE=i2b2hive

ENV i2b2_db_user_PM=i2b2pm
ENV i2b2_db_pass_PM=GAOchuang900529
ENV i2b2_db_schema_PM=i2b2pm

ENV i2b2_db_user_CRC=i2b2demodata
ENV i2b2_db_pass_CRC=GAOchuang900529
ENV i2b2_db_schema_CRC=i2b2demodata

ENV i2b2_db_user_ONT=i2b2metadata
ENV i2b2_db_pass_ONT=GAOchuang900529
ENV i2b2_db_schema_ONT=i2b2metadata

ENV i2b2_db_user_WORK=i2b2workdata
ENV i2b2_db_pass_WORK=GAOchuang900529
ENV i2b2_db_schema_WORK=i2b2workdata

ENV ANT_HOME=/opt/ant/

RUN mkdir data

# Include schema and initial data
COPY ./LeafDB.sql ./LeafDB.Init.sql ./LeafDB.ImportI2b2Ontology.sql ./I2B2.Init.sql ./installdata.sh ./
# COPY ./SynPuf_OMOP.bak ./data/

# Accept EULA
ENV ACCEPT_EULA Y

# Dev SA Password
ENV MSSQL_SA_PASSWORD ${sapw}

# Volumize somewhere to interact with host if needed
VOLUME /bak

RUN apt-get update \
&& apt-get install openjdk-8-jdk wget -y
RUN apt-get install unzip

RUN wget https://www.i2b2.org/software/projects/installer/apache-ant-1.9.6-bin.zip --no-check-certificate \
	&& unzip apache-ant-1.9.6-bin.zip -d /opt \
	&& mv /opt/apache-ant-1.9.6/ /opt/ant/

RUN apt-get install xmlstarlet -y

ADD ./i2b2createdb-1710.zip /opt

RUN unzip /opt/i2b2createdb-1710.zip -d /opt \
	&& mv /opt/i2b2-data-master /opt/i2b2data/

# Set up database
RUN /opt/mssql/bin/sqlservr & sleep 10 \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${MSSQL_SA_PASSWORD} -i ./LeafDB.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${MSSQL_SA_PASSWORD} -i ./LeafDB.Init.sql \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${MSSQL_SA_PASSWORD} -i ./I2B2.Init.sql \
    #&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${MSSQL_SA_PASSWORD} -i ./LeafDB.ImportI2b2Ontology.sql \
    #&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${MSSQL_SA_PASSWORD} -i ./SynPuf_OMOP.Shrink.sql \
    && pkill sqlservr

# RUN rm /data/SynPuf_OMOP.bak

ADD ./installdata.sh /opt
RUN chmod +x /opt/installdata.sh
