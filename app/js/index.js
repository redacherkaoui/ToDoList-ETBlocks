const Web3 = require('web3');
const web3 = new Web3('http://localhost:9545');

const TodoContract = require('./build/contracts/Todo.json');

console.log('loaded');

const contractAddress = TodoContract.networks['5777'].address; // Replace <YOUR_NETWORK_ID>
const contract = new web3.eth.Contract(TodoContract.abi, contractAddress);

async function getContractInfo() {
  const accounts = await web3.eth.getAccounts();
  console.log('Accounts:', accounts);

  // Example: Call a function of your contract
  const taskIds = await contract.methods.getTaskIds().call();
  console.log('Task IDs:', taskIds);
}

getContractInfo();
