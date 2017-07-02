pragma solidity ^0.4.11;

import 'Ownable.sol';
import 'TokenizedDeal.sol';


/* Create new tokenized contract and hold address of it */
contract DealsHolder is Ownable {

    // contract address => creator address
    mapping (address => address) tokendeals;

    // Constructor
    function DealsHolder() {
        owner = msg.sender;
    }

    // Events
    event EventTokenDeal(address _dealAddress, uint _amount, uint _nights);

    // create new token-deal
    function createTokenDeal(address _landlord, uint _amountOfPayment, uint _nights, uint _tokenPrice) returns (address) {
        address newContract = new TokenizedDeal(_landlord, _amountOfPayment, _nights, _tokenPrice);
        tokendeals[newContract] = msg.sender;
        EventTokenDeal(newContract, _amountOfPayment, _nights);
        return newContract;
    }

    // address of the landlord by contract address
    function creatorOfTheContract(address _contractAddress) constant returns (address _landlord) {
        return tokendeals[_contractAddress];
    }

}
