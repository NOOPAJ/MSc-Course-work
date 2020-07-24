# -*- coding: utf-8 -*-
"""
Created on Wed May 13 13:56:01 2020

@author: noopa
"""

import io 
import nltk
from nltk.corpus import stopwords 
nltk.download('stopwords')
from nltk.tokenize import word_tokenize 
#word_tokenize accepts a string as an input, not a file. 
stop_words = set(stopwords.words('english')) 
file1 = open("data1.txt") 
line = file1.read()# Use this to read file content as a stream: 
words = line.split() 
for r in words: 
    if not r in stop_words: 
        appendFile = open('data1_clean.txt','a') 
        appendFile.write(" "+r) 
        appendFile.close() 
        
        

#stopwords = stopwords.words('english')