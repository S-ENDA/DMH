## Dataset
Datasets form the building block of any data management model. Dataset specification is the first step in structuring data for efficient management.
A dataset is a collection of data. Typically, a dataset represents a number of variables in time and space. Datasets may be categorised by: 

- *Source*, such as observations (in situ, remotely sensed) and numerical model projections and analyses; 
- *Processing level*, such as "raw data", calibrated data, quality-controlled data, derived parameters, temporally and/or spatially aggregated variabled; 
- *Data type*, including point data, sections and profiles, lines and polylines, polygons, gridded data, volume data, and time series (of points, grids etc.). 

Data having all of the same characteristics in each category, but different independent variable ranges and/or responding to a specific need, are normally considered part of a single dataset. In the context of data preservation a dataset consists of the data records and their associated knowledge (information, tools). 

In order to best serve the data through web services, the following principles are useful for guiding the dataset definition:

- A dataset can be a collection of variables stored in, for example, a relational database or as flat files;
- A dataset is defined as a number of spatial and/or temporal variables;
- A dataset should be defined by the information content and not the production method;
- A good dataset does not mix feature types, i.e., trajectories and gridded data should not be present in the same dataset.

To follow FAIR principles, datasets should: 
- Be assigned a globally unique and persistent identifier. 
- Be described with rich metadata. 
- Be registered or indexed in a searchable resource. 
- Be retrievable by their identifier using a standardised communications protocol, which is open, free, universally implementable and allows for authentication where necessary. 
- Be released with a clear and accessible data usage license. 
- Be associated with detailed provenance. 
- Use a vocabulary that follows FAIR principles. 