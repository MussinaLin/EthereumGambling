const Web3 = require('web3');

console.log('hi');

// const web3 = new Web3(Web3.givenProvider || "https://ropsten.infura.io/v3/e876de601519478790cf4e8c425d0aee");
const web3 = new Web3(Web3.givenProvider || "ws://10.1.40.23:8546");
console.log(web3);
console.log(web3.isAddress("0x8888f1f195afa192cfee860698584c030f4c9db1"));
// console.log(web3.modules);