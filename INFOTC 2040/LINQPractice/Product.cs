using System;

namespace LINQPractice
{
    public class Product
    {
        private int _productID;
        private ProductCategory _productCategory;
        private string _title;
        private double _price;
        private int _stockedQuantity;

        public Product(int id, ProductCategory category, string title, double price, int stockedQuantity)
        {
            ID = id;
            Category = category;
            Title = title;
            Price = price;
            StockedQuantity = stockedQuantity;
        }

        public int ID {
            get { return _productID; }
            set {
                _productID = value;
            }
        }

        public ProductCategory Category {
            get { return _productCategory; }
            set {
                _productCategory = value;
            }
        }

        public string Title {
            get { return _title; }
            set {
                _title = value;
            }
        }

        public double Price {
            get { return _price; }
            set {
                _price = value;
            }
        }

        public int StockedQuantity {
            get { return _stockedQuantity; }
            set {
                _stockedQuantity = value;
            }
        }

        public override string ToString()
        {
            // note: {1:F2} indicates the second variable (first is 0, second is 1) with 2 digits after the decimal point

            return String.Format("ID: {0}, Price: {1:F2}, Stocked Qty: {2}, Category: {3}, Title: {4}", ID, Price, StockedQuantity, Category, Title);
        }
    }
}