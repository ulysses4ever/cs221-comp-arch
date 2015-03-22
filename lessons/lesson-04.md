[//]: <> ( assignment id: 9881 )

### Введение: ограничения для подпрограмм, конвенции вызова

При формулировке пролога и эпилога подпрограммы указывалось на необходимость сохранения «старого» значения регистра `BP` на стеке. Возникает вопрос:

(@)  Нужно ли сохранять значения других регистров и если да, то всех или некоторых?

На самом деле, можно задать ещё несколько похожих «инфраструктурных» вопросов:

(@) Должны ли передаваться параметры через стек или через регистры, если последних хватает (ведь регистры быстрей).

(@)  Если параметры передаются через стек, нужно ли складывать их туда в обратном порядке (как мы делали на прошлом занятии) или в прямом.

(@)  Где должен располагаться код очистки стека от аргументов подпрограммы, в вызывающем коде после вызова `CALL` (как мы делали на прошлом занятии) или в самой подпрограмме в эпилоге (для этого существует специальная форма инструкции `ret` с одним целочисленным параметром, который указывает, сколько байтов надо снять в дополнение к снятому адресу возврата).

Набор конкретных ответов на эти четыре вопроса называется [конвенцией вызова подпрограмм](http://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%B3%D0%BB%D0%B0%D1%88%D0%B5%D0%BD%D0%B8%D0%B5_%D0%BE_%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%D0%B5). Существует несколько вариантов конвенций, каждая носит своё имя. Очень важно, чтобы подпрограммы, которые обычно пишутся одними людьми, и вызывающий код (в том числе в других подпрограммах), который пишется другими людьми, использовали одну конвенцию вызова. При использовании языков высокого уровня типа C на это можно влиять с помощью компилятора.

По умолчанию большинство компиляторов с языка C используют конвенцию, которая известна под именем **cdelc** (от C declaration), её мы и будем придерживаться в данной лабораторной работе и далее:

1.  Подпрограмма может «портить» регистры `AX`, `CX`, `DX`, значения остальных регистров она обязана сохранять: обычно по аналогии с сохранением `BP` для этого используется стек. Результат функций возвращается в `AX`. В этих условиях, если в вызывающем коде используются перечисленные регистры, перед вызовом любой подпрограммы их значения должны сохраняться (также на стеке).
2.  Параметры всегда передаются через стек.
3.  Параметры складываются справа-налево (как в прошлой лабораторной).
4.  Очистка стека от параметров остаётся для вызывающего кода (как в прошлой лабораторной).

Примем ещё одно соглашение, которое стараются выдерживать в большинстве профессиональных проектов:

* Подпрограмма не должна использовать глобальные переменные. Если подпрограмме нужны переменные для хранения промежуточных вычислений, она использует для их хранения стек.

### Часть 1. Разминка [1 балл]

1.  [task-1.s] Создайте процедуру `SWAP`, которая получает адреса двух слов и меняет их местами. Помните о необходимости сохранять старые значения регистров, которые вы собираетесь использовать (кроме `AX`/`CX`/`DX`).

2.  [task-2.s на основе task-1.s] Создайте процедуру `SWAP_ARRAYS`, которая меняет местами содержимое двух массивов одинаковой длины поэлементно. Параметры процедуры: адреса двух массивов и их длина. Для перестановки пары элементов используйте процедуру `SWAP` из прошлого задания. В основной программе используйте `SWAP_ARRAYS` для двух массивов, объявленных в секции данных. После этого распечатайте их с помощью процедуры печати массива из занятия 3 (task-extra-2.s).

### Часть 2. Переменное число параметров подпрограммы [1 балл]

1.  [task-3.s] Создайте функцию `SUM`, которая принимает целое число _N_ и складывает _N_ чисел, которые лежат на стеке после _N_. В основной программе загрузите на стек массив и его размер и вызовите `SUM`. Результат распечатайте на консоль.

### Часть 3. Передача адресов подпрограмм в другие подпрограммы [1 балл]

1.  [task-4.s] Создайте функцию _F_, которая вычисляет значение выражения $4x^4 - 9x^2-5$, где _x_ — параметр функции. Умножение/деление на степени двойки реализуются с помощью битовых сдвигов.

2.  [task-5.s на основе task-4.s] Создайте процедуру `MAP`, которая получает два массива одинаковой длины и функцию, которую она применяет к каждому элементу первого массива. Результат применения функции записывается в соответствующий элемент второго массива. Для передачи адреса применяемой функции значение её метки нужно положить на стек, а внутри `MAP` вызвать эту функцию косвенно, указав в качества операнда `CALL` место в стеке, где лежит адрес этой функции (например `4(BP)`, если адрес функции передан в качестве первого аргумента `MAP`). В основной программе продемонстрируйте работу `MAP` для произвольного массива и функции _F_ из прошлой задачи. Массивы передаются своими адресами, их длина передаётся один раз (поскольку она одинакова у обоих массивов).

### Часть 4. Дополнительные задачи

1.  [task-extra-1-cdecl.s, task-extra-1-pascal.s] Создайте функцию `MAX` для определения наибольшего из двух аргументов в двух вариантах: один вариант с конвенцией вызова cdecl, а второй — который использует конвенции вызова pascal. Справку по последним можно получить в [Википедии](http://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%B3%D0%BB%D0%B0%D1%88%D0%B5%D0%BD%D0%B8%D0%B5_%D0%BE_%D0%B2%D1%8B%D0%B7%D0%BE%D0%B2%D0%B5#pascal). Для второго случая вам понадобится использовать форму инструкции `ret` с целочисленным операндом, указывающим количество снимаемых со стека байт для очистки стека от аргументов.

2.  [task-extra-2.s] Создайте функцию `DIVIDES_2_TO_N`, которая в качестве аргументов принимает два целых числа, _X_ и _N_ и возвращает 1, если _X_ делится на 2<sup>_N_</sup> и 0 в противном случае. Указание: в цикле из максимум _N_ шагов следует делать сдвиг вправо на одну позиция и если взведён флаг carry, то завершать цикл вместе со всей функцией, возвращая результат 0; если цикл пройдёт все _N_ шагов и этот флаг ни разу не взведётся, то результат равен 1.