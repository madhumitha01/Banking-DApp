pragma solidity ^0.4.18;

/*
 * A simple banking contract
 * Initializes with owner, anyone can deposit money but only account owner
 * can withdraw money from the account. Also let the owner to check the balance.
 * 0x345ca3e014aaf5dca488057592ee47305d9b3e10
 */

contract SimpleBank {
    struct Transaction {
    address fromAddress;
    address toAddress;
    uint amount;
  }

  address owner;
  Transaction[] transactions;

  modifier onlyOwner() {
    require(owner == msg.sender);
    _;
  }
  
  function SimpleBank() public {
    /* Set the owner to the creator of this contract */
    owner = msg.sender;
  }

  function deposit(address _fromAddress, uint _depositAmount) public {
    /* Add the amount to the user's balance, call the event associated with a deposit,
       then return the balance of the user */
    Transaction memory transaction = Transaction(_fromAddress, owner, _depositAmount);
    transactions.push(transaction);
  }

  function withdraw(address _toAddress, uint _withdrawAmount) public onlyOwner {
    /* If the sender's balance is at least the amount they want to withdraw,
       Subtract the amount from the sender's balance, and try to send that amount of ether
       to the user attempting to withdraw. IF the send fails, add the amount back to the user's balance
       return the user's balance.*/
    require(balance() >= _withdrawAmount);
    Transaction memory transaction = Transaction(owner, _toAddress, _withdrawAmount);
    transactions.push(transaction);
  }

  function balance() public view returns (uint) {
    uint paidIn = 0;
    uint paidOut = 0;
    /* Get the balance of the sender of this transaction */
    for (uint i = 0; i < transactions.length; i++) {
      if (transactions[i].toAddress == owner) {
        paidIn += transactions[i].amount;
      }

      if (transactions[i].fromAddress == owner) {
        paidOut += transactions[i].amount;
      }
    }

    return paidIn - paidOut;
  }
  
  // Fallback function - Called if other functions don't match call or
  // sent ether without data.
  // Typically, called when invalid data is sent
  // Added so ether sent to this contract is reverted if the contract fails
  // otherwise, the sender's money is transferred to contract
  function() public {
    revert();
  }
}