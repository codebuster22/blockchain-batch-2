// name -> IP-address
// name -> company profile
// company can register domain
// comapny can update domain

pragma solidity ^0.8.0;

contract ENS {
    
    // state varibales
    mapping(string => string) private _domain_to_ip;
    
    struct Company{
        uint id;
        string comapnyName;
        uint yearOfEstb;
        string category;
    }
    mapping(string => Company) private _domain_to_company;
    uint public company_counter;
    
    // logic
    function getIP(string memory _domain_name) public view returns(string memory ip_){
        ip_ = _domain_to_ip[_domain_name];
    }
    
    function setIP(string memory _domian_name, string memory _ip) public {
        _domain_to_ip[_domian_name] = _ip;
    }
    
    function registerDomain(
            string memory _company_name,
            string memory _category,
            string memory _domain_name,
            string memory _ip,
            uint _year_of_estb
        ) public {
            
        require( _domain_to_company[_domain_name].id == 0 , "ENS: domain already taken" );
            
        company_counter++;
        
        Company memory company = Company(company_counter,_company_name, _year_of_estb, _category );
        _domain_to_company[_domain_name] = company;
        setIP(_domain_name, _ip);
    }
    
    function getCompanyProfile(string memory _domain_name
        ) public view returns(Company memory company_) {
        
        company_ = _domain_to_company[_domain_name];
    }
    
    function updateDomain(
        string memory _old_domain,
        string memory _new_domain
        ) public {
            
        _domain_to_ip[_new_domain] = _domain_to_ip[_old_domain];
        _domain_to_company[_new_domain] = _domain_to_company[_old_domain];
        
        delete _domain_to_ip[_old_domain];
        delete _domain_to_company[_old_domain];
    }
}