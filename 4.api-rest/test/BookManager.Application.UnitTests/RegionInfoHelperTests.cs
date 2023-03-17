namespace BookManager.Application.UnitTests
{
    using BookManager.Application.Extensions;

    public class RegionInfoHelperTests
    {      
        [Theory]
        [InlineData("ES", true)]
        [InlineData("XX", false)]
        [InlineData("", false)]
        [InlineData("ESS", false)]
        public void Given_CountryCode_The_Validation_Is_As_Expected(string countryCode, bool expected)
        {
            var result = countryCode.TryParseRegionInfo(out var region);

            Assert.Equal(expected, result);
        }
    }
}
