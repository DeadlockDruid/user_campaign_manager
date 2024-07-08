<template>
  <v-container>
    <v-row class="mt-4">
      <v-col>
        <v-card class="pa-4">
          <v-card-title class="display-1">User List</v-card-title>
          <v-card-text>
            <UserList />
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import UserList from '@/components/Home/UserList.vue';

export default {
  name: 'Home',
  components: {
    UserList
  }
};
</script>
