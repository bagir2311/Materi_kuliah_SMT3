function fetchData1(callback) {
  setTimeout(() => {
    console.log("Hacking Prosess...");
    callback(" 10%");
  }, 3000);
}
function fetchData2(data1, callback2) {
  setTimeout(() => {
    console.log(`Hacking Prosess ...${data1}`);
    callback2(" 50%");
  }, 3000);
}
function fetchData3(data2, callback3) {
  setTimeout(() => {
    console.log(`Hacking Prosess ...${data2}`);
    callback3("100%");
  }, 3000);
}
// Memanggil Callback Hell
fetchData1((data) => {
  fetchData2(data, (data1) => {
    fetchData3(data1, (data2) => {
      console.log(`Hacked Nasa: Completed ${data2}`);
    });
  });
});
