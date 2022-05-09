import getContract from "@/abi/index.js";

function judgeToken(rootState) {
    if (!state.token) state.token = getContract.getContractByName('market', rootState.app.web3)
}

const state = {};
const mutations = {};
const actions = {
    allowance({rootState}, {owner, spender}) {
        judgeToken(rootState)
        console.log(state.token)
        return new Promise((resolve, reject) => {
            state.token.methods.allowance(owner, spender).call().then(res => {
                resolve(res)
            }).catch(err => {
                console.log(err)
                reject(err)
            })
        })
    },
    approve({rootState}, {spender, amount}) {
        console.log(spender, amount)
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.approve(spender, amount).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.approve(spender, amount).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(err)
            })
        })
    },
    balanceOf({rootState}, {account}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.balanceOf(account).call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    totalSupply({rootState}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.totalSupply().call().then(res => {
                resolve(res)
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    transfer({rootState}, {recipient, amount}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.transfer(recipient, amount).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.transfer(recipient, amount).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
    transferFrom({rootState}, {sender, recipient, amount}) {
        judgeToken(rootState)
        return new Promise((resolve, reject) => {
            state.token.methods.transferFrom(sender, recipient, amount).estimateGas({
                from: rootState.app.account,
            }).then(gas => {
                state.token.methods.transferFrom(sender, recipient, amount).send({
                    from: rootState.app.account,
                    gas: parseInt(gas * 1.2)
                }).then(res => {

                    resolve(res)
                })
            }).catch(err => {
                reject(JSON.parse(err.message.substr(24, err.message.length)).message)
            })
        })
    },
}
export default {
    namespaced: true,
    mutations,
    state,
    actions
}
