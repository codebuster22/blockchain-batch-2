pragma solidity ^0.8.0;

contract Loops{
    
    uint immutable notToBeAdded;// multiple of 10 not be added
    
    event Fallback(bool flag);
    
    constructor (uint _notToBeAdded) {
        notToBeAdded = _notToBeAdded;
    }
    
    function forLoop(uint _cap) public view returns(uint) {
        uint sum;
        for(uint i=1; i<_cap; i++){
            if(i%notToBeAdded == 0){
                continue;
            }
            sum += i;
        }
        return sum;
    }
    
    function whileLoop(uint _cap) public view returns(uint){
        uint sum;
        uint i=1;
        while(i<_cap){
            if(i%notToBeAdded == 0){
                break;
            }
            sum += i;
            i++;
        }
        return sum;
    }
    
    function doWhileLoop(uint _cap) public pure returns(uint){
        uint sum;
        uint i=1;
        do{
            sum += i;
            i++;
        }while(i<_cap);
        return sum;
    }
    
    function destory(address _receiver) external{
        selfdestruct(payable(_receiver));
    }
    
    receive () external payable {
        emit Fallback(false);
    }
}