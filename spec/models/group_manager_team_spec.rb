require 'rails_helper'

## testes de múltiplas condições para a classe GroupManagerTeam

RSpec.describe GroupManagerTeam, type: :model do
  describe '#is_permitted?' do 
    before(:each) do 
      @app = App.create!(app_name: 'app', owner_country: 'brasil')
      @app = @app.reload
      @parent_node = Group.create!(description: 'root_node')
      @group_mng1 = GroupManager.create!(email: 'mngr1@gmail.com', password: "guardioeshjh456", vigilance_syndromes: [])
      @group_mng1 = @group_mng1.reload

      @group_mng2 = GroupManager.create!(email: 'mngr2@gmail.com', password: "guardioesbhj458", vigilance_syndromes: [])
      @group_mng2 = @group_mng2.reload

      @group_mng3 = GroupManager.create!(email: 'mngr3@gmail.com', password: "guardioesghv457", vigilance_syndromes: [])
      @group_mng3 = @group_mng3.reload

      @group_mng4 = GroupManager.create!(email: 'mngr4@gmail.com', password: "guardioesghv459", vigilance_syndromes: [])
      @group_mng4 = @group_mng4.reload
    
      @group1 = Group.create!(description: 'Espanha', group_manager_id: @group_mng1.id, parent_id: @parent_node.id)
      @group2 = Group.create!(description: 'Brasil', group_manager_id: @group_mng2.id, parent_id: @parent_node.id)
      @group3 = Group.create!(description: 'Alemanha', group_manager_id: @group_mng3.id, parent_id: @parent_node.id)
      @group4 = Group.create!(description: 'root_node', group_manager_id: @group_mng4.id, parent_id: @parent_node.id)

      @manager_group_permission1 = ManagerGroupPermission.create!(group_manager_id: @group_mng1.id, group_id: @group1.id)
      @manager_group_permission2 = ManagerGroupPermission.create!(group_manager_id: @group_mng2.id, group_id: @group2.id)
      
      

      @group_mng_team1 = GroupManagerTeam.create!(email: 'mng1@gmail.com', password: 'gd12345', group_manager_id: @group_mng1.id, app_id: @app.id)
      @group_mng_team1 = @group_mng_team1.reload
      @group_mng_team2 = GroupManagerTeam.create!(email: 'mng2@gmail.com', password: 'gd64874', group_manager_id: @group_mng2.id, app_id: @app.id)
      @group_mng_team2 = @group_mng_team2.reload
      @group_mng_team3 = GroupManagerTeam.create!(email: 'mng3@gmail.com', password: 'gd54545', group_manager_id: @group_mng3.id, app_id: @app.id)
      @group_mng_team3 = @group_mng_team3.reload
      @group_mng_team4 = GroupManagerTeam.create!(email: 'mng4@gmail.com', password: 'gd54555', group_manager_id: @group_mng4.id, app_id: @app.id)
      @group_mng_team4 = @group_mng_team4.reload

      @permission1 = Permission.create!(models_manage: ['household', 'form_option', 'symptom'] , group_manager_id: @group_mng1.id, group_manager_team_id: @group_mng_team1.id)
      ## incluso group
      @permission2 = Permission.create!(models_manage: ['group', 'household', 'form'], group_manager_id: @group_mng2.id, group_manager_team_id: @group_mng_team2.id)      
    end

    it 'primeira cobertura múltipla' do
      expect(@group_mng_team1.is_permitted?(@group1)).to be false 
    end

    it 'segunda cobertura múltipla' do
      expect(@group_mng_team2.is_permitted?(@group2)).to be true
    end 

    it 'terceira cobertura múltipla' do 
      expect(@group_mng_team3.is_permitted?(@group3)).to be false
    end
    it 'quarta cobertura múltipla' do 
      expect(@group_mng_team4.is_permitted?(@group4)).to be false
    end

  end 
end