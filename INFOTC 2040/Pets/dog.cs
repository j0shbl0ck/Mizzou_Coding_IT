using System;
using System.Collections.Generic;
using System.IO;

namespace Pets
{
    class Dog
    {
        public Dog(string name, string owner, double weight)
        {
            Name = name;
            Owner = owner;
            Weight = weight;
        }

        public string pType { get; }
        public string Name { get; }
        public string Owner { get; }
        public double Weight { get; }

        public string getTag()
        {
            string tag = "If lost, call " + Owner;
            return tag;
        }





        public string bark(int count)
        {
            int i = 1;
            string barkLine = "bark!";
            string numOfBarks = "";
            while (i <= count)
            {
                numOfBarks = numOfBarks + barkLine;
                i++;
            }
            return numOfBarks;
        }
    }
}