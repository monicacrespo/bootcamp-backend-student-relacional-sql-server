namespace BookManager.Domain
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class AuthorEntity
    {
        public int Id { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = string.Empty;
        public DateTime? DateOfBirth { get; set; }
        
        public string CountryCode { get; set; } = string.Empty;

        // Navigation properties
        public List<BookEntity> Books { get; set; } = new();
    }
}