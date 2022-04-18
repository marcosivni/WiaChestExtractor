CREATE METRIC L2 
USING EUCLIDEAN 
FOR PARTICULATE;

CREATE METRIC L1 
USING CITYBLOCK 
FOR PARTICULATE;

CREATE METRIC CANBERRA 
USING CANBERRA  
FOR PARTICULATE;

CREATE TABLE Lung2D (
    Id INTEGER,
    IdStudy INTEGER,
    Filename VARCHAR(255),
    Patient_Name VARCHAR(300),
    PcaF PARTICULATE(2),
    VggF PARTICULATE(93),
    Image_Type INTEGER,
    Image_Class INTEGER,
    Patient_Sex INTEGER,
    Patient_Age INTEGER,
    Image_Hypothesis INTEGER,
    Days_Of_Infection INTEGER,
    ICU INTEGER,
    COA INTEGER,
    Opacity_Pattern INTEGER,
    Interlobar_Distribution INTEGER,
    Axial_Distribution INTEGER,
    Pleural_Disorder INTEGER,
    Lymphadenopathy INTEGER,
    Cardiomegaly INTEGER,
    Enlarged_Trunk INTEGER,
    PRIMARY KEY (Id),
    METRIC (PcaF) USING (L2, L1, CANBERRA),
    METRIC (VggF) USING (L2, L1, CANBERRA) 
) ;


CREATE TABLE U_Lung2D (
    Id INTEGER,
    IdStudy INTEGER,
    Filename VARCHAR(255),
    Patient_Name VARCHAR(300),
    PcaF PARTICULATE(2),
    VggF PARTICULATE(93),
    url VARCHAR(300),
    PRIMARY KEY (Id),
    METRIC (PcaF) USING (L2, L1, CANBERRA),
    METRIC (VggF) USING (L2, L1, CANBERRA) 
); 


-- Define valid search filters
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Image_Class');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Opacity_Pattern');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Interlobar_Distribution');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Axial_Distribution');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Pleural_Disorder');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Lymphadenopathy');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Cardiomegaly');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'Enlarged_Trunk');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'ICU');
INSERT INTO Scope (tableName,attributeName) VALUES ('Lung2D', 'COA');

-- Image classes
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Image_Class', '1', 'Normal');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Image_Class', '2', 'ILD');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Image_Class', '3', 'COVID');

-- COVID-related attributes
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'ICU', '0', 'No');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'ICU', '1', 'Yes');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'ICU', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'COA', '0', 'Deceased');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'COA', '1', 'Internal care');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'COA', '2', 'Discharged');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'COA', '3', 'Lost track');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'COA', '99', 'N/A');


-- Interstitial-related attributes
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '1', 'Alveolar');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '2', 'Alveolointerstitial');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '3', 'Miliary');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '4', 'Nodular');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '5', 'Reticular');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '6', 'Reticulonodular');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Opacity_Pattern', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Interlobar_Distribution', '1', 'Upper lobes pred.');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Interlobar_Distribution', '2', 'Lower lobes pred.');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Interlobar_Distribution', '3', 'Diffuse');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Interlobar_Distribution', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Axial_Distribution', '1', 'Extense');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Axial_Distribution', '2', 'Central pred.');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Axial_Distribution', '3', 'Peripheral pred.');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Axial_Distribution', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Pleural_Disorder', '0', 'Absent');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Pleural_Disorder', '1', 'Present');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Pleural_Disorder', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Lymphadenopathy', '0', 'Absent');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Lymphadenopathy', '1', 'Present');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Lymphadenopathy', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Cardiomegaly', '0', 'Absent');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Cardiomegaly', '1', 'Present');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Cardiomegaly', '99', 'N/A');

INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Enlarged_Trunk', '0', 'Absent');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Enlarged_Trunk', '1', 'Present');
INSERT INTO Caption (tableN,attributeN,valueN,caption) VALUES ('Lung2D', 'Enlarged_Trunk', '99', 'N/A');

