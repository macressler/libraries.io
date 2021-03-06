require "rails_helper"

describe "Admin::StatsController" do
  let(:user) { create :user }

  describe "GET /admin/stats", :vcr, type: :request do
    it "denies access when logged out" do
      get admin_stats_path
      expect(response).to redirect_to(login_path)
    end

    it "denies access for non-admins" do
      login(user)
      expect { visit admin_stats_path }.to raise_exception ActiveRecord::RecordNotFound
    end

    it "renders successfully for admins" do
      mock_is_admin
      login(user)
      visit admin_stats_path
      expect(page).to have_content 'Recent Signups'
    end
  end

  describe "GET /admin/stats/github", :vcr, type: :request do
    it "denies access when logged out" do
      get admin_github_stats_path
      expect(response).to redirect_to(login_path)
    end

    it "denies access for non-admins" do
      login(user)
      expect { visit admin_github_stats_path }.to raise_exception ActiveRecord::RecordNotFound
    end

    it "renders successfully for admins" do
      mock_is_admin
      login(user)
      visit admin_github_stats_path
      expect(page).to have_content 'GitHub Stats'
    end
  end

  describe "GET /admin/graphs", :vcr, type: :request do
    it "denies access when logged out" do
      get admin_graphs_path
      expect(response).to redirect_to(login_path)
    end

    it "denies access for non-admins" do
      login(user)
      expect { visit admin_graphs_path }.to raise_exception ActiveRecord::RecordNotFound
    end

    it "renders successfully for admins" do
      mock_is_admin
      login(user)
      visit admin_graphs_path
      expect(page).to have_content 'Graphs'
    end
  end
end
