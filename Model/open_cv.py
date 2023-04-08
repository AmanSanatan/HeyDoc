import cv2 as cv
import numpy as np
import PIL.Image as Image

def convert_single(image1):
    # image1 = cv2.imread(image1)
    img = cv.cvtColor(image1, cv.COLOR_BGR2GRAY)  
    thresh2 = cv.adaptiveThreshold(img, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY, 201,31)
    thresh2 = cv.cvtColor(thresh2 , cv.COLOR_GRAY2RGB)
    return  thresh2


def thresh_crop(image,val=40,margin=5,size=(100,100)):
    threshold = val
    src=cv.imread(image)
    src_gray = cv.cvtColor(src, cv.COLOR_BGR2GRAY)
    src_gray = cv.blur(src_gray, (5,5))
    # Detect edges using Canny
    canny_output = cv.Canny(src_gray, threshold, threshold * 2)
    # Find contours
    contours, hierarchy = cv.findContours(canny_output, cv.RETR_TREE, cv.CHAIN_APPROX_SIMPLE)
    # Draw contours
    # drawing = np.zeros((canny_output.shape[0], canny_output.shape[1], 3), dtype=np.uint8)
    cnts = np.concatenate(contours)
    x,y,w,h = cv.boundingRect(cnts)
    # img = cv.rectangle(src,(x,y),(x+w,y+h),(0,255,0),2)
    Y,X,Z=src.shape
    """    for i in range(len(contours)):
           color = (rng.randint(0,256), rng.randint(0,256), rng.randint(0,256))
           cv.drawContours(drawing, contours, i, color, 2, cv.LINE_8, hierarchy, 0)"""
    # Show in a window
    cropped_image = src[max(y,max(0,y-margin)):min(Y,y+h+margin), max(x,max(0,x-margin)):min(X,x+w+margin)]
    # print([x,y,w,h])
    # cv.imshow("cropped",cropped_image)
    out = cv.resize(cropped_image,size)
    # out = cv.cvtColor(out, cv.COLOR_BGR2RGB)
    out = convert_single(out)
    out = Image.fromarray(out)
    return out