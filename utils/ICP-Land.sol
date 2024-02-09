// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract ICPLandFurniture is ERC721URIStorage, Ownable(msg.sender) {

    uint public price = 25000000000000000;
    uint256 public tokenCounter = 0;
    mapping(address => uint256) public addressToTokenId;
    
    constructor() ERC721("ICPLand", "FURNITURE") {}
    
    struct Furniture {
        address ownerName;
        string title;
        string link;
    }

    event NewFurniture(uint furniture, address ownerName, string title, string link);

    Furniture[] public furnitures;
    uint public nbFurnitures;
    

    function createFurniture(address _ownerName, string memory _title, string memory _link) public {
        furnitures.push(Furniture(_ownerName, _title, _link));
        emit NewFurniture(nbFurnitures, _ownerName, _title, _link);
        nbFurnitures++;
    }

    function mintNFT(address recipient, string memory name, string memory tokenURI) public payable returns(uint256)
    {
        tokenCounter = tokenCounter + 1;
        _mint(recipient, tokenCounter);
        _setTokenURI(tokenCounter, tokenURI);
        addressToTokenId[msg.sender] = tokenCounter;
        createFurniture(recipient, name, tokenURI);
        return tokenCounter;
    }

    function viewTokenCounter() public view returns(uint){
        return tokenCounter;
    }

    function withdrawAll() external payable onlyOwner {
        uint256 balance = address(this).balance;
        uint256 balanceOne = balance;
        ( bool transferOne, ) = payable(msg.sender).call{value: balanceOne}("");
        require(transferOne, "Transfer failed.");
    }
}