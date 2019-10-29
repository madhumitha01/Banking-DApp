# Banking-DApp
This project mainly focuses on creating and interacting with the smart contracts within an application. Basically, we will have a Struct that describe a Simple bank system. With Structs, we will be able to assign multiple properties to them such as fromAdress, toAddress, amount and so on.
Struct definition, as the name suggests is just a definition but not a variable itself. We will create an instance of this Struct every time a new spending request is created.

The features that will be included in this project are:
-	Display the balance of an account holder.
-	Check if the User-entered ID is unique.
-	Ask and store more information about a User.
-	Add in an option to see whether a person with a specific id has deposited or not.
-	Initializes with owner, anyone can deposit money but only account owner.
-	Can withdraw money from the account. Also let the owner to check the balance.
-	Require Users to have an Ethereum Address to withdraw or deposit.

1.	Since a blockchain is a permanent record of transactions (votes) that are distributed, every deposit can irrefutably be traced back to exactly when and where it happened without revealing the account holder’s identity. 
2.	Transactions are verified and approved by consensus among participants in the network, making fraud more difficult.
3.	The full chronologies of events that take place are tracked, allowing anyone to trace or audit prior transactions.
4.	Past deposit cannot be changed, while the present can’t be hacked, because every transaction is verified by every single node in the network. 
5.	Any outside or inside attacker must have control of 51% of the nodes to alter the record.
