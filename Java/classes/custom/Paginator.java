public record Paginator<T>(
        List<T> data,
        Integer total,
        Integer currentPage,
        Integer pageSize,
        String next,
        String previous) {

    // Constructor
    public Paginator(List<T> data, Integer total, Integer currentPage, Integer pageSize, String baseUrl) {
        this(data, total, currentPage, pageSize,
                createNextLink(baseUrl, currentPage, pageSize, total),
                createPreviousLink(baseUrl, currentPage, pageSize));
    }

    // Methods
    private String createNextLink(String baseUrl) {
        if (currentPage * pageSize < total) {
            return baseUrl + "?page=" + (currentPage + 1) + "&size=" + pageSize;
        }
        return null;
    }

    private String createPreviousLink(String baseUrl) {
        if (currentPage > 1) {
            return baseUrl + "?page=" + (currentPage - 1) + "&size=" + pageSize;
        }
        return null;
    }
}