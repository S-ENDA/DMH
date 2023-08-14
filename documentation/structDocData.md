# Data Structure and Documentation

## Dataset
A dataset is a collection of data. In the context of the data management model, the storage mode of the dataset is irrelevant, since access mechanisms can be decoupled from the storage layer as experienced by a data consumer. Typically, a dataset represents a number of variables in time and space. A more detailed definition is provided in the Glossary of Terms. In order to best serve the data through web services, the following principles are useful for guiding the dataset definition:

    A dataset can be a collection of variables stored in, for example, a relational database or as flat files;

    A dataset is defined as a number of spatial and/or temporal variables;

    A dataset should be defined by the information content and not the production method;

    A good dataset does not mix feature types, i.e., trajectories and gridded data should not be present in the same dataset.

Point 3 implies that the output of, e.g., a numerical model may be divided into several datasets that are related. This is also important in order to efficiently serve the data through web services. For instance, model variables defined on different vertical coordinates should be separated as linked datasets, since some OGC services (e.g., WMS) are unable to handle mixed coordinates in the same dataset. One important linked dataset relation is the parent-child relationship. In the numerical model example, the parent dataset would be the model simulation. This (parent) dataset encompasses all datasets created by the model simulation such as, e.g., two NetCDF-CF files (child datasets) with different information content.

Most importantly, a dataset should be defined to meet the consumer needs. This means that the specification of a dataset should follow not only the content guidelines just listed, but also address the consumer needs for data delivery, security and preservation.

## Metadata

Metadata is a broad concept. In our data management model the term "metadata" is used in several contexts, specifically the five categories that are briefly described in Table 1.

Metadata table 

The tools and facilities used to manage the information for efficient discovery and use are further described in Chapter 2.


## A data management model based on the FAIR principles

The data management model is built upon the following principles:

    Standardisation – compliance with established international standards;

    Interoperability – enabling machine-to-machine interfaces including standardised documentation and encoding of data;

    Integrity – ensuring that data and data access can be maintained over time, and ensuring that the consumer receives the same data at any time of request;

    Traceability – documentation of the provenance of a dataset, i.e., all actions taken to produce and maintain the dataset and the usage of the data in downstream systems;

    Modularisation – enabling replacement of one component of the system without necessitating other changes.

The model’s basic functions fall into three main categories:

    Documentation of data using discovery and use metadata. The documentation identifies who, what, when, where, and how, and shall make it easy for consumers to find and understand data. This requires application of information containers and utilisation of controlled vocabularies and ontologies where textual representation is required. It also covers the topic of data provenance which is used to describe the origin and all actions done on a dataset. Data provenance is closely linked with workflow management. Furthermore, it covers the relationship between datasets. Application of ontologies in data documentation is closely linked to the concept of linked data.

    Publication and sharing of data focuses on making data accessible to consumers internally and externally. Application of standardised approaches is vital, along with cost effective solutions that are sustainable. Direct integration of data in applications for analysis through data streaming minimises the complexity and overhead in dissemination solutions. This category also covers persistent identifiers for data.

    Preservation of data includes short and long term management of data, which secures access and availability throughout the lifespan of the data. Good solutions in this area depend on expected and actual usage of the data. Preservation of data includes the concept of data life cycle, i.e., the documented flow of data from initial storage through to obsolescence and permanent archiving (or deletion) and preserving the metadata for the same data (even after deleting).

# Vocabulary

## Purpose

In order to properly find, understand and use geophysical data, standardised encoding and documentation are required, i.e., metadata.

Both discovery metadata and use metadata can be embedded in the files produced for a dataset through utilisation of self-explaining file formats. If properly done by the data producer, publication and preservation of data through services is simplified and can be automated.

## Implementation

An essential prerequisite for structuring and documenting data is the specification of the dataset(s), cf. Section 1.1.3. The dataset is the basic building block of our data management model; all the documentation and services described in this DMH are built on datasets. The dataset specification is the first step in structuring one’s data for efficient management, and it is mandatory.


## Structuring and documenting data at MET Norway
### Current practice
There are essentially two types of dynamical geodata at MET Norway: gridded data and non-gridded data.

#### Gridded data
Gridded data include numerical and statistical model output and many satellite-derived datasets. MET Norway employs NetCDF/CF as the primary method for structuring gridded data. For documentation, CF-compliance ensures the availability of adequate use metadata in each file... 

WMO membership obliges the institute to provide and handle GRIB files; this is done for several datasets, but GRIB does not provide use or discovery metadata in itself.

#### Non-gridded data
Non-gridded data include most observational data like observations at weather stations, radiosondes, CTD profiles in the ocean, etc. These diverse data types are maintained in many different solutions, ranging from files (e.g. weather station observations extracted from WMO GTS in WMO BUFR format and subsequently converted to NetCDF/CF for easier usage) or DBMS solutions (e.g., the institute’s weather station climate data storage). Software ([frost2nc](https://github.com/metno/frost2nc)) for conversion of output from the climate data storage to NetCDF/CF for user consumption is available for some stations... 

The WMO standard for observations is BUFR, which is also supported but is not self-describing. The institute also maintains other types of data, like textual representations of the weather forecast. Most of these are currently not in any standard format, a notable exception being newly available warnings in CAP format, which is a WMO/OASIS standard format.

## Structuring and documenting data at [insert organisation here]

### Current practice in structuring and documenting data

|Supported file formats/structures |Datatype |Available metadata |Examples|
|:----|:----|:----|:----|
|Comments|
| | |
