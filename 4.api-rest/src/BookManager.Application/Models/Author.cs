namespace BookManager.Application.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    public class Author
    {    
        public string FirstName { get; set; } = String.Empty;
        public string LastName { get; set; } = String.Empty;
        public DateTime DateOfBirth { get; set; }

        [StringLength(2, ErrorMessage = "The {0} value cannot exceed {1} characters. ")]
        public string CountryCode { get; set; } = String.Empty;
    }
}
