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
  { 
    path: '/acciones_administrador',
    name: 'BotonesAdministrador', 
    component: () => import('../views/BotonesAdministrador.vue') 
  },
  { 
    path: '/login_administrador',
    name: 'LoginAdministrador', 
    component: () => import('../views/LoginAdministrador.vue') 
  },
  { 
    path: '/login_mesero',
    name: 'LoginMesero', 
    component: () => import('../views/LoginMesero.vue') 
  },
  { 
    path: '/acciones_mesero',
    name: 'BotonesMesero', 
    component: () => import('../views/BotonesMesero.vue') 
  },

  { 
    path: '/cocina',
    name: 'Vista_cocina', 
    component: () => import('../views/Vista_cocina.vue') 
  },
  {
    path: '/nueva_orden',
    name: 'NuevaOrden',
    component: () => import ('../views/NuevaOrden.vue')
  },
  { 
    path: '/ordenes',
    name: 'Ordenes', 
    component: () => import('../views/Ordenes.vue') 
  },
  { 
    path: '/ventas',
    name: 'Ventas', 
    component: () => import('../views/Ventas.vue') 
  },
  { 
    path: '/cortes',
    name: 'Cortes', 
    component: () => import('../views/Cortes.vue') 
  },
  { 
    path: '/detalles_orden',
    name: 'Detalles_orden', 
    component: () => import('../views/Detalles_orden.vue') 
  },
  { 
    path: '/ticket',
    name: 'Ticket', 
    component: () => import('../views/Orden_ticket.vue') 
  },
  { 
    path: '/ordenes_de_vida',
    name: 'Ordenes_de_vida', 
    component: () => import('../views/Ordenes_de_vida.vue') 
  },

]

const router = new VueRouter({
  routes
})

export default router
