using System;
using System.Collections.Generic;

namespace Dog
{
    public class Dog
    {
        public string name;
        public string owner;
        public int age;
        public Gender gender;

        public Dictionary<Gender, string> Shehe = new Dictionary<Gender, string>();
        public Dictionary<Gender, string> Herhis = new Dictionary<Gender, string>();
    
        public Dog(string name, string owner, int age, Gender gender)
        {  
            this.name = name;
            this.owner = owner;
            this.age = age;
            this.gender = gender;

            Shehe.Add(Gender.Female,"she");
            Shehe.Add(Gender.Male,"he");
            Herhis.Add(Gender.Female,"Her");
            Herhis.Add(Gender.Male,"His");


        }
        public void Bark(int time)
        {
            for (int i = 0; i < time; i++) 
            {
            Console.WriteLine("Woof!");
            }
        }
        public string GetTag()
        {
            string AgeUnit = age == 1 ? "year" : "years";
            return String.Format("If lost, call {0}. {1} name is {2} and {3} is {4} {5} old.",
            owner,Herhis.GetValueOrDefault(gender,"Her"),name,Shehe.GetValueOrDefault(gender,"she"),age,AgeUnit);

        }
        
    }
}
