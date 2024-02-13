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
This section contains institution specific information about how to add netcdf-cf files to thredds.

#### MET Norway
To add your NetCDF-CF data to [thredds.met.no](https://thredds.met.no/thredds/catalog.html])? Follow these steps and your data will be discoverable by MET Norway’s thredds server
(discovery metadata files can then be created with the nc2mmd tool in [py-mmd-tools](https://github.com/metno/py-mmd-tools]). 
1. Store the NetCDF-CF file(s) on the lustre filesystem.
  - If you need help to transfer data, file a ticket at [hjelp.met.no](https://hjelp.met.no)
  - Make sure that you have sufficient quota on lustre for your data or apply for a quota on [hjelp.met.no](https://hjelp.met.no)
  - You can either use your own user space or a group area that you have access to within a project
  - Make sure you add the same data to both the A and B storage rooms if you need redundancy (this requires some extra steps)
2. Then, thredds needs to be able to discover your data:
 - Use [hjelp.met.no](https://hjelp.met.no) to file a ticket for adding data to thredds. The full path to your data or to the base directory of your data structure is needed. All data files ending with .nc ( or.ncml ) below this base directory will be visible on thredds.
 - When thredds configuration updates have been deployed by the thredds administrator, your NetCDF-CF data will become visible on the server.
   
The base directory of all data available on thredds is https://thredds.met.no/thredds/catalog.html. Here you will find your data in the folder agreed with the thredds administrator. If your files are correctlyformatted and follow the [CF](https://cfconventions.org/) and [ACDD](https://wiki.esipfed.org/Attribute_Convention_for_Data_Discovery_1-3) conventions, it is also possible to register the datasets in the discovery metadata catalog. See details in [Creating NetCDF-CF files].

## Register and make data available
In order to make a dataset findable, a dataset must be registered in a searchable catalog with appropriate metadata. Metadata Controlled Production is the process of using metadata and notification services to control downstream production. The (meta)data catalog is indexed and exposed through [CSW](https://www.geonorge.no/en/for-developers/apis/csw/).

At MET Norway for example,the MET Messaging System (MMS) a message broker, notifies users about the availability of new data. MMS uses [CloudEvents](https://cloudevents.io/) to describe [Product Events](https://github.com/metno/MMS/blob/main/messages.md), which are notification messages about new datasets (or products). MMS can be used both to notifying downstream production systems, and to make datasets findable, accessible and reusable for the general public. The former can be achieved by supplying the minimum required metadata in a Product Event, whereas the latter requires provisioning of an MMD metadata string to the Product Event. 

In order to make a dataset available to the public, a dataset must be registered in a searchable catalog with appropriate metadata.The following needs to be done:
1. Generate an MMD xml file from your NetCDF-CF file 
2. Test your mmd xml metadata file 
3. Push the MMD xml file to MMS or to the discovery metadata catalog service

### Generation of MMD xml file from NetCDF-CF

Clone the [py-mmd-tools](https://github.com/metno/py-mmd-tools.git) repo and make a local installation with e.g., *pip install .*. This should bring in all needed dependencies (we recommend to use a virtual environment).
Then, generate your mmd xml file as follows:

```
cd script
./nc2mmd.py -i <your netcdf file> -o <your xml output directory>
```
See *./nc2mmd.py --help* for documentation and extra options.

You will find Extensible Stylesheet Language Transformations (XSLT) documents in the [MMD](https://github.com/metno/mmd.git) repository. These can be used to translate the metadata documents from MMD to other vocabularies, such as ISO 19115:
```
./bin/convert_from_mmd -i <your mmd xml file> -f iso -o <your iso output file name>
```
*Note that the discovery metadata catalog ingestion tool will take care of translations from MMD, so you don’t need to worry about that unless you have special interest in it.*

### Test the MMD xml file
Install the [dmci app](https://github.com/metno/discovery-metadata-catalog-ingestor), and run the usage example locally. This will return an error message if anything is wrong with your MMD file.
You can also test your MMD file via the DMCI API:
```
curl --data-binary "@<PATH_TO_MMD_FILE>" https://dmci.s-enda-*.k8s.met.no/v1/validate
```
### Push the MMD xml file to the discovery metadata catalog
For development and verification purposes:a producer of data that does not need to go through the event queue should do the following:
1. Push to the staging environment for tesing and verification: ```curl --data-binary "@<PATH_TO_MMD_FILE>" https://dmci.s-enda-*.k8s.met.no/v1/insert```
   where * should be either dev or staging.
2. Check that the MMD file has been added to the catalog services in staging
3. Push for production (the official catalog): ``` curl --data-binary "@<PATH_TO_MMD_FILE>" https://dmci.s-enda.k8s.met.no/v1/insert```
4. Check that the MMD file has been added to the catalog services in production

## How to find data
### Using OpenSearch
#### Local test machines
The [vagrant-s-enda](https://github.com/metno/vagrant-s-enda) environment provides OpenSearch support through [PyCSW](https://github.com/geopython/pycsw). To test [OpenSearch](https://en.wikipedia.org/wiki/OpenSearch) via the browser, start the vagrant-s-enda vm (vagrant up) and go to: ```http://10.10.10.10/pycsw/csw.py?mode=opensearch&service=CSW&version=2.0.2&request=GetCapabilities```

This will return a description document of the catalog service. The URL field in the description document is a template format that can be used to represent a parameterized form of the search. The search client will process the URL template and attempt to replace each instance of a template parameter, generally represented in the form {name}, with a value determined at query time [OpenSearch URL template syntax](https://github.com/dewitt/opensearch/blob/master/opensearch-1-1-draft-6.md#opensearch-url-template-syntax). The question mark following any search parameter means that the parameter is optional.

#### Online catalog
For searching the online metadata catalog, the base url ```(http://10.10.10.10/)``` must be replaced by ```https://csw.s-enda.k8s.met.no/```:

``` http://csw.s-enda.k8s.met.no/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results ```

#### OpenSearch examples
To find all datasets in the catalog:

- ```https://csw.s-enda.k8s.met.no/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results```

Or datasets within a given time span:

- ```http://csw.s-enda.k8s.met.no/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results&time=2000-01-01/2020-09-01```

Or datasets within a geographical domain (defined as a box with parameters min_longitude, min_latitude, max_longitude, max_latitude):

- ```https://csw.s-enda.k8s.met.no/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results&bbox=0,40,10,60```

Or, datasets from any of the Sentinel satellites:

- ```https://csw.s-enda.k8s.met.no/?mode=opensearch&service=CSW&version=2.0.2&request=GetRecords&elementsetname=full&typenames=csw:Record&resulttype=results&q=sentinel```

### Advanced geographical search OGC CSW
PyCSW opensearch only supports geographical searches querying for a box. For more advanced geographical searches, one must write specific XML files. For example:

To find all datasets containing a point:
```
<?xml version="1.0" encoding="ISO-8859-1" standalone="no"?>
<csw:GetRecords
    xmlns:csw="http://www.opengis.net/cat/csw/2.0.2"
    xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:gml="http://www.opengis.net/gml"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    service="CSW"
    version="2.0.2"
    resultType="results"
    maxRecords="10"
    outputFormat="application/xml"
    outputSchema="http://www.opengis.net/cat/csw/2.0.2"
    xsi:schemaLocation="http://www.opengis.net/cat/csw/2.0.2 http://schemas.opengis.net/csw/2.0.2/CSW-discovery.xsd" >
  <csw:Query typeNames="csw:Record">
    <csw:ElementSetName>full</csw:ElementSetName>
    <csw:Constraint version="1.1.0">
      <ogc:Filter>
        <ogc:Contains>
          <ogc:PropertyName>ows:BoundingBox</ogc:PropertyName>
          <gml:Point>
            <gml:pos srsDimension="2">59.0 4.0</gml:pos>
          </gml:Point>
        </ogc:Contains>
      </ogc:Filter>
    </csw:Constraint>
  </csw:Query>
</csw:GetRecords>
```
- To find all datasets intersecting a polygon:
 ```
<?xml version="1.0" encoding="ISO-8859-1" standalone="no"?>
<csw:GetRecords
    xmlns:csw="http://www.opengis.net/cat/csw/2.0.2"
    xmlns:gml="http://www.opengis.net/gml"
    xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    service="CSW"
    version="2.0.2"
    resultType="results"
    maxRecords="10"
    outputFormat="application/xml"
    outputSchema="http://www.opengis.net/cat/csw/2.0.2"
    xsi:schemaLocation="http://www.opengis.net/cat/csw/2.0.2 http://schemas.opengis.net/csw/2.0.2/CSW-discovery.xsd" >
  <csw:Query typeNames="csw:Record">
    <csw:ElementSetName>full</csw:ElementSetName>
    <csw:Constraint version="1.1.0">
      <ogc:Filter>
        <ogc:Intersects>
          <ogc:PropertyName>ows:BoundingBox</ogc:PropertyName>
          <gml:Polygon>
            <gml:exterior>
              <gml:LinearRing>
                <gml:posList>
                  47.00 -5.00 55.00 -5.00 55.00 20.00 47.00 20.00 47.00 -5.00
                </gml:posList>
              </gml:LinearRing>
            </gml:exterior>
          </gml:Polygon>
        </ogc:Intersects>
      </ogc:Filter>
    </csw:Constraint>
  </csw:Query>
</csw:GetRecords>
```
- Then, you can query the CSW endpoint with, e.g., python:
```
import requests
requests.post('https://csw.s-enda.k8s.met.no', data=open(my_xml_request).read()).text
```
### Human Search Interface

Access the human search interface through the provided user portals for S-ENDA partners at [https://s-enda.github.io/DMH/userPortals.html] to
find you data via the web browser. For more information about how to use the service [responsible personnel](partners https://s-enda.github.io/DMH/data_management_contacts_tbl.html) for each S-ENDA is provided.
#### QGIS
MET Norway’s S-ENDA CSW catalog service is available at https://data.csw.met.no. This can be used from QGIS as follows:
1. Select ```Web > MetaSearch > MetaSearch``` menu item
2. Select ```Services > New```
3. Type, e.g., ```data.csw.met.no``` for the name
4. Type ```https://data.csw.met.no``` for the URL
   
Under the ```Search``` tab, you can then add search parameters, click ```Search```, and get a list of available datasets.
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
For full examples see:
  - [creating timeseries](./src/notebooks/create-timeseries.html)
  - [creating trajectories](./src/notebooks/create-trajectory.html)

    
## Assignment of Digital Object Identifiers (DOIs)
A DOI is a unique, persistent and web resolvable identifier (PID), that uniquely and persistently resolves to a digital resource. The DOI is a key element to make digital resources findable on the web, thus allowing for their easy discovery. Additionally, they can be used when citing a specific resource on the web.

DOIs consist of an alphanumeric string made up by a prefix and a suffix. The prefix is assigned to a particular DOI registrant, e.g., MET Norway, whereas the suffix is provided by the registrant for a specific object. The combination of a prefix and a suffix is unique, and the suffix and the prefix are separated by a forward slash (e.g. 10.21343/z9n1-qw63).

### DOIs in a FAIR perspective
The use of DOIs for datasets specifically relates with the Findability and Reusability principles:
- Findability: Making a resource findable is the first step to allow for sharing of data, and for this reason this is a key point for achieving FAIRness of data.
The first FAIR guideline principle states the following:
-  F1. (meta)data are assigned a globally unique and persistent identifier. Thus, assigning a DOI to a
digital resource adheres with the first principle of FAIRness, as the identifier will be globally unique
as well as persistent.
   Additionally, the third principle for findability:
-  F3: Metadata clearly and explicitly include the identifier of the data they describe.
This means that the metadata and the data should be connected explicitly by mentioning a dataset’s globally unique and persistent identifier in the metadata of that specific dataset. This applies more particularly for data formats that do not include metadata in their headers, usually resulting in separate files for data and metadata.
- Reusability of data is strictly related with the possibility of citing data. When the DOI is incorporated into a citation it becomes a guaranteed location for the resource cited, because the DOI will always resolve to the right web address (URL). Using a DOI then allows for proper citation of data when it is reused, giving the right credits and visibility to scientists.

```
Further reading and resources:
1. DOI FAQ [https://www.doi.org/faq.html]
2. FAIR principle paper [https://doi.org/10.1038/sdata.2016.18]
3. GO-FAIR [https://www.go-fair.org/fair-principles]
4. OPENAIR [https://www.openaire.eu/how-to-make-your-data-fair]
```
### How-to assign DOIs to your datasets
It is most practical to assign DOIs to parent datasets. However, any dataset can be assigned a DOI,irrespective of the DOI status of its related datasets. For example, a child dataset may receive its own DOI even if its parent also has a DOI. This may be practical if the dataset is, e.g., used in a scientific publication.

In order for the DOI registration agency (DataCite) to assign a DOI, the followinf have to be provided:
1. A metadata file containing at least the DataCite mandatory elements
2. A URL to the dataset landing page, which will be the persistent URL to which the DOI resolves
   
For MET Norway, the information required for the DataCite metadata file is available in [MMD]([https://htmlpreview.github.io/?https://github.com/metno/mmd/blob/master/doc/mmd-specification.html) whereas the DOI landing page is automatically created on the https://adc.met.no/ data portal, upon request from the data producer. Only administrators of the data portal have access to this service and are thus the only ones who can finalize the process of assigning a DOI.
Examples of landing pages created using this approach are available at:
- https://adc.met.no/landing-page-collector
```
Further reading and resources:
1. DOI at MET [https://adc.met.no/sites/adc.met.no/files/articles/DOIs-at-METNO.pdf]
```


