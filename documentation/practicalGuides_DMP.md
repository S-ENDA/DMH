### Data Management Plan (DMP)

A Data Management Plan (DMP) is a document that describes textually how the data life cycle management will be carried out for datasets used and produced in specific projects. Generally, these are externally financed projects for which such documentation is required by funding agencies. However, larger internal projects covering many datasets may also find it beneficial to create a specific document of this type.

The funding agency of your project will usually provide requirements, guidelines or a template for the DMP. If this is not the case, Science Europe offers a comprehensive [Practical guide of research data management](https://www.forskningsradet.no/contentassets/e4cd6d2c23cf49d4989bb10c5eea087a/se_rdm_practical_guide_final.pdf).

For researchers with no or little experience in data management, a simple way of creating a DMP is with [EasyDMP](https://www.sigma2.no/data-planning)

### Using easyDMP

1. Log in to easyDMP, use Dataporten if your institution supports that, otherwise pick one of the other login methods.

2. Click on + Create a new plan and pick a template

3. By using the Summary button from page two and on, you can get an overview of all the questions.

*Publishing the plan*

Currently you can use the export function in easyDMP to download an HTML or PDF version of the DMP and use it further. This might change if "Hosted DMP" gets implemented.

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