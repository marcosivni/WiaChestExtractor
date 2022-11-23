###GLOBAL FUNCTIONS

fetchMin <- function (data){

    minV <- NULL

    for (i in 1:ncol(data)){
        minV <- c(minV, min(data[,i]));
    }

    fetchMin <- minV;
}


fetchMax <- function (data){

    maxV <- NULL

    for (i in 1:ncol(data)){
        maxV <- c(maxV, max(data[,i]));
    }

    fetchMax <- maxV;
}

fetchMean <- function (data){

    meanV <- NULL

    for (i in 1:ncol(data)){
        meanV <- c(meanV, mean(data[,i]));
    }

    fetchMean <- meanV;
}

scale <- function(data, minValues, maxValues){

    dataN <- data;
    for (i in 1:length(minValues)){
        if ((maxValues[i] - minValues[i]) > 0){
            dataN[, i] <- (data[, i] - minValues[i])/(maxValues[i] - minValues[i]); 
        } else {
            dataN[, i] <- 0;
        }
    }
    scale <- dataN;
}

## Read the raw feature vector(s) from the deep learning model (File -> Python/CBIR_Extractor.py)
featureVector <- read.csv("Input/DL_Features.csv", header=F);

##Read max and min values to scale the feature vector(s)
maxBeforePCA <- read.csv("R/MaxBeforePCA.csv", header=T);
minBeforePCA <- read.csv("R/MinBeforePCA.csv", header=T);

##Scale the feature vector(s)
featureVector <- scale(featureVector, t(minBeforePCA), t(maxBeforePCA))

##Remove dimensions with neglectable variance
trueVariance <- read.csv("R/Neglectable_Variance.csv", header=T);
trueVarianceIdx <- which(trueVariance == TRUE);
featureVector <- featureVector[, trueVarianceIdx]

##Read PCA Eigenvectors
eVectors <- read.csv("R/PCA_Eigenvectors.csv", header=T);

##PCA final transformation
reducedFV <- as.matrix(featureVector) %*% as.matrix(eVectors[,1:2])

##Read max and min values to scale the reduced feature vector(s)
maxAfterPCA <- read.csv("R/MaxAfterPCA.csv", header=T);
minAfterPCA <- read.csv("R/MinAfterPCA.csv", header=T);

##Scale the reduced feature vector(s)
reducedFVN <- scale(reducedFV, t(minAfterPCA), t(maxAfterPCA));

##Save reduced and scaled feature vectors 
write.csv(reducedFVN, "ExtractedFeatures.csv", row.names=FALSE)

