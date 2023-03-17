namespace BookManager.Controllers
{
    using BookManager.Application;
    using BookManager.Application.Models;
    using Microsoft.AspNetCore.Mvc;
    using System.Net;
    using System.Net.Mime;

    [Route("api")]
    public class BookManagerController
            : ControllerBase
    {
        private readonly BookManagerCommandService _bookManagerService;
        public BookManagerController(BookManagerCommandService bookManagerService)
        {
            _bookManagerService = bookManagerService;
        }



        [HttpPost("authors")]
        [Consumes(MediaTypeNames.Application.Json)]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> CreateAuthor([FromBody] Author author)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var id = await _bookManagerService.CreateAuthor(author);
            return Ok(id);
        }

        [HttpPost("books")]
        public async Task<IActionResult> CreateBook([FromBody] Book book)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var id = await _bookManagerService.CreateBook(book);

            return Ok(id);
        }
    }
}