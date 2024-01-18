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

- Define your dataset, some help can be found at [CF conventions](https://cfconventions.org/)

- Create a CF-NetCDF file with neccary attributes

  * Add units, long_name and standard_name(if possible) to data variables
  * Add discovery metadata as global attributes to the dataset, also see [adc.met.no](https://adc.met.no/node/4) and/or the [met handbook](https://metno.github.io/data-management-handbook/#_climate_and_forecast_conventions_cf)

For a full example see [create timeseries](./src/notebooks/create-timeseries.html)
