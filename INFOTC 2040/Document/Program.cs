using System;
using System.IO; 
using System.Text;

namespace Document
{
    class Program
    {
        static void Main(string[] args)
        {
            string restart;
            do 
            {
                try
                {
                    
                    
                    string Fulltime = DateTime.Now.ToString("MM//dd/yyyy hh:mm tt");
                    
                    {    
                    Console.WriteLine("Document\n");
                    Console.WriteLine("Please create filename:");
                    string filename = Console.ReadLine();
                    string path = (filename + ".txt");
                    StreamWriter sw = new StreamWriter(path,true);
                    Console.WriteLine("\nEnter text created on" + " " + Fulltime + ":");
                    string Usercontent = Console.ReadLine();
                    Console.WriteLine("\n");
                    string alltext = (Usercontent);
                    sw.WriteLine(alltext + "\n");
                    sw.Close();
                    
                    string Clocktime = DateTime.Now.ToString("hh:mm tt");
                    Console.WriteLine("File " + filename + " has been successfully saved @ " + Clocktime); 
                    Console.WriteLine("Character Count: " + alltext.Length);
                    Console.WriteLine("Press any key to continue...");  
                    }

                }
                catch (Exception e)
                {
                    Console.WriteLine("Error occured while saving file..." + e.Message);
                }
                finally
                {
 
                    restart = Console.ReadLine().ToUpper();
                    while ((restart != "Y") && (restart != "N"))
                    {
                    Console.WriteLine("Would you like to create another document? (Y/N)");
                    restart = Console.ReadLine().ToUpper();
                    Console.WriteLine("\n");
                    }
                }
            
            } while (restart == "Y");
        }   
    }
}
