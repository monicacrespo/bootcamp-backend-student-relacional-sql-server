namespace BookManager.Controllers
{
    using BookManager.Application;
    using BookManager.Application.Models;
    using Microsoft.AspNetCore.Mvc;

    [Route("api/[controller]")]
    public class BookManagerController
            : ControllerBase
    {
        private readonly BookManagerCommandService _bookManagerService;
        public BookManagerController(BookManagerCommandService bookManagerService)
        {
            _bookManagerService = bookManagerService;
        }



        [HttpPost("authors")]
        public async Task<IActionResult> CreateAuthor([FromBody] Author author)
        {
            var id = await _bookManagerService.CreateAuthor(author);

            return Ok(id);
        }
    }
}