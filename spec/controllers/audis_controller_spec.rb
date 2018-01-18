require 'rails_helper'

RSpec.describe AudisController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      audi = FactoryGirl.create(:audi)
      get :show , id: audi.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      audi = FactoryGirl.create(:audi)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      audi = FactoryGirl.create(:audi)
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      audi = FactoryGirl.create(:audi)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      audis = Audi.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      audi = FactoryGirl.create(:audi)
      get :edit , id:audi.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      audi = FactoryGirl.create(:audi)
      get :edit, id:'ajhgahj' , format:'json', audi:{ category:'' , capacity:'', movie_id:'', theatre_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      audi = FactoryGirl.create(:audi)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      audi = FactoryGirl.create(:audi)
      post :create, format:'json', audi:{ category:audi.category , capacity:audi.capacity, movie_id:audi.movie_id, theatre_id:audi.theatre_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      audi = FactoryGirl.create(:audi)
      post :create, format:'json', audi:{ category:'' , capacity:'', movie_id:'', theatre_id:''}
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      audi = FactoryGirl.create(:audi)
      put :update, format:'json', id:audi.id, audi:{ category:audi.category , capacity:audi.capacity, movie_id:audi.movie_id, theatre_id:audi.theatre_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      audi = FactoryGirl.create(:audi)
      put :update, format:'json', id:audi.id, audi:{ category:'' , capacity:'', movie_id:'', theatre_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      audi = FactoryGirl.create(:audi)
      put :update, format:'json', id:'', audi:{ category:'' , capacity:'', movie_id:'', theatre_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      audi = FactoryGirl.create(:audi)
      delete :destroy, format:'json', id:audi.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      audi = FactoryGirl.create(:audi)
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      audi = FactoryGirl.create(:audi)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end