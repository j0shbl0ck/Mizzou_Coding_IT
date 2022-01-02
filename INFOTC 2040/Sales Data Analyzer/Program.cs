using System;
using System.Collections.Generic;
using System.Linq;


namespace Sales_Data_Analyzer
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 2) {
                Console.WriteLine("Sales Data Analyzer <Sales_Data_Analyzer_csv_file_path> <report_file_path>");
                Environment.Exit(1);
            }

            string csvDataFilePath = args[0];
            string reportFilePath = args[1];

            List<SalesData> salesDataList = null;
            try
            {
                salesDataList = SalesDataLoader.Load(csvDataFilePath);
            } catch (Exception e) {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }

            var report = SalesDataReport.GenerateText(salesDataList);

            try
            {
                System.IO.File.WriteAllText(reportFilePath, report);
            } catch (Exception e) {
                Console.WriteLine(e.Message);
                Environment.Exit(3);
            }
        }
    }
}
