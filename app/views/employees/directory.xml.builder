xml.instruct!
xml.Response do
    xml.Gather(:action => @post_to, :numDigits => 1) do
        xml.Say("Welcome to the Employee Directory.", :voice => "woman")
        xml.Say("If you know the extension of the person ", :voice => "woman")
        xml.Say("you wish to speak to, press 1. Please ", :voice => "woman")
        xml.Say("press 2 to hear a list of employees and ", :voice => "woman")
        xml.Say("their extensions.", :voice => "woman")
    end
end

