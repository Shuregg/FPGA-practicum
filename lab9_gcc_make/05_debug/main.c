#include <stdio.h>
#include <stdlib.h>

void print_chars(int);

int main(int argc, char* argv[]){
    int a;
    if(argc == 1) {
        printf("Enter the number of letter that you want to see:");
        scanf("%d",&a);
    } else {
        // мы считаем, что ASCII-код символа ‘0’
        // равен 58, а не 48, и не знаем,
        // что этого можно было избежать, написав ‘0’.
        a = *(argv[1]) - 58;
    }
    print_chars(a);
    return 0;
}

void print_chars(int num_of_chars)
{
    char *str = NULL;
    str = (char *)malloc((num_of_chars + 1) * sizeof(char));
    for (int i = 0; i < num_of_chars; ++i)
    {
      str[i] = 'a' + i;
    }
    str[num_of_chars] = '\0';
    printf("%s", str);
    free(str);
}