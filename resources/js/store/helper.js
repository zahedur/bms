export const helper = {
    namespaced: true,
    state: () => ({
        loading: false
    }),
    mutations: {
        loading(state, value) {
            state.loading = value;
        },
    },
    getters: {
        loading(state) {
            return state.loading;
        }
    }
};
