#Josh Block // Module 11 // document.py

class Document:
    #defines what happens when a new document is created:
    def __init__(self,document_title,document_body,document_author):
        self.__title = document_title
        self.__body = document_body
        self.__author = document_author

    #Get the title
    def get_title(self):
        return self.__title

    #Get the body
    def get_body(self):
        return self.__body

    #Get the author
    def get_author(self):
        return self.__author
