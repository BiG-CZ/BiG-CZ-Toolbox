Web Services in the BiGCZ
=========================

## 1. ODM2 Web Services

These web services are currently being developed by SDSC (Choonhan and Dave).

### ODM2REST API / web services
- https://github.com/ODM2/ODM2RESTfulWebServices
- ODM2 REST API's. Based on Django Swagger
  - "Production" (original alpha release): http://sis-devel.cloudapp.net/docs/
  - [New dev](https://github.com/ODM2/ODM2RESTfulWebServices/issues/1#issuecomment-132387462), based on my feedback 
  (below); only implemented on JSON response; untested: http://sis-devel.cloudapp.net:9090/docs/
- [Feedback on the alpha release - Part 1](https://github.com/ODM2/ODM2RESTfulWebServices/issues/1)
- [Illustrating the use of ODM2 REST web services with the ODM2 Marchantaria use case (ipython notebook)](http://nbviewer.ipython.org/github/BiG-CZ/BiG-CZ-Toolbox/blob/master/ipynotebooks/ODM2RESTdemo_MarchantariaUseCase.ipynb)

### ODM2 WOFpy WOF 1 endpoint
- https://github.com/ODM2/WOFpy
- From Choonhan: "David and I have worked on WOFpy service with ODM2. Currently, we have released WaterML1.0 format for REST and SOAP service on the github. [We continue working on WaterML1.1 format](https://github.com/ODM2/WOFpy/issues/2) as well so that we have a plan to release it." Test endpoints:
  - REST API: http://sis-devel.cloudapp.net:8080
  - SOAP API: http://sis-devel.cloudapp.net:8080/soap/wateroneflow.wsdl


## 2. WOF/WaterML 1.x Access from CZOData

See discussions and information at the [CZOData/CZOWOFWaterML1 repo](https://github.com/CZOData/CZOWOFWaterML1).


## 3. IGSN/SESAR web services, MG-RAST

### Web services
The [Proof-of-Concept BiGCZ Portal prototype (pre-pre-alpha!)](http://portal2.bigcz.org/Explorer) demonstrates an initial approach at ingesting IGSN/SESAR (samples) and MG-RAST (metagenomic data) web services. [For IGSN's, here's an initial (and now old, from 2014-10) IPython notebook demonstrating service requests and parsing.](http://nbviewer.ipython.org/github/BiG-CZ/BiG-CZ-Toolbox/blob/master/ipynotebooks/2014OctMeeting/BiGCZ_Demo_2_IGSN_DynamicMaps.ipynb)

### BiGCZ GeoJSON files as intermediates between web service responses and vizer
_(GeoJSON discussion/notes [originally from here](https://github.com/emiliom/mapdata/blob/master/bigcz_geojsons.md); it dates back to abt. 2015-01, so it needs updating.)_ A handy reason for converting to [GeoJSON](http://geojson.org) as an intermediate format is that [github provides native map rendering of GeoJSON files](https://help.github.com/articles/mapping-geojson-files-on-github/), so you get a simple map visualization w/o doing any extra work (and the markers are clickable, so you can explore the attributes). These files can also be downloaded and easily opened in desktop GIS clients like QGIS. http://geojson.io is another nice online tool that enables interactive creation and examination of GeoJSON data. _(Note: vizer doesn't consume GeoJSON directly; it uses a different, custom JSON format)_

- [IGSN samples GeoJSON:](https://github.com/emiliom/mapdata/blob/master/igsn_czoshalehills_validresp_fc.geojson) I've examined the web service responses (requested by IGSN number; [here's an example](http://app.geosamples.org/webservices/display.php?igsn=SSH00023E)) for the Shale Hills CZO IGSN's that Megan sent me in November. A little less than half of the ~1,700 IGSN's generated XML parsing errors with the standard Python XML parser I used, and my limited testing suggests these are due to invalid (not properly escaped) "<" and ">" characters in the XML responses; I ignored those. Of the remaining ~950 IGSN's, ~400 had no latitude and longitude entries ("Not Provided"). In order to examine the remaining IGSN sample responses, I first converted them into a standard GeoJSON structure, before converting and subsetting to what we'll use in the initial visualization portal test/pilot. The GeoJSON file available here has all ~550 IGSN's with lat & lon entries.
- [MG-RAST metagenomic GeoJSON:](https://github.com/emiliom/mapdata/blob/master/mgrast_usa1_fc.geojson) Started with an [MG-RAST _metagenome MIxS_ request](http://api.metagenomics.anl.gov/api.html#metagenome), issued on the browser with a limit of 10,000 records (Folker had mentioned in November that there were probably ~ 20,000 total records from that request; the request was http://api.metagenomics.anl.gov//metagenome?verbosity=mixs&limit=100, except for using _limit=10000_. Looks like `curl` on the shell would've worked, but I tried `wget` and didn't succeed). The [MIxS sequence metadata](http://dx.doi.org/10.1038/nbt.1823) provides a manageable amount of metadata for initial exploration. I then eliminated records with invalid latitude or longitude values (372 records). Then kept only records with `country in ('USA', 'United States of America')` (5393). The geographical distribution of locations (points all over the world, but mostly in the USA) showed that _country_ was not the geographical location, but more likely the home base of the project PI; so I applied a rough bounding box filter to retain only sites within the USA lower 48 `(if (lon > -125.68 and lon < -65.04) and (lat > 24.53 and lat < 50.06))`. The MG-RAST collection includes all kinds of genomic sequences, including ones from sources that are not of interest to the BiGCZ project (eg, from human tissue); after exploring source, material, biome and similar "type" metadata vocabularies in the responses, I further appplied a filter based on _env_package_type_: `env_package_type in ('air', 'built environment', 'microbial mat|biofilm', 'plant-associated', 'sediment', 'soil', 'water')`. These last two filters (_bounding box_ and _environment package type_) greatly reduced the number of records to a final total of 883. They include a substantial number of marine sites.

I did these requests and processing on IPython notebooks. I can share those eventually, after I've cleaned them up; right now they're very messy.


## 4. ulmo, pyoos, and other general data access libraries
- Check out [ulmo](http://ulmo.readthedocs.org) and [pyoos](https://github.com/ioos/pyoos/). The former is focused mainly on hydrological and met data, and the latter on oceanographic data; but they definitely overlap, and have a couple of duplicated readers.
- ["SciPy discussions on Python water & met data access (including IOOS SOS) client libraries".](https://groups.google.com/d/msg/ioos_tech/ztzB5qEPpTc/SG2Uowoo_OQJ) A burst of enthusiasm of mine from July 2013. Still relevant, and cool developments have taken place since then.
- There are now many ulmo and pyoos IPython notebooks from the community that can be shared and highlighted. I'll do this later.
