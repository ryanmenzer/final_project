require 'spec_helper'

describe Transaction do
  before do 
    @tenant = Tenant.create(org_name: "Hello Inc")
    Tenant.set_current_tenant @tenant.id
    c = Category.create(name: "Staff")
    r = Role.create(name: "Administrator")
    @user = User.create(email: "hello@hello.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
    @user_new = User.create(email: "hi@hi.com",
               password: "password",
               password_confirmation: "password",
               role_id: r.id)
    @tenant.users << @user
    @tenant.users << @user_new
    @person =  Person.create(full_name: "Jim John Joe",
                          user_id: @user.id,
                          category_id: c.id,
                          gender: "male",
                          nationality: "American", 
                          email: "jim@hello.com")
    @initiative = Initiative.create(manager_id: @person.id,
                                    initiative_type_id: 0,
                                    title: "build school",
                                    description: "it is a cool work",
                                    goal: 1000)
    @sponsorship = Sponsorship.create(initiative_id: @initiative.id)
    @transaction = Transaction.new(transaction_type_id: 0, 
                                      sponsorship_id: @sponsorship.id, 
                                      payer_id: @user_new.id, 
                                      date: "2013-10-21", 
                                      amount: 1000)

  end 
    
    context "Validations and Associations" do
    
      it "should save a transaction with a sponsor_id" do
        expect(@transaction.save).to eq(true)
      end

      it "should belong to sponsorship" do 
        transaction = Transaction.reflect_on_association(:sponsorship)
        transaction.macro.should == :belongs_to      
      end 

      it "should have many payer" do 
        transaction = Transaction.reflect_on_association(:payer)
        transaction.macro.should == :belongs_to
      end
      
    end   
  
end
