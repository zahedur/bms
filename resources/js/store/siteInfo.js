export const siteInfo = {
    namespaced: true,
    state: () => ({
        logo: '',
        title: '',
        subTitle: '',
        currency: {
            name: '',
            symbol: ''
        },
        language: '',
    }),

    mutations: {
        setLogo(state, data) {
            state.logo = data;
        },

        setTitle(state, data) {
            state.title = data;
        },

        setSubTitle(state, data) {
            state.subTitle = data;
        },

        setCurrency(state, data) {
            state.currency.name = data.currency.name;
            state.currency.symbol = data.currency.symbol;
        },

        setLanguage(state, data) {
            state.language = data;
        },

        siteInfo(state, data) {
            state.logo = data.logo;
            state.title = data.title;
            state.subTitle = data.subTitle;
            state.currency.name = data.currency.name;
            state.currency.symbol = data.currency.symbol;
            state.language = data.language;
        }
    },

    getters: {
        siteInfo(state) {
            return state
        }
    }
}
