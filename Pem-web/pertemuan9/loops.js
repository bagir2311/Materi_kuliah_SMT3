// Membuat Loop dengan For
for (let i = 10; i >= 1; i--) {
  // tempalate literal string
  console.log(`ini perulangan ke ${i}`);
  console.log("ini perulangan ke " + i);
  console.log("ini perulangan ke", i);
}
for (let i = 0; i < 10; i++) {
  // tempalate literal string
  console.log(`ini perulangan ke ${i + 1}`);
  console.log("ini perulangan ke " + i);
  console.log("ini perulangan ke", i);
}
// Loops dengan While
let j = 1;
while (j < 10) {
  console.warn(`ini perulangan While ke ${j}`);
  j++;
}
// contoh Menampilkan data mhs
let mhs = ["Budi", "Andi", "Joko", "Joni"];
for (let i = 0; i < mhs.length; i++) {
  console.log(mhs[i]);
}


