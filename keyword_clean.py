# Keyword cleaning - 
# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import re
import nltk
# nltk.download('stopwords')
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer

# Importing the dataset
dataset = pd.read_csv('dts2.csv')

corpus = []
for i in range(0, dataset['Sr.No.'].count()):
    review = re.sub('[^a-zA-Z0-9]', ' ', dataset['Search_Keywords'][i])
    review = review.lower()
    review = review.split()
    ps = PorterStemmer()
    review = [ps.stem(word) for word in review if not word in set(stopwords.words('english'))]
    review = ''.join(review)
    if review == '':
        review = re.sub('[^a-zA-Z0-9]', '', dataset['Search_Keywords'][i])
        review = review.lower()
    corpus.append(review)

dataset3 = dataset
dataset3.insert(2,"StemmedKW",corpus)
stkw_instance = [0]*dataset3['Sr.No.'].count()
dataset3.insert(3,"StemKW_Instance",stkw_instance)
dataset3 = dataset3.sort_values(['StemmedKW','Internal Search Terms Instances'])
dataset3 = dataset3.reset_index(drop=True)

stkw_dict={}
for i in range(0,dataset['Sr.No.'].count()):
    if dataset3['StemmedKW'][i] in list(stkw_dict.keys()):
        dataset3["StemKW_Instance"][i] = stkw_dict[dataset3['StemmedKW'][i]]
    else:
        stkw_dict[ dataset3['StemmedKW'][i] ] = 0
        for j in range(i, dataset['Sr.No.'].count()):
            if  dataset3['StemmedKW'][i]== dataset3['StemmedKW'][j]:
                stkw_dict[ dataset3['StemmedKW'][i] ] = stkw_dict[ dataset3['StemmedKW'][i] ] + dataset3['Internal Search Terms Instances'][j]
            else:
                break
        print(i)
        dataset3["StemKW_Instance"][i] = stkw_dict[dataset3['StemmedKW'][i]]

dataset3 = dataset3.sort_values(['StemKW_Instance','Internal Search Terms Instances'],ascending=[False,False])
dataset3 = dataset3.reset_index(drop=True)


dataset3.to_csv('dts3.csv')




