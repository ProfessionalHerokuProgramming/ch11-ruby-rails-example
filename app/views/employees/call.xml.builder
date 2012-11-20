xml.instruct!
xml.Response do
   xml.Say("Connecting to ", :voice => "woman")
   xml.Say(@employee.name, :voice => "woman")
   xml.Dial @employee.phone
end
