//any variable outside code block is said to have GLOBAL SCOPE!!!!!!
//can be access anywhere in the program
//IT IS NOT A GOOD PRACTISE!!!!!!!
//LOCAL SCOPE

// let sayHi = 'Hello';
// //let sayHi = 'Greeting';

// function getGreeting(){
// //    sayHi = 'Peanut Butter and Jelly';
//     let sayHi = 'Hello from function';
//     console.log(sayHi);
//     let pants = 'big pants';
//     console.log(pants);
    
// }

// //console.log(pants);

// getGreeting();

// if(5>2){
// //    sayHi = 'Udemy is the best';
//     let sayHi = 'Hello from function';

//     console.log(sayHi);
//     let shirts = 'small shirts';
//     console.log(shirts);

// }

// console.log(shirts);


// console.log(sayHi);
/////////////////////////////////////////////////


// let sayHi = 'hello';

// function getGreeting(){
//     let sayHi = 'hello from function';
//     let peterTheGreat = 'peter the great';
//     peter = 'peter';
//     console.log(sayHi);
// }

// getGreeting();

// console.log(peter);
// console.log(peterTheGreat);

/////////////////////////////////////////////////

let generalNumber = 5;

function add(num1, num2){

    let result = num1 + num2 + generalNumber;

    function multiply(){
        let multiplyResult = generalNumber * result;
        console.log(multiplyResult);

    }
    multiply();

    console.log(multiplyResult);
    

    return result;
}

let result = add(10,20);

console.log(result);


























