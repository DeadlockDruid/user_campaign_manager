<template>
  <v-container>
    <v-card class="pa-4">
      <v-card-title class="display-1">Search Users</v-card-title>
      <v-card-text>
        <v-form @submit.prevent="submitSearch">
          <v-text-field
            v-model="campaign_names"
            label="Campaign Names (comma separated)"
            required
            class="mb-4"
          ></v-text-field>
          <v-btn type="submit" color="primary" class="mb-4">Search</v-btn>
        </v-form>
        <v-container v-if="users.length">
          <v-row>
            <v-col cols="12" md="6" v-for="user in users" :key="user.id">
              <v-card class="mb-4">
                <v-card-title>{{ user.name }} ({{ user.email }})</v-card-title>
                <v-card-subtitle>
                  <v-list>
                    <v-list-item v-for="campaign in user.campaigns_list" :key="campaign.campaign_id">
                      <v-list-item-title>
                        {{ campaign.campaign_name }} ({{ campaign.campaign_id }})
                      </v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-card-subtitle>
              </v-card>
            </v-col>
          </v-row>
        </v-container>
        <v-alert v-else-if="searchAttempted" type="info" class="my-4">
          No users found with the given campaign names.
        </v-alert>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import userService from '@/api/services/users/userService';

export default {
  name: 'SearchUsers',
  data() {
    return {
      campaign_names: '',
      users: [],
      searchAttempted: false,
    };
  },
  methods: {
    async submitSearch() {
      this.searchAttempted = true;
      const campaignNames = this.campaign_names.split(',').map(name => name.trim());

      try {
        const response = await userService.filterUsers(campaignNames);

        this.users = response.length ? response : [];
      } catch (error) {
        console.error('There was an error searching the users! ', error.response.data.errors);
        
        this.users = [];
      }
    }
  }
};
</script>
