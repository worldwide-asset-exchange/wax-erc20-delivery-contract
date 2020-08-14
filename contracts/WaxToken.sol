pragma solidity ^0.4.13;

import "zeppelin-solidity/contracts/token/StandardToken.sol";
import "zeppelin-solidity/contracts/lifecycle/Pausable.sol";


/**
 * @title WaxToken
 * @dev ERC20 WAX Token
 *
 * WAX Tokens are divisible by 1e8 (100,000,000) base
 * units referred to as 'Grains'.
 *
 * WAX are displayed using 8 decimal places of precision.
 *
 * 100 Million WAX Token total supply (10 Quadrillion Grains):
 *   100,000,000 * 1e8 == 10e7 * 10**8 == 10e15
 *
 * All initial WAX Grains are assigned to the creator of
 * this contract.
 */
contract WaxToken is StandardToken, Pausable {

  string public constant name = 'Wax Token';                              // Set the token name for display
  string public constant symbol = 'WAXE';                                  // Set the token symbol for display
  uint8 public constant decimals = 8;                                     // Set the number of decimals for display
  uint256 public constant INITIAL_SUPPLY = 10e7 * 10**uint256(decimals); // supply specified in Grains

  /**
   * @dev Modifier to make a function callable only when the contract is not paused.
   */
  modifier rejectTokensToContract(address _to) {
    require(_to != address(this));
    _;
  }

  /**
   * @dev WaxToken Constructor
   * Runs only on initial contract creation.
   */
  function WaxToken() {
    totalSupply = INITIAL_SUPPLY;                               // Set the total supply
    balances[msg.sender] = INITIAL_SUPPLY;                      // Creator address is assigned all
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }

  /**
   * @dev Transfer token for a specified address when not paused
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function transfer(address _to, uint256 _value) rejectTokensToContract(_to) public whenNotPaused returns (bool) {
    return super.transfer(_to, _value);
  }

  /**
   * @dev Transfer tokens from one address to another when not paused
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) rejectTokensToContract(_to) public whenNotPaused returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  /**
   * @dev Aprove the passed address to spend the specified amount of tokens on behalf of msg.sender when not paused.
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
    return super.approve(_spender, _value);
  }

  /**
   * Adding whenNotPaused
   */
  function increaseApproval (address _spender, uint _addedValue) public whenNotPaused returns (bool success) {
    return super.increaseApproval(_spender, _addedValue);
  }

  /**
   * Adding whenNotPaused
   */
  function decreaseApproval (address _spender, uint _subtractedValue) public whenNotPaused returns (bool success) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }

}
