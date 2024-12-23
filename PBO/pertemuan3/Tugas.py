# Membuat Kelas Hero
class Hero:
    # membuat kontstruktor untuk menampung atribut
    def __init__(self, name, role, health_point, attack_damage,skill ):
        # lakukan inisiasi untuk masing-masing variabel
        self.nm = name
        self.rl = role
        self.hp = health_point
        self.ad = attack_damage
        self.sk = skill
    # Membuat Method Attack
    def attack(self, target):
        target.hp -= self.ad
        print(f"{self.nm} menyerang {target.nm}")
        print(f"{target.nm} kehilangan {self.ad} HP.")
    # Membuat methode Use Skill
    def useSkill(self, target):
        target.hp -= self.ad * 2.5 
        print(f"{self.nm} Menggunakan Skill: {self.sk}! \n{target.nm} Kehilangan {int(self.ad * 2.5)} HP")
   #Membuat Methode show Stats
    def showStats(self):
        print(f"Status {self.nm}:")
        print(f"Role    : {self.rl}")
        print(f"HP      : {int(self.hp)}")
        print(f"AD      : {self.ad}")
        print(f"Skill   : {self.sk}") 
        print("----------------------")
layla = Hero("Layla","Marksman",350, 50, "Destruction Rush")
tigreal = Hero("Tigreal", "Tank", 500, 40, "Sacred Hammer")
layla.attack(tigreal)
tigreal.useSkill(layla)
layla.showStats()
tigreal.showStats()