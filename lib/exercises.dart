/* 1. Generic fold accumulator
Create a generic function:
T accumulate<T>(Iterable<T> values, T initial, T Function(T, T) operation)

Requirements:
- It must use fold().
- It must work with different types.
Tests:
accumulate<int>([1, 2, 3, 4], 0, (a, b) => a + b);
// 10

accumulate<String>(["D", "a", "r", "t"], "", (a, b) => a + b);
// "Dart" */

//import dart:core;

void main() {

  T accumulate<T>(Iterable<T> values, T initial, T Function(T, T) operation) {
    return values.fold(initial, operation);
  }

  typedef thisType = int;

  dynamic toPrint = accumulate(<dynamic>[1, 2, 3, 4], 0 as dynamic, (dynamic previousValue, dynamic element) => previousValue + element);

  print(toPrint);

}

/* 2. Generic inventory filter
Create:
class Product {
  final String name;
  final double price;
  final bool available;

  Product(this.name, this.price, this.available);
}

Create:
List<T> filterAvailable<T>(
  Iterable<T> items,
  bool Function(T) predicate,
)

Requirements:
- use where;
- use a generic type;
- return a List<T>.
Example:
filterAvailable<Product>(
  products,
  (p) => p.available && p.price < 100,
);

3. Dynamic JSON-like parser
You receive:
final data = [
  {"name": "Sword", "damage": 50},
  {"name": "Potion", "damage": "none"},
  {"name": "Bow", "damage": 30},
];

Create a function that:
- extracts valid damage values;
- ignores invalid ones;
- calculates total damage using fold().
Rules:
- Use dynamic.
- Use casting:
(value as int)

- Do not assume every map is correct.
Expected:
80

4. Mixed-type list analyzer
Given:
final values = [
  10,
  "hello",
  3.5,
  true,
  20,
  "dart"
];

Create:
Map<String, int> analyze(Iterable<dynamic> values)

Return:
{
  "int": 2,
  "double": 1,
  "String": 2,
  "bool": 1
}

Requirements:
- use fold();
- use runtime type checks:
value is int

5. RPG character system
Create:
abstract class Character {
  int get power;
}

class Warrior implements Character {
  final int power;
}

class Mage implements Character {
  final int power;
}

Given:
List<Character> party;

Implement:
bool hasPowerfulMage(List<Character> party)

Requirements:
- use any();
- use type checking:
character is Mage

Expected logic:
"Does any member satisfy both conditions?"
6. Fold into a custom object
Create:
class Statistics {
  final int count;
  final double total;
  final double max;

  Statistics(this.count, this.total, this.max);
}

Given:
[10.5, 20.0, 5.5]

Use fold() to produce:
Statistics(
  count: 3,
  total: 36,
  max: 20
)

No loops.
7. Nullable values pipeline
Given:
List<String?> names = [
  "Alice",
  null,
  "Bob",
  null,
  "Charlie"
];

Create:
String result;

containing:
Alice,Bob,Charlie

Requirements:
- remove nulls;
- use whereType<String>();
- use fold().
8. Permission system
Create:
class User {
  final String name;
  final List<String> permissions;

  User(this.name, this.permissions);
}

Implement:
bool canDelete(List<User> users)

Rules:
- return true if any user has "delete" permission;
- use any();
- do not use loops.
9. Generic grouping
Implement:
Map<K, List<T>> groupBy<T, K>(
  Iterable<T> items,
  K Function(T item) selector,
)

Example:
groupBy(
  ["apple", "banana", "avocado"],
  (fruit) => fruit[0],
);

Result:
{
  "a": ["apple", "avocado"],
  "b": ["banana"]
}

Requirements:
- use fold();
- generic types;
- arrow functions.
10. Command processor
Create:
class Command {
  final String name;
  final Function action;

  Command(this.name, this.action);
}

Given:
[
 Command("save", () => true),
 Command("exit", () => false),
 Command("backup", () => true)
]

Implement:
bool executeCommand(
  List<Command> commands,
  String name
)

Requirements:
- find command;
- execute its function;
- handle missing commands;
- use any() somewhere.
11. Type-safe event system
Create:
abstract class Event {}

class LoginEvent extends Event {
  final String user;
}

class ErrorEvent extends Event {
  final int code;
}

Given:
List<Event> events;

Implement:
int countErrors(List<Event> events)

Requirements:
- use fold();
- use is ErrorEvent;
- access fields after casting.
12. One-line Dart challenge
Without writing a normal loop:
Given:
final numbers = [1, 2, 3, 4, 5, 6];

Produce:
"The sum of even numbers is 12"

Constraints:
- use where;
- use fold;
- use an arrow function;
- no temporary variables.
These are closer to what you actually encounter when using Dart: manipulating collections, preserving type safety, dealing with dynamic data, and composing functions instead of just adding numbers in lists. */