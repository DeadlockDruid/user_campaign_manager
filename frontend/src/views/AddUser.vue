<template>
  <v-container>
    <AddUserForm />
  </v-container>
</template>

<script>
import AddUserForm from '@/components/AddUser/AddUserForm.vue';

export default {
  name: 'AddUser',
  components: {
    AddUserForm
  }
};
</script>
