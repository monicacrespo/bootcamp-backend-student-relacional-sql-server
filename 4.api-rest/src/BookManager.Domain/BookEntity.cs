namespace BookManager.Domain
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class BookEntity
    {
        public int Id { get; set; }

        public string Title { get; set; } = null!;

        public DateTime? PublishedOn { get; set; }

        public string Description { get; set; } = null!;

        public AuthorEntity Author { get; set; } = null!;

        public int AuthorId { get; set; }
    }
}