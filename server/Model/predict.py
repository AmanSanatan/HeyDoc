from tensorflow.keras.models import load_model,Model
from tensorflow.keras.utils import load_img, img_to_array
import numpy as np
import sys
import os
from open_cv import thresh_crop

class_dir = ["Healthy","Parkinson"]

dirname = os.path.dirname(__file__)

# sp_mod1 = load_model(os.path.join(dirname,"VGG16_sp.h5"),compile=False)
# wa_mod1 = load_model(os.path.join(dirname,"VGG16_wa.h5"),compile=False)
# sp_mod1.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])
# wa_mod1.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])

# sp_mod2 = load_model(os.path.join(dirname,"MobileNetV2_sp.h5"),compile=False)
# wa_mod2 = load_model(os.path.join(dirname,"MobileNetV2_wa.h5"),compile=False)
# sp_mod2.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])
# wa_mod2.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])

sp_mod3 = load_model(os.path.join(dirname,"DenseNet201_sp.h5"),compile=False)
wa_mod3 = load_model(os.path.join(dirname,"DenseNet201_wa.h5"),compile=False)
sp_mod3.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])
wa_mod3.compile(optimizer='adam',loss='categorical_crossentropy',metrics=['accuracy'])

def thresh_predict(arr,val=0.40):
    ans = []
    for i in arr[: , 1]:
        if( i>= val):
            ans.append(1)
        else:
            ans.append(0)
    ans = np.array(ans)
    return ans

def sp_predict(img):
    img=thresh_crop(img)
    # img.show()
    norm_a=img_to_array(img)/255.0
    arr_a=np.array([norm_a])
    # pr1 = sp_mod1.predict(arr_a)
    # pr2 = sp_mod2.predict(arr_a)
    pr3 = sp_mod3.predict(arr_a)
    # pr = (pr1 + pr2 + pr3)/3
    pr = thresh_predict(pr3,0.5)
    return(pr)

def wa_predict(img):
    img=thresh_crop(img)
    # img.show()
    norm_b=img_to_array(img)/255.0
    arr_b=np.array([norm_b])
    # pr1 = wa_mod1.predict(arr_b)
    # pr2 = wa_mod2.predict(arr_b)
    pr3 = wa_mod3.predict(arr_b)
    # pr = (pr1 + pr2 + pr3)/3
    pr = thresh_predict(pr3,0.50)
    return(pr)

def predict(spiralimg, waveimg):
    avg = int((sp_predict(spiralimg) + 2*wa_predict(waveimg)))
    return avg

def caller():
    print(predict(os.path.join(dirname,"data\\"+str(sys.argv[1])+"_spiral.png"),os.path.join(dirname,"data\\"+str(sys.argv[1])+"_wave.png")))
    #print(predict(os.path.join(dirname,"data\\" + "uid1" +"_spiral.png"),os.path.join(dirname,"data\\"+"uid1"+"_wave.png")))
caller()