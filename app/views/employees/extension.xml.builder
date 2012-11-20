xml.instruct!
xml.Response do
   xml.Gather(:action => @post_to, :numDigits => 4) do
       xml.Say("Enter the 4 digit extension now.", :voice => "woman")
   end
end
