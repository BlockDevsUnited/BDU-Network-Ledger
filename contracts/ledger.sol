pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BDUNetwork is Ownable{
    
  struct community {
    string name;
    string hash;
    address manager;
  }

  community[] public communities;

  uint public activeMemberCount; // Not used.

  mapping(uint => bool) active;

  function addCommunity(string memory _name, string memory _hash) public onlyOwner {
    communities.push(community(_name, _hash, owner()));
  }

  function activateCommunity(uint _id) public onlyOwner {
    active[_id] = true;
  }

  function addAndActivateCommunity(string memory _name, string memory _hash) public onlyOwner {
    addCommunity(_name, _hash);
    activateCommunity(communities.length);
  }

  function deactiveateCommunity(uint _id) public onlyOwner {
    active[_id] = false;
  }

  function updateCommunity(uint _id,string memory _newName, string memory _newHash, address _newManager) public {
    require(msg.sender == owner() || msg.sender == communities[_id].manager);
    communities[_id].name = _newName;
    communities[_id].hash = _newHash;
    communities[_id].manager = _newManager;
  }
}
