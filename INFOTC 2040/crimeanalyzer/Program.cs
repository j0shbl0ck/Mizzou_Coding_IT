using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace CrimeAnalyzer
{
    public struct Data //Create Data Headers from CSV
    {
        public int Year, Population, ViolentCrime, Murder, Rape, Robbery, Aggravate, Property, Burglary, Theft, MotorVechicleTheft;

        public Data(int data1, int data2, int data3, int data4, int data5, int data6, int data7, int data8, int data9, int data10, int data11)
        {
            Year = data1;
            Population = data2;
            ViolentCrime = data3;
            Murder = data4;
            Rape = data5;
            Robbery = data6;
            Aggravate = data7;
            Property = data8;
            Burglary = data9;
            Theft = data10;
            MotorVechicleTheft = data11;
        }
    }

    class Program //Create class that handles file export and handling
    {
        static void Main(string[] args)
        {
            int i;
            List<Data> RowCol = new List<Data>();
            try
            {
                if (File.Exists($"CrimeData.csv") == false)
                {
                    Console.WriteLine("File not found.");
                }
                else
                {
                    StreamReader sr = new StreamReader($"CrimeData.csv");
                    i = 0;
                    string line = sr.ReadLine();
                    while ((line = sr.ReadLine()) != null)
                    {
                        i = i + 1;
                        try
                        {
                            string[] strings = line.Split(',');
                            if (strings.Length < 11)
                            {
                                Console.Write($"Row {i} contains {strings.Length}  values.It should contain 11.");
                                break;
                            }
                            else
                            {
                                Data dataTemp = new Data(Int32.Parse(strings[0]), Int32.Parse(strings[1]), Int32.Parse(strings[2]), Int32.Parse(strings[3]), Int32.Parse(strings[4]), Int32.Parse(strings[5]), Int32.Parse(strings[6]), Int32.Parse(strings[7]), Int32.Parse(strings[8]), Int32.Parse(strings[9]), Int32.Parse(strings[10]));
                                RowCol.Add(dataTemp);
                            }
                        }
                        catch
                        {
                            Console.Write("Error can read line!");
                        }
                    }
                    sr.Close();
                }
            }
            catch (Exception)
            {
                Console.WriteLine("File cannot be previewed!");
            }

            try
            {
                Data[] stats = RowCol.ToArray();
                using (StreamWriter write = new StreamWriter("CrimeAnalyzerReport.txt"))
                {
                    write.WriteLine("Crime Analyzer Report");
                    write.WriteLine("");

                    var years = from crimeStats in stats orderby crimeStats.Year ascending select crimeStats.Year;
                    write.Write("Period: ");
                    i = 0;
                    foreach (int x in years)
                    {
                        i++;
                    }
                    write.WriteLine($"{years.First()}-{years.Last()} {(i)}"); // import values from CSV

                    var murderYears = from crimeStats in stats where crimeStats.Murder < 15000 select crimeStats.Year;
                    write.Write("Years murders per year < 15000: ");
                    foreach (int x in murderYears)
                    {
                        if(murderYears.Last() != x)
                            write.Write($"{x}, ");
                        
                        else
                            write.Write($"{x} ");
                    }
                    write.WriteLine("");

                    var robberiesYears = from crimeStats in stats where crimeStats.Robbery > 500000 select new { crimeStats.Year, crimeStats.Robbery };                   
                    write.Write("Robberies per year > 500000: ");
                    foreach (var x in robberiesYears)
                    {
                        if(!robberiesYears.Last().Equals(x))                      
                            write.Write($" { x.Year} = {x.Robbery},");
                        else
                            write.Write($" { x.Year} = {x.Robbery}");
                    }
                    write.WriteLine("");

                    var violentCrimePerCapita = from crimeStats in stats where crimeStats.Year == 2010 select new { crimeStats.ViolentCrime, crimeStats.Population };                                               
                    write.Write("Violent crime per capita rate (2010): ");
                    foreach (var x in violentCrimePerCapita)
                    {
                        float violentstats = (float)x.ViolentCrime / x.Population;
                        write.Write($"{violentstats}");
                    }
                    write.WriteLine("");

                    var averageMurder = from crimeStats in stats select crimeStats.Murder;                   
                    write.Write("Average murder per year (all years): ");
                    write.Write(averageMurder.Average());
                    write.WriteLine("");

                    var averageMurder19941997 = from crimeStats in stats where crimeStats.Year >= 1994 && crimeStats.Year <= 1997 select crimeStats.Murder;
                    write.Write("Average murder per year (1994-1997): ");
                    write.Write(averageMurder19941997.Average());
                    write.WriteLine("");

                    var averageMurder20102014 = from crimeStats in stats where crimeStats.Year >= 2010 && crimeStats.Year <= 2014 select crimeStats.Murder;
                    write.Write("Average murder per year (2010-2014): ");
                    write.Write(averageMurder20102014.Average());
                    write.WriteLine("");

                    var minMurder19992004 = from crimeStats in stats where crimeStats.Year >= 1999 && crimeStats.Year <= 2004 select crimeStats.Theft;
                    write.Write("Minimum thefts per year (1999-2004): ");
                    write.Write(minMurder19992004.Min());
                    write.WriteLine("");

                    var maxMurder19992004 = from crimeStats in stats where crimeStats.Year >= 1999 && crimeStats.Year <= 2004 select crimeStats.Theft;
                    write.Write("Maximum thefts per year (1999-2004): ");
                    write.Write(maxMurder19992004.Max());
                    write.WriteLine("");

                    var highestvechicle = from crimeStats in stats orderby crimeStats.MotorVechicleTheft ascending select crimeStats.Year;
                    write.Write("Years of highest number of motor vehicle thefts: ");
                   
                    write.WriteLine(highestvechicle.Last());

                    write.Close();
                }
                Console.WriteLine("Crime Analyzer Report has been generated.");
            }

            catch (Exception)
            {
                Console.WriteLine("File failed to generate.");
            }
            Console.ReadLine();        
        }
    }
}