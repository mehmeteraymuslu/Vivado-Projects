
let number = 20 + null;//20 + 0

console.log(number);

let number2 = 20 + undefined;

console.log(number2);




let human = "John Pepper";


let length = human.length;

console.log(human.length);

console.log(human.toLowerCase());
console.log(human.toUpperCase());
console.log(human.charAt(5));
console.log(human.charAt(human.length-1));

console.log(human.indexOf('e'));

console.log(human.toLowerCase().startsWith('john'));
console.log(human.toLowerCase().endsWith('pepper'));

console.log(human.slice(0,3));
console.log(human.slice(-5));

console.log(human.includes('zzz'));

//Templete Strings

let name = 'john';
let age = 25;
let sentence = `Hey it's ${name} and he's ${age + 25}`;

//console.log('Hey it"s' + name + ' and he\'s ' + age + ' old');

//console.log(`Hey it's ${name} and he's ${age + 25}`);

console.log(sentence);


//arrays === list of values
//objects ==== collection of values

// let zero = [];
let names = ['john', 'bob', 'barry', 'olga', 'ben',1,2,3,4];
// let names2 = new Array (1,40,60);
// console.log(names);
// names[0] = 'peter';
// console.log(names[0]);
// console.log(names);

// let person = {
//     name:'bob'
// }

// console.log(person.name);

// person.name = 'susy';

//length

let result = names.length;

console.log(result);

console.log(names[names.length-1]);
//reverse
//console.log(names.reverse());
//concat
let lastNames = ['pepper', 'onion', 'banana'];

console.log(names.concat(lastNames));

//unshift
console.log(names.unshift('susy'));
console.log(names);
//shift
console.log(names.shift());
console.log(names);
//push
console.log(names.push('hello world'));
console.log(names);
//pop
console.log(names.pop());
console.log(names);
//splice

// console.log(names.splice(2,3));
// console.log(names);

//sort
console.log(names.sort());

console.log(names);

//for loop

// for(let i=0; i<10;i++){
//     console.log(`Your number is ${i}`);
//     }

let friends = ['bob', 'susy', 'john', 'eddy', 'olga'];

// for(let i = 0; i<friends.length; i++){
//     console.log(`Your friend number ${i+1} is ${friends[i]}`);
// }

for(let i=friends.length-1; i>=0; i--){
    console.log(`Your friend number ${i+1} is ${friends[i]}`);
}

//Global Math object

let number3 = 25;

//let result2 = Math.floor(number3);
//let result2 = Math.ceil(number3);
//let result2= Math.sqrt(number3);
//let result2 = Math.PI;
//let result2 = Math.min(1,8,3,5,7);
//let result2 = Math.max(1,8,3,5,7);

let result2 = Math.floor((Math.random() * 10) +1);

console.log(result2);

const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

//let date = new Date();
let date = new Date('1/12/2004');

let month = date.getMonth();

let day = date.getDay();

//let seconds = date.getSeconds();

console.log(date);

console.log(month);

console.log(day);

//console.log(seconds);

date.setDate(25);
date.setDate(2009);
date.setMonth(4);

console.log(`Month is : ${months[month]} and the date is :${days[day]}`);

console.log(date);


//there are many methods
//MDN
//there is no point of memorizing
//the best way to learn is to build using them

let toDoList = [];

function addItem(arr){
    let answer = prompt("What would you like to do today?");
    let correct = answer.toLowerCase().trim();
    
    if(checkDuplicate(arr,correct)){
        arr.push(correct);
        showItems(toDoList);
    }
    else{
        alert('Item wont be added to the list. Item already exists, do not work so hard');
    }

}

function checkDuplicate(arr,item){
    let exists = false;
    let index = arr.indexOf(item);//-1
    if(index!=-1){
        exists = false;
    } 
    else{
        exists = true;
    }
    return exists;
}

// function removeItem(list){
//     if(list.length > 0){
//         console.log(`You deleted "${list[list.length-1]}" from the list`);

//         list.pop();
//     }
//     else {
//         console.log('list does not have any more items to delete');
//     }
// }

//remove item function
function removeItem(list){
    let answer = prompt('Which item would you like to DELETE from the list');
    let correct = answer.trim().toLowerCase();

    let index = list.indexOf(correct);

    if(!checkDuplicate(list,correct)){
        let removedItem = list.splice(index,1);
        console.log(removedItem);
        alert(`You removed "${removedItem}" from your list`);
    }
    else{
        console.log('no such value exists');
    }

}


//function showItems

function showItems (list){
let listValues = 'You list items are : ';

for(let i = 0; i<list.length; i++){
    listValues +=`"List item Nr${i+1} : ${list[i]}"`;
}
alert(listValues);
}







addItem(toDoList);
addItem(toDoList);
addItem(toDoList);
removeItem(toDoList);
showItems(toDoList);


console.log(toDoList)






























