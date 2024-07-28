// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmallBusinessContract {
    address public businessOwner;
    address public customer;
    uint public totalAmount;
    bool public isConfirmed;

    event ContractCreated(address indexed _businessOwner, address indexed _customer, uint _totalAmount);
    event ContractConfirmed();

    constructor(address _customer, uint _totalAmount) {
        businessOwner = msg.sender;
        customer = _customer;
        totalAmount = _totalAmount;
        isConfirmed = false;
        emit ContractCreated(businessOwner, customer, totalAmount);
    }

    function confirmContract() public {
        require(msg.sender == customer, "Only customer can confirm the contract");
        isConfirmed = true;
        emit ContractConfirmed();
    }
}
