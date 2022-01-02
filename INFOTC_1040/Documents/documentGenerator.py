#Josh Block // Module 11 // documentGenerator.py

import Document

documents = list()

print('')
print('Welcome to the document generator!')
print('This program creates documents.')
print('')


def document_creation():
    document_title = input('What is the name of the document title? ')
    document_body = input('Please type in the body of the document: ')
    document_author = input('Who is the author of the document? ')

    document = Document.Document(document_title, document_body, document_author)
    documents.append(document)
    
    return create_document()

def create_document():
    Question = input('Would you like to create another document? (Y/N): ').lower().strip()
    if (Question == 'y'):
        return document_creation()
    elif (Question == 'n'):
        return list_document()
    else:
        print('Please enter Y or N\n')
        return create_document()

def list_document():
    #return animal_creation()
    print('')
    print('Generated Documents:')
    print('')
    for document in documents:
        document_title = document.get_title()
        document_body = document.get_body()
        document_author = document.get_author()
        print('')
        print('TITLE: ',document_title)
        print('')
        print('BODY: ',document_body)
        print('')
        print('AUTHOR: ',document_author)
        print(''End'')
    return close_document()

def close_document():
    raise SystemExit
            
    

document_creation()
create_document()
list_document()
close_document()
