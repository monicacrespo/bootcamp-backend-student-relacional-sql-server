namespace BookManager.Application.Extensions
{
    using System.Globalization;

    public static class RegionInfoHelper
    {
        public static bool TryParseRegionInfo(this string input, out RegionInfo? regionInfo)
        {
            regionInfo = null;
            if (string.IsNullOrEmpty(input))
                return false;
            try
            {
                regionInfo = new RegionInfo(input);
                return true;
            }
            catch (ArgumentException)
            {
                return false;
            }
        }
    }
}
