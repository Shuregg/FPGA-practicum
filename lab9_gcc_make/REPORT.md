# GCC

## 1. Этапы компиляции

### 1. Предобработка (Препроцессор (cpp))
Вставка содержимого файлов, подключенных с помощю директивы `#include`, а также подстановка значений в макросах, определённых через `#define`.

`cpp hello.c > hello.i`

### 2. Компиляция (Компилятор (gcc/g++))
Компиляция исходного кода в набор машинных инструкций на языке ассемблера.

`gcc -S hello.i`

### 3. Трансляция (Ассемблер (as))
Трансляция  ассемблерного кода в машинный.

`as -o hello.o hello.s`

### 4. Компоновка (Linker/Линковщик (ld))
Установка связей между вызовами функций в основной программе и их реализацией в подключаемых библиотеках.

`gcc -o hello hello.o`

## 2. Компиляция кода из нескольких файлов
`gcc -c src/hello.c src/main.c -Iinc`
`gcc -o hello hello.o main.o`

## 3. Сборка и использование статических библиотек
Получение объектного файла из hello.c

`gcc -c src/hello.c -Iinc -o hello.o`

Создание статической библиотеки
`ar rcs libhello.a hello.o`

Компиляция main.c
`gcc -c src/main.c -Iinc -o main.o`

Компоновка вместе с библиотекой
`gcc main.o -L./ -lhello -o hello`

## 4. Сборка и использование динамических библиотек
Компиляция объектного файла в виде позиционно-независимого кода

`gcc -c -fpic src/hello.c -Iinc -o hello.o`

Компоновка позиционно-независимого кода в динамическую библитотеку

`gcc -shared hello.o -o libhello.dll`

Объектный файл main.c
`gcc main.o -L./ -lhello -o hello`

Сборка итогового проекта

`gcc main.o -L./ -lhello -o hello`


>**/usr/bin/ld: cannot find -lhello: No such file or directory**
>**collect2: error: ld returned 1 exit status**

## 5. Отладка программы
Основная программа:
```c
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

void print_chars(int num_of_chars) {
    char *str = NULL;
    str = (char *)malloc((num_of_chars + 1) * sizeof(char));
    for (int i = 0; i < num_of_chars; ++i) {
      str[i] = 'a' + i;
    }
    str[num_of_chars] = '\0';
    printf("%s", str);
    free(str);
}
```

### Сборка файла с отладочной информацией
`gcc main.c -output main -g` with err

`gcc main.c -o main -g`

trying to launch programm
`./main 5`
>Segmentation fault

### Запуск через отладчик
`gdb -q main` где `-q` - quiet (без стартового сообщения)

>Reading symbols from main...

### Запуск программы в отладчике
Запускаем программу с тем же аргументом `5`
> (gdb) `run 5`

>Starting program: main 5
>Program received signal SIGSEGV, Segmentation fault.
>print_chars (num_of_chars=-5) at ./main.c:29
>29	    str[num_of_chars] = '\0';

Ошибка произошла при вызове функции `print_chars`. Выведем исходный код этой фукнции.
```
(gdb) list print_chars
17	    print_chars(a);
18	    return 0;
19	}
20	
21	void print_chars(int num_of_chars)
22	{
23	    char *str = NULL;
24	    str = (char *)malloc((num_of_chars + 1) * sizeof(char));
25	    for (int i = 0; i < num_of_chars; ++i)
26	    {
(gdb) list
27	      str[i] = 'a' + i;
28	    }
29	    str[num_of_chars] = '\0';
30	    printf("%s", str);
31	    free(str);
32	}
```

### Установка точек останова
* на входе в функцию;
* внутри цикла `for`, когда итератор `i > 2`;
* на строке, вызвавшей падение программы.

>Для установки используется `break` или `b`


>(gdb) `b print_chars`
>Breakpoint 1 at 0x55555555526d: file ./main.c, line 23.
>(gdb) `b 27 if i>2`
>Breakpoint 2 at 0x555555555292: file ./main.c, line 27.
>(gdb) `b 29`
>Breakpoint 3 at 0x5555555552b5: file ./main.c, line 29.

>(gdb) `run 5`
>The program being debugged has been started already.
>Start it from the beginning? (y or n) `y`
>Starting program: main 5
>
>Breakpoint 1, print_chars (num_of_chars=-5) at ./main.c:23
>23	    char *str = NULL;

* `next`     или `n` - выполнение кода программы до следующей строчки (step over);
* `step`     или `s` - выполнение кода со входом внутрь функции (step into);
* `continue` или `c` - выполнение до следующей точки останова.
* `print`    или `p` - вывод значения переменной.
* `run` or `r` - run a programm

`b 17`

>(gdb) `p a`
>\$1 = -5
>(gdb) `p a=5`
>\$2 = 5
>(gdb) `step`
>
>Breakpoint 1, print_chars (num_of_chars=5) at ./main.c:23
>23	    char *str = NULL;

`clear` - удаление конкретной точки останова
`delete` - удаление всех
## 6. Автоматизация сборки проекта

```makefile
hello.o: src/hello.c
	gcc -c -Iinc ./src/hello.c

main.o: src/main.c
	gcc -c -Iinc ./src/main.c

hello: main.o hello.o
	gcc main.o hello.o -o hello
```
`make hello`
## 7. Кроссплатоформенная компиляция

## 8. ELF - Executable and Linkable Format