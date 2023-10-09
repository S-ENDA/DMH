## Metadata

In order to properly find, understand and use geophysical data, standardised encoding and documentation are required, i.e., metadata. Metadata is a broad concept. In our data management model the term "metadata" is used in several contexts, specifically the five categories: discovery, use, site, configuration, and system metadata.

Both discovery metadata and use metadata can be embedded in the files produced for a dataset through utilisation of self-explaining file formats. If properly done by the data producer, publication and preservation of data through services is simplified and can be automated.


In order to support the FAIR principles, the following guidelines must apply to metadata:
- Metadata must be self-explanatory and not need additional information. 
- Metadata must document the quality of data. 
- Data owners must manage the metadata only in one place. 
- It must be clear to everyone who is the data owner and responsible for updating metadata. 
- Geographical data and products with metadata that are not subject to grading regimes shall
could be used in portals where the data is relevant.
- Metadata is entered with English and Norwegian as standard

(This is taken from FAIR-veileder by geonorge, but no similar for datasets...)


To follow FAIR, metadata should: 
- Include the data identifier clearly and explicitly.
- Be registered or indexed in a searchable resource.
- Be self-explanatory to optimize searchability. 
- Clearly identify who owns the data. 
- Use a vocabulary that follows FAIR principles. 
- [Be accessible even when the data are no longer available]( https://www.go-fair.org/fair-principles/a2-metadata-accessible-even-data-no-longer-available/). 
## Metadata types

|Type|Purpose|Description|Examples|
|:----|:----|:----|:----|
|Discovery metadata|Used to find relevant data|Discovery metadata are also called index metadata and are a digital version of the library index card. They describe who did what, where and when, how to access data and potential constraints on the data. They shall also link to further information on the data, such as site metadata.|ISO 19115; GCMD/DIF|
|Use metadata|Used to understand data found|Use metadata describes the actual content of a dataset and how it is encoded. The purpose is to enable the user to understand the data without any further communication. They describe the content of variables using standardised vocabularies, units of variables, encoding of missing values, map projections, etc.|Climate and Forecast (CF) Convention; BUFR; GRIB|
|Site metadata|Used to understand data found|Site metadata are used to describe the context of observational data. They describe the location of an observation, the instrumentation, procedures, etc. To a certain extent they overlap with discovery metadata, but also extend discovery metadata. Site metadata can be used for observation network design. Site metadata can be considered a type of use metadata.|WIGOS; OGC O&M|
|Configuration metadata|Used to tune portal services for datasets intended for data consumers (e.g., WMS)|Configuration metadata are used to improve the services offered through a portal to the user community. This can, e.g., be how to best visualise a product.| |
|System metadata|Used to understand the technical structure of the data management system and track changes in it|System metadata covers, e.g., technical details of the storage system, web services, their purpose and how they interact with other components of the data management system, available and consumed storage, number of users and other KPI elements etc.| |
