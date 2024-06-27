# cmocean-qgis
cmocean colormaps for QGIS

This repository provides an xml file containing the [cmocean perceptually uniform colormaps](https://matplotlib.org/cmocean/) by [Kristen Thyng](https://github.com/kthyng), adapted for use as color ramps in [QGIS](https://qgis.org/), along with the Matlab code that generated this file using the [Matlab cmocean function](https://github.com/chadagreene/cmocean) by [Chad A. Greene](https://github.com/chadagreene).

## Installation and use

In QGIS, color ramps are installed and managed through the [Style Manager](https://docs.qgis.org/latest/en/docs/user_manual/style_library/style_manager.html). This can be accessed in the Settings menu, or on the Project toolbar.

Click the `Import/Export` button and select `Import Item(s)...`. If you have downloaded or generated the xml file locally, choose `File` in the drop-down menu, click the `...` button, and select the file, `cmocean.xml`. If you want to load the color ramps directly from this repository, choose `URL` in the dropdown, enter `https://raw.githubusercontent.com/PovlAbrahamsen/cmocean-qgis/main/cmocean.xml` into the URL field, and click `Fetch Items`. The color ramps will now be shown in the bottom of the dialog. You can select a sub-section of color ramps to install, or click `Select All` to select all. Then click `Import` to import the color ramps.

Once you have installed the color ramps, you can select them as color ramps under the `Symbology` tab of the `Properties` dialog for raster layers using [`paletted`](https://docs.qgis.org/latest/en/docs/user_manual/working_with_raster/raster_properties.html#paletted) or [`singleband pseudocolor`](https://docs.qgis.org/latest/en/docs/user_manual/working_with_raster/raster_properties.html#singleband-pseudocolor) rendering or for vector layers with [`graduated`](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#graduated-renderer) rendering.

If these colormaps are useful for you, please consider citing the original creators' paper:
Thyng, K.M., C.A. Greene, R.D. Hetland, H.M. Zimmerle, and S.F. DiMarco. 2016. True colors of oceanography: Guidelines for effective and accurate colormap selection. Oceanography 29(3):9–13. https://doi.org/10.5670/oceanog.2016.66

## Generating the xml file

Matlab function `convert_cmocean_to_qgis.m` requires the `cmocean` function, available from https://github.com/chadagreene/cmocean or http://www.mathworks.com/matlabcentral/fileexchange/57773-cmocean-perceptually-uniform-colormaps. When you run the function, the `cmocean.xml` file will be written in the current directory.

## Developer
[Povl Abrahamsen](https://www.bas.ac.uk/profile/epab/), [Polar Oceans team](https://www.bas.ac.uk/team/science-teams/oceans/), [British Antarctic Survey](https://www.bas.ac.uk/)

## License
This software is licensed under a MIT license. For more information please see the attached ``LICENSE`` file.
