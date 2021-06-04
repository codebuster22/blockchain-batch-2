pragma solidity ^0.8.0;

contract Animal{
    
    uint256 public legs;
    
    modifier onlyRun() virtual {
        require(true == (10>9), "Not run");
        _;
    } 
    
    function move(string memory _type) public pure virtual returns(string memory) {
        return "Run";
    }
}

contract Bird is Animal{
    
    struct Pet{
        string name;
        uint8 age;
    }
    mapping(address => Pet) public pets;
    
    event NameChanged(string name, uint8 age);
    
    function move(string memory _type) public pure override onlyRun returns(string memory){
        if( sha256(abi.encode(_type)) == sha256(abi.encode("flightless")) ){
            return "walk";
        }
        return "fly";
    }
    
    function wings() external pure returns(uint256){
        return 10;
    }
    
    function addPet(string memory _name, uint8 age) public {
        Pet memory pet = Pet(_name, age);
        pets[msg.sender] = pet;
    }
    
    function birdAddress() public view returns( address ){
        return address(this);
    }
    
    function _updateName(Pet memory pet, string memory _name
        ) private pure returns(uint8 age, string memory name_) {
        pet.name = _name;
        return (pet.age, pet.name);
    }
    
    function updateName(string memory _name) public {
        string memory name;
        uint8 age;
        Pet memory pet = pets[msg.sender];
        (,name) = _updateName(pet, _name);
        emit NameChanged(name, age);
    }
    
    function getWings() public view returns(uint256) {
        return this.wings();
    }
}