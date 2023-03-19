namespace BookManager.Application
{
    using BookManager.Application.Models;
    using BookManager.Application.Validators;
    using BookManager.Domain;
    using FluentValidation;
    using Microsoft.AspNetCore.Identity;
    using System.Runtime.InteropServices;
    using System.Threading.Tasks;

    public class BookManagerService
    {
        private readonly IBookManagerDbContext _bookManagerDbContext;

        public BookManagerService(IBookManagerDbContext bookManagerDbContext)
        {
            _bookManagerDbContext = bookManagerDbContext;
        }

        public async Task<int> CreateAuthor(Author author)
        {
            AuthorEntity authorEntity = new AuthorEntity
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
       
        public async Task<int> UpdateBook(int id, string? title, string? description)
        {
            BookEntity? bookEntity = await GetBook(id);

            if (bookEntity == null)
            {
                return -1; // book not found
            }

            if (title == null && description == null)
            {
                return -2; // nothing to update
            }
            
            if (!string.IsNullOrWhiteSpace(title?.Trim()))
            { 
                bookEntity.Title = title; 
            }

            if (!string.IsNullOrWhiteSpace(description?.Trim()))
            {
                bookEntity.Description = description;
            }

            _bookManagerDbContext.Books.Update(bookEntity);
            await _bookManagerDbContext.SaveChangesAsync();

            return id;
        }

        public async Task<BookEntity?> GetBook(int bookId)
        {
            return await _bookManagerDbContext
                .Books
                .FindAsync(bookId);
            //return (bookEntity == null)
            //    ? null
            //    : new Book
            //    {
            //        Title = bookEntity.Title,
            //        Description = bookEntity.Description,
            //        PublishedOn = bookEntity.PublishedOn,
            //        AuthorId = bookEntity.AuthorId
            //    };
        }
    }
}