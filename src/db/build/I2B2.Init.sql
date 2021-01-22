-- Copyright (c) 2020, UW Medicine Research IT, University of Washington
-- Developed by Nic Dobbins and Cliff Spital, CRIO Sean Mooney
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.
﻿USE [master]
GO
/****** Object:  Database [i2b2]    Script Date: ******/
CREATE DATABASE [i2b2]
GO
USE [i2b2]
GO

-- Creates a database user and the login for i2b2demodata.
CREATE LOGIN i2b2demodata
    WITH PASSWORD = 'GAOchuang900529';  
GO    
CREATE USER i2b2demodata FOR LOGIN i2b2demodata;  
GO 
Create schema [i2b2demodata] AUTHORIZATION i2b2demodata;
GO

-- Creates a database user and the login for i2b2hive.
CREATE LOGIN i2b2hive
    WITH PASSWORD = 'GAOchuang900529';  
GO   
CREATE USER i2b2hive FOR LOGIN i2b2hive;  
GO 
Create schema [i2b2hive] AUTHORIZATION i2b2hive;
GO

-- Creates a database user and the login for i2b2imdata.
CREATE LOGIN i2b2imdata
    WITH PASSWORD = 'GAOchuang900529';  
GO    
CREATE USER i2b2imdata FOR LOGIN i2b2imdata;  
GO 
Create schema [i2b2imdata] AUTHORIZATION i2b2imdata;
GO

-- Creates a database user and the login for i2b2metadata
CREATE LOGIN i2b2metadata
    WITH PASSWORD = 'GAOchuang900529';  
GO  
CREATE USER i2b2metadata FOR LOGIN i2b2metadata;  
GO 
Create schema [i2b2metadata] AUTHORIZATION i2b2metadata;
GO

-- Creates a database user and the login for i2b2pm.
CREATE LOGIN i2b2pm
    WITH PASSWORD = 'GAOchuang900529';  
GO    
CREATE USER i2b2pm FOR LOGIN i2b2pm;  
GO 
Create schema [i2b2pm] AUTHORIZATION i2b2pm;
GO

-- Creates a database user and the login for i2b2workdata.
CREATE LOGIN i2b2workdata
    WITH PASSWORD = 'GAOchuang900529';  
GO    
CREATE USER i2b2workdata FOR LOGIN i2b2workdata;  
GO 
Create schema [i2b2workdata] AUTHORIZATION i2b2workdata;
GO

