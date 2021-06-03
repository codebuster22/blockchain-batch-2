pragma solidity ^0.7.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol';

library custom {
    function add(uint _num1, uint _num2) external pure returns(uint) {
        return _num1+_num2;
    }
}

// you call view/pure - gas cost = 0
// you send normal functions - gas cost > 0

contract Library{
    using Strings for uint256;
    using custom for uint256;
    
    function add(uint _num1, uint _num2) public pure returns(uint){
        return _num1.add(_num2);
    }
    
    function toString(uint _num) public pure returns(string memory){
        return _num.toString();
    }
    
    function toString(uint _num, bool _overload) public pure returns(string memory){
        return Strings.toString(_num);
    }
    
    function toHexString(uint256 _value, uint256 _length) public pure returns(string memory){
        return _value.toHexString(_length);
    }
}