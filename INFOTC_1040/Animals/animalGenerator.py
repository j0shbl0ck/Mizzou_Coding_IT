#Josh Block // Module 10 // animalGenerator.py
import random
from animals import Animal

print('Welcome to the animal generator!')
print('This program creates Animal objects.')
print('')

def animal_generator():
    animal_v = Animal('a_type', 'a_name', 'a_mood')
    
    animal_list = []
    retrive_int = True
    while(retrive_int):
        animal_type_input = input('What type of animal would you like to create? ')
        typer = (animal_v.set_type(animal_type_input))
        print('')

        animal_name_input = input('What is the animals name? ')
        namer = (animal_v.set_name(animal_name_input))
        print('')

        Question = input("Would you like to add more animals? (Y/N): ").lower().strip()
        if (Question != 'y'):
            retrive_int = False

        animal_mood = ('happy', 'hungry', 'sleepy')[random.randint(0, 2)]
        mooder = (animal_v.set_mood(animal_mood))

    
    print('Animal List: ')
    print('')
    print('',typer,' the ',namer,' is ',mooder,'\n')


animal_generator()
