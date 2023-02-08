import abi from "@/abi";
let tokenByType = new Map()
tokenByType['RBTElf'] = abi.CONTRACTS.RBTElf.address
tokenByType['RBTEnvoy'] = abi.CONTRACTS.RBTEnvoy.address
tokenByType['RBTPartner'] = abi.CONTRACTS.RBTPartner.address
tokenByType['RBTNode'] = abi.CONTRACTS.RBTNode.address

let imgByType = new Map()
imgByType['RBTElf'] = require("@/assets/img/elves.png")
imgByType['RBTEnvoy'] = require("@/assets/img/ambassador.png")
imgByType['RBTPartner'] = require("@/assets/img/partner.png")
imgByType['RBTNode'] = require("@/assets/img/superNode.png")
let typeByToken = new Map([
    [abi.getContractAddress("RBTElf"), "RBTElf"],
    [abi.getContractAddress("RBTEnvoy"), "RBTEnvoy"],
    [abi.getContractAddress("RBTPartner"), "RBTPartner"],
    [abi.getContractAddress("RBTNode"), "RBTNode"],
])
export {
    tokenByType,
    imgByType,
    typeByToken
}
