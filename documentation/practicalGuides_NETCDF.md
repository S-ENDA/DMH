### Introduction ###

[NetCDF (Network Common Data Form)](https://www.unidata.ucar.edu/software/netcdf/) is a format designed to facilitate handling of array-oriented scientific data. For a more detailed description, please visit [Unidata's NetCDF user's guide.](https://docs.unidata.ucar.edu/nug/current/netcdf_introduction.html)

## Submitting data as NetCDF-CF
### Workflow
1. Define your dataset 
2. Create a NetCDF-CF file
   - Add discovery metadata as global attributes (see global attibutes section)
   - Add variables and use metadata following the [CF conventions](https://cfconventions.org/)
3. Store the NetCDF-CF file in a suitable location, and distribute it via thredds or another dap server
4. Register your dataset in a searchable catalog 
   - Test that your dataset contains the necessary discovery metadata and create an MMD xml file
   - Test the MMD xml file
   - Push the MMD xml file to the discovery metadata catalog 

### Creating NetCDF-CF files
By documenting and formatting your data using [NetCDF)](https://www.unidata.ucar.edu/software/netcdf/) following the [CF conventions](https://cfconventions.org/) and the [Attribute Convention for Data Discovery (ACDD)](https://wiki.esipfed.org/Attribute_Convention_for_Data_Discovery_1-3), [MMD](https://github.com/metno/mmd) (metadata) files can be automatically generated from the NetCDF files. The CF conventions is a controlled vocabulary providing a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data. The ACDD vocabulary describes attributes recommended for describing a NetCDF dataset to data discovery systems. See, e.g.,[netCDF4-python docs](https://unidata.github.io/netcdf4-python/), or [xarray docs](http://xarray.pydata.org/en/stable/user-guide/io.html])for documentation about how to create netCDF files.

The ACDD recommendations should be followed in order to properly document your netCDF-CF files. The tables below summarize the required and recommended ACDD as well as additional attributes required to support interoperability between different information systems( e.g.,GCMD/DIF, the INSPIRE and WMO profiles of ISO19115, etc.).

#### Notes
Keywords describe the content of your dataset following a given vocabulary. You may use any vocabulary to define your keywords, but a link to the keyword definitions should be provided in the
keywords_vocabulary attribute. This attribute provides information about the vocabulary defining the keywords used in the keywords attribute. Example:

```:keywords_vocabulary = "GCMDSK:GCMD Science
Keywords:https://gcmd.earthdata.nasa.gov/kms/concepts/concept_scheme/sciencekeywords,GEMET:INSPIRE 
Themes:http://inspire.ec.europa.eu/theme,NORTHEMES:GeoNorge
Themes:https://register.geonorge.no/metadata-kodelister/nasjonal-temainndeling";
 ```

Note that the [GCMDSK](https://gcmd.earthdata.nasa.gov/kms/concepts/concept_scheme/sciencekeywords) [GEMET](http://inspire.ec.europa.eu/theme) and [NORTHEMES](https://register.geonorge.no/metadata-kodelister/nasjonal-temainndeling) vocabularies are required for indexing in [S-ENDA](https://adc.met.no/) and [Geonorge](https://www.geonorge.no/en/). 

The keywords should be provided by the keywords attribute as a comma separated list with a short-name defining the vocabulary used, followed by the actual keyword, i.e., short_name:keyword. Example:

```
:keywords = "GCMDSK:Earth Science > Atmosphere > Atmospheric radiation, GEMET:Meteorological geographical features,
GEMET:Atmospheric conditions, NORTHEMES:Weather and climate";
```
See https://adc.met.no/node/96 for more information about how to define the ACDD keywords.

A data license provides information about any restrictions on the use of the dataset. To support a linked data approach, it is strongly recommended to use identifiers and URL’s from https://spdx.org/licenses/ and to use a form similar to <URL>(<Identifier>) using elements from the SPDX license list. Example:

```:license = "http://spdx.org/licenses/CC-BY-4.0(CC-BY-4.0)" ;```

#### Default global attribute values for MET Norway

The below is an example of selected global attributes, as shown from the output of ```ncdump -h <filename>:```
```
// global attributes:
:creator_institution = "Norwegian Meteorological Institute" ;
:institution = "Norwegian Meteorological Institute" ;
:institution_short_name = "MET Norway" ;:keywords = "GCMDSK:<to-be-added-by-data-creator>, GEMET:<to-be-added-by-data-creator>,
GEMET:<to-be-added-by-data-creator>, GEMET:<to-be-added-by-data-creator>, NORTHEMES:<to-be-
added-by-data-creator>" ;
:keywords_vocabulary = "GCMDSK:GCMD Science
Keywords:https://gcmd.earthdata.nasa.gov/kms/concepts/concept_scheme/sciencekeywords,
GEMET:INSPIRE Themes:http://inspire.ec.europa.eu/theme, NORTHEMES:GeoNorge
Themes:https://register.geonorge.no/metadata-kodelister/nasjonal-temainndeling" ;
:license = "http://spdx.org/licenses/CC-BY-4.0(CC-BY-4.0)" ;
:naming_authority = "no.met" ;
:publisher_name = "Norwegian Meteorological Institute" ;
:publisher_type = "institution" ;
:publisher_email = "csw-services@met.no" ;
:publisher_url = "https://www.met.no/" ;

```
Global attribute values for other S-ENDA partners can be added as showm:
```
// global attributes:
    :creator_institution = "<to-be-added>" ;
    :institution = "<to-be-added>" ;
    :institution_short_name = "<to-be-added>" ;
    :keywords = "GCMDSK:<to-be-added-by-data-creator>, GEMET:<to-be-added-by-data-creator>, GEMET:<to-be-added-by-data-creator>, GEMET:<to-be-added-by-data-creator>, NORTHEMES:<to-be-added-by-data-creator>" ;
    :keywords_vocabulary = "GCMDSK:GCMD Science Keywords:https://gcmd.earthdata.nasa.gov/kms/concepts/concept_scheme/sciencekeywords, GEMET:INSPIRE Themes:http://inspire.ec.europa.eu/theme, NORTHEMES:GeoNorge Themes:https://register.geonorge.no/metadata-kodelister/nasjonal-temainndeling" ;
    :license = "http://spdx.org/licenses/CC-BY-4.0(CC-BY-4.0)" ;
    :naming_authority = "<to-be-added>" ;
    :publisher_name = "<publisher-institution-name>" ;
    :publisher_type = "institution" ;
    :publisher_email = "<to-be-added>" ;
    :publisher_url = "<to-be-added>" ;
```

#### Example script to update a NetCDF-CF file with correct discovery metadata
We use a test dataset containing the U component of wind at 10 m height, x_wind_10m, extracted from a [MEPS 2.5km file](https://thredds.met.no/thredds/catalog/metusers/magnusu/test-2023-02-03/catalog.html?dataset=metusers/magnusu/test-2023-02-03/meps_reduced.nc) (~3.5G). The file can be downloaded by clicking on the link at access point 2., HTTPServer.
Below is an example python script to add the required discovery metadata to the netCDF-CF file. The resulting file can be validated by the script scripts/nc2mmd.py in [py-mmd-tools](https://github.com/metno/py-mmd-tools), which also can parse the netCDF-CF file into an MMD xml file.The script becomes available as the endpoint nc2mmd in the environment where the py-mmd-tools repo is
installed. A warning that the CF attribute featureType is missing will be printed, but this is not a concern for this dataset, since it is gridded data, and featureType only applies to discrete sampling geometries (see https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#_features_and_feature_types).

```
#!/usr/bin/env python
from datetime import datetime, timezone
import sys
import netCDF4
from uuid import uuid4

with netCDF4.Dataset(sys.argv[1], "a") as f:
    f.id = str(uuid4())
    f.naming_authority = "no.met"

    f.creator_institution = "Norwegian Meteorological Institute"
    f.delncattr("creator_url")  # not needed, replaced by publisher_url

    f.institution = "Norwegian Meteorological Institute"
    f.institution_short_name = 'MET Norway'

    f.title = "U component of wind speed at ten meter height (example)"
    f.title_no = "U-komponent av vindhastighet i ti meters høyde (eksempel)"
    f.summary = (
        "Test dataset to demonstrate how to document a netcdf-cf file"
        " containing wind speed at 10 meter height from a MEPS 2.5km "
        "dataset with ACDD attributes.")
    f.summary_no = (
        "Test datasett for å demonstrere hvordan du dokumenterer en "
        "netcdf-cf-fil som inneholder vindhastighet i 10 meters "
        "høyde fra et MEPS 2,5 km datasett med ACDD-attributter.")
    f.references = "https://github.com/metno/NWPdocs/wiki (Users guide)"

    f.keywords = (
        "GCMDSK:Earth Science > Atmosphere > Atmospheric winds, "
        "GEMET:Meteorological geographical features, "
        "GEMET:Atmospheric conditions, "
        "GEMET:Oceanographic geographical features, "
        "NORTHEMES:Weather and climate")
    f.keywords_vocabulary = (
        "GCMDSK:GCMD Science Keywords:https://gcmd.earthdata.nasa.gov"
        "/kms/concepts/concept_scheme/sciencekeywords, "
        "GEMET:INSPIRE themes:https://inspire.ec.europa.eu/theme, "
        "NORTHEMES:GeoNorge Themes:https://register.geonorge.no/"
        "subregister/metadata-kodelister/kartverket/nasjonal-"
        "temainndeling")

    # Set ISO topic category
    f.iso_topic_category = "climatologyMeteorologyAtmosphere"

    # Set the correct license
    f.license = "http://spdx.org/licenses/CC-BY-4.0(CC-BY-4.0)"

    f.publisher_name = "Norwegian Meteorological Institute"
    f.publisher_type = "institution"
    f.publisher_email = "csw-services@met.no"
    f.publisher_url = "https://www.met.no/"

    # Extract time_coverage_start from the time variable
    tstart = f.variables['time'][0]  # masked array
    tstart = int(tstart[~tstart.mask].data[0])
    tstart = datetime.fromtimestamp(tstart)
    # The time zone is utc (this can be seen from the metadata of the
    # time variable) and the time in isoformat is
    # 2023-02-01T10:00:00+00:00
    f.time_coverage_start = tstart.replace(tzinfo=timezone.utc).isoformat()

    # Extract time_coverage_end from the time variable
    tend = f.variables['time'][-1]  # masked array
    tend = int(tend[~tend.mask].data[0])
    tend = datetime.fromtimestamp(tend)
    # The time in isoformat is 2023-02-03T23:00:00+00:00
    f.time_coverage_end = tend.replace(tzinfo=timezone.utc).isoformat()

    # The date_created is in this case recorded in the history attribute
    # We have hardcoded it here for simplicity
    f.date_created = datetime.strptime("2023-02-01T11:30:05", "%Y-%m-%dT%H:%M:%S").replace(
        tzinfo=timezone.utc).isoformat()

    # Set the spatial representation (a MET ACDD extension)
    f.spatial_representation = 'grid'

    # Update the conventions attribute to the correct ones
    f.Conventions = 'CF-1.10, ACDD-1.3'
```
To test it yourself, you can do the following:

```
$ git clone git@github.com:metno/data-management-handbook.git
$ cd data-management-handbook/example_scripts
$ wget https://thredds.met.no/thredds/fileServer/metusers/magnusu/test-2023-02-03/meps_reduced.nc
$ ./update_meps_file.py meps_reduced
$ cd <path-to-py-mmd-tools>/script
$ ./nc2mmd.py -i <path-to-data-management-handbook>/example_scripts/meps_reduced.nc -o .
$ less meps_reduced.xml  # to see the MMD xml file
```

### How to add NetCDF-CF data to thredds
This section should contain institution specific information about how to add netcdf-cf files to thredds.

#### MET Norway
To add your NetCDF-CF data to [thredds.met.no](https://thredds.met.no/thredds/catalog.html])? Follow these steps and your data will be discoverable by MET Norway’s thredds server
(discovery metadata files can then be created with the nc2mmd tool in [py-mmd-tools](https://github.com/metno/py-mmd-tools]). 
1. Store the NetCDF-CF file(s) on the lustre filesystem.
  - if you need help to transfer data, please file a ticket at [hjelp.met.no](https://hjelp.met.no)
  - Please also make sure that you have sufficient quota on lustre for your data or apply for a quota on [hjelp.met.no](https://hjelp.met.no)
  - You can either use your own user space or a group area that you have access to within a project
  - Make sure you add the same data to both the A and B storage rooms if you need redundancy (this requires some extra steps)
2. Then, thredds needs to be able to discover your data:
 - Use hjelp.met.no [https://hjelp.met.no] to file a ticket for adding data to thredds. The full path to your data or to the base directory of your data structure is needed. All data files ending with .nc ( or.ncml ) below this base directory will be visible on thredds.
 - When thredds configuration updates have been deployed by the thredds administrator, your NetCDF-CF data will become visible on the server.
   
The base directory of all data available on thredds is https://thredds.met.no/thredds/catalog.html. Here you will find your data in the folder agreed with the thredds administrator. If your files are correctlyformatted and follow the CF [https://cfconventions.org/] and ACDD [https://wiki.esipfed.org/Attribute_Convention_for_Data_Discovery_1-3] conventions, it is also possible to register the datasets in the discovery metadata catalog. See details in [Creating NetCDF-CF files].

## Access to data without downloading

It is possible to get access to NetCDF data via URL. Here we provide ways to do so using Python and R.

### With Python

Xarray installation is required. For more information visit xarray's [documentation site](https://docs.xarray.dev/en/stable/index.html) or [getting started guide](https://docs.xarray.dev/en/latest/getting-started-guide/installing.html). 

If you don't have xarray installed. Do so with

```python
python -m pip install "xarray[complete]"
        
# If you use conda: 

conda install -c conda-forge xarray dask netCDF4 bottleneck
```

**Reproducible example:**

```python
import xarray as xr

ds = xr.open_dataset("https://thredds.niva.no/thredds/dodsC/datasets/loggers/msource-inlet.nc")
ds # this displays basic info on the dataset
# If you don't need the full dataset subset!
# That way you don't need to download all the years
ds = ds.sel(time="2024")
ds.to_dataframe()
ds.temperature.plot()
ds.head()
```

### With R

There are several packages for NetCDF in R (RNetCDF, ncdf4, raster, stars). The example below uses [tidync](https://docs.ropensci.org/tidync/). 

**Reproducible example:**

```R
library(tidync)

url=paste0('https://thredds.niva.no/thredds/dodsC/datasets/loggers/msource-outlet.nc')
          
# Read the netcdf file from the url
dataNiva = tidync(url) 

```

### Submitting data as NetCDF-CF

**Workflow**

- Define your dataset, some help can be found at [CF conventions](https://cfconventions.org/)

- Create a CF-NetCDF file with the required attributes

  * Add units, long_name and standard_name(if possible) to data variables
  * Add discovery metadata as global attributes to the dataset, also see [adc.met.no](https://adc.met.no/node/4) and/or the [met handbook](https://metno.github.io/data-management-handbook/#_climate_and_forecast_conventions_cf)

For full examples see:
  - [creating timeseries](./src/notebooks/create-timeseries.html)
  - [creating trajectories](./src/notebooks/create-trajectory.html)
