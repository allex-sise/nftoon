import contractRegele from "../assets/contracts/NftoonRegeleV5.json"
import contractMain from "../assets/contracts/NftoonMain.json"

let dict = {
    '0xCdcF4cbA4A23B1D4eD67dE961149243a9E9d0668':contractRegele.abi,
    '0x741F8c281cB2C9240Ec79C455047063394951d7d':contractMain.abi
};
// var addPair = function (myKey, myValue) {
//     dict[myKey] = myValue;
// };
let getContractAbiById = function (myKey) {
    return dict[myKey];
};

export { getContractAbiById as default};