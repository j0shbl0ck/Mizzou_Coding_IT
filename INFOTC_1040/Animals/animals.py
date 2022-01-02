#Josh Block // Module 10 // Animals.py


class Animal:

    def __init__(self,a_type,a_name,a_mood):
        #set the class attributes
        self.__a_type = a_type
        self.__a_name = a_name
        self.__a_mood = a_mood

    #method to get animal type
    
    def get_a_name(self):
        return self.__a_name

    def get_a_type(self):
        return self.__a_type
    def get_a_mood(self):
        return self.__a_mood

    def set_name(self, new_name):
        self.__name = new_name

    def set_type(self, new_type):
        self.__type = new_type
    def set_mood(self, new_mood):
        self.__type = new_mood
    

    
