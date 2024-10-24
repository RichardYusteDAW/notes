public class Color {

    // Attributes
    private static final String RESET = "\u001B[0m";
    private static final String RED = "\u001B[31m";
    private static final String GREEN = "\u001B[32m";
    private static final String BLUE = "\u001B[34m";

    // Methods
    public static void red(String text) {
        System.out.println(RED + text + RESET);
    }

    public static void green(String text) {
        System.out.println(GREEN + text + RESET);
    }

    public static void blue(String text) {
        System.out.println(BLUE + text + RESET);
    }
}