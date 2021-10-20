import axios from "axios";
import router from "../router/router";

export const products = {
    namespaced: true,
    state: () => ({
        products: {}
    }),
    mutations: {
        products(state, products) {
            state.products = products;
        },

        addNew(state, product) {
            state.products.data.unshift(product);
        },

        update(state, updatedProduct) {

            let products = state.products.data;

            //Find index of specific object using findIndex method.
            const objIndex = products.findIndex(( product => product.id === updatedProduct.id ));
            products[objIndex] = updatedProduct;


        },
        delete(state, id) {
            state.products.data = state.products.data.filter(product => product.id !== id);
        },
    },

    actions: {
        getProducts({ commit }, page = 1) {
            axios.get(`products?page=${ page }`)
                .then(res => {
                    if (res.data.success) {
                        commit('products', res.data.products);
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
        products(state) {
            return state.products;
        }
    }
};

