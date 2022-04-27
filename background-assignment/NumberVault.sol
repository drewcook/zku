// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

// This contract can be transferred to other owners
contract NumberVault is Ownable {
    // Ensures we are only storing valid unsigned 256bit integers. This protects against underflow and overflow.
    using SafeMath for uint256;

    // This value is only accessible within the contract.
    uint256 private _number;

    // A getter for the number stored in local state
    function retrieveNumber() public view returns (uint256 storedNumber) {
        return _number;
    }

    // A setter for storing a new value as the number in local state.
    // This can only be called by the contract owner.
    function storeNumber(uint256 number) public onlyOwner {
        _number = number;
    }
}
