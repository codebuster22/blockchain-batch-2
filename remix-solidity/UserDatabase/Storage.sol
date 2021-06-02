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
    
    constructor () {
        controller = msg.sender;
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
    
    function registerUser(string memory _name, uint8 _age) onlyController initialised public {
        _userCounter++;
        User memory user = User(_name, _age);
        _userIds[msg.sender] = _userCounter;
        _users[_userCounter] = user;
    }
    
    function updateName(string memory _newName, address _user) onlyController initialised public {
        _users[_userIds[_user]].name = _newName;
    }
    
    function updateAge(uint8 _newAge, address _user) onlyController initialised public {
        _users[_userIds[_user]].age = _newAge;
    }
    
    function getUser(address _user) public initialised view returns(User memory user_) {
        return _users[_userIds[_user]];
    }
    
    function getUserId(address _user) public initialised view returns(uint id_){
        return _userIds[_user];
    }
}