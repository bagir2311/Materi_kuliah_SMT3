# Membuat Program Paradigma OOP
class Luas:
    def __init__(self, panjang, lebar):
        self.panjang = panjang
        self.lebar = lebar
    def Luas_Persegipanjang(self):
        return self.panjang * self.lebar
cek_luas = Luas(5,10)
print (f"Luas Persegi adalah {cek_luas.Luas_Persegipanjang()}")    


