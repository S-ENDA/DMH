## Dataset
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

Point 3 implies that the output of, e.g., a numerical model may be divided into several datasets that are related. This is also important in order to efficiently serve the data through web services. For instance, model variables defined on different vertical coordinates should be separated as linked datasets, since some OGC services (e.g., WMS) are unable to handle mixed coordinates in the same dataset. One important linked dataset relation is the parent-child relationship. In the numerical model example, the parent dataset would be the model simulation. This (parent) dataset encompasses all datasets created by the model simulation such as, e.g., two NetCDF-CF files (child datasets) with different information content.

Most importantly, a dataset should be defined to meet the consumer needs. This means that the specification of a dataset should follow not only the content guidelines just listed, but also address the consumer needs for data delivery, security and preservation.

An essential prerequisite for structuring and documenting data is the specification of the dataset(s). The dataset is the basic building block; all the documentation and services described in this DMH are built on datasets. The dataset specification is the first step in structuring one’s data for efficient management, and it is mandatory.
