pragma solidity ^0.8.0;

contract Storage{
    
    address public controller;
    
    struct User{
        string name;
        uint8 age;
    }
    uint256 public _userCounter;
    mapping(address => uint256) private _userIds;
    mapping(uint256 => User) private _users;
    
    constructor (address _controller) {
        controller = _controller;
    }
    
    modifier onlyController() {
        require( msg.sender == controller, "Storage: controller function" );
        _;
    }
    
    modifier initialised() {
        require( controller != address(0), "Storage: contract not initialised" );
        _;
    }
    
    /*
    function initialise(address _controller) public {
        require( _controller != address(0), "Storage: controller cannot be zero address" );
        controller = _controller;
    }
    */
    
    function registerUser(string memory _name, uint8 _age, address _user) onlyController initialised public {
        _userCounter++;
        User memory user = User(_name, _age);
        _userIds[_user] = _userCounter;
        _users[_userCounter] = user;
    }
    
    function updateName(string memory _newName, address _user) onlyController initialised public {
        uint256 userId = _userIds[_user];
        _users[userId].name = _newName;
    }
    
    function updateAge(uint8 _newAge, address _user) onlyController initialised public {
        uint256 userId = _userIds[_user];
        _users[userId].age = _newAge;
    }
    
    function setController(address _controller) initialised onlyController public {
        require(_controller != address(0), "Storage: controller cannot be zero address");
        controller = _controller;
    }
    
    function getUser(address _user) public initialised view returns(string memory name_, uint8 age_) {
        uint256 userId = _userIds[_user];
        return (_users[userId].name, _users[userId].age);
    }
    
    function getUserId(address _user) public initialised view returns(uint id_){
        return _userIds[_user];
    }
}