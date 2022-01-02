using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DocumentMerger_jsbvnn_
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
                    {
                    Console.WriteLine("Document Merger\n");
                    
                    Console.WriteLine("Please type name of first file:");
                    string filename1 = Console.ReadLine();
                    while (!File.Exists(filename1))
                    {
                        Console.WriteLine("File does not exist in the current directory!");
                        filename1 = Console.ReadLine();
                    }

                    Console.WriteLine("Please type name of second file:");
                    string filename2 = Console.ReadLine();
                    while (!File.Exists(filename2))
                    {
                        Console.WriteLine("File does not exist in the current directory!");
                        filename2 = Console.ReadLine();
                    }
                    string content1 = File.ReadAllText(filename1);
                    string content2 =File.ReadAllText(filename2);
                    char[] Text = {'.','t','x','t'};
                    filename1 = filename1.TrimEnd(Text);
                    filename2 = filename2.TrimEnd(Text);

                    string filename3 = filename1 + filename2 + ".txt";
                    string filecontent2 = content1 + content2;
                    File.AppendAllText(filename3, filecontent2);
                    
                    StreamWriter sw = null;
                    sw = new StreamWriter(filename3);
                    sw.WriteLine(filecontent2);
                    sw.Close();
                    string Clocktime = DateTime.Now.ToString("hh:mm tt");
                    Console.WriteLine("\n");
                    Console.WriteLine("File " + filename3 + " has been successfully saved @ " + Clocktime); 
                    Console.WriteLine("Character Count: " + filecontent2.Length);
                    Console.WriteLine("Press any key to continue...");  
                    }
                    
                    
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error occured while merging files..." + e.Message +"\nPress enter to continue...");
                }
                finally
                {
                    restart = Console.ReadLine().ToUpper();
                    while ((restart != "Y") && (restart != "N"))
                    {
                        Console.WriteLine("Would you like to merge more documents? (Y/N)");
                        restart = Console.ReadLine().ToUpper();
                        Console.WriteLine("\n");
                    }
                }
                
            } while (restart == "Y");
        }
    }
}
