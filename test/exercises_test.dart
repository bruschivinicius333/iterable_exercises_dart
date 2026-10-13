import 'package:test/test.dart';
import 'package:iterable_exercises/exercises.dart';

void exec1_test() {
  group('1 - Generic accumulate', () {
    test('folds integers correctly', () {
      expect(
        accumulate<int>([1, 2, 3, 4], 0, (a, b) => a + b),
        10,
      );
    });

    test('folds strings correctly', () {
      expect(
        accumulate<String>(
          ["D", "a", "r", "t"],
          "",
          (a, b) => a + b,
        ),
        "Dart",
      );
    });

    test('returns initial value for empty iterable', () {
      expect(
        accumulate<int>([], 100, (a, b) => a + b),
        100,
      );
    });
  });
}
  


  group('2 - Generic filterAvailable', Function() Function  {
    final products = [
      Product("Cheap", 50, true),
      Product("Expensive", 200, true),
      Product("Unavailable", 10, false),
    ];

    test('filters using predicate correctly', () {
      final result = filterAvailable<Product>(
        products,
        (p) => p.available && p.price < 100,
      );

      expect(result.length, 1);
      expect(result.first.name, "Cheap");
    });

    test('returns empty list when nothing matches', () {
      final result = filterAvailable<Product>(
        products,
        (p) => p.price > 1000,
      );

      expect(result, isEmpty);
    });
  });


  group('3 - Dynamic parser', Function() Function  {
    test('ignores invalid dynamic values', () {
      final data = [
        {"name": "Sword", "damage": 50},
        {"name": "Potion", "damage": "none"},
        {"name": "Bow", "damage": 30},
      ];

      expect(calculateDamage(data), 80);
    });

    test('handles completely invalid data', () {
      final data = [
        {"damage": "50"},
        {"damage": null},
        {},
      ];

      expect(calculateDamage(data), 0);
    });
  });


  group('4 - Mixed type analyzer', Function() Function  {
    test('counts runtime types correctly', () {
      final result = analyze([
        10,
        "hello",
        3.5,
        true,
        20,
        "dart",
      ]);

      expect(result["int"], 2);
      expect(result["double"], 1);
      expect(result["String"], 2);
      expect(result["bool"], 1);
    });

    test('handles empty input', () {
      expect(analyze({}), isEmpty);
    });
  });


  group('5 - RPG character system', Function() Function  {
    test('finds powerful mage', () {
      final party = [
        Warrior(100),
        Mage(150),
      ];

      expect(hasPowerfulMage(party), true);
    });

    test('does not confuse warrior with mage', () {
      final party = [
        Warrior(999),
      ];

      expect(hasPowerfulMage(party), false);
    });

    test('rejects weak mage', () {
      final party = [
        Mage(20),
      ];

      expect(hasPowerfulMage(party), false);
    });
  });


  group('6 - Statistics fold', Function() Function  {
    test('creates correct statistics object', () {
      final result = calculateStatistics([
        10.5,
        20.0,
        5.5,
      ]);

      expect(result.count, 3);
      expect(result.total, 36);
      expect(result.max, 20);
    });

    test('handles one element', () {
      final result = calculateStatistics([42]);

      expect(result.count, 1);
      expect(result.total, 42);
      expect(result.max, 42);
    });
  });


  group('7 - Nullable pipeline', Function() Function  {
    test('removes nulls and joins names', () {
      expect(
        joinNames([
          "Alice",
          null,
          "Bob",
          null,
          "Charlie",
        ]),
        "Alice,Bob,Charlie",
      );
    });

    test('handles all null values', () {
      expect(
        joinNames([null, null]),
        "",
      );
    });
  });


  group('8 - Permission system', Function() Function  {
    test('detects delete permission', () {
      expect(
        canDelete([
          User("Alice", ["read"]),
          User("Bob", ["delete"]),
        ]),
        true,
      );
    });

    test('rejects missing permission', () {
      expect(
        canDelete([
          User("Alice", ["read"]),
        ]),
        false,
      );
    });
  });


  group('9 - Generic groupBy', Function() Function  {
    test('groups correctly by selector', () {
      final result = groupBy<String, String>(
        [
          "apple",
          "banana",
          "avocado",
        ],
        (fruit) => fruit[0],
      );

      expect(result["a"], ["apple", "avocado"]);
      expect(result["b"], ["banana"]);
    });

    test('handles empty iterable', () {
      expect(
        groupBy<int, int>([], (x) => x),
        isEmpty,
      );
    });
  });


  group('10 - Command processor', Function() Function  {
    test('executes existing command', () {
      final commands = [
        Command("save", () => true),
      ];

      expect(
        executeCommand(commands, "save"),
        true,
      );
    });

    test('returns false for missing command', () {
      final commands = [
        Command("save", () => true),
      ];

      expect(
        executeCommand(commands, "delete"),
        false,
      );
    });

    test('does not execute unrelated commands', () {
      var executed = false;

      final commands = [
        Command("test", () {
          executed = true;
          return true;
        }),
      ];

      executeCommand(commands, "missing");

      expect(executed, false);
    });
  });


  group('11 - Event system', Function() Function  {
    test('counts only ErrorEvents', () {
      final events = [
        LoginEvent("bob"),
        ErrorEvent(404),
        ErrorEvent(500),
      ];

      expect(countErrors(events), 2);
    });

    test('does not count other events', () {
      expect(
        countErrors([
          LoginEvent("alice"),
        ]),
        0,
      );
    });
  });


  group('12 - One-line challenge', Function() Function  {
    test('calculates even sum correctly', () {
      expect(
        evenSumMessage([1, 2, 3, 4, 5, 6]),
        "The sum of even numbers is 12",
      );
    });

    test('handles no even numbers', () {
      expect(
        evenSumMessage([1, 3, 5]),
        "The sum of even numbers is 0",
      );
    });
  });
}