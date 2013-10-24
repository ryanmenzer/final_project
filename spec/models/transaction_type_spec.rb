require 'spec_helper'

describe TransactionType do
  context "Validations and Associations" do
    context "Saving" do
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
        @transaction_type = TransactionType.new(name: "Bank")
        @transaction_type_no_name = TransactionType.new()

      end

        it "should save a transaction type with a name" do
          expect(@transaction_type.save).to eq(true)
        end

        it "should not save a transaction type without a name" do
          expect{@transaction_type_no_name.save}.to raise_error(ActiveRecord::StatementInvalid)
        end
    end

    context "Model Validations" do
      it "should belong to initiative" do
        transactiontype = TransactionType.reflect_on_association(:transactions)
        transactiontype.macro.should == :has_many
      end
    end

  end
end