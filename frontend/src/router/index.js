import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue';
import AddUser from '@/views/AddUser.vue';
import Search from '@/views/Search.vue';

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/add', name: 'AddUser', component: AddUser },
  { path: '/search', name: 'Search', component: Search }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
