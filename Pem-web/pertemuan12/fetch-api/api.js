fetch("https://jsonplaceholder.typicode.com/posts").then((response) => {
    if (!response.ok) {
      throw new Error("Response Not Ok");
    }
    return response.json();
  }).then((data) => {
    console.log(data);
  }).catch((error) => {
    console.error("Error:", error);});
