class WeightFaultObject < FaultObject
  
  cattr_accessor :UNSPECIFIED,
    :INVALID_LOGIN,
    :INCOMPLETE_DATA
    
  @@UNSPECIFIED       = 101
  @@INVALID_LOGIN     = 102
  @@INCOMPLETE_DATA   = 103
  
  @@MSG = {
    @@UNSPECIFIED => "Unspecified fault!",
    @@INVALID_LOGIN => "Invalid login!",
    @@INCOMPLETE_DATA => "Incomplete data provided!"
  }
  
  def initialize(code, details = nil) 
    super(@@MSG[code], details, nil)
    self['faultCode'] = code
  end
  
end
