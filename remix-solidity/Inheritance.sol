pragma solidity ^0.8.0;

contract Age {
    uint public age;
    
    function setAge(uint _age) public {
        age = _age;
    }
}

contract Parent is Age {
    
    string public name;
    
    constructor () {
        setAge(20);
    }
    
    function talk() public pure returns(string memory){
        return "Hello World";
    }
    
}

contract Parent2 is Age {
    string public lastName;
    
    constructor () {
        setAge(22);
    }
}

contract Child is Parent2, Parent {
    Age public _age;
    
    function deployAge() public returns(address) {
        _age = new Age();
        _age.setAge(30);
        return address(_age);
    }
    
    function set(uint age) public {
        _age.setAge(age);
    }
    
    function getAge() public view returns(uint) {
        return _age.age();
    }
}