import axios from "axios";
import router from "../router/router";

export const rawMaterials = {
    namespaced: true,
    state: () => ({
        rawMaterials: {}
    }),
    mutations: {
        rawMaterials(state, rawMaterials) {
            state.rawMaterials = rawMaterials;
        },

        addNew(state, rawMaterial) {
            state.rawMaterials.data.unshift(rawMaterial);
        },

        update(state, updatedRawMaterial) {

            let rawMaterials = state.rawMaterials.data;

            //Find index of specific object using findIndex method.
            const objIndex = rawMaterials.findIndex(( rawMaterial => rawMaterial.id === updatedRawMaterial.id ));
            rawMaterials[objIndex] = updatedRawMaterial;


        },
        delete(state, id) {
            state.rawMaterials.data = state.rawMaterials.data.filter(rawMaterial => rawMaterial.id !== id);
        },
    },

    actions: {
        getRawMaterials({ commit }, page = 1) {
            axios.get(`rawMaterials?page=${ page }`)
                .then(res => {
                    if (res.data.success) {
                        commit('rawMaterials', res.data.rawMaterials);
                    }
                })
                .catch(err => {
                    if (err.response) {
                        commit('messages/errorMsg', err.response.data.message, { root: true })
                    }
                });
        },
    },

    getters: {
        rawMaterials(state) {
            return state.rawMaterials;
        }
    }
};

