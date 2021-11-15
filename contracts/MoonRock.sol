// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact team@herodao.org
contract MoonRock is ERC20, ERC20Burnable, ERC20Snapshot, Ownable {
    constructor(uint _amount) ERC20("MoonRock", "MR") {
      //One mint at once. All tokens are minted to owner. Owner is in charge of moving tokens
      //If everything looks in order, the DAO will approve this contract as the official Moon Rock token
      _mint(msg.sender, _amount);
    }

    function snapshot() public onlyOwner {
        _snapshot();
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Snapshot)
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
