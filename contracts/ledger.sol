  pragma solidity ^0.8.0;

  import "@openzeppelin/contracts/access/Ownable.sol";

  contract BDUNetwork is Ownable{
    
  struct community {
      string name;
      string hash;
      address manager;
  }

  community[] public communities;

  uint public memberCount = 0;

  uint public activeMemberCount;

  mapping(uint=>bool) active;

  function addCommunity(string memory name, string memory hash) public onlyOwner {
    communities[memberCount].name = name;
    communities[memberCount].hash = hash;
    memberCount++;
  }

  function activateCommunity(uint id) public onlyOwner {
    active[id] =true;
  }

  function addAndActivateCommunity(string memory name, string memory hash) public onlyOwner {
    activateCommunity(memberCount);
    addCommunity(name,hash);
  }

  function deactiveateCommunity(uint id) public onlyOwner {
    active[id]=false;
  }

  function updateCommunityInfo(uint id,string memory name, string memory hash, address representative) public {
    require(msg.sender==owner() || msg.sender==communities[id].manager);
    communities[id].name = name;
    communities[memberCount].hash = hash;
  }
  }
