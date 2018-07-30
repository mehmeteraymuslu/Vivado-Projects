//Primitive Data Types
//String, Number, Symbol, Boolean,Undefined,Null
//Arrays, Functions, Objects = object
//(typeof)

//assigning to primitive value any changes
//are made directly to that value

//assigning non-primitive value to varible is done by reference
//so any the changes will affect all the references

let number = 1;
let number2 = number;

number2 = 4;


console.log('the first value is' + number);
console.log('the second value is' + number2);

let person = {name:'bob'};
let person2 = person;

person2.name = 'john';

console.log('the name of the first person ' + person.name);
console.log('the name of the second person ' + person2.name);



