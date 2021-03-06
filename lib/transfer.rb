class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if valid? && @sender.balance > amount && @sender.status="pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    
    # if status is pending then subtract cash from senders balance, add cash to receivers balance, transaction complete... it can reject if sender doesnt have enough funds.
    end 
  end


    def reverse_transfer 
      if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end 
  end 
  
end
