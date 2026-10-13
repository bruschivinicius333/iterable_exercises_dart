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

T accumulate<T>(Iterable<T> values, T initial, T Function(T, T) operation) {
  return values.fold(initial, operation);
}

/// 2. Generic inventory filter
/// Create:
class Product {
  final String name;
  final double price;
  final bool available;

  Product(this.name, this.price, this.available);
}

/// Create:
List<T> filterAvailable<T>(Iterable<T> items, bool Function(T) predicate) {
  return items.where(predicate).toList();
}

/// Requirements:
/// - use where;
/// - use a generic type;
/// - return a List<T>.
/// Example:
/// filterAvailable<Product>(
/// products,
/// (p) => p.available && p.price < 100,
/// );

/*3. Dynamic JSON-like parser
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
80*/

final data = [
  {"name": "Sword", "damage": 50},
  {"name": "Potion", "damage": "none"},
  {"name": "Bow", "damage": 30},
];

int dynamicJSONLikeParser(List<Map<String, dynamic>> elements) {
  /* elements
      .where((element) => element["damage"] is num && element["damage"] > 0)
      .fold(0, ((previousValue, element) => 5)); */

  return elements
      .where((element) => element["damage"] is num && element["damage"] > 0)
      .fold(
        0,
        (previousValue, element) => previousValue + element["damage"] as int,
      );
}

/*
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
value is int*/

final values = [10, "hello", 3.5, true, 20, "dart"];

/// Create:
Map<String, int> analyze(Iterable<dynamic> values) {
  final Map<String, int> toReturn = {
    "int": 0,
    "double": 0,
    "String": 0,
    "bool": 0,
  };
  values.fold(true, (previousValue, element) {
    // the exercise obligates me to use `fold`
    // stupid null-fanatic compiler
    if (element is int) toReturn["int"] = (toReturn["int"] ?? 0) + 1;
    if (element is double) toReturn["double"] = (toReturn["double"] ?? 0) + 1;
    if (element is String) toReturn["String"] = (toReturn["String"] ?? 0) + 1;
    if (element is bool) toReturn["bool"] = (toReturn["bool"] ?? 0) + 1;
    return false; // no reason, just syntax
  });
  return toReturn;
}

/*5. RPG character system
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
"Does any member satisfy both conditions?"*/

/// Create:
abstract class Character {
  final int _power = 0;
  Character(int power);
  int get power => _power;
}

class Warrior extends Character {
  Warrior(super.power);
}

class Mage extends Character {
  Mage(super.power);
}

class Sage extends Character {
  Sage(super.power);
}

class Monk extends Character {
  Monk(super.power);
}

class Knight extends Character {
  Knight(super.power);
}

/// Given:
List<Character> party = [
  Warrior(23235),
  Mage(23552),
  Sage(745624),
  Monk(32523),
  Mage(125325),
  Mage(1246),
  Mage(4376347),
  Knight(323),
];

/// Implement:
bool hasPowerfulMage(List<Character> party) {
  const randomPowerConstantITookOutOfMyAssAndNothingShouldDependOn = 8000;
  return party.any(
    ((character) =>
        character is Mage &&
        character.power >
            randomPowerConstantITookOutOfMyAssAndNothingShouldDependOn),
  );
}

/*6. Fold into a custom object
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
*/

class Statistics {
  final int count;
  final double total;
  final double max;

  Statistics(this.count, this.total, this.max);
}

//Given:
var things = [10.5, 20.0, 5.5];

var toPrint = things.fold(Statistics(0, 0.0, 0.0), (previousValue, element) {
  if (element == things.last) {
    return Statistics(
      things.length,
      things.fold(0, (previousValue, element) => previousValue + element),
      things.lastWhere((innerElement) => innerElement > element),
    );
  }
  return previousValue;
});

/*7. Nullable values pipeline
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
- use fold().*/

List<String?> clod = [
  "Alice",
  null,
  "Bob",
  null,
  "Charlie"
];

String result = clod.whereType<String>().fold("", (previousValue, element) {
  previousValue += (previousValue == "") ? element : ",$element";
  return previousValue;
});

/*8. Permission system
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
- do not use loops.*/

class User {
  final String name;
  final List<String> permissions;

  User(this.name, this.permissions);
}

bool canDelete(List<User> users) {
  return users.any((user) => user.permissions.any((permission) => permission == "delete"));
}

/*9. Generic grouping
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
- arrow functions.*/
/* Map<K, List<T>> groupBy<T, K>(
  Iterable<T> items,
  K Function(T item) selector
) {
  return Map<K, T>();
}

void main() {

  groupBy(
    ["apple", "banana", "avocado"],
    (fruit) => fruit[0],
  );

} */

/* {
  "a": ["apple", "avocado"],
  "b": ["banana"]
} */


/*10. Command processor
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
- use any() somewhere.*/
/// Given:
class Command {
  final String name;
  final Function action;

  Command(this.name, this.action);
}

/// Given:
final given = [
 Command("save", () => true),
 Command("exit", () => false),
 Command("backup", () => true)
];

/// Implement:
bool executeCommand(
  List<Command> commands,
  String name
) {
  if(commands.any((command) => command.name == name)) {
    print("Command found. Running it...");
    commands.firstWhere((command) => command.name == name).action();
    print("Command done.");
    return true;
  } else {
    print("Command not found.");
    return false;
  }
}

/*11. Type-safe event system
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
- access fields after casting.*/

/// Create:
abstract class Event {}

class LoginEvent extends Event {
  final String user;

  LoginEvent(this.user);
}

class ErrorEvent extends Event {
  final int code;

  ErrorEvent(this.code);
}

/// Given:
final events = <Event>[
  LoginEvent("awgawgawg"),
  ErrorEvent(3215236),
  LoginEvent("ijregoijoijer"),
  ErrorEvent(326478),
  ErrorEvent(334734)
];

/// Implement:
int countErrors(List<Event> events) {
  int howMany = 0;
  events.fold(Event, (_, element) {
    if (element is ErrorEvent) {
      ++howMany;
    } 
    return Type;
  });
  return howMany;
}

/*12. One-line Dart challenge
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
///Given:
const numbers = [1, 2, 3, 4, 5, 6];

void oneLineDartChallenge(List<int> numbers) {
  print("The sum of even numbers is ${numbers.where((number) => number.isEven).fold(0, (previousValue, element) => previousValue + element)}");
}