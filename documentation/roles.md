## Data management roles and responsibilities
### Context
Data is processed and interpreted to generate knowledge (e.g., about the weather) for end users. The knowledge can be presented as information in the form of actual data, illustrations, text or other forms of communication. In this context, an illustration is a representation of data, whereas data means the numerical values needed to analyse and interpret a natural process (i.e., calibrated or with calibration information; it must be possible to understand the meaning of the numerical value from the available and machine-readable information).

Advanced users typically consume some type of data in order to process and interpret it, and produce new knowledge, e.g., in the form of a new dataset or other information. The datasets can be organised in different levels, such as the [WMO WIGOS definition for levels of data](https://codes.wmo.int/wmdr/_SourceOfObservation). Less advanced users apply information based on data (e.g., an illustration) to make decisions (e.g., clothing adapted to the forecast weather).

Between the data providers and data consumers are the processes that manage and deliver the datasets (Figure 1). A number of human roles may be defined with responsibilities that, together, ensure that these processes are carried out in accordance with the data management requirements of the organisation. The definition and filling of these roles depend heavily on the particular organisation, and each organisation must devise its own best solution.

![value_chain](https://github.com/S-ENDA/data-management-handbook/blob/master/source/images/value_chain.png)

*Figure 1. Value chain for data*

### Data management at MET Norway  
At MET Norway, data have always been managed, albeit in a rather narrow technical sense. The main focus has been on storage, primarily for operational data. More recently, the issues of delivering, sharing and reusing data have steadily gained prominence. Still, the legacy of data storage systems built up over many years is an important factor in any uniform data management program.

During the International Polar Year ([IPY](https://public.wmo.int/en/bulletin/international-polar-year-2007-2008)), MET Norway was the international coordinator for operational data. IPY data management was based on the principle of distributed data management through exchange of standardised descriptions of datasets between contributing data centres.

At the global level, the institute is the primary representative for Norway in the [WMO](https://public.wmo.int/en). WMO has in recent years reorganised its approach to documenting and sharing data through two major activities: [WIS](https://community.wmo.int/en/activity-areas/wis) and [WIGOS](https://community.wmo.int/en/activity-areas/WIGOS). Both are metadata-driven activities that follow the same principles as [Geonorge](https://www.geonorge.no/en/) and [INSPIRE](https://inspire.ec.europa.eu/), although there are differences concerning standards required.

### Data management at NIVA

### Data management at NILU

### Data management at NINA

### Contacts and roles

| Institute      | Responsible Personnel                | Role                                                | Description                                                                                                | Contact                  |
|:---------------|:--------------------|:----------------------------------------------------|:---------------------------------------------------------------------------------------------------------|:-------------------------|
| NIVA           | Dag Hjerman         | Environmental Data Science Section Leader           | Projects, colaborations                                                                                  | dhj@niva.no              |
| NIVA           | Zofia Rudjord       | Technical Group Lead                                | NIVACloud, loggers, technical inquiries                                                                  | Zofia.Rudjord@niva.no    |
| NIVA           | Ivana Huskova       | Data Specialist                                     | Data management planning; Documentation and architecture; Data workflow improvements; data QC procedures | ivana.huskova@niva.no    |
| NIVA           | Benno Dillinger     | Data engineer                                       | Reporting to [Vannmiljø](https://vannmiljo.miljodirektoratet.no)                                         | benno.dillinger@niva.no  |
| NIVA           | Kim Leirvik         | Systems developer                                   | Datasets, NIVAcloud, Data Management, NetCDF, Thredds server                                             | kim.leirvik@niva.no      |
| NIVA           | Viviane Girardin    | Systems engineer                                    | LIMS or any lab-related data , Shiny, R, Data Management                                                 | viviane.girardin@niva.no |
| NILU           | Kjetil Tørseth      | Research Director – Atmosphere and Climate Research | Overall responsibility for [EBAS](acronym.md) at NILU                                                                  | kt@nilu.no               |
| NILU           |                     | [EBAS](acronym.md) data curator(s)                                 | Curation and quality assurance of EBAS data                                                              |                          |
| NILU           |                     | [EBAS](acronym.md) scientific expert(s)                              | Scientific responsible for certain components of EBAS data                                               |                          |
| NILU           | Paul Eckhart        | Senior system developer                             | EBAS database architecture and core software development                                                 | pe@nilu.no               |
| NILU           | Markus Fiebig       | Senior scientist                                    | Director of ACTRIS In Situ Data Centre unit, Vocabulary                                                              | mf@nilu.no               |
| NILU           | Cathrine Lund Myhre | Senior scientist                                    | Director ACTRIS Data Centre                                                                              | clm@nilu.no              |
| NILU           | Wenche Aas          | Senior scientist                                    | Responsible for work related to the Chemical Co-ordinating Centre of EMEP (CCC)                          | wa@nilu.no               |
| NILU           | Ann Mari Fjæraa     | Senior scientist                                    | Responsible for work related to EVDC project                                                             | amf@nilu.no              |
| NILU           | Richard Rud     | System developer                                    | Responsible for the ACTRIS data portal                                                             | ror@nilu.no              |
| NINA| Roald Vang          | Technical group lead| Steering group, Project overview                                                                         | roald.vang@nina.no|                          |
| NINA           | Matteo De Stefano   | Data Engineer                                       | Data management, Documentation, Vocabularies                                                             | matteo.destefano@nina.no |
|NINA| Francesco Frassinelli|Data Engineer| Data Management, System Architecture                                                                     |francesco.frassinelli@nina.no|
|NINA|Frode Thomassen Singsaas|Librarian| Vocabularies                                                                                             |frode.singsaas@nina.no|
MET|The directors of MET, headed by the Director General,  Roar Skålin|Steering Group|Responsible for prioritisation,strategic decisions, and resource commitment from the Departments.         |roars@met.no| 
|MET|Morten Wergeland Hansen|Data Manager|Has the overall responsibility for ensuring that the institute’s data management regime is implemented and followed throughout the organisation. The DM is located in the Research and Development Department,Division for Remote Sensing and Data Management (RSDM).    |mortenwh@met.no|
|MET|Solfrid Agersten, Værvarslingsdivisjonen<br> Nina Elisabeth Larsgård, Observasjons- og klimadivisjonen<br> Eivind Støylen, Senter for utvikling av varslingstjenesten<br> Jan Ivar Pladsen, IT-divisjonen|Data Management Group|The Data Management Group (DMG) provides support to the DM, project managers and line managers for the execution of his/her duties and acts as local points of contact for data management in the organisation.  |solfrida@met.no<br> ninael@met.no<br> eivinds@met.no<br> janip@met.no |
|MET|Gjermund Mamen Haugen, Værvarslingsdivisjonen <br> Lara Ferrighi, Forsknings og utviklingsdivisjonen - Fjernmåling og Dataforvaltning (FoU-FD) <br> Erik Totlund, IT-divisjonen| Service Organisation|The Service Organisation (SO) is responsible for operation,technical development and platform management of the services for long-term data. |gjermundmh@met.no<br> laraf@met.no<br> erikt@met.no|
|MET|| Remote Sensing and Data Management department |The RSDM maintains the responsibility for alignment and coordination with national and international standardisation efforts and modern data management procedures, with participation of other units as required. ||

