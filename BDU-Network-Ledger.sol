pragma solidity ^0.8.0;

contract BDUNetwork{
    
  address public manager;
  
  modifier onlyManager {
      require(msg.sender==manager);
      _;
  }
    
  struct community {
      string name;
      string hash;
      address manager;
  }
  
  community[] public communities;
  
  uint public memberCount = 0;
  
  uint public activeMemberCount;
  
  mapping(uint=>bool) active;
 
  function addCommunity(string memory name, string memory hash) public onlyManager{
    communities[memberCount].name = name;
    communities[memberCount].hash = hash;
    memberCount++;
  }
  
  function activateCommunity(uint id) public onlyManager{
    active[id] =true;
  }
  
  function addAndActivateCommunity(string memory name, string memory hash) public onlyManager{
    activateCommunity(memberCount);
    addCommunity(name,hash);
  }
  
  function deactiveateCommunity(uint id) public onlyManager{
    active[id]=false;
  }
  
  function updateCommunityInfo(uint id,string memory name, string memory hash, address representative) public{
    require(msg.sender==manager || msg.sender==communities[id].manager);
    communities[id].name = name;
    communities[id].hash = hash;
    communities[id].hash = hash;
  }
}
