function proses1() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("Hello");
    }, 1000);
  });
}
function proses2(greetings) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(`${greetings} World`);
    }, 1000);
  });
}
function proses3(pesan) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(`${pesan} Have A Great Day !`);
    }, 1000);
  });
}
// Memanggil Chaining Promise
proses1()
  .then((greetings) => {
    return proses2(greetings);
  })
  .then((pesan) => {
    return proses3(pesan);
  })
  .then((result) => {
    console.log(result);
  })
  .catch((error) => {
    console.error(`Error: ${error}`);
  });
