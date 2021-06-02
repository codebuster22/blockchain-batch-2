pragma solidity ^0.8.0;

import "./IStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Controller is Ownable {
    
    IStorage public store;
    
    modifier initialised () {
        require( store != IStorage(address(0)), "Controller: storage not initialised" );
        _;
    }
    
    function setStorage(IStorage _storage) onlyOwner external {
        require(_storage != IStorage(address(0)), "Controller: storage cannot be zero");
        store = _storage;
    }
    
    function setNewController(address _newController) onlyOwner public {
        store.setController(_newController);
    }
    
    function regsiterUser(string memory _name, uint8 _age) initialised public {
        store.registerUser(_name, _age, msg.sender);
    }
    
    function updateName(string memory _newName) initialised public {
        store.updateName(_newName, msg.sender);
    }
    
    function updateAge(uint8 _newAge) initialised public {
         store.updateAge(_newAge, msg.sender);
    }
    
    function getUser() initialised public view returns(string memory name_, uint8 age_) {
        string memory name;
        uint8 age;
        (name, age) = store.getUser(msg.sender);
        return (name, age);
    }
    
    function getUserId() initialised public view returns(uint256 id_){
        return store.getUserId(msg.sender);
    }
    
}