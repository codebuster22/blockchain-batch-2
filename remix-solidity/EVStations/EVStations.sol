pragma solidity 0.8.0;

contract EVStations {
    
    // state variables
    enum StationType {AC, DC}
    
    address public companyAddress;
    string public companyName;
    
    struct Investor{
        string investorName;
        uint totalStationCount;
    }
    mapping(address => Investor) public investors;
    
    mapping(StationType => uint) public stationTypePrice;
    mapping(StationType => uint) public saleableStations;
    mapping(StationType => uint) public perUnitFees;
    
    struct Station{
        StationType typeOfStation;
        uint pricePerUnit;
        uint location;
        bool isActive;
    }
    mapping(uint => Station) public stations;
    uint public stationCounter;
    
    // logic
    
    modifier onlyCompany() {
        require(msg.sender == companyAddress, "EVStations: sender is not the owner");
        _;
    }
    
    modifier allowedToAdd(StationType _type) {
        require( stationTypePrice[_type] != 0, "EVStations: station price cannot be zero");
        _;
    }
    
    constructor (string memory _companyName) {
        companyAddress = msg.sender;
        companyName = _companyName;
    }
    
    function addStation(StationType _type, uint _quantity) public onlyCompany allowedToAdd(_type) {
        saleableStations[_type] += _quantity;
    }
    
    function setTypePrice(StationType _type, uint _price) public onlyCompany {
        stationTypePrice[_type] = _price;
    }
    
    function setPerUnitFee(StationType _type, uint _perUnitFee) public onlyCompany {
        perUnitFees[_type] = _perUnitFee;
    }
    
}