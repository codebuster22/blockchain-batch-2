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

contract newMapping {
    mapping(address => bool) private _isUser;
    
    event NewUser(address user, bool isUser);
    
    function setUser() public {
        _isUser[msg.sender] = true;
        emit NewUser(msg.sender, _isUser[msg.sender]);
    }
    
    function checkIfUser() public view returns(bool isUser_){
        isUser_ = _isUser[msg.sender];
    }
}















