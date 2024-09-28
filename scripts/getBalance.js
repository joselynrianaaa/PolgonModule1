const hre = require("hardhat");
const tokenContractJSON = require("../artifacts/contracts/CloudRabbit.sol/CloudRabbit.json");

const tokenAddress = "0x8bc787A539CB359DC5c09cC46eED6B2Bf8145321"; 
const tokenABI = tokenContractJSON.abi;
const walletAddress = "0x3b1A95B6b9e8f40F1C5e876a6e8338b7Ee3209c4";

async function main() {
  try {
    const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);
    const balance = await token.balanceOf(walletAddress);
    console.log(`You now have: ${balance} NFTs in your wallet`);
  } catch (error) {
    console.error(error);
    process.exitCode = 1;
  }
}

main();