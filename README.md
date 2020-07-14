# Dokumentacja

## Struktura folderów

_"In general, large projects work best with data locality. Having all images in one folder, all scenes in another, and all scripts in another becomes hell once projects start to grow. Just put in a same folder all scripts, scenes, images, assets, etc. that are related."_

~reduz

Dla małych projektów prosty podział folderów na tekstury, dźwięki, sceny, skrypty itd. przeważnie bywa wystarczający, lecz dla lepszej organizacji zaleca się umieszczanie wszystkich plików lokalnie tzn. wszystkie pliki związane z graczem(tekstury, sceny, skrypty) trafiają do folderu gracza("Player") oraz do jego podfolderów.

## Nazewnictwo

### Język

W dużej większości przypadków należy używać języka angielskiego. Wyjątkiem są komentarze programistów, pisane dla wygody w języku polskim oraz commity na GitHubie.

### System plików

|                 |            |
|-----------------|------------|
| Foldery         | PascalCase |
| Sceny           | PascalCase |
| Skrypty         | snake_case |
| Pliki graficzne | snake_case |
| Pliki dźwiękowe | snake_case |
| Zasoby          | snake_case |

### Kod

|                  |             |
|------------------|-------------|
| Klasy            | PascalCase  |
| Funkcje          | snake_case  |
| Zmienne          | snake_case  |
| Stałe            | UPPER_CASE  |
| Sygnały          | snake_case  |
| Enumy            | PascalCase  |
| Wartości enumów  | UPPER_CASE  |

### Sugestie

Pliki graficzne dobrze zaczynać od litery odpowiadającej zastowsowaniu assetu np. e_zombie (prefiks **e**, bo **e**nemy).

Jeżeli w kodzie chcemy podkreślić, że określona funkcja lub zmienna jest "prywatna", nazwę należy rozpocząć od prefiksu podłogi '_'.

Zalecane jest unikanie używania oczywistych określeń w nazwach np. lepszą nazwą dla pliku "s_boom_sound.wav" byłoby po prostu "boom.wav"(wiadomo, że to dźwięk ze względu na format ".wav").

## Zalecenia dla programistów

### Kolejność elementów skryptu

Inspirowane [tym](https://docs.godotengine.org/pl/stable/getting_started/scripting/gdscript/gdscript_styleguide.html#code-order) ułożeniem z dokumentacji Godota.

1. tool
2. extends
3. class_name
4. signals
5. enums
6. constants
7. exported general variables
8. exported PackedScenes
9. exported NodePaths
10. public variables
11. private variables
12. onready variables
13. _init
14. _ready
15. other built-in virtual methods
16. public methods
17. private methods
18. signal handlers

### Static typing

Zobacz [tutaj.](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/static_typing.html#doc-gdscript-static-typing)

_"Typed GDScript and dynamic GDScript can coexist in the same project. But I recommended to stick to either style for consistency in your codebase, and for your peers. It's easier for everyone to work together if you follow the same guidelines, and faster to read and understand other people's code."_

~dokumentacja Godot'a

```python
# przypisywanie typu zmiennej
var x: int
# skrót
var x := 42
# przypisywanie typu stałej
const x := 42

# przypisywanie zwracanego typu funkcji
func foo() -> int:
    return 0
func foo() -> void:
    return
# przypisywanie typu argumentom funkcji
func foo(arg: int) -> void:
    return
# argument domyślny
func foo(arg := 42) -> void:
    return

# eksportowanie zmiennych z typem
export var name: String
# skrót
export var name := "Bob"
# przykład
export var timer_path: NodePath
onready var timer := get_node(timer_path) as Timer
```

Zaleca się zawsze przypisywać domyślną wartość zmiennej z typem.

Istnieje wiele miejsc, w których static typing jeszcze nie został zaimplementowany, np. nie da się zdefiniować typu argumentów sygnału oraz typu elementów tablicy.

Bardzo przydatnym skrótem jest ta linijka kodu:
```python
export(NodePath) var timer = get_node(timer) as Timer
```
Umożliwia ona uzyskanie referencji do węzła przy użyciu jednej zmiennej. Niestety w jej wypadku static typing również **nie** działa. Jest to akceptowalny wyjątek do używania.

### Schludność kodu

Zobacz [tutaj.](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_styleguide.html)

### Komentarze

Programista pisząc komentarz powinien po znaku '#' postawic spację. Odróżnia to zwykłe komentarze od "wykomentowanego" przy użyciu CTRL + K kodu.

W celu dodania kilkulinijkowego opisu należy użyć docstring, np.:
```python
"""
To oto jest
wielolinijkowy
komentarz.
"""
```
