xml.instruct!
xml.Response do
   xml.Gather(:action => @post_to, :numDigits => 4) do
       @employees.each do |employee|
           xml.Say(employee.name + " at extension " +
               employee.extension.to_s(), :voice => "woman")
       end
       xml.Say("Please enter the 4 digit extension now.", :voice => "woman")
   end
end
