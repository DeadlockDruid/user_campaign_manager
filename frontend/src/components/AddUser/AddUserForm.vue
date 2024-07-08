<template>
  <v-container>
    <v-card class="pa-4">
      <v-card-title class="display-1">Add User</v-card-title>
      <v-card-text>
        <v-form @submit.prevent="submitForm">
          <v-text-field
            v-model="name"
            label="Name"
            required
            class="mb-4"
          ></v-text-field>
          <v-text-field
            v-model="email"
            label="Email"
            type="email"
            required
            class="mb-4"
          ></v-text-field>
          <div v-for="(campaign, index) in campaigns_list" :key="index" class="mb-4">
            <v-text-field
              v-model="campaign.campaign_name"
              label="Campaign Name"
              required
              class="mb-2"
            ></v-text-field>
            <v-text-field
              v-model="campaign.campaign_id"
              label="Campaign ID"
              required
            ></v-text-field>
          </div>
          <div>
            <v-btn class="mr-2" @click="addCampaign" outlined>Add Campaign</v-btn>
            <v-btn type="submit" color="primary">Submit</v-btn>
          </div>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import userService from '@/api/services/users/userService';

export default {
  name: 'AddUserForm',
  data() {
    return {
      name: '',
      email: '',
      campaigns_list: [{ campaign_name: '', campaign_id: '' }]
    };
  },
  methods: {
    addCampaign() {
      this.campaigns_list.push({ campaign_name: '', campaign_id: '' });
    },
    async submitForm() {
      try {
        await userService.addUser({
          name: this.name,
          email: this.email,
          campaigns_list: this.campaigns_list
        });

        alert('User added successfully!');

        this.name = '';
        this.email = '';
        this.campaigns_list = [{ campaign_name: '', campaign_id: '' }];
      } catch (error) {
        console.error('There was an error adding the user! ', error.response.data.errors);
      }
    }
  }
};
</script>
