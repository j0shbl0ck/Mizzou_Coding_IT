using System; 
namespace Sales_Data_Analyzer 
{
    public class SalesData
    {
        public int InvoiceNo;

        public int StockCode; 

        public string Description;

        public int Quantity;

        public int InvoiceDate;

        public int UnitPrice; 

        public int CustomerID;

        public string Country; 

        public SalesData(int invoiceNo, int stockCode, string description, int quantity,
                        int invoiceDate, int unitPrice, int customerID, string country)
        
        {
            InvoiceNo = invoiceNo; 
            StockCode = stockCode;
            Description = description;
            Quantity = quantity;
            InvoiceDate = invoiceDate;
            UnitPrice = unitPrice;
            CustomerID = customerID;
            Country = country;
        }
    }
}