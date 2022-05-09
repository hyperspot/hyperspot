import Vue from 'vue'
import VueRouter from 'vue-router'
import layout from "@/layout";

Vue.use(VueRouter)

const routes = [

    {
        path: '/',
        component: layout,
        redirect: '/detail',
        children: [
            {
                path: '/lend',
                name: 'lend',
                component: () => import('../views/list.vue'),
            },
            {
                path: '/detail',
                name: 'detail',
                component: () => import('../views/detail.vue'),
            },
            {
                path: '/borrowDetail',
                name: 'borrowDetail',
                component: () => import('../views/borrowDetail.vue'),
            },
            {
                path: '/borrow',
                name: 'borrow',
                component: () => import('../views/borrow.vue'),
            }
        ]
    }
]
const router = new VueRouter({
    routes
})

export default router
