using System;
using System.Collections.Generic;
using System.IO;

namespace Sales_Data_Analyzer
{
    public static class SalesDataLoader
    {
        private static int NumItemsInRow = 8;

        public static List<SalesData> Load(string csvDataFilePath) {
            List<SalesData> salesDataList = new List<SalesData>();

            try
            {
                using (var reader = new StreamReader(csvDataFilePath))
                {
                    int lineNumber = 0;
                    while (!reader.EndOfStream)
                    {
                        var line = reader.ReadLine();
                        lineNumber++;
                        if (lineNumber == 1) continue;

                        var values = line.Split(',');

                        if (values.Length != NumItemsInRow)
                        {
                            throw new Exception($"Row {lineNumber} contains {values.Length} values. It should contain {NumItemsInRow}.");
                        }
                        try
                        {
                            int invoiceNo = Int32.Parse(values[0]);
                            int stockCode = Int32.Parse(values[1]);
                            string description = values[2];
                            int quantity = Int32.Parse(values[3]);
                            int invoiceDate = Int32.Parse(values[4]);
                            int unitPrice = Int32.Parse(values[5]);
                            int customerID = Int32.Parse(values[6]);
                            string country = values[7];
                            SalesData salesData = new SalesData(invoiceNo, stockCode, description, quantity, invoiceDate, unitPrice, customerID, country);
                            salesDataList.Add(salesData);
                        }
                        catch (FormatException e)
                        {
                            throw new Exception($"Row {lineNumber} contains invalid data. ({e.Message})");
                        }
                    }
                }
            } catch (Exception e){
                throw new Exception($"Unable to open {csvDataFilePath} ({e.Message}).");
            }

            return salesDataList;
        }
    }
}