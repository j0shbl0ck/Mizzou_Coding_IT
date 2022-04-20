using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Sales_Data_Analyzer
{
    public static class SalesDataReport
    {
        public static string GenerateText(List<SalesData> salesDataList)
        {
            string report = "Sales Data Report \n\n"; 

            if(salesDataList.Count() < 1)
            {
                report += "No data available.\n";

                return report;
            }
            
            Console.WriteLine("Thisisatest");
            var itemsAustralia = from salesData in salesDataList where salesData.Country ==  "Australia" select salesData;
            itemsAustralia.ToList().ForEach(salesData => Console.WriteLine("Stock Code: {0} | Description: {1}", salesData.StockCode, salesData.Description));
            report += $"Items sold to customers in Australia: { itemsAustralia}\n";

            var individualSales = ();
            //Create LINQ that groups invoice numbers then outputs inidivdual sales
            report += $"Individual sale count: {individualSales}\n";

            var salesTotalNumber = from salesData in salesDataList where salesData.InvoiceNo == 536365 select salesData;
            report += $"Sales Total For Invoice #536365: {salesTotalNumber}\n";

            var totalCountrySales = ();
            //Create LINQ that pulls in all countries and then lists their sales seperatly. 
            report += $"Total Sales By Country: {totalCountrySales}\n";

            var customerMoney = ();
            //Create LINQ that groups all customers then pulls highest spender.
            report += $"Customer Who Spent Most Money: {customerMoney}\n";

            var salesCustomer = from salesData in salesDataList where salesData.CustomerID == 3152 select salesData.UnitPrice
            report += $"Total Sales of Customer 15311: {salesCustomer}\n";

            var unitHand = from salesData in salesDataList where salesData.Description.Contains("HAND WARMER UNION JACK") select salesData;
            report += $"Hand Warmer Union Jack units sold: {unitHand}\n";

            var valueHand = from salesData in salesDataList where salesData.Description.Contains("HAND WARMER UNIO JACK") select(salesData.UnitPrice * salesData.Quantity);
            report += $"Total Sale Value Of Hand Warmer Union Jack units: {valueHand}\n";


            var productPrice = ();
            // Which descriptions have the highest unit price? List the descriptions(s) and the unit price.
            var productPrice = from salesData in salesDataList select salesData.UnitPrice.Max();
            report += $"Highest Unit Price: {productPrice}\n";
            
            //Group Products by UnitPrice then find max and list the description alongside. 
            report += $
            report += $"Prodct With Highest UnitPrice: {productPrice}\n";

            var saleTotal = from salesData in salesDataList select(salesData.UnitPrice * salesData.Quantity);
            report += $"Total Sales Inside Dataset: {saleTotal}\n";

            var invoiceSale = (from salesData in salesDataList select salesData.InvoiceNo).Max();
            report += $"Invoice# With Highest Sales: {invoiceSale}\n";

            var productUnit = (from salesData in salesDataList select salesData.Description).Max();
            report += $"Product With Most Units Sold: {productUnit}\n";

            return report;

        }
    }
}