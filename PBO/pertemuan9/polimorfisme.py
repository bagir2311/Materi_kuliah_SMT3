# tanpa Implementasi Polimorfisme
class Jumlah:
    def tambah1(n1, n2):
        print(f"Hasilnya {n1+n2}")
objek3 = Jumlah
objek3.tambah1(10,20) #Menghasilkan Error jika jumlah Parameter Strict wajib 2
# Implementasi Polimorfisme
class Penjumlahan:
    def tambah(*num):
        return sum(num) 
objek1 = Penjumlahan
print(objek1.tambah(2,3)) #tidak Menghasilkan Error implementasi Polimorfisme
# menggunakan default Parameter
class Default:
    def tambah2( a, b,c=0,d=0,e=0):
        print (f"Hasilnya {a+b+c+d+e}")
objek2 = Default
objek2.tambah2(2,4,2,3,5)