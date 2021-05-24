// name -> IP-address
// name -> company profile
// company can register domain
// comapny can update domain

pragma solidity ^0.8.0;

contract ENS {
    
    // state varibales
    struct Company{
        uint id;
        string comapnyName;
        uint yearOfEstb;
        string category;
    }
    uint public company_counter;
    
    mapping(string => string )  private _domain_to_ip;
    mapping(string => address) public  domain_to_owner;
    mapping(string => Company) private _domain_to_company;
    
    event CompanyRegistered(address owner, string domainName, string companyName);
    
    // modifier
    modifier isOwner(string memory _domain_name) {
        require(
            domain_to_owner[_domain_name] == msg.sender,
            "ENS: you are not the owner"
            );
        _;
    }
    
    // logic
    function setIP(
        string memory _domain_name,
        string memory _ip
        ) public isOwner(_domain_name) {
        
        _domain_to_ip[_domain_name] = _ip;
    }
    
    function getIP(string memory _domain_name) public view returns(string memory ip_){
        ip_ = _domain_to_ip[_domain_name];
    }
    
    function registerDomain(
            string memory _company_name,
            string memory _category,
            string memory _domain_name,
            string memory _ip,
            uint _year_of_estb
        ) public returns(bool flag_) {
            
        require( 
            _domain_to_company[_domain_name].id == 0,
            "ENS: domain already taken" 
            );
        
        company_counter++;
        
         _domain_to_company[_domain_name] = Company(
                                                company_counter,
                                                _company_name,
                                                _year_of_estb,
                                                _category 
                                            );
        domain_to_owner[_domain_name] = msg.sender;
        setIP(_domain_name, _ip);
        emit CompanyRegistered(msg.sender, _domain_name, _company_name);
        flag_ = true;
    }
    
    function getCompanyProfile(string memory _domain_name
        ) public view returns(Company memory company_) {
        
        company_ = _domain_to_company[_domain_name];
    }
    
    function updateDomain(
        string memory _old_domain,
        string memory _new_domain
        ) public isOwner(_old_domain) {
        
        _domain_to_ip[_new_domain]      = _domain_to_ip[_old_domain];
        _domain_to_company[_new_domain] = _domain_to_company[_old_domain];
        
        delete _domain_to_ip[_old_domain];
        delete _domain_to_company[_old_domain];
    }
}