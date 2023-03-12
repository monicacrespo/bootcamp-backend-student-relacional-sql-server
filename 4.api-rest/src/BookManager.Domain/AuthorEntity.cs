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
        public string Name { get; set; } = null!;
        public string Surname { get; set; } = string.Empty;
        public DateTime Birth { get; set; }

        [StringLength(2, ErrorMessage = "The {0} value cannot exceed {1} characters. ")]
        public string CountryCode { get; set; } = string.Empty;

        // Navigation properties
        public List<BookEntity> Books { get; set; } = new();
    }
}