// -------------->>  1. Class and Object

// class Animal {
//   String name = 'Dog'; // Property
//   void sound() { // Method
//     print('Bark!');
//   }
// }
//
// void main() {
//   Animal myPet = Animal(); // Creating an object
//   print(myPet.name); // Accessing property
//   myPet.sound(); // Calling method
// }

// -------------->> 2. Inheritance

// class Animal {
//   void sound() {
//     print('Animal makes a sound');
//   }
// }
//
// class Dog extends Animal { // Inheriting from Animal
//   void sound() {
//     print('Bark!'); // Overriding the method
//   }
// }
//
// void main() {
//   Dog myDog = Dog();
//   myDog.sound(); // Output: Bark!
// }

// -------------->>  3. encapsulation

// class Person {
//   String? _name; // Private property
//
//   // Getter
//   String? get na => _name;
//
//   // Setter
//   set name(String newName) {
//     _name = newName;
//   }
// }
//
// void main() {
//   Person person = Person();
//   person.name = 'Alice'; // Using setter
//   print(person.na); // Using getter
// }


// -------------->> 4. Access Modifier

// class Car {
//   String _model; // Private to the library
//   String color; // Public
//
//   Car(this._model, this.color);
//
//   String get model => _model; // Access to private member
// }
//
// void main() {
//   Car car = Car('Tesla', 'Red');
//   print(car.color); // Public member
//   print(car.model); // Accessing private member through getter
// }


// -------------->> 5. override data member

// class Animal {
//   String sound = 'Some sound';
// }
//
// class Dog extends Animal {
//   String sound = 'Bark!'; // Overriding data member using the same name
// }
//
// void main() {
//   Dog myDog = Dog();
//   print(myDog.sound); // Output: Bark!
// }
