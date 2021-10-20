import Vue from 'vue';
import vueRouter from 'vue-router';
import store from '../store';
Vue.use(vueRouter);

import welcome from "../pages/welcome";
import login from '../pages/auth/login';
import dashboard from '../pages/dashboard';
import rawMaterial from '../pages/rawMaterial';
import products from '../pages/productsList';
import dailyProducts from '../pages/dailyProducts/dailyProducts';
import addDailyProduct from '../pages/dailyProducts/addDailyProduct';


const routes = [
    { path: '/', name: 'welcome', component: welcome, meta: { requiresAuth: true } },
    { path: '/auth/login', name: 'login', component: login, meta: { visitor: true } },
    { path: '/dashboard', name: 'dashboard', component: dashboard, meta: { requiresAuth: true } },
    { path: '/raw-material', name: 'rawMaterial', component: rawMaterial, meta: { requiresAuth: true } },
    { path: '/products', name: 'products', component: products, meta: { requiresAuth: true } },
    { path: '/daily-products', name: 'dailyProducts', component: dailyProducts, meta: { requiresAuth: true } },
    { path: '/add-daily-product', name: 'addDailyProduct', component: addDailyProduct, meta: { requiresAuth: true } },
]

const router = new vueRouter({
    routes,
    mode: 'history',
    base: process.env.BASE_URL
});


//check auth
router.beforeEach((to, from, next) => {

    if (to.matched.some(record => record.meta.requiresAuth)) {

        store.commit('auth/setAuthData');
        store.dispatch('auth/isAuthenticated');
        //store.dispatch('auth/refresh');

        if (to.name !== 'login' && !store.getters['auth/authenticated']) {
            next({
                name: 'login',
                //query: { redirect: to.fullPath }
            })
        }
        else {
            next();
        }
    }
    else if (to.matched.some(record => record.meta.visitor)) {

        store.commit('auth/setAuthData');

        if (store.getters['auth/authenticated']) {
            next({
                name: 'dashboard',
                //query: { redirect: to.fullPath }
            })
        }
        else {
            next();
        }
    }
    else {
        next() // make sure to always call next()!
    }
});



export default router;
