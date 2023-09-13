## Vocabulary
An important part of ensuring the FAIRness of the data is to adopt standardized and controlled vocabularies to describe the data and metadata. The vocabularies themselves shall also follow the FAIR principles, highlighted by the [I2](https://www.go-fair.org/fair-principles/i2-metadata-use-vocabularies-follow-fair-principles/) (Interoperability 2) principle. In practice, this means that vocabularies should ideally be: 
- Findable -> registered (indexed, listed) in a vocabulary service
- Accessible -> available on the web, downloadable
- Interoperable -> encoded in a standard representation, such as the [Web Ontology Language](https://www.w3.org/OWL/) (OWL) or [Simple Knowledge Organization System](https://www.w3.org/2004/02/skos/) (SKOS) and domain-specific extensions
- Reusable -> licensed and maintained, ideally with an open license
(Source: [FAIR vocabularies](https://fairvocabularies.github.io/index.html))

The formalised vocabularies agreed upon during the project aim to facilitate data search in [ADC](https://adc.met.no) portal across S-ENDA partner data centres. Ideally, each institute provides FAIR compliant machine-to-machine access point to harvest vocabularies, enabling mapping of internal vocabulary to common reference vocabulary (e.g. REST API or SPARQL endpoints for vocabulary servers).

The table below shows the current domain-specific reference vocabularies together with vocabulary servers for each institute. 

| Institute | Domain-specific reference vocabularies | Vocabulary server |
| -------- | -------- | -------- |
| MET    | [CF Standard Names](https://cfconventions.org/Data/cf-standard-names/current/build/cf-standard-name-table.html), [GCMD Science Keywords](https://gcmd.earthdata.nasa.gov/KeywordViewer/scheme/all?gtm_scheme=all)     | [METNO Vocabulary Service](https://vocab.met.no/mmd/en/groups)     |
| NILU    | [CF Standard Names](https://cfconventions.org/Data/cf-standard-names/current/build/cf-standard-name-table.html)     | [ACTRIS Vocabulary](https://vocabulary.actris.nilu.no/skosmos/en/)     |
| NINA    | [GEMET](https://www.eionet.europa.eu/gemet/en/about/), [EnvThes](https://vocabs.lter-europe.net/envthes/en/)     | Under development     |
| NIVA    | [CF Standard Names](https://cfconventions.org/Data/cf-standard-names/current/build/cf-standard-name-table.html), [GCMD Science Keywords](https://gcmd.earthdata.nasa.gov/KeywordViewer/scheme/all?gtm_scheme=all)     | Under development     |