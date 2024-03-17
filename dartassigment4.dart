import 'dart:io';

abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Animal {
  void makeSound() {
    print("Generic animal sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

class AnimalReader {
  Animal readFromFile(String filePath) {
    List<String> lines = File(filePath).readAsLinesSync();
    if (lines.isNotEmpty) {
      String animalType = lines.first.toLowerCase();
      switch (animalType) {
        case 'dog':
          return Dog();
        case 'cat':
          return Cat();
        default:
          return Animal();
      }
    } else {
      throw Exception("File is empty");
    }
  }
}

void main() {
  Dog myDog = Dog();
  myDog.makeSound();

  Cat myCat = Cat();
  myCat.makeSound();

  AnimalReader reader = AnimalReader();
  try {
    Animal animal = reader.readFromFile('animal.txt');
    animal.makeSound();
  } catch (e) {
    print("Error reading file: $e");
  }

  for (int i = 0; i < 3; i++) {
    print("Loop iteration $i");
  }
}
