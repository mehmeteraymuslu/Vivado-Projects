const scores = [
    {name:'john',score:87},
    {name:'susy',score:97},
    {name:'bob',score:67},
    {name:'peter',score:77}
];

let totalScores = 0;

for(let i = 0;i<scores.length;i++){
    totalScores += scores[i].score;
}

console.log(totalScores);

let average = totalScores/scores.length;

console.log(average);

for(let i = 0; i<scores.length; i++){
    if(scores[i].score>average){
        scores[i].betterThanAverage = true;
    }
    else{
        scores[i].betterThanAverage = false;
    }
}

console.log(scores);


