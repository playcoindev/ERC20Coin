pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

/**
 * @title ERC 20 contract
 */
contract ERC20Coin is StandardToken {
    string public symbol;
    string public name;
    uint8 public decimals = 9;

    uint noOfTokens = 1000000000; // 1,000,000,000 (1B)

    /**
     * @dev initialize QRC20(ERC20)
     *
     * all token will deposit into the vault
     * later, the vault, owner will be multi sign contract to protect privileged operations
     *
     * @param _symbol token symbol
     * @param _name   token name
     * @param _vault  vault address
     */
    constructor (string _symbol, string _name, address _vault) public {
        require(bytes(_symbol).length > 0);
        require(bytes(_name).length > 0);

        totalSupply_ = noOfTokens * (10 ** uint(decimals));
        // 1E9 tokens initially

        symbol = _symbol;
        name = _name;

        balances[_vault] = totalSupply_;
        emit Transfer(address(0), _vault, totalSupply_);
    }

    function getMaxNumberOfTokens() public view returns (uint) {
        return noOfTokens;
    }
}