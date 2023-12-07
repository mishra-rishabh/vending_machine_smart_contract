# Vending Machine Solidity Contract

This Solidity smart contract represents a simple Vending Machine where users can purchase coke by sending ether. The contract allows the owner to restock the machine and keeps track of coke balances for each address.

## Functions
### `getVendingMachineBalance()`
Returns the current coke balance of the vending machine.

### `restockVendingMachine(uint _quantity)`
Allows the owner to restock the vending machine with a specified quantity of coke.

### `purchaseCoke(uint _quantity)`
Allows users to purchase coke by sending ether. The user must pay at least 200 wei per coke, and the contract ensures there is enough coke in stock.

## Modifiers
### `onlyOwner`
Restricts certain functions to only be callable by the owner of the vending machine.

## Usage
1. Deploy the VendingMachine contract.
2. Use the `restockVendingMachine` function to add coke to the vending machine.
3. Users can purchase coke using the `purchaseCoke` function by sending the required ether.
