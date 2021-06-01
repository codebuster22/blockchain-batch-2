pragma solidity ^0.8.0;

contract Enum {
    
    enum UserRole{USER, ADMIN}
    
    mapping(address => UserRole) private _userRoles;
    
    modifier notReg(UserRole _role) {
        require(_userRoles[msg.sender] != _role, "Enum: User registered" );
        _;
    }
    
    function setUserRole(UserRole _role) notReg(_role) public {
        _userRoles[msg.sender] = _role;
    }    
    
    function getUserRole() public view returns(UserRole role_) {
        role_ = _userRoles[msg.sender];
    }
}