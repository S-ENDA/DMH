## Searching data in the Catalog Service for the Web (CSW) interface

The Catalog Service for the Web (CSW) interface is a standard for interacting with a catalog service. It is a web service that allows clients to discover, browse, and query metadata about data, services, and other potential resources. For example to do a wildcard search use the follow snippet in R

```r
library(httr)

headers <- c(
  'Content-Type' = 'application/xml'
)

body <- "<?xml version=\"1.0\"?>\n
      <csw:GetRecords xmlns:csw=\"http://www.opengis.net/cat/csw/2.0.2\"  
              xmlns:gmd=\"http://www.isotc211.org/2005/gmd\" 
              xmlns:ogc=\"http://www.opengis.net/ogc\" 
              xmlns:gml=\"http://www.opengis.net/gml\" 
              service=\"CSW\" version=\"2.0.2\"\n
              resultType=\"results\"  
              outputSchema=\"http://www.opengis.net/cat/csw/2.0.2\">\n
        <csw:Query typeNames=\"csw:Record\">\n
          <csw:ElementSetName>full</csw:ElementSetName>\n
          <csw:Constraint version=\"1.1.0\">\n
            <ogc:Filter>\n
              <ogc:PropertyIsLike wildCard=\"*\" 
                        singleChar=\"?\" 
                        escapeChar=\"\\\" 
                        matchCase=\"false\">\n
                <ogc:PropertyName>csw:AnyText</ogc:PropertyName>\n
                <ogc:Literal>*snow*</ogc:Literal>\n
              </ogc:PropertyIsLike>\n
            </ogc:Filter>\n
          </csw:Constraint>\n
        </csw:Query>\n
      </csw:GetRecords>"

res <- VERB("POST", url = "https://www.geonorge.no/geonetwork/srv/nor/csw/csw", body = body, add_headers(headers))

cat(content(res, 'text'))
```

There are also more examples on [here](https://metno.github.io/data-management-handbook/#_online_catalog)