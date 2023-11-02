
##  MET Norway

### Current practice
There are essentially two types of dynamical geodata at MET Norway: gridded data and non-gridded data.

#### Gridded data
Gridded data include numerical and statistical model output and many satellite-derived datasets. MET Norway employs NetCDF/CF as the primary method for structuring gridded data. For documentation, CF-compliance ensures the availability of adequate use metadata in each file... 

WMO membership obliges the institute to provide and handle GRIB files; this is done for several datasets, but GRIB does not provide use or discovery metadata in itself.

#### Non-gridded data
Non-gridded data include most observational data like observations at weather stations, radiosondes, CTD profiles in the ocean, etc. These diverse data types are maintained in many different solutions, ranging from files (e.g. weather station observations extracted from WMO GTS in WMO BUFR format and subsequently converted to NetCDF/CF for easier usage) or DBMS solutions (e.g., the institute’s weather station climate data storage). Software ([frost2nc](https://github.com/metno/frost2nc)) for conversion of output from the climate data storage to NetCDF/CF for user consumption is available for some stations... 

The WMO standard for observations is BUFR, which is also supported but is not self-describing. The institute also maintains other types of data, like textual representations of the weather forecast. Most of these are currently not in any standard format, a notable exception being newly available warnings in CAP format, which is a WMO/OASIS standard format.

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


## NIVA

### Current practice

Data are usually stored in databases like oracle or for newer dataflows in postgresql. Some of this data is publicly available through [aquamonitor](https://aquamonitor.niva.no) or for visualization using [superset](https://superset.p.niva.no). 

#### Time Series

Loggers are a large source of time series data at NIVA and stored in a DBMS solution. Some of the data is shared with partners using a REST-API. For public access NIVA can share timeseries using OPeNDAP and the C&F convention.

#### Trajectories

Sensors placed onboard ships, ferryboxes, are typical trajectories sampled by NIVA. For trajectories, metadata is stored in a NoSQL solution, while data is stored in a postgresql database following an internal schema. A REST-API is used to share data upon request, while an internal approval process is used before publishing data for public access. When published, data can be shared through OPeNDAP and following the C&F convention. 

## NINA

### Current practice

Data is stored in multiple formats and structures such as databases, tabular files, geospatial, gridded, and images.

### Species observation

One of the main type of data is the point observation of species, delivered in the darwin core standard. Sampling of genetic material in nature converges into huge databases of biodiversity genetic data.

### Time series

Automated positioning of individuals by gps devices results in Spatial animal movement data. Regular surveying of the same variables in same locations results in time series of biodiversity data.