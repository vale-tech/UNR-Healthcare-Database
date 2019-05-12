# UNRHealthCare Database

## Hospital Compare Tables.xlsx

This spreadsheet lists all of the tables across all data files that were candidates for importing into the UNRHealthCare database. Each row represents similar data across years. For some years similar data was found across multiple tables and all relevant table names for that year are within a cell. The status column indicates whether or not the row was imported. The table names listed have the year appended to them. This is the result of the ProcessMDB package (see below). Some notes also exist in the last column, although this is not critical information.

## Hospital Compare Data (Folder)

This folder would contain the extracted Hospital Compare Access files for 2009-2016. This data can be downloaded from the [Hospital Compare Archive]: (https://data.medicare.gov/data/archives/hospital-compare) 

## HospitalCompareImportAll (Folder)

Contains the VS solution file for the SSIS packages used to import the Access files into a staging database, create the UNRHealthCare database, and import the data from the staging database. This package was devloped in Visual Studio 2015 and is targeted towards SQL Server 2016.

### Configuration Files

Configuration files can be edited to prepare the solution to be run in your own environment.

MDBPaths.csv - This file should contain the fully qualified path to each Hospital Compare MDB file you wish to process along with the year of that data file. The year is contained in the first column, and the path in the second column.

### Project Parameters

Project parameters can be edited to prepare the solution to be run in your own environment.

MDBPathsFile - The location of the MDBPaths.csv file used by the MDBPaths connection manager.
MDBLoadLogTable - The table name used to log data loading from MDB files to stage.
DBServer - The target database server.
DBDatabase - The initial catalog to use for the connection - default is master.
DBUser - The username for an account that can create objects, and insert records on the target datbase server.
DBPass - Th password for DBUser.

### Connection Managers

The solution contains connection managers that are used to access flat files and databases. These are all configured via project parameters and should not require any manual configuration for your environment.

- MDBPaths (Flat File): Connection used to access MDBPaths.csv configuration file.
- DBMaster: Database connection for master database on target server. Uses DBServer, DBDatabase, DBUser, and DBPass project parameters.
- UNRHealthcareData: Database connection for UNRHealthcareData database on target server. Uses DBServer, DBUser, and DBPass project parameters.

### Project Packages

A series of SSIS packages is used to move the data from the MDB files to a staging database, and then ultimately the UNRHealthcareData database. The packages are listed below in execution sequence. The individual packages that transfer data from stage to the UNRHealthcareData database generally operate the same way and while their names are listed invidually, functionality for each is not listed.

#### Master Package

This package is responsible for sequencing and executing the package used to process the MDB files and the package used to transfer data from stage to the UNRHealthcareData database. This is the first package that should be run if the desire is to execute the data load process in full.

#### ProcessMDB Package

This package requires paths to the Hospital Compare Data files to be set within MDBPaths.csv and completes the following steps:

1. Setup HospitalCompareStage staging database and create the load log table.
2. Extract all tables from each of the MDB files and load the data into stage. Each table is appended with the data file year.
3. Delete tables that are not imported into UNRHealthcareData database, and perform miscellaneous data cleaning tasks that are required for the LoadMain package to execute.

#### ProcessStage Package

This package performs the following tasks:

1. Create the UNRHealthcareData database and all necessary tables
2. Execute all child packages responsible for transferring data from HospitalCompareStage to UNRHealthcareData database.

The first three steps in this package - Create All Tables, Populate Parent Tables, and Execute LoadHospital must all be run first. After that the child packages are broken down arbritrarily into sequence containers. These sequence containers and the packages within can be executed in any order as long as all of the tables have been created and the parent entities populated in the previous steps.

##### ProcessStage Child Packages

Each child package is responsible for transferring data from the HospitalCompareStage database to the UNRHealthcareData database. In general each child package follows this pattern:

1. Populate any necessary parent entities.
2. Populate data tables.
3. Create a pivoted view for data.

#### Pivoted Views

The ECON department wished to have output available to them that listed one data row per hospital per data year. In order to fulfill this requirement, a view was created for each set of tables in UNRHealthcare that pivoted the normalize data into one row per hospital per table. Each view contains the ProviderID and the DataYear for join purposes.

### Misc Notes

- The data source objects within packages typically use a SQL Command object. This code can be edited as needed.
- A STATA do file was created that attempted to provide some "friendly" variable labels for use in STATA. The script Generate STATA Label File.sql will create output that can be copied into a plain text file with the extension ".do" for processing in STATA. This script generates labels for all of the pivoted views.