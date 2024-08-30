public class BinarySearch {
    /**
     * Realiza a busca binária em um array de inteiros ordenado.
     *
     * @param array O array ordenado no qual realizar a busca.
     * @param target O valor a ser encontrado.
     * @return O índice do valor encontrado ou -1 se não encontrado.
     */
    public static int binarySearch(int[] array, int target) {
        return binarySearchHelper(array, target, 0, array.length - 1);
    }

    /**
     * Função recursiva auxiliar para realizar a busca binária.
     *
     * @param array O array ordenado.
     * @param target O valor a ser encontrado.
     * @param left O índice inicial do intervalo de busca.
     * @param right O índice final do intervalo de busca.
     * @return O índice do valor encontrado ou -1 se não encontrado.
     */
    private static int binarySearchHelper(int[] array, int target, int left, int right) {
        if (left > right) {
            return -1; // Valor não encontrado
        }
        int mid = left + (right - left) / 2; // Calcula o índice do meio
        if (array[mid] == target) {
            return mid; // Valor encontrado, retorna o índice
        } else if (array[mid] > target) {
            return binarySearchHelper(array, target, left, mid - 1); // Busca na metade esquerda
        } else {
            return binarySearchHelper(array, target, mid + 1, right); // Busca na metade direita
        }
    }
}