<template>
  <v-table class="elevation-1 mt-2">
    <thead>
      <tr>
        <th v-for="header in headers" :key="header.value" class="text-start">
          {{ header.text }}
        </th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="user in users" :key="user.name">
        <td>{{ user.name }}</td>
        <td>{{ user.email }}</td>
        <td>
          <ul>
            <li v-for="campaign in user.campaigns_list" :key="campaign.campaign_id">
              {{ campaign.campaign_name }} ({{ campaign.campaign_id }})
            </li>
          </ul>
        </td>
      </tr>
      <tr v-if="!users.length">
        <td colspan="3" class="text-center">
          <v-alert type="info" class="my-4">
            No users present. Please add some.
          </v-alert>
        </td>
      </tr>
    </tbody>
  </v-table>
</template>

<script>
import userService from '@/api/services/users/userService';

export default {
  data() {
    return {
      headers: [
        { text: 'Name', value: 'name' },
        { text: 'Email', value: 'email' },
        { text: 'Campaigns', value: 'campaigns_list' }
      ],
      users: [],
    };
  },
  async created() {
    try {
      const response = await userService.getUsers();

      this.users = response.map(user => ({
        ...user,
        campaigns_list: user.campaigns_list || []
      }));
    } catch (error) {
      console.error('There was an error fetching the users! ', error.response.data.errors);
    }
  },
};
</script>
