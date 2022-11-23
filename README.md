# WIA-Feature Extractor - WiaChestExtract
## _A feature extractor for chest X-Rays_

**This repository contains data and metadata to reproduce the [CBIR feature extraction stage](https://github.com/marcosivni/webhigiia) reported in the manuscript _Enhancing COVID-19 and ILD diagnoses with Content-based Image Retrieval: An experimental study_.**

**Additionally, the WiaChestExtract script extracts features from new chest X-Rays. Those features can be straightforwardly inserted into the [CBIR WebHigiia](https://github.com/marcosivni/webhigiia) as new query images**

WiaChestExtract provides an automatic low-level feature extraction for chest X-Rays targeting ILD and COVID-19 diseases.
The extraction pipeline is based on a slightly modified version of VGG-19 followed by a data pre-processing based on a PCA reduction (See Figure 1).

![WiaChestExtract Pipeline](https://github.com/marcosivni/WiaChestExtractor/blob/main/GitImages/arch.png)
Figure 1. WiaChestExtract feature extraction pipeline.


### Automatic extraction for new, incoming query images (potentially undiagnosed cases)

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

### HC-CXRay-INT dataset

The HC-CXRay-INT dataset contains a collection of verified chest X-Rays annotated with either ILD or COVID-19 diagnoses from different adult patients registered in our PACS/HIS systems - (Check the manuscript reference above for more technical info).
The dataset contains 185 COVID-19, 307 ILD, and 381 Normal annotated lungs.
The chest X-Rays images will be made publicly available after the first round of reviews for the manuscript, but the metadata and extracted features are already available here.

1. Flat HC-CXRay-INT metadata 
    - File [CSV/DumpMetadata-HC-CXRAY-INT.csv](CSV/DumpMetadata-HC-CXRAY-INT.csv) - Contains the metadata for the 873 patients, including clinical outcome (COA), ICU, opacity patterns, etc.
    - File [CSV/DumpMetadataExplanation.txt](CSV/DumpMetadataExplanation.txt) - Contains the description and domain of metadata attributes, including the codes for missing values.
    
2. Flat HC-CXRay-INT features
    - File [CSV/DumpDeepFeaturesWithValidVariance-HC-CXRAY-INT.csv](CSV/DumpDeepFeaturesWithValidVariance-HC-CXRAY-INT.csv) - Contains the scaled features with non-neglectable variance extracted from the modified VGG-19 CNN.
    - File [CSV/DumpCleanedPcaFeatures-HC-CXRAY-INT.csv](CSV/DumpCleanedPcaFeatures-HC-CXRAY-INT.csv) - Contains the final and scaled features after PCA transformation of deep features into a low-dimensional space following the Broken-Stick rule.

3. Relational HC-CXRay-INT data 
    - File [SiREN-SQL/DDL_CREATE_TABLE_HC-CXRAY-INT.sql](SiREN-SQL/DDL_CREATE_TABLE_HC-CXRAY-INT.sql) - Contains the definition of the *Lung2D* table representing HC-CXRay-INT images and metadata. It also includes the internal inserts for the [CBIR WebHigiia](https://github.com/marcosivni/webhigiia) describing the metadata attributes.
    - File [SiREN-SQL/DDL_INSERTS_HC-CXRAY-INT.sql](SiREN-SQL/DDL_INSERTS_HC-CXRAY-INT.sql) - Contains the insertion script for HC-CXRay-INT image and attributes.
    
### TQI dataset

The TQI dataset contains a collection of twelve chest X-Rays employed as query images in the experiments reported in the above manuscript (06 ILD and 06 COVID-19).

1. Flat TQI features
    - File [CSV/DumpCleanedPcaFeatures-TQI.csv](CSV/DumpCleanedPcaFeatures-TQI.csv) - Contains the final and scaled features after PCA transformation of deep features into a low-dimensional space following the Broken-Stick rule.

2. Relational TQI data 
    - File [SiREN-SQL/DDL_CREATE_TABLE_HC-CXRAY-INT.sql](SiREN-SQL/DDL_CREATE_TABLE_HC-CXRAY-INT.sql) - Contains the definition of the *U_Lung2D* table representing TQI images and metadata. It also includes the internal inserts for the [CBIR WebHigiia](https://github.com/marcosivni/webhigiia) describing the metadata attributes.
    - File [SiREN-SQL/DDL_INSERTS_TQI.sql](SiREN-SQL/DDL_INSERTS_TQI.sql) - Contains the insertion script for TQI image and attributes. 

3. Raw DICOM studies
    - *Case 01:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.2021120212345323.354749101147148383869).
    - *Case 02:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202123718669.29247133079929098951).
    - *Case 03:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202123831525.92891755321331241415).
    - *Case 04:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202123844373.31524973759955746331).
    - *Case 05:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124040344.54323040926621634711).
    - *Case 06:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124050320.48158125511186015744).
    - *Case 07:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124059169.64929550105269381081).
    - *Case 08:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.2021120212417509.471406384545835036236).
    - *Case 09:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124117244.49312422957808574127).
    - *Case 10:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124438567.96196473667257865110).
    - *Case 11:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124136451.82606447305416332928).
    - *Case 12:* Available [here](https://www.dicomlibrary.com?study=1.3.6.1.4.1.44316.6.102.1.20211202124145372.38173796896874918298).
    

### WiaChestExtract setup files

WiaChestExtract runs a two-step feature extraction and relies on data files containing CNN weights (which may be used for transfer learning) and PCA eigenvectors/eigenvalues.

1. [Python/PyExtractor.py](Python/PyExtractor.py) - Relies on modelFull.h5 for loading the model weights
2. [R/ReduceFeatureVector.R](R/ReduceFeatureVector.R) - Relies on a set of .csv files for loading the scale limits and the PCA eigenvector matrix.





**WARNING: WiaChestExtract is NOT clinical software. It was designed for education and demonstration purposes ONLY!**
