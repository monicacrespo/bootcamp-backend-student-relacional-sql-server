namespace BookManager.Application.Validators
{
    using BookManager.Application.Models;
    using FluentValidation;
    using System.Globalization;
    using System.Text.RegularExpressions;
    public class BookValidator : AbstractValidator<Book>
    {
        public BookValidator()
        {
            RuleFor(a => a.Title.Trim())
               .NotEmpty()
               .WithMessage("Title should not be empty")
               .Length(2, 150)
               .WithMessage("Title should have between {0} and {1} characters");

            RuleFor(a => a.Description.Trim())
               .NotEmpty()
               .WithMessage("Description should not be empty")
               .Length(2, 450)
               .WithMessage("Description should have between {0} and {1} characters");          
        }       
    }
}
