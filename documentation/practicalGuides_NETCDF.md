[NetCDF (Network Common Data Form)](https://www.unidata.ucar.edu/software/netcdf/) is a format designed to facilitate handling of array-oriented scientific data. For a more detailed description, please visit [Unidata's NetCDF user's guide.](https://docs.unidata.ucar.edu/nug/current/netcdf_introduction.html)

### Submitting data as NetCDF-CF

**Workflow**

- Define your dataset 
- Create a NetCDF-CF file 

  * Add discovery metadata as global attributes
  * Add variables and use metadata following the link: [CF conventions](https://cfconventions.org/)

- Store the NetCDF-CF file in a suitable location, and distribute it via thredds or another dap server
- Register your dataset in a searchable catalog 

  * Test that your dataset contains the necessary discovery metadata and create an MMD xml file 
  * Test the MMD xml file 
  * Push the MMD xml file to the discovery metadata catalog 