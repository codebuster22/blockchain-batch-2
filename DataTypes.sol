pragma solidity 0.8.0;

contract DataTypes {
    
    // State Variables
    
    // Create a bank
// string - bank name
// bool - is active
// uint - store bank's balance
// function - sendFunds - 2% fees for the bank, and transfer rest to receiver
// function - getBank's balance
// uint - total amount of value transacted facilitated by the bank

    // int - integer - negative + positive integers - 0
    // uint- unsigned integer - only positive integers - 0
    // string - array of characters - ""
    // bool - boolean true/false - false
    
    string public name = "Mihir";
    bool public flag;
    address public owner;
    
    function getSender() public view returns(uint){
        return (msg.sender).balance;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function sendEther(address receiver) public payable{
        payable(receiver).transfer((msg.value)+10);
    }
    
    function boolean() public view returns(bool) {
        return flag;
    }
    
    
}