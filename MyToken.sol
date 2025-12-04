// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {

    // -----------------------------------------------------------
    // 🔹 Token metadata - public so anyone can read them
    // -----------------------------------------------------------
    string public name = "MyToken";       // Token name
    string public symbol = "MTK";         // Token symbol
    uint8 public decimals = 18;           // Standard ERC-20 decimals

    // -----------------------------------------------------------
    // 🔹 Total supply of the token
    // -----------------------------------------------------------
    uint256 public totalSupply;

    // -----------------------------------------------------------
    // 🔹 Mapping to track balances: address => token balance
    // -----------------------------------------------------------
    mapping(address => uint256) public balanceOf;

    // -----------------------------------------------------------
    // 🔹 Nested mapping for allowances:
    //    owner => (spender => amount approved)
    // -----------------------------------------------------------
    mapping(address => mapping(address => uint256)) public allowance;

    // -----------------------------------------------------------
    // 🔹 Events required by the ERC-20 standard
    // -----------------------------------------------------------

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // -----------------------------------------------------------
    // 🔹 Constructor: runs only once during deployment
    //    Assigns the entire supply to the contract creator
    // -----------------------------------------------------------
    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    // -----------------------------------------------------------
    // 🔹 Transfer tokens from caller to another address
    // -----------------------------------------------------------
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Cannot transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // Corrected line ↓
        balanceOf[msg.sender] -= _value;

        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
        // -----------------------------------------------------------
    // 🔹 Approve another address to spend tokens on your behalf
    // -----------------------------------------------------------
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // Validate spender is not zero address
        require(_spender != address(0), "Cannot approve zero address");

        // Set allowance for spender
        allowance[msg.sender][_spender] = _value;

        // Emit Approval event AFTER updating state
        emit Approval(msg.sender, _spender, _value);

        return true;
    }
        // -----------------------------------------------------------
    // 🔹 Transfer tokens on behalf of the owner using allowance
    // -----------------------------------------------------------
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Validate recipient is not zero address
        require(_to != address(0), "Cannot transfer to zero address");

        // Validate owner has sufficient balance
        require(balanceOf[_from] >= _value, "Insufficient balance");

        // Validate caller has enough allowance
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");

        // Subtract tokens from owner's balance
        balanceOf[_from] -= _value;

        // Add tokens to recipient
        balanceOf[_to] += _value;

        // Reduce allowance
        allowance[_from][msg.sender] -= _value;

        // Emit Transfer event AFTER updating state
        emit Transfer(_from, _to, _value);

        return true;
    }
        // -----------------------------------------------------------
    // 🔹 Helper function to get total supply
    // -----------------------------------------------------------
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // -----------------------------------------------------------
    // 🔹 Helper function to get all token details
    // -----------------------------------------------------------
    function getTokenInfo() public view returns (string memory, string memory, uint8, uint256) {
        return (name, symbol, decimals, totalSupply);
    }


}
