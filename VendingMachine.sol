// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 <= 0.9.0;

contract VendingMachine {
    // The owner of the vending machine
    address public owner;

    // Mapping to track coke balances for each address
    mapping(address => uint) public cokeBalances;

    // Constructor to set the initial state of the vending machine
    constructor() {
        owner = msg.sender;                             // Set the owner to the deployer of the contract
        cokeBalances[address(this)] = 100;              // Set the initial balance of the vending machine to 100
    }

    // Modifier to restrict certain functions to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can restock the vending machine");
        _;
    }

    // Function to retrieve the balance of the vending machine
    function getVendingMachineBalance() public view returns (uint) {
        return cokeBalances[address(this)];
    }

    // Function to allow the owner to restock the vending machine
    function restockVendingMachine(uint _quantity) public onlyOwner {
        cokeBalances[address(this)] += _quantity;
    }

    // Function to allow users to purchase coke from the vending machine
    function purchaseCoke(uint _quantity) public payable {
        // Check if the sent ether is sufficient to cover the purchase
        require(msg.value >= _quantity * 200 wei, "You must pay at least 200 wei per coke!");
        
        // Check if there is enough coke in stock
        require(cokeBalances[address(this)] >= _quantity, "Not enough coke in stock!");

        // Deduct the purchased coke from the vending machine and credit it to the buyer
        cokeBalances[address(this)] -= _quantity;
        cokeBalances[msg.sender] += _quantity;
    } 
}
