pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol";

contract ArtworkRegistry is AccessControl {
    
    bytes32 constant artist = keccak256(abi.encode("Artist"));
    
    mapping( bytes32 => address) public arts;
    
    event ArtistRegistered(address artist);
    
    constructor () {
        bytes32 role = keccak256(abi.encode("Deployer"));
        _setupRole(role, msg.sender);
    }
    
    function checkIsArtist(address _artist) public view returns(bool) {
        return hasRole(artist, _artist);
    }
    
    function regsiterArtist() external {
        _setupRole(artist, msg.sender);
    }
    
    function registerArt(string memory _title, uint _price) public onlyRole(artist) returns(address) {
        bytes32 id = keccak256(abi.encode(_title,msg.sender));
        Art art = new Art(id, _title, _price, msg.sender);
        arts[id] = address(art);
        return address(art);
    }
    
    function generateID(string memory _title) public view returns(bytes32){
        return keccak256(abi.encode(_title, msg.sender));
    }
    
}

contract Art{
    bytes32 public immutable id;
    string public title;
    address public owner;
    uint public price;
    
    constructor (bytes32 _id, string memory _title, uint _price, address _owner) {
        id = _id;
        title = _title;
        owner = _owner;
        price = _price;
    }
    
    
    // owner can only start auction
    // bidders can bid
    // time contraint
    // after it ends, automatically, 
    // ownership transfer, 
    // funds trasnfered to prevOwner from new Owner
    
}















