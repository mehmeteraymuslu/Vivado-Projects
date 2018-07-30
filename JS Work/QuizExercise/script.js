// const example = [
//     ['bob', 'john'],
//     ['banana','orange'],
//     ['hammer','nail']
// ];

// console.log(example[0][1]);

// let item = example[1][1];

// console.log(item);

// example[2][1] = 'drywall';

// console.log(example);

const quiz = [
    ['Best state to live in?','ca'],
    ['Capital of California?','sacramento'],
    ['Best beach city?','huntington beach']
];

let score = 0;

for(let i = 0; i<quiz.length; i++){
    let answer = prompt(quiz[i][0]);
    let answerCorrect = answer.toLowerCase().trim();

    if(answerCorrect ===quiz[i][1]){
        score++;
    }
    else{
        alert(`Weong answer. The correct answer
        is ${quiz[i][1]}`);
    }


}

let correctPercent = ((score/quiz.length)*100).toFixed(2);

alert(`You answered ${score} questions correctly
and your correct percent is ${correctPercent}%
`)

