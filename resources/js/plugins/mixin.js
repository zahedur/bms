import Vue from 'vue';
import { mapGetters } from 'vuex'
import {products} from "../store/products";
import moment from "moment";

Vue.mixin({
    methods: {
        getPageNumber(pageUrl) {
            let url = new URL(pageUrl);
            return url.searchParams.get("page");
        },

        isPaginate(pageUrl1, pageUrl2) {
            let url1 = new URL(pageUrl1);
            let Number1 = url1.searchParams.get("page");

            let url = new URL(pageUrl2);
            let Number2 = url.searchParams.get("page");

            return Number1 !== Number2;
        },

        limitAfterDecimal (value, limit) {
            return (Math.floor(value * 100) / 100).toFixed(limit)
        },

        customFormatter(date) {
            return moment(date).format('D/MM/YYYY');
        },

        today() {
            let date= new Date();
            return date.getDate() +'/'+date.getMonth()+'/'+date.getFullYear();
        },

        confirm(callback){
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    callback();
                }

            })
        },

        success(message) {
            this.$store.commit('messages/successMsg', message);
        },
        error(err) {
            if (err.response) {
                this.$store.commit('messages/errorMsg', err.response.data.message);
            }
        },
        warning(message) {
            this.$store.commit('messages/warningMsg', message);
        },
        info(message) {
            this.$store.commit('messages/infoMsg', message);
        },

        startLoading() {
            this.$store.commit('helper/loading', true);
        },
        endLoading() {
            this.$store.commit('helper/loading', false);
        },

    },

    computed: {
        ...mapGetters({
            user: 'auth/user',
            authenticated: 'auth/authenticated',
            siteInfo: 'siteInfo/siteInfo',

            //Messages
            successMsg: 'messages/successMsg',
            errorMsg: 'messages/errorMsg',
            warningMsg: 'messages/warningMsg',
            infoMsg: 'messages/infoMsg',
            loading: 'helper/loading',

            //Raw materials
            rawMaterials: 'rawMaterials/rawMaterials',
            products: 'products/products'
        })
    }
});

