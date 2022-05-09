import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import app from "./modules/app";
import abisMethods from "./modules/abisMethods/index"

Vue.use(Vuex)

export default new Vuex.Store({
    getters,
    modules: {
        app,
        ...abisMethods
    }
})
