using System;
using System.Collections.Generic;

namespace Dog
{
    class Program 
    {
        static void Main(string[] args)
        {
            Dog puppy = new Dog("Orion", "Shawn", 1, Gender.Male);  // create object instance
            puppy.Bark(3); // output: Woof!Woof!Woof!
            Console.WriteLine(puppy.GetTag()); // output: If lost, call Shawn. His name is Orion and he is 1 year old.

            Dog myDog = new Dog("Lileu", "Dale", 4, Gender.Female);  // create object instance
            myDog.Bark(1); // output: Woof!
            Console.WriteLine(myDog.GetTag()); // output: If lost, call Dale. Her name is Lileu and she is 4 years old.   
        }
    }
}
