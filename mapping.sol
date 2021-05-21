pragma solidity 0.8.0;

contract Mapping {
    
    struct User{
        uint8 age;
        string name;
    }
    
    mapping( address => User ) public users;
    
    function register(string memory _name) public {
        users[msg.sender] = User(22, _name);
    }
    
    function getAge() public returns(uint8){
        User memory user = users[msg.sender];
        user.age = 34;
        users[msg.sender] = user;
        return user.age;
    }
    
}