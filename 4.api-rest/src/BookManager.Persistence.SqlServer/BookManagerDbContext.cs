namespace BookManager.Persistence.SqlServer
{
    using BookManager.Application;
    using BookManager.Domain;
    using Microsoft.EntityFrameworkCore;
   
    public class BookManagerDbContext: DbContext, IBookManagerDbContext
    {
        public BookManagerDbContext(DbContextOptions<BookManagerDbContext> options)
        : base(options)
        {
        }

        public DbSet<BookEntity> Books { get; set; } = null!;
        public DbSet<AuthorEntity> Authors { get; set; } = null!;
       
        public Task<int> SaveChangesAsync()
        {
            return base.SaveChangesAsync();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder
                .Entity<BookEntity>()
                .HasOne(m => m.Author);               
        }
    }
}