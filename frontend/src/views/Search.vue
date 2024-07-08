<template>
  <v-container>
    <SearchUsers />
  </v-container>
</template>

<script>
import SearchUsers from '@/components/Search/SearchUsers.vue';

export default {
  name: 'Search',
  components: {
    SearchUsers
  }
};
</script>
