if __name__ == "__main__":
    # open English phrases file
    english = open('englishPhrases.txt', 'r')

    testEnglish = open('englishPhrasesEx.txt', 'w')

    for line in english:
        testEnglish.write('!' + line)

    english.close()
    testEnglish.close()
