require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe AppSettingsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # AppSetting. As you add validations to AppSetting, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {:key => 'MyKey', :value => 'MyValue'} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AppSettingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    sign_in
  end

  describe "GET index" do
    it "assigns all app_settings as @app_settings" do
      app_settings = double('app_settings')
      allow(AppSetting).to receive(:all).and_return(app_settings)
      get :index
      expect(assigns(:app_settings)).to equal(app_settings) # Note: it should be called after controller action has been executed
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "responds successfully" do
      get :index
      expect(response).to be_success
      # expect(response).to have_http_status(200) # Note: it is available in rspec 3
    end
  end

  describe "GET show" do
    before(:each) do
      @id = 'id'
      @app_setting = double('app_settings', :id => @id)
      allow(AppSetting).to receive(:find).with(@id).and_return(@app_setting)
      get :show, {:id => @id}
    end
    it "assigns the requested app_setting as @app_setting" do
      expect(assigns(:app_setting)).to equal(@app_setting)
    end
    it "renders the show template" do
      expect(response).to render_template("show")
    end
    it "responds successfully" do
      expect(response).to be_success
    end
  end

  describe "GET new" do
    before(:each) do
      get :new
    end
    it "assigns a new app_setting as @app_setting" do
      expect(assigns(:app_setting)).to be_a_new(AppSetting)
    end
    it "renders the edit template" do
      expect(response).to render_template("new")
    end
    it "responds successfully" do
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    before(:each) do
      @id = 'id'
      @app_setting = double('app_settings', :id => @id)
      allow(AppSetting).to receive(:find).with(@id).and_return(@app_setting)
      get :edit, {:id => @id}
    end
    it "assigns the requested app_setting as @app_setting" do
      assigns(:app_setting).should equal(@app_setting)
    end
    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
    it "responds successfully" do
      expect(response).to be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AppSetting with valid attributes and redirects to created app_setting" do
        passed_attributes = {:app_setting => {:key => 'MyKey', :value => 'MyValue'}}
        new_app_setting = AppSetting.new(passed_attributes[:app_setting])
        allow(AppSetting).to receive(:new).with(passed_attributes[:app_setting]).and_return(new_app_setting)
        allow(new_app_setting).to receive(:save).and_return(true)
        expect(AppSetting).to receive(:new).with(passed_attributes[:app_setting])
        expect(new_app_setting).to receive(:save)
        post :create, passed_attributes
        expect(response).to redirect_to(new_app_setting)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved app_setting as @app_setting and renders 'new' template" do
        passed_attributes = {:app_setting => {:key => 'InvalidMyKey', :value => 'InvalidMyValue'}}
        new_app_setting = AppSetting.new(passed_attributes[:app_setting])
        allow(AppSetting).to receive(:new).and_return(new_app_setting)
        allow(new_app_setting).to receive(:save).and_return(false)
        expect(AppSetting).to receive(:new).with(passed_attributes[:app_setting])
        expect(new_app_setting).to receive(:save)
        post :create, passed_attributes
        expect(response).to render_template('new')
      end
    end

    describe "with missing params" do
      it "raises ActionController::ParameterMissing error" do
        passed_attributes = {:app_setting_another => {:key => 'InvalidMyKey', :value => 'InvalidMyValue'}}
        expect { post :create, passed_attributes_missing }.to raise_error
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns requested app_setting as @app_setting, updated it and redirects to app_setting" do
        passed_attributes = {:id => 123, :app_setting => {:key => 'MyKey', :value => 'MyValue'}}
        app_setting = mock_model(AppSetting)
        allow(AppSetting).to receive(:find).with(instance_of(String)).and_return(app_setting)
        allow(app_setting).to receive(:update).with(any_args).and_return(true)
        expect(AppSetting).to receive(:find).ordered.with(instance_of(String))
        expect(app_setting).to receive(:update).ordered.with(any_args)
        put :update, passed_attributes
        expect(assigns(:app_setting)).to equal(app_setting)
        expect(response).to redirect_to(app_setting)
      end
    end

    describe "with invalid params" do
      it "assigns requested app_setting as @app_setting, as update fails, renders the 'edit' template" do
        passed_attributes = {:id => 123, :app_setting => {:key => 'MyKeyInvalid', :value => 'MyValueInvalid'}}
        app_setting = mock_model(AppSetting)
        allow(AppSetting).to receive(:find).with(instance_of(String)).and_return(app_setting)
        allow(app_setting).to receive(:update).with(any_args).and_return(false)
        expect(AppSetting).to receive(:find).ordered.with(instance_of(String))
        expect(app_setting).to receive(:update).ordered.with(any_args)
        put :update, passed_attributes
        expect(assigns(:app_setting)).to equal(app_setting)
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested app_setting and redirects to the app_settings list" do
      passed_attributes = {:id => 123}
      app_setting = mock_model(AppSetting)
      allow(AppSetting).to receive(:find).with(instance_of(String)).and_return(app_setting)
      allow(app_setting).to receive(:destroy)
      expect(AppSetting).to receive(:find).ordered.with(instance_of(String))
      expect(app_setting).to receive(:destroy).ordered
      delete :destroy, passed_attributes
      expect(response).to redirect_to(app_settings_url)
    end
  end

end

