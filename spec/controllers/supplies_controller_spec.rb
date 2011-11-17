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

describe SuppliesController do

  # This should return the minimal set of attributes required to create a valid
  # Supply. As you add validations to Supply, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all supplies as @supplies" do
      supply = Supply.create! valid_attributes
      get :index
      assigns(:supplies).should eq([supply])
    end
  end

  describe "GET show" do
    it "assigns the requested supply as @supply" do
      supply = Supply.create! valid_attributes
      get :show, :id => supply.id
      assigns(:supply).should eq(supply)
    end
  end

  describe "GET new" do
    it "assigns a new supply as @supply" do
      get :new
      assigns(:supply).should be_a_new(Supply)
    end
  end

  describe "GET edit" do
    it "assigns the requested supply as @supply" do
      supply = Supply.create! valid_attributes
      get :edit, :id => supply.id
      assigns(:supply).should eq(supply)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Supply" do
        expect {
          post :create, :supply => valid_attributes
        }.to change(Supply, :count).by(1)
      end

      it "assigns a newly created supply as @supply" do
        post :create, :supply => valid_attributes
        assigns(:supply).should be_a(Supply)
        assigns(:supply).should be_persisted
      end

      it "redirects to the created supply" do
        post :create, :supply => valid_attributes
        response.should redirect_to(Supply.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved supply as @supply" do
        # Trigger the behavior that occurs when invalid params are submitted
        Supply.any_instance.stub(:save).and_return(false)
        post :create, :supply => {}
        assigns(:supply).should be_a_new(Supply)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Supply.any_instance.stub(:save).and_return(false)
        post :create, :supply => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested supply" do
        supply = Supply.create! valid_attributes
        # Assuming there are no other supplies in the database, this
        # specifies that the Supply created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Supply.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => supply.id, :supply => {'these' => 'params'}
      end

      it "assigns the requested supply as @supply" do
        supply = Supply.create! valid_attributes
        put :update, :id => supply.id, :supply => valid_attributes
        assigns(:supply).should eq(supply)
      end

      it "redirects to the supply" do
        supply = Supply.create! valid_attributes
        put :update, :id => supply.id, :supply => valid_attributes
        response.should redirect_to(supply)
      end
    end

    describe "with invalid params" do
      it "assigns the supply as @supply" do
        supply = Supply.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Supply.any_instance.stub(:save).and_return(false)
        put :update, :id => supply.id, :supply => {}
        assigns(:supply).should eq(supply)
      end

      it "re-renders the 'edit' template" do
        supply = Supply.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Supply.any_instance.stub(:save).and_return(false)
        put :update, :id => supply.id, :supply => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested supply" do
      supply = Supply.create! valid_attributes
      expect {
        delete :destroy, :id => supply.id
      }.to change(Supply, :count).by(-1)
    end

    it "redirects to the supplies list" do
      supply = Supply.create! valid_attributes
      delete :destroy, :id => supply.id
      response.should redirect_to(supplies_url)
    end
  end

end
