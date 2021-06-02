pragma solidity ^0.8.0;

import './Storage.sol';

contract Controller {
    
    Storage public store;
    
    modifier initialised () {
        require( store != Storage(address(0)), "Controller: storage not initialised" );
        _;
    }
    
    function initialise(Storage _storage) external {
        require(store == Storage(address(0)), "Controller: already initialised");
        store = _storage;
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
    
    function getUser() initialised public view returns(bool flag_) {
        store.getUser(msg.sender);
        return true;
    }
    
    function getUserId() initialised public view returns(uint256 id_){
        return store.getUserId(msg.sender);
    }
    
}