// Safe Math library
// add, sub, div, mul 
// total sum of n numbers starting from 0;
// donot add multiple of some number
// set this number in constructor
// should be immutable

// constructor - owner: address

//create a fallback function - when contract balance > 15 ETH -> sefDestruct , 
//          send all money to owner

// fallabck function, only accept payment in 1 ETH interval.

pragma solidity ^0.8.0;

contract receiveP{
    
    address owner;
    
    constructor () {
        owner = msg.sender;
    }
    
    receive () external payable {
        require(msg.value%(1 ether) == 0, "Only in whole numbers");
        if(address(this).balance > (15 * (1 ether))){
            selfdestruct(payable(owner));
        } 
}
}



