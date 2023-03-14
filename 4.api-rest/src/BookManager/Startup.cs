namespace BookManager
{
    using BookManager.Application;
    using BookManager.Persistence.SqlServer;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    public class Startup
    {
        private readonly IConfiguration _configuration;

        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // Dependency Injection Container
        public void ConfigureServices(IServiceCollection services)
        {
            var booksConnectionString =
                _configuration.GetValue<string>("ConnectionStrings:BooksDatabase");

            var websocketHostUrl = _configuration.GetValue<string>("WebsocketHostUrl");

            if (websocketHostUrl is null)
            {
                throw new ApplicationException();
            }

            services
                .AddTransient<INotificationService>(sp =>
                    new NotificationService(new NotificationServiceConfiguration { Host = websocketHostUrl }))
                .AddTransient<BookManagerCommandService>()            
                .AddDbContext<BookManagerDbContext>(options =>
                {
                     options.UseSqlServer(booksConnectionString);
                })
                .AddScoped<IBookManagerDbContext, BookManagerDbContext>()            
                .AddControllers();
        }
        
        // Middleware pipeline
        public void Configure(IApplicationBuilder app)
        {
            app.UseRouting();                

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}