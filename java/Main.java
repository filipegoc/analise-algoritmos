import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        // Tamanhos dos arrays para testar (mantidos dentro do intervalo de int)
        int[] sizes = {
                1000,
                10000,
                100000,
                1000000,
                10000000,
                100000000,
                1000000000,
        };
        int numIterations = 10000; // Número de iterações para cada tamanho

        // Cria o arquivo para salvar os logs
        FileWriter writer = null;
        try {
            Random rand = new Random();

            for (int size : sizes) {
                writer = new FileWriter("search_logs" + size + ".txt", true); // Abrir o arquivo em modo de append (adicionar conteúdo)

                // Cabeçalho do arquivo de logs
                writer.write("size: {target, binarySearch, linearSearch}\n");

                writer.write("Array Size: " + size + "\n");

                for (int i = 0; i < numIterations; i++) {
                    // Gera um vetor grande de inteiros ordenados
                    int[] array = generateSortedArray(size);

                    // Define o valor a ser buscado
                    int target = array[rand.nextInt(array.length)];

                    // Medindo o tempo da Busca Linear
                    long startTime = System.nanoTime();
                    LinearSearch.linearSearch(array, target);
                    long endTime = System.nanoTime();
                    long durationLinear = endTime - startTime;

                    // Medindo o tempo da Busca Binária
                    startTime = System.nanoTime();
                    BinarySearch.binarySearch(array, target);
                    endTime = System.nanoTime();
                    long durationBinary = endTime - startTime;

                    // Salvando os resultados no formato {target, timeBinarySearch, timeLinearSearch}
                    writer.write("{" + target + ", " + durationBinary + ", " + durationLinear + "}\n");

                    System.out.println("Logs salvos para o tamanho do array " + size + ", iteração " + (i + 1));
                }
            }

        } catch (IOException e) {
            System.out.println("Erro ao salvar os logs: " + e.getMessage());
        } finally {
            // Fechando o FileWriter manualmente
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    System.out.println("Erro ao fechar o arquivo: " + e.getMessage());
                }
            }
        }
    }

    // Função para gerar um array de inteiros ordenado
    public static int[] generateSortedArray(int size) {
        int[] array = new int[size];
        for (int i = 0; i < size; i++) {
            array[i] = i;
        }
        return array;
    }
}