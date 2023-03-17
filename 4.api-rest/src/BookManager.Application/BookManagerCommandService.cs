namespace BookManager.Application
{
    using BookManager.Application.Extensions;
    using BookManager.Application.Models;
    using BookManager.Domain;
    using System.Threading.Tasks;

    public class BookManagerCommandService
    {
        private readonly IBookManagerDbContext _bookManagerDbContext;

        public BookManagerCommandService(IBookManagerDbContext bookManagerDbContext)
        {
            _bookManagerDbContext = bookManagerDbContext;
        }

        public async Task<int> CreateAuthor(Author author)
        {
            bool isCountryCodeValid = author.CountryCode.TryParseRegionInfo(out var region);
            if (!isCountryCodeValid) return -1;

            var authorEntity = new AuthorEntity
            {
                FirstName = author.FirstName,
                LastName = author.LastName,
                DateOfBirth = author.DateOfBirth,
                CountryCode = author.CountryCode
            };

            _bookManagerDbContext.Authors.Add(authorEntity);
            await _bookManagerDbContext.SaveChangesAsync();

            return authorEntity.Id;
        }
        public async Task<int> CreateBook(Book book)
        {
            var bookEntity = new BookEntity
            {
                Title = book.Title,
                PublishedOn = book.PublishedOn,
                Description = book.Description,
                AuthorId = book.AuthorId
            };

            _bookManagerDbContext.Books.Add(bookEntity);
            await _bookManagerDbContext.SaveChangesAsync();

            return bookEntity.Id;
        }
    }
}