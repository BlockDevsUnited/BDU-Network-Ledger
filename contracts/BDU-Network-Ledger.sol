pragma solidity ^0.8.0;

contract BDU_Network_Ledger{
    
  address public manager;
  
  modifier onlyManager {
      require(msg.sender==manager, "Must be Network Manager");
      _;
  }
    
  struct community {
      string name;
      string hash;
      address manager;
      bool active;
  }
  
  community[] public communities;
  
  uint public memberCount = 0;
  
  uint public activeMemberCount;
  
  constructor() {
    manager = msg.sender;
  }
  
  function setManager(address newManager) public onlyManager{
    manager = newManager;
  }
  
  function addCommunity(string memory name, string memory hash, address communityManager,bool active) public onlyManager{
    communities.push(community(name,hash,communityManager,active));
    memberCount++;
  }
  
  function activateCommunity(uint id) public onlyManager{
    communities[id].active = true;
  }
  
  function deactiveateCommunity(uint id) public onlyManager{
    communities[id].active = false;
  }
  
  function updateCommunityInfo(uint id,string memory name, string memory hash, address communityManager) public{
    require(msg.sender==manager || msg.sender==communities[id].manager);
    communities[id].name = name;
    communities[id].hash = hash;
    communities[id].manager = communityManager;
  }
}
