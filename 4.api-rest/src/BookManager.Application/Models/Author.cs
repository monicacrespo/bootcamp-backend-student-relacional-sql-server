namespace BookManager.Application.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class Author
    {
        public string FirstName { get; set; } = String.Empty;
        public string LastName { get; set; } = String.Empty;
        public DateTime? DateOfBirth { get; set; }

        [StringLength(2, ErrorMessage = "The {0} value cannot exceed {1} characters. ")]
        public string CountryCode { get; set; } = String.Empty;
    }
}