using System;

namespace Csharp_Basics
{
    class Program
    {
        static void Main(string[]args)
        {        
        const byte sample1 = 0x3A;
        byte sample2 = 58;
        if (sample1 == sample2)
            {
                Console.WriteLine("The samples are equal");
            }
            else
            {
                Console.WriteLine("The samples are not equal");
            }
        int heartRate = 85;
        if (heartRate >= 40 && heartRate <= 80) 
            {
                Console.WriteLine("Heart rate is normal.");
            }
            else
            {
                Console.WriteLine("Heart rate is not normal.");
            }

        double deposits = 135002796;
        if (deposits >= 100000000)
            {
                Console.WriteLine("You are exceedingly wealthy.");
            }
            else
            {
                Console.WriteLine("Sorry you are so poor.");
            }

        float acceleration = 9.800f;
        float mass = 14.6f;
        float force = mass * acceleration;
            Console.WriteLine("Force =" + force.ToString()); //Why two parantheses after ToString
        
        double distance = 129.763001;
            Console.WriteLine(distance + " is the distance.");
        
        bool lost = true;
        bool expensive = true;
        if (lost == true && expensive == true)
            {
                Console.WriteLine("I am really sorry! I will get the manager.");
            }
            else if (lost == true && expensive == false)
            {
                Console.WriteLine("Here is coupon for 10% off.");
            }
        
        int choice = 2;
        switch (choice)
        {
            case 1:
                Console.WriteLine("You chose 1.");
                break;
            case 2:
                Console.WriteLine("You chose 2.");
                break;
            case 3:
                Console.WriteLine("You chose 3.");
                break;
            default:
                Console.WriteLine("You made an unkown choice.");
                break; 
        }
        for (int i = 5; i <= 10; i++)
        {
            Console.WriteLine("I = " + i);
        }
        char integral = '\u222B';
            Console.WriteLine(integral + " is an integral.");
        
        int age = 0;
        while (age < 6)
            {
                Console.WriteLine("age =" + age);
                age++; //Why do we increment the value of age by 1?
            }
        String greeting = "Hello";
        String name = "Karen";
            Console.WriteLine(greeting + "" + name); 
        
        }   
    }
}
