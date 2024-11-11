// memebuat loop for
for (let i = 10; i > 1; i--) {
    // tamolat  literal string
    console.log('ini perulangan ke $ {i}') ;
    console.log("ini perulangan ke" + i);
    console.log("ini perulangan ke". i);
}
for (let i =0; i< 10; i++){
    //tamplat
    console.log('ini perulangan ke ${i + 1}');
    console.log("ini perulangan ke" +i);
    console.log("ini perulangan ke".i);
}
//lops dengan while
let j = 1;
while (j < 10){
    console.warn('ini perulangan  ke ${j}');
    j++;
}
// contoh menampilakna data
let mhs = ["budi","andi","joko","joni","jais"];
for (let i = 0; i < mhs.length; i++){
    console.log(mhs[i]);
}