# ODM2 end-to-end pilot exercise

We are working on multiple "integrated" tests of the ODM2 ecosystem. These include:

`YODA File(s) > ODM2 database(s) > ODM2 registry/catalog > ODM2 services > ODM2 clients`

`ODM2 Streaming Data Loader > ODM2 Database(s) > ODM2 registry/catalog > ODM2 clients (or other clients)`

`ODM 1.1.1 Database > ODM2 Database > ODM2 registry/catalog > ODM2 clients (or other clients)`

`Simple CSV file (into HydroShare) > ODM2 SQLite File > HydroShare Time Series Resource (ODM2 SQLite) > ODM2 Client (HydroShare Jupyter Notebook)`

Alternatively, we are exploring a simpler workflow for an existing ODM2 database, at bare minimum:

`ODM2 databases > ODM2 services > ODM2 clients`

And thrown somewhere in there, if possible, something involving the ODM2 vocabularies.

## Notes
- ODM2 services: ODM2REST API and WOFpy reading from ODM2 databases
- ODM2 clients: For now, that could be IPython/Jupyter notebooks and simple vizer ingest in the BiGCZ portal prototype

## Importing into an ODM2 database

(*Note:* I'm playing with inline diagrams from the [gravizo service](http://www.gravizo.com); more info [here](https://github.com/TLmaK0/gravizo/blob/master/README.md))

### Scenario 1 - Draft sketch
![Scenario 1](http://g.gravizo.com/g?
@startuml;
%28*%29 --> if "Sensor Stream" then;
  -->[true] "Streaming Data Loader";
  --> "<b>ODM2 DB</b> - Time Series";
else;
  ->[false] "Excel ODM2 Template";
  -> "Export YODA";
  -->[YODA-Tools] "<b>ODM2 DB</b> - Measurements";
endif;
@enduml
)

### Scenario 2 ...
