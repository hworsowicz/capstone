namespace Capstone.Models
{
    public class CoffeeShop
    {
        public int ShopId { get; set; }
        public string ShopName { get; set; }
        public string ShopLocation {get;set;}
        public string About { get; set; }
        public bool HasSpirits { get; set; }
        public string ImagePath { get; set; }

        public string HoursWeekdays { get; set; }
        public string HoursWeekends { get; set; }
        public int PriceRange { get; set; }
        public string Website { get; set; }

     
    }
}
