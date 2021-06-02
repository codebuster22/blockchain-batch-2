pragma solidity ^0.8.0;

interface IStorage {
    function registerUser(string memory _name, uint8 _age, address _user) external;
    function updateName(string memory _name, address _user) external;
    function updateAge(uint8 _age, address _user) external;
    function setController(address _controller) external;
    
    function getUser(address _user) external view returns(string memory name_, uint8 age_);
    function getUserId(address _user) external view returns(uint256 id_);
}