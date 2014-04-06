Short reademe file for the python html scraper, whose purpose is to scrape data
from the wiki phrase book site using the Beautiful Soup package. Here are the instructions
for getting this scraper to work:

Follow the download instructions for the Beautiful Soup Python package at:

http://www.crummy.com/software/BeautifulSoup/bs4/doc/#installing-beautiful-soup

Beautiful Soup is a collection of python classes and methods that parse HTML and XML
data. It creates Python classes out of the elements in the DOM and allows you to
call methods on those objects.

Finally, run the app program. This will create a newline-delimited text file named 
‘englishPhraseFile.txt' with the contents of the html document in the same directory as the 
python file was located in. This text file will contain several phrases that should not be
included in the file because they are not phrases, but it’s more work to write code that
goes in and picks out these false phrases than it is to go in by hand and fix it. After you this
text file of English phrases, copy and paste its contents into Google Translate to translate all
of the phrases into whichever language you desire.

