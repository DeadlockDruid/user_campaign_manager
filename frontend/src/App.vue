<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title>User Campaign Manager</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn class="mr-2" to="/" text>Home</v-btn>
      <v-btn class="mr-2" to="/add" text>Add User</v-btn>
      <v-btn to="/search" text>Search Users</v-btn>
    </v-app-bar>
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'App'
};
</script>

<style>
nav a {
  margin: 0 1em;
  text-decoration: none;
}
</style>
