#!/usr/bin/python3

while (1==1):
    userInput = str(input("Enter a string: "))
    index = 0
    indexLast = 0
    wordList = []
    i = 1
    while i==1:
        index = userInput.find(" ", index, len(userInput))
        if(index == -1):
            wordList.append(userInput[indexLast:len(userInput)])
            i = 0
        else:
            wordList.append(userInput[indexLast:index])
            indexLast = index + 1
            index = index + 1
            
    t = 0
    masterString = ""
    while t < len(wordList):
        if(wordList[t][0] == "a" or wordList[t][0] == "e" or wordList[t][0] == "i" or wordList[t][0] == "o" or wordList[t][0] == "u"): 
            masterString = masterString + wordList[t] + "way "
        else:
            masterString = masterString + wordList[t][1:len(wordList[t])] + wordList[t][0] + "ay "
        t = t + 1
    print (masterString)

