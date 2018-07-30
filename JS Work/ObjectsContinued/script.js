//everything in javascript is either
//one of six primitive data types or an object
//objects are key value pairs
//if a property is a function it is called a method

//object literals
const person = {};
//construction function
const secondPerson = new Object();
//add property
person.name = 'john';
console.log(person);

//access property
console.log(person.name);

//modify property
person.name = 'bob';

//access property
console.log(person['name']);

//assign value
let lastName = person.lastName;
console.log(lastName);

//check if exists
let check = 'lastName' in person;
console.log(check);

//check with undefined
if(person.lastName !== undefined){

}
//delete property
delete person.name;
console.log(person);

//create object
const human = {
    name:'bob',
    nickName:'zippy',
    height:7,
    weight:200,
    married:true,
    education:false,
    friends:['john', 'susy'],
    sign(){
        return `i'm singing away`
    }
}

let song = human.sign();
console.log(song);







//iterate
for(const key in human){
    console.log(`${key} : ${human[key]}`);
}

//nested objects
const people = {
    person1:{name:'susy',age:34},
    person2:{name:'john'}
}

//objects as parameters

function hello({greet,name}){
    return `${greet}!!!!${name}`
}

let greetPerson = hello({name:'john',greet:'hello there.....'});

console.log(greetPerson);



