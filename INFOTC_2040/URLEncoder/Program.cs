using System;
using System.Collections.Generic;

namespace URLEncoder
{
    class Program
    {
        static string urlFormatString = "https://companyserver.com/content/{0}/files{1}/{1}Report.pdf";

        static Dictionary<string, string> convertedchar = new Dictionary<string, string>
        {
            {" ","%20"}, {"!","%22"}, {"#","%23"},{"$","%24"},{"%","%25"},
            {"&","%26"},{"'","%27"},{"(","%28"},{")","%29"},{"*","%2A"},
            {"+","%2B"},{",","%2C"},{"-","%2D"},{".","%2E"},{"/","%2F"},
            {":","%3A"},{";","3B"},{"<","%3C"},{"=","%3D"},{">","%3E"},
            {"?","3F"},{"@","%40"},{"[","%5B"},{"\"","%5C"},{"]","%5D"},
            {"^","%5E"},{"_","%5F"},{"`","%60"},{"|","%7C"},{"\\","%5C"}

        };
        
        static void Main(string[] args)
        {
            Console.WriteLine("URL Encoder");
            do
            {
                Console.Write("\nProject name: ");
                string projectName = GetUserInput();
                Console.Write("Activity name: ");
                string activityName = GetUserInput();

                Console.WriteLine(CreateURL(projectName, activityName));

                Console.Write("Would you like to do another? (y/n): ");
            } while (Console.ReadLine().ToLower().Equals("y"));
        }
            
        static string CreateURL(string projectName, string activityName)
        {
            return String.Format(urlFormatString,Encode(projectName),Encode(activityName));
        }
        static string GetUserInput()
        {
            string input = "";
            do
            {
                input = Console.ReadLine();
                if (IsValid(input)) return input;
                Console.Write("The input contains invalid characters. Enter again: ");
            } while(true);
        }
        static bool IsValid(string input){
            foreach (char character in input.ToCharArray()){
                if ((character >= 0x00 && character <= 0x1F) || character == 0x7F ){
                    return false;
                }
            }
            return true;
        }
            
        static string Encode(string value)
        {
            string encodedValue = "";
            foreach (char character in value.ToCharArray()){
                string characterString = character.ToString();
                encodedValue += convertedchar.GetValueOrDefault(characterString, characterString);    
            }
            return encodedValue;
        }        
    }
}
