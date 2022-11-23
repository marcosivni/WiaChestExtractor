import os
import csv

import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
from tensorflow.keras import backend as K

import PIL
import PIL.Image
from PIL import Image

##Define resize scale
img_rows = 224
img_cols = 224

##Img reading and type casting
def select_image(filename):
    # load image from file
    image = PIL.Image.open(filename)
    image = image.convert('RGB')
    image = image.resize((img_rows, img_cols))
    img = np.array(image) 
    img = img.reshape((1,) + img.shape)
    img = img.astype('float32')
    img = img / 255.0
    return img

##Load DL weights and topology
model = load_model('Python/modelFull.h5')

##Define the cut point for the collection of filter values
getFeature = K.function(model.layers[0].input, model.layers[4].output)

##Batch processing
if os.path.exists('Input/DL_Features.csv'):
    os.remove('Input/DL_Features.csv')
    
with open('Input/inputFiles.txt') as openfileobject:
    for line in openfileobject:
        print('Extracting ' + line.rstrip() + '...')
        imageFile = select_image(line.rstrip())
        filtro = getFeature(imageFile)
        #print(filtro)
        
        with open('Input/DL_Features.csv', 'a', newline='') as file:
            writer = csv.writer(file)    
            writer.writerows(filtro)

openfileobject.close()




