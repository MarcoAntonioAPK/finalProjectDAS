import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/administradores',
    name: 'Administradores',
    component: () => import('../views/Administrador.vue')
  },
  {
    path: '/productos',
    name: 'Productos',
    component: () => import('../views/Producto_menu.vue')
  },
]

const router = new VueRouter({
  routes
})

export default router
