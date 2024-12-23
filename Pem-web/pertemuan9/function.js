// Membuat Function Deklarative
function salamPembuka(name) {
  console.log("Halo, Selamat Datang " + name);
}
salamPembuka("Budi");
// Membuat Function Expression
let salamPenutup = function (name) {
  console.log("Halo, Sampai Jumpa " + name);
};
salamPenutup("Andi");
// membuat arrow function
let salamPenutup2 = (name) => {
  console.log("Halo, Sampai Jumpa " + name);
};
salamPenutup2("Joko");

// Scope Variabel local dan Global
let varGlobal = "ini Variabel Global";

let shapeArea = (panjang, lebar) => {
  let varLocal = "ini Variabel Local";
  console.log(`Luas untuk persegi dengan Panjang ${panjang} dan Lebar
     ${lebar}adalah ${panjang * lebar}`);
  console.log(varLocal);
  console.log(varGlobal);
};
shapeArea(5, 10);
