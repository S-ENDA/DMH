
##  MET Norway

### Current practice
There are essentially two types of dynamical geodata at MET Norway: gridded data and non-gridded data.

#### Gridded data
Gridded data include numerical and statistical model output and many satellite-derived datasets. MET Norway employs NetCDF/CF as the primary method for structuring gridded data. For documentation, CF-compliance ensures the availability of adequate use metadata in each file... 

WMO membership obliges the institute to provide and handle GRIB files; this is done for several datasets, but GRIB does not provide use or discovery metadata in itself.

#### Non-gridded data
Non-gridded data include most observational data like observations at weather stations, radiosondes, CTD profiles in the ocean, etc. These diverse data types are maintained in many different solutions, ranging from files (e.g. weather station observations extracted from WMO GTS in WMO BUFR format and subsequently converted to NetCDF/CF for easier usage) or DBMS solutions (e.g., the institute’s weather station climate data storage). Software ([frost2nc](https://github.com/metno/frost2nc)) for conversion of output from the climate data storage to NetCDF/CF for user consumption is available for some stations... 

The WMO standard for observations is BUFR, which is also supported but is not self-describing. The institute also maintains other types of data, like textual representations of the weather forecast. Most of these are currently not in any standard format, a notable exception being newly available warnings in CAP format, which is a WMO/OASIS standard format.

### Current practice in structuring and documenting data

|Supported file formats/structures |Datatype |Available metadata |Examples|
|:----|:----|:----|:----|
|Comments|
| | |


## NILU
### Current practice
There are several types of dynamical geodata at NILU.

#### Gridded data

#### Time series data


### Current practice in structuring and documenting data

|Supported file formats/structures |Datatype |Available metadata |Examples|
|:----|:----|:----|:----|
|EBAS NasaAmes | NasaAmes1001 / ASCII | [EBAS metadata elements](https://ebas-submit.nilu.no/templates/comments/ebas_metadata_elements) | |
|NetCDF| | | |
|Comments| | | |