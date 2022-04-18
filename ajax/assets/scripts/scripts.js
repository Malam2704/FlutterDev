
var xmlhttp = new XMLHttpRequest();
var url = "http://solace.ist.rit.edu/~ma3655/252/ajax/orcs.json";

xmlhttp.onload = function () {
  if (this.readyState == 4 && this.status == 200) {
    var myArr = JSON.parse(this.responseText);
    var resultingArray = Object.values(myArr);
    console.log(myArr)
    console.log(resultingArray[0])
    appearData(resultingArray);
  }
};

xmlhttp.open("GET", url, true);
xmlhttp.send();

function appearData(myArr) {
  for (let j = 0; j < 12; j++) {
    document.getElementById("listMenu").innerHTML += `
    <div class='orcs'>
          <p>Orc ID = ${myArr[j].playerId}</p>
          <p>Orc Name = ${myArr[j].playerName}</p>
          <p>Orc Name = ${myArr[j].playerHealth}</p>
          <p>Orc Name = ${myArr[j].playerAttack}</p>
          <p>Orc Name = ${myArr[j].playerDefense}</p>
          <p>Orc Name = ${myArr[j].playerToken}</p>
          <div><p>Orc Image = <img src='${myArr[j].playerImage}'> </p></div>
    </div>
      `;
  }
}

//xmlhttp.addEventListener('load', getRandomOrc())