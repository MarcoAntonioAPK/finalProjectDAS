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
    path: '/menu',
    name: 'Menu',
    component: () => import('../views/Menu.vue')
  },
  {
    path: '/productos',
    name: 'Productos',
    component: () => import('../views/Producto_menu.vue')
  },
  {
    path: '/meseros',
    name: 'Meseros',
    component: () => import('../views/Meseros.vue')
  },
  { 
    path: '/categoria',
    name: 'Categoria', 
    component: () => import('../views/Categoria.vue') 
  },
  { 
    path: '/mesas',
    name: 'Mesas', 
    component: () => import('../views/Mesas.vue') 
  },
]

const router = new VueRouter({
  routes
})

export default router
