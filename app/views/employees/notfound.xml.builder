xml.instruct!
xml.Response do
   xml.Gather(:action => @post_to, :numDigits => 1) do
       xml.Say("The extention you entered, " + @entry, :voice => "woman")
       xml.Say(" was not found. To try another extension, press 1.  For a ",
           :voice => "woman")
       xml.Say("list of extensions, press 2.", :voice => "woman")
   end
end
