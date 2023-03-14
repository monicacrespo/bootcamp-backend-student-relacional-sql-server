namespace BookManager.Application
{
    using BookManager.Application.Models;
    using BookManager.Domain;
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
    using System.Text;
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
    }
}