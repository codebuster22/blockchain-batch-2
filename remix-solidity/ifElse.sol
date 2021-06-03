pragma solidity ^0.8.0;

contract IfElse{
    
    function subIfGreater (uint _num) public pure returns(uint) {
        return _num > 10 ?
                _num - 10
                :
                (_num < 10 ?
                    _num + 10
                    :
                    10);
    }
    
    /*
    if(condition){
        when condition is true
    } else if(condition){
        when condition is true;
    }else {
        when both condition donot satisfy
    } */
    
}