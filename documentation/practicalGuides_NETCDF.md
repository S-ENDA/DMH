## NetCDF

[NetCDF (Network Common Data Form)](https://www.unidata.ucar.edu/software/netcdf/) is a format designed to facilitate handling of array-oriented scientific data. For a more detailed description, please visit [Unidata's NetCDF user's guide.](https://docs.unidata.ucar.edu/nug/current/netcdf_introduction.html)

### Accessing data

Data available through OPeNDAP can be accessed for example using [xarray](https://docs.xarray.dev/en/stable). 

```python
import xarray as xr

ds = xr.open_dataset("https://thredds.niva.no/thredds/dodsC/datasets/loggers/msource-inlet.nc")
ds # this displays basic info on the dataset
# If you don't need the full dataset subset!
# That way you don't need to download all the years
ds = ds.sel(time="2024")
ds.to_dataframe()
ds.temperature.plot()
```

### Submitting data as NetCDF-CF

**Workflow**

- Define your dataset, some help can be found at [CF conventions](https://cfconventions.org/)

- Create a CF-NetCDF file with neccary attributes

  * Add units, long_name and standard_name(if possible) to data variables
  * Add discovery metadata as global attributes to the dataset, also see [adc.met.no](https://adc.met.no/node/4) and/or the [met handbook](https://metno.github.io/data-management-handbook/#_climate_and_forecast_conventions_cf)

For a full example see [create timeseries](./src/notebooks/create_timeseries.html)