public class LinearSearch {
    /**
     * Realiza a busca linear em um array de inteiros.
     *
     * @param array O array no qual realizar a busca.
     * @param target O valor a ser encontrado.
     * @return O índice do valor encontrado ou -1 se não encontrado.
     */
    public static int linearSearch(int[] array, int target) {
        for (int i = 0; i < array.length; i++) {
            if (array[i] == target) {
                return i; // Valor encontrado, retorna o índice
            }
        }
        return -1; // Valor não encontrado
    }
}