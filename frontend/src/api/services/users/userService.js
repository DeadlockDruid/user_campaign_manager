import apiClient from '@/api/apiClient';

// APIs for user resource
const userService = {
  async getUsers() {
    const response = await apiClient.get('/users');

    return response.data;
  },

  async addUser(user) {
    const response = await apiClient.post('/users', { user });

    return response.data;
  },

  async filterUsers(campaignNames) {
    const query = campaignNames.map(name => encodeURIComponent(name)).join(',');

    const response = await apiClient.get(`/users/filter?campaign_names=${query}`);

    return response.data;
  }
};

export default userService;
