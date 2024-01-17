### Introduction ###

[NetCDF (Network Common Data Form)](https://www.unidata.ucar.edu/software/netcdf/) is a format designed to facilitate handling of array-oriented scientific data. For a more detailed description, please visit [Unidata's NetCDF user's guide.](https://docs.unidata.ucar.edu/nug/current/netcdf_introduction.html)

## Access to data without downloading

It is possible to get access to NetCDF data via URL. Here we provide ways to do so using Python and R.

### With Python

Xarray installation is required. For more information visit xarray's [documentation site](https://docs.xarray.dev/en/stable/index.html) or [getting started guide](https://docs.xarray.dev/en/latest/getting-started-guide/installing.html). 

If you don't have xarray installed. Do so with

```python
python -m pip install "xarray[complete]"
        
# If you use conda: 

conda install -c conda-forge xarray dask netCDF4 bottleneck
```

**Reproducible example:**
```python
import xarray as xr

ds = xr.open_dataset("https://thredds.niva.no/thredds/dodsC/datasets/loggers/msource-inlet.nc")
ds # this displays basic info on the dataset
# If you don't need the full dataset subset!
# That way you don't need to download all the years
ds = ds.sel(time="2024")
ds.to_dataframe()
ds.temperature.plot()
ds.head()
```


### With R

There are several packages for NetCDF in R (RNetCDF, ncdf4, raster, stars). The example below uses [tidync](https://docs.ropensci.org/tidync/). 

**Reproducible example:**

```R
library(tidync)

url=paste0('https://thredds.niva.no/thredds/dodsC/datasets/loggers/msource-outlet.nc')
          
# Read the netcdf file from the url
dataNiva = tidync(url) 
```

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
