@Getter
public class Paginator<T> {

    // Attributes
    private List<T> data;
    private int total;
    private int currentPage;
    private int pageSize;
    private String next;
    private String previous;

    // Constructor
    public Paginator(List<T> data, int total, int currentPage, int pageSize, String baseUrl) {
        this.data = data;
        this.total = total;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.next = createNextLink(baseUrl);
        this.previous = createPreviousLink(baseUrl);
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