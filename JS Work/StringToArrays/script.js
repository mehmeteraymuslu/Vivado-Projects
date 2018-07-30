let text = 'This is some short string';
let arrText = text.split(' ');
let secondText = arrText.join(' ');

console.log(arrText);
console.log(secondText);

function reverseString(text){
    let result = text.split('').reverse().join('');
    console.log(result);
}

reverseString("This is some random text");

function findTheLongestWord(pants){
    let result = pants.split(' ');
    console.log(result);

    let longestWord = '';

    for(let i = 0; i<result.length; i++){
        if(result[i].length>longestWord.length){
            longestWord = result[i];
        }
    }
    console.log(`The longest word is ${longestWord}`);
    console.log(longestWord.length);
}



findTheLongestWord("this is some longer random text blblblbblblbl");

