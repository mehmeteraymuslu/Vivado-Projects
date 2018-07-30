document.write("This is external js");
//alert("This is alert from external js")

let name = "Silence";
let lastName = "Wise";
let fullName = name + " " + lastName;
const SSN = 12345;

//Types//

//string type
let text = "this is text";
//number type
let value = 123;
//boolean type
let value1 = true;
let value2 = false;
//null type
let number23 = null;
//undefined type
let name2;

//arrays, function, objects
let fruits = ['apple','orange','banana']
let code = function code (){
    console.log("Hello World");
}
let person = {
    name3 : "John",
    lastName3 :"Pepper"
}

//Arrays IN JAVASCRIPT
let friend1 = "John";
let friend2 = "Peter";
let friend3 = "Bob";
let friend4 = "Will";

let friends = new Array("John","Peter","Bob","Will");
let oldFriends = ["Peter",45,true,null,undefined];

oldFriends[0] = "Bob";

let bestFriend = oldFriends [0];

//Functions IN JAVASCRIPT

//Declaration, Invoke, Return, Parameters, Expression

function add (num1,num2){
    let sum = num1 * num2;
    return sum;
}

let result = add(12,56);

let result2 = function (num1,num2){
    let sum = num1/num2;
    return sum;
}

//OBJECTS IN JAVASCRIPT

let person2 = {
    name:"john",
    lastName:'pepper',
    age:25,
    education:false,
    wife:true,
    siblings:['sister','brother'],
    fullName:function (){
        console.log("And the full name of the person is : "+ person2.name + " " + person2.lastName )
    }
}

let personName = person2.name;
let personName2 = person2['name'];
let personLastName = person2['lastName'];
person2.fullName();

//IF ELSE STATEMENTS
//CONDITIONAL STATEMENTS IN JAVASCRIPT
//COMPARISON OPERATORS
//>,<,>=,<=,==,===,!=,!==

if(2>1){
    console.log("I am math genius")
}

let num1 = 8;
let num2 = 8;

if(num1 >= num2){
    console.log("First number was bigger than second or equal");
}
else{
    console.log("First number was smaller than second");
}

if(num1 == num2){
    console.log("numbers are equal");
}

if(num1 != num2){
    console.log("numbers are not equal");
}
else{
    console.log("numbers are equal");
}

let person3 = "john";

let person4 = "bob";

let person5 = 'peter';

if(person5 === 'john'){
    console.log("This dude is john");
}
else if(person5 === 'bob'){
    console.log("this dude is bob");
}
else{
    console.log("I dont know who is this dude");
}


//LOGICAL OPERATORS && and ||

let day2 = "friday";
let money2 = 55;

if(day2==="friday"&&money2>50){
    console.log("You are going out");
}


//"",'',``,0,-0,NaN,false,null,undefined

let bool1 = true;
let bool2 = false;

console.log(typeof bool1);
console.log(typeof bool2);

let value3 = 2 < 5;

console.log(typeof value3);

let result3 = false;

if(result3){
    console.log("another boolean");
}


let number = 5;

if(number < 6){
    console.log("another boolean");
}

let text2 = "just a text";

if(text2){
    console.log("how this is possible");
}

let falsy = 0;

if(falsy){
    console.log("runs only if true");
}
else {
    console.log("turn out to be false");
}


//unary operator

let text3 = "string";

console.log(typeof text3);//operand

//binary

let number2 = 3;
let number3 = 2 < 5;

//ternary

//condition ? (runs if true) : (runs if false);

let result4 = 8;

//result4%2===0 ? console.log("even number") : console.log("odd number");

let expression = result4%2;

function response (text3){
    console.log(text3 + " number")
}

expression === 0 ? response("even") : response("odd")

let dice =0;

// if(dice===1){
//     console.log("You got one");
// }
// else if(dice===2){
//     console.log("You got two");
// }
// else{
//     console.log("You did not roll the dice");
// }

switch(dice){
    case 1:
    console.log("You got one");
    break;
    case 2:
    console.log("You got two");
    break;
    default:
    console.log("You did not roll the dice");
    break;
}

function displayDayOfTheWeek(day){
    switch(day){
        case 1:
        console.log('Today is Monday');
        break;
        case 2:
        console.log('Today is Tuesday');
        break;
        case 3:
        console.log('Today is Wednesday');
        break;
        case 4:
        console.log('Today is Thursday');
        break;
        case 5:
        console.log('Today is Friday');
        break;
        case 6:
        console.log('Today is Saturday');
        break;
        case 7:
        console.log('Today is Sunday');
        break;
        default:
        console.log('INVALID DAY!!!!!!');
    }
}


displayDayOfTheWeek(4);
displayDayOfTheWeek(3);

//repeatedly run a block of code while certain condition is true
//while loop

let amount = 10;

while(amount>0){
    console.log("I have " + amount + " dollars and I'm going to the mall");
    amount--;
}

//repeatedly run a block of code while certain condition is true
//do while loop

let money = 12;

do{
    console.log("You have " + money + " and you are going to the mall");
    money++;
}while(money<10)

//repeatedly run a block of code while certain condition is true
//for loop

let i;

for( i=0; i<=10; i++){
    console.log("And the number is " + i);
}

for(let number4 = 11; number4 >= 0; number4--){
    console.log("And the number is " + number4);
}


//Console Logging
console.log("Hello from console");

console.log(name);
console.log(lastName);
console.log(fullName);
console.log(SSN);

console.log("Hello there your name is : " + fullName)

console.log(typeof text);
console.log(typeof value);
console.log(typeof value1);
console.log(typeof value2);
console.log(typeof number23);
console.log(typeof name2);

console.log(typeof fruits);
console.log(typeof code);
console.log(typeof person);

console.log(friend1);
console.log(oldFriends[0]);
console.log(bestFriend);

console.log(add(10,35));
console.log(add(4,60));
console.log(result);
console.log(result2(24,3));

console.log(personName);
console.log(personName2);
console.log(personLastName);

