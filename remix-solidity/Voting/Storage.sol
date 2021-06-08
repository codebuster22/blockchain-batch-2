

contract Storage{
    
    struct Voter
    struct Candidate
    mapping(key => voter);
    voterCounter
    mapping(key => Candidate);
    candidateCounter;
    
    controller
    
    addVoter()
    addCandidate()
    
    getVoter()
    getCandidate()
    
    getNumberOfVoters()
    getNumberOfCandidates()
    
    getAllCandidates()
    getAllCandidatesId()
    
    bool isEntered;
    
    transfer(address, 100){
        require(!isEntered);
        isEntered = true;
        require(balance[msg.sender] >= amt);
        balance[address] -= amt;
        address.transfer(amt);
        isEntered = false;
    }
    
}