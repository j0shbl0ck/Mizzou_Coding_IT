using System;
using System.Collections.Generic;
using System.IO;

namespace Pets
{
    class Cat
    {
        public Cat(string name, string owner, double weight)
        {
            Name = name;
            Owner = owner;
            Weight = weight;
        }

        public string Name { get; }
        public string Owner { get; }
        public double Weight { get; }

        public string getTag()
        {
            string tag = "If lost, call " + Owner;
            return tag;
        }

        public string meow(int count)
        {
            int i = 1;
            string meowLine = "meow.";
            string numOfMeows = "";
            while (i <= count)
            {
                numOfMeows = numOfMeows + meowLine;
                i++;
            }
            return numOfMeows;
        }
    }
}