#include <stdio.h>
#include <stdlib.h>
int main(int argc, char const *argv[])
{

    size_t N = 1000;
    
    int *a = malloc(N * sizeof(int));
    
    if (a == NULL)
    {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }
    
    for (size_t i = 0; i < N; i++)
    {
        a[i] = i;
    }
    
    double sum = 0;
    for (size_t i = 0; i < N; i++)
    {
        sum += (double) a[i];
    }
    printf("Sum: %f\n", sum);
    printf("Average: %f\n", sum / N);
    
    free(a);
    
    a = NULL;

    return 0;
}
