using System;
using System.Linq;

// https://docs.microsoft.com/en-us/dotnet/csharp/linq/return-a-query-from-a-method
// https://docs.microsoft.com/en-us/dotnet/csharp/linq/index
// https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/basic-linq-query-operations
// https://www.aspsnippets.com/Articles/SELECT-multiple-columns-from-DataTable-using-LINQ-in-C-and-VBNet.aspx
// https://social.msdn.microsoft.com/Forums/en-US/874f1cbe-7549-4fae-9769-3fc1656c18c4/how-can-i-grab-two-columns-from-a-table-in-linq?forum=linqtosql

namespace LINQPractice
{
    class Program
    {
        static void Main(string[] args)
        {
            Product[] products =
            {
                new Product(1252, ProductCategory.Computers, "Logitech M510 Wireless Computer Mouse", 18.49, 25),
                new Product(1343, ProductCategory.Computers, "Redragon K552 KUMARA LED Backlit Mechanical Gaming Keyboard", 29.99, 9),
                new Product(1542, ProductCategory.Computers, "Corsair Vengeance LPX 16GB (2x8GB) DDR4 DRAM 3000MHz", 139.99, 42),
                new Product(1721, ProductCategory.Computers, "USB 3.0 A to A Cable Type A Male to Male, 3 feet", 7.29, 112),
                new Product(2231, ProductCategory.Computers, "USB C to USB A", 10.99, 84),
                new Product(2405, ProductCategory.Computers, "EVGA GeForce GTX 1050 Ti Gaming Video Card, 4GB GDDR5", 169.99, 25),
                new Product(2502, ProductCategory.Computers, "ASUS ROG Strix Z370-E Motherboard LGA1151 ", 209.99, 8),
                new Product(3152, ProductCategory.Electronics, "Tascam DR05 Stereo Portable Digital Recorder", 92.99, 14),
                new Product(3178, ProductCategory.Electronics, "Toshiba 43LF621U19 43-inch 4K Ultra HD Smart LED TV HDR", 319.99, 23),
                new Product(3556, ProductCategory.Electronics, "Crown XLS1502 Two-channel, 525W at 4Ω Power Amplifier", 399.00, 17),
                new Product(4339, ProductCategory.Kitchen, "KitchenAid KSM150PSER Artisan Tilt-Head Stand Mixer", 278.63, 36),
                new Product(4411, ProductCategory.Kitchen, "Hamilton Beach 62682RZ Hand Mixer", 14.99, 67),
                new Product(4523, ProductCategory.Kitchen, "Tovolo Flex-Core All Silicone Spatula", 10.49, 98),
                new Product(5134, ProductCategory.Kitchen, "Circulon Symmetry Hard Anodized Nonstick Skillet", 49.95, 62),
                new Product(5216, ProductCategory.Pet, "Neater Feeder Express Pet Bowls", 22.99, 6),
                new Product(5678, ProductCategory.Pet, "Magic Roller Ball Dog Toy", 10.80, 9),
                new Product(6123, ProductCategory.Pet, "Pillow Pets Signature Cozy Cow Plush Toy", 19.99, 17),
                new Product(6732, ProductCategory.Pet, "Evriholder FURemover Broom with Squeegee ", 15.99, 21),
                new Product(7128, ProductCategory.Pet, "Fabreze Pet Oder Eliminator", 4.94, 33),
                new Product(7231, ProductCategory.Pet, "Professional Pet Slicker Rug Brush for Dogs", 7.59, 17)
            };

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 1                                  */
            /*  Get a list of the products that have prices in range */
            /*  between $10.00 and $20.00 (inclusive of endpoints).  */
            /*-------------------------------------------------------*/
            Console.WriteLine("1. List of products with prices in range $10 to $20:");

            // The following is a non-functional LINQ statement.
            var productsWithPricesInRange10To20 = from product in products where product.Price >= 10.00 & product.Price <= 20.00 select product;
            // The following is a functional LINQ statement.
            var productsWithPricesInRange10To20Functional = products.Where(product => (product.Price >= 10.00 & product.Price <= 20.00));

            Console.WriteLine("Non-functional:");
            foreach (var product in productsWithPricesInRange10To20) {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var product in productsWithPricesInRange10To20Functional)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("----------------------------------------------------");


            /*-------------------------------------------------------*/
            /*  Practice Item ID: 2                                  */
            /*  Get a list of the products that have prices in range */
            /*  between $10.00 and $20.00 (inclusive of endpoints)   */
            /*  ordered by lowest to highest price.                  */
            /*-------------------------------------------------------*/
            Console.WriteLine("\n2. List of products with prices in range $10 to $20 ordered by price ascending:");

            var productsWithPricesInRange10To20OrderedByPriceAsc = from product in products where product.Price >= 10.00 & product.Price <= 20.00 orderby product.Price select product;
            var productsWithPricesInRange10To20OrderedByPriceAscFunctional = products.Where(product => (product.Price >= 10.00 & product.Price <= 20.00)).OrderBy(product => product.Price);

            Console.WriteLine("Non-functional:");
            foreach (var product in productsWithPricesInRange10To20OrderedByPriceAsc)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var product in productsWithPricesInRange10To20OrderedByPriceAscFunctional)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 3                                  */
            /*  Get a list of the product titles for products that   */
            /*  have prices in range between $10.00 and $20.00       */
            /*  (inclusive of endpoints) ordered by title            */
            /*  alphabetically.                                      */
            /*-------------------------------------------------------*/
            Console.WriteLine("\n3. List of titles for products with prices in range $10 to $20 ordered by title alphabetically ascending:");

            var titlesForProductsWithPricesInRange10To20OrderedByTitleAsc = from product in products where product.Price >= 10.00 & product.Price <= 20.00 orderby product.Title select product.Title;
            var titlesForProductsWithPricesInRange10To20OrderedByTitleAscFunctional = products.Where(product => (product.Price >= 10.00 & product.Price <= 20.00)).OrderBy(product => product.Title).Select(product => product.Title);

            Console.WriteLine("Non-functional:");
            foreach (var title in titlesForProductsWithPricesInRange10To20OrderedByTitleAsc)
            {
                Console.WriteLine(title);
            }

            Console.WriteLine("Functional:");
            foreach (var title in titlesForProductsWithPricesInRange10To20OrderedByTitleAscFunctional)
            {
                Console.WriteLine(title);
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 4                                  */
            /*  Get a list of the products that have prices in range */
            /*  between $10.00 and $20.00 (inclusive of endpoints)   */
            /*  ordered by ID ascending.                             */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n4. List of IDs for products with prices in range $10 to $20 ordered by ID descending:");

            var idsForProductsWithPricesInRange10To20OrderedByIDDesc = from product in products where product.Price >= 10.00 & product.Price <= 20.00 orderby product.ID descending select product.ID;
            var idsForProductsWithPricesInRange10To20OrderedByIDDescFunctional = products.Where(product => (product.Price >= 10.00 & product.Price <= 20.00)).OrderByDescending(product => product.ID).Select(product => product.ID);

            Console.WriteLine("Non-functional:");
            foreach (var id in idsForProductsWithPricesInRange10To20OrderedByIDDesc)
            {
                Console.WriteLine(id);
            }

            Console.WriteLine("Functional:");
            foreach (var id in idsForProductsWithPricesInRange10To20OrderedByIDDescFunctional)
            {
                Console.WriteLine(id);
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 5                                  */
            /*  Get a list of kitchen products.                      */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n5. Kitchen products:");

            var kitchenProducts = from product in products where product.Category == ProductCategory.Kitchen select product;
            var kitchenProductsFunctional = products.Where(product => (product.Category == ProductCategory.Kitchen));

            Console.WriteLine("Non-functional:");
            foreach (var kitchenProduct in kitchenProducts)
            {
                Console.WriteLine(kitchenProduct.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var kitchenProduct in kitchenProductsFunctional)
            {
                Console.WriteLine(kitchenProduct.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 6                                  */
            /*  Get a list of kitchen products ordered by quantity   */
            /*  in stock descending.                                 */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n6. Kitchen products ordered by quantity in stock descending:");

            var kitchenProductsOrderedByStockedQuantity = from product in products where product.Category == ProductCategory.Kitchen orderby product.StockedQuantity descending select product;
            var kitchenProductsOrderedByStockedQuantityFunctional = products.Where(product => (product.Category == ProductCategory.Kitchen)).OrderByDescending(product => product.StockedQuantity);

            Console.WriteLine("Non-functional:");
            foreach (var kitchenProduct in kitchenProductsOrderedByStockedQuantity)
            {
                Console.WriteLine(kitchenProduct.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var kitchenProduct in kitchenProductsOrderedByStockedQuantityFunctional)
            {
                Console.WriteLine(kitchenProduct.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 7                                  */
            /*  Get a list of computer products that cost more       */
            /*  than $100.                                           */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n7. Computer products costing more than $100:");

            var computerProductsCostingMoreThan100 = from product in products where product.Category == ProductCategory.Computers & product.Price > 100.00 select product;
            var computerProductsCostingMoreThan100Functional = products.Where(product => (product.Category == ProductCategory.Computers) & (product.Price > 100.00));

            Console.WriteLine("Non-functional:");
            foreach (var computerProduct in computerProductsCostingMoreThan100)
            {
                Console.WriteLine(computerProduct.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var computerProduct in computerProductsCostingMoreThan100Functional)
            {
                Console.WriteLine(computerProduct.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 8                                  */
            /*  Get the title of the product with an ID of 3152.     */
            /*                                                       */
            /*  Note: try to find a way to get one value rather than */
            /*  an array of values as a result.                      */
            /*-------------------------------------------------------*/
            // Ref: https://stackoverflow.com/questions/7809745/linq-code-to-select-one-item

            Console.WriteLine("\n8. Title of product with an ID of 3152:");

            var productTitleWithID3152 = (from product in products where product.ID == 3152 select product.Title).Single();
            var productTitleWithID3152Functional = products.Where(product => product.ID == 3152).Select(product => product.Title).Single();

            Console.WriteLine("Non-functional:");
            Console.WriteLine(productTitleWithID3152);

            Console.WriteLine("Functional:");
            Console.WriteLine(productTitleWithID3152);

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 9                                  */
            /*  Get a list of products with titles that are longer   */
            /*  than 50 characters.                                  */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n9. List of products with titles longer than 50 characters:");

            var productsWithTitlesLongerThan50 = from product in products where product.Title.Length > 50 select product;
            var productsWithTitlesLongerThan50Functional = products.Where(product => product.Title.Length > 50);

            Console.WriteLine("Non-functional:");
            foreach (var product in productsWithTitlesLongerThan50)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var product in productsWithTitlesLongerThan50Functional)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 10                                 */
            /*  Get a list of Pet products ordered by price from     */
            /*  lowest to highest.                                   */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n10. List of Pet products ordered by price from lowest to highest:");

            var petProductsLowestToHighestPrice = from product in products where product.Category == ProductCategory.Pet orderby product.Price ascending select product;
            var petProductsLowestToHighestPriceFunctional = products.Where(product => product.Category == ProductCategory.Pet).OrderBy(product => product.Price);

            Console.WriteLine("Non-functional:");
            foreach (var petProduct in petProductsLowestToHighestPrice)
            {
                Console.WriteLine(petProduct.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var petProduct in petProductsLowestToHighestPriceFunctional)
            {
                Console.WriteLine(petProduct.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 11                                 */
            /*  Get a list of products with product IDs in range of  */
            /*  2000 to 2999 (inclusive of endpoints) ordered by ID. */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n11. List of products with IDs in range 2000 to 2999 ordered by ID:");

            var productsInIDRange2000To2999OrderedByID = from product in products where product.ID >= 2000 & product.ID <= 2999 orderby product.ID select product;
            var productsInIDRange2000To2999OrderedByIDFunctional = products.Where(product => (product.ID >= 2000 & product.ID <= 2999)).OrderBy(product => product.ID);

            Console.WriteLine("Non-functional:");
            foreach (var product in productsInIDRange2000To2999OrderedByID)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("Functional:");
            foreach (var product in productsInIDRange2000To2999OrderedByIDFunctional)
            {
                Console.WriteLine(product.ToString());
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 12                                 */
            /*  Get a list of titles for products with IDs in range  */
            /*  of 2000 to 2999 (inclusive of endpoints) ordered by  */
            /*  title length.                                        */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n12. List of titles for products with IDs in range 2000 to 2999 ordered by title length:");

            var titlesForProductsInIDRange2000To2999OrderedByTitleLength = from product in products where product.ID >= 2000 & product.ID <= 2999 orderby product.Title.Length ascending select product.Title;
            var titlesForProductsInIDRange2000To2999OrderedByTitleLengthFunctional = products.Where(product => (product.ID >= 2000 & product.ID <= 2999)).OrderBy(product => product.Title.Length).Select(product => product.Title);

            Console.WriteLine("Non-functional:");
            foreach (var title in titlesForProductsInIDRange2000To2999OrderedByTitleLength)
            {
                Console.WriteLine(title);
            }

            Console.WriteLine("Functional:");
            foreach (var title in titlesForProductsInIDRange2000To2999OrderedByTitleLengthFunctional)
            {
                Console.WriteLine(title);
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 13                                 */
            /*  Get a list of product titles and stocked quantity    */
            /*  for products that have less than 20 in stock.        */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n13. Titles and stocked quantity for products with less than 20 in stock:");

            var lowStock = from product in products where product.StockedQuantity < 20 select new { Title = product.Title, StockedQuantity = product.StockedQuantity };
            var lowStockFunctional = products.Where(product => product.StockedQuantity < 20).Select(product => new { Title = product.Title, StockedQuantity = product.StockedQuantity });

            Console.WriteLine("Non-functional:");
            foreach (var productInfo in lowStock)
            {
                Console.WriteLine(productInfo);
            }

            Console.WriteLine("Functional:");
            foreach (var productInfo in lowStockFunctional)
            {
                Console.WriteLine(productInfo);
            }

            Console.WriteLine("----------------------------------------------------");

            /*-------------------------------------------------------*/
            /*  Practice Item ID: 14                                 */
            /*  Get a list of product titles and stocked quantity    */
            /*  for products that have less than 20 in stock ordered */
            /*  by stocked quantity ascending.                       */
            /*-------------------------------------------------------*/

            Console.WriteLine("\n14. Titles and stocked quantity for products with less than 20 in stock ordered by stock ascending:");

            var lowStockOrderedByStockedQuantity = from product in products where product.StockedQuantity < 20 orderby product.StockedQuantity select new { Title = product.Title, StockedQuantity = product.StockedQuantity };
            var lowStockOrderedByStockedQuantityFunctional = products.Where(product => product.StockedQuantity < 20).OrderBy(product => product.StockedQuantity).Select(product => new { Title = product.Title, StockedQuantity = product.StockedQuantity });

            Console.WriteLine("Non-functional:");
            foreach (var productInfo in lowStockOrderedByStockedQuantity)
            {
                Console.WriteLine(productInfo);
            }

            Console.WriteLine("Functional:");
            foreach (var productInfo in lowStockOrderedByStockedQuantityFunctional)
            {
                Console.WriteLine(productInfo);
            }

            Console.WriteLine("----------------------------------------------------");

        }
    }
}
