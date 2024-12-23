# Membuat sebuah Super Class
class Animal:
    # Membuat kontstruktor untuk menampung attribut
    def __init__(self, name, ras):
        self.name = name
        self.ras = ras
    # Membuat method bersuara
    def speaks(self):
        print(f"{self.name} bisa bersuara")
# Membuat kelas 1 turunan dari super kelas
class Cat(Animal):
    def speaksCat(self):
        print(f"Nama {self.name} dengan Ras {self.ras} bersuara Meooowwww")
# mebuat kelas 2 turunan dari Super kelas
class Dog(Animal):
    def speaksDog(self):
        print(f"Nama {self.name} dari Ras {self.ras} Bersuara Guk Guk")
# Membuat Objek
cat = Cat("Kitty", "Angora")
cat.speaksCat()
dog = Dog("Puppy", "Pitbull")
dog.speaksDog()