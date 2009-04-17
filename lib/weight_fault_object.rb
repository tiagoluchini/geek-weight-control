class WeightFaultObject < FaultObject
  
  cattr_accessor :UNSPECIFIED,
    :INVALID_LOGIN
  
  @@UNSPECIFIED       = 101
  @@INVALID_LOGIN     = 102
  
  @@MSG = {
    @@UNSPECIFIED => "Unspecified fault!",
    @@INVALID_LOGIN => "Invalid login!"
  }
  
  def initialize(code) 
    super(@@MSG[code])
    self['faultCode'] = code
    self['code'] = code
  end
  
end
