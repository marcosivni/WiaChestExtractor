# WIA-Feature Extractor - WiaChestExtract
## _A feature extractor for chest X-Rays_

**The WiaChestExtract script extracts features from new chest X-Rays. Those features can be straightforwardly inserted into the [CBIR WebHigiia](https://github.com/marcosivni/webhigiia) as new query images**

WiaChestExtract provides an automatic low-level feature extraction for chest X-Rays targeting ILD and COVID-19 diseases.
The extraction pipeline is based on a slightly modified version of VGG-19 followed by a data pre-processing based on a PCA reduction (See Figure 1).

![WiaChestExtract Pipeline](https://github.com/marcosivni/WiaChestExtractor/blob/main/GitImages/arch.png)
Figure 1. WiaChestExtract feature extraction pipeline.


### Automatic extraction for new query images

1. Clone this repository to your machine
```sh
#!/bin/sh
git clone https://github.com/marcosivni/WiaChestExtractor.git
```
> Please, be sure to have the OS path variables working correctly and have installed R and Python3 packages before the execution.

2. Download the [modelFull.h5 file from this Google Drive link](https://drive.google.com/file/d/1JdDtnGa43MJwm5cbErgzA-9cxWMAOy-2/view?usp=sharing).
> Paste the .h5 inside the /Python directory as it contains the CNN setup and weights.


3. Indicate the list of chest X-Ray images to be extracted (one per line - .png/.jpg files)
```sh
#!/bin/sh
vim Input/inputFiles.txt
```
> You can set the final reduced dimensionality in the reduction [script](R/ReduceFeatureVector.R), with the embedding dimensionality being 93.

4. Run the _WiaChestExtract_ script
```sh
#!/bin/sh
sudo chmod +x WiaChestExtract.sh
./WiaChestExtract.sh
```
> File WiaChestExtract.bat is the Windows(R) version of the same script. 


5. Check the output (File ExtractedFeatures.csv located at the repository root directory, each line matching its image counter-part in the /Input/inputFiles.txt file)
```sh
#!/bin/sh
vim ExtractedFeatures.csv
```

### WiaChestExtract setup files

WiaChestExtract runs a two-step feature extraction and relies on data files containing CNN weights (which may be used for transfer learning) and PCA eigenvectors/eigenvalues.

1. [Python/PyExtractor.py](Python/PyExtractor.py) - Relies on modelFull.h5 for loading the model weights
2. [R/ReduceFeatureVector.R](R/ReduceFeatureVector.R) - Relies on a set of .csv files for loading the scale limits and the PCA eigenvector matrix.





**WARNING: WiaChestExtract is NOT clinical software. It was designed for education and demonstration purposes ONLY!**
