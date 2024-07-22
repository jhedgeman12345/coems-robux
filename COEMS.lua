-- Putting together everything we've learned, we will now create a basic hub using all previous code snippets.

local Progress = getfenv().Progress

Progress.Window:SetSubtitle("BETA TEST | Early Access")

local pages = {
	Self = Progress.Hub:CreatePage("Self", "home"),
	Teleports = Progress.Hub:CreatePage("Teleports", "swirl"),
	Alerts = Progress.Hub:CreatePage("Alerts", "bell-ring")
}

local sections = {
	Self = {
		Main = pages.Self:CreateSection("Main", false),
		Another = pages.Self:CreateSection("Cool Little Section", false)
	},
	Teleports = {
		Main = pages.Teleports:CreateSection("Another Page", false)
	},
	Alerts = {
		Main = pages.Alerts:CreateSection("Alerts", false)
	}
}

--==--== PAGE "Self" SECTION "Main" ==--==--

-- Create a button
local button = sections.Self.Main:CreateElement("Button", {
	Text = "Press me!",
	Label = {
		Title = "Am a cool button",
		Text = "Press me for important information regarding your fridge."
	}
}).Click:Connect(function()
	Progress.Window:ShowMessage(
		"Test Message",
		"I have hacked into your Samsung fridge.\nYou should be very scared right now. Real!"
	)
end)

-- Create a label
sections.Self.Main:CreateElement("Label", {
	Label = {
		Title = "I am a label!",
		Text = "I am a description"
	}
})

-- Create a slider
local slider = sections.Self.Main:CreateElement("Slider", {
	Value = 3,
	Min = 0,
	Max = 10,
	Step = 1,
	Label = {
		Title = "A Cool Slider",
		Text = "I'm a very cool slider that can select any integer from 0-10."
	},
	OnChanged = function(value)
		print("The slider's value changed to:", value)
	end
})

-- Create a slider
local slider = sections.Self.Main:CreateElement("Slider", {
	Value = 3,
	Min = 0,
	Max = 10,
	Step = 1,
	Label = {
		Title = "A Cool Slider",
		Text = "I'm a very cool slider that can select any integer from 0-10."
	},
	OnChanged = function(value)
		print("The slider's value changed to:", value)
	end
})

-- Create an alert
sections.Self.Main:CreateElement("Alert", {
	Type = 3, -- Important
	Label = {
		Title = "Imp-ortant", -- hehe funny demon pun
		Text = "Do not underestimate the power of cats."
	}
})

-- Create a color picker
local colorPicker = sections.Self.Main:CreateElement("ColorPicker", {
	Value = Color3.fromRGB(100, 0, 50),
	Label = {
		Title = "Color picker",
		Text = "I am a color picker. Click me to choose from over 1.6 million colors."
	},
	OnChanged = function(value)
		print("Color picker changed value:", value)
	end
})

-- Create a toggle
local toggle = sections.Self.Main:CreateElement("Toggle", {
	Value = true,
	Label = {
		Title = "Toggle",
		Text = "I am a toggle"
	},
	OnChanged = function(value)
		print("The state of the toggle changed:", value)
	end
})

-- Create two dropdowns: one single-select, and one multi-select.
-- Define our base configuration for both dropdowns. It's worth noting that previous configurations are always safe to use later and are never overwritten.
local dropdownConfig = {
	Values = {
		"Option 1",
		"Option 2",
		"Option 3",
		"Option 4",
		"Option 5"
	},
	Selected = {
		"Option 1",
	},
	OnSelectionChanged = function(values)
		print("Selection was changed to:", unpack(values))
	end,
	OnSelectionDifference = function(selected, unselected)
		print("Selection difference:", selected, unselected)
	end,
	OnValueSelected = function(value)
		print("Value selected:", value)
	end,
	OnValueUnselected = function(value)
		print("Value unselected:", value)
	end
}

-- Add to config for dropdown #1
dropdownConfig.Label = {
	Title = "Dropdown",
	Text = "I am a dropdown that can only select from one value at a time."
}

-- Create dropdown #1
local dropdown1 = sections.Self.Main:CreateElement("Dropdown", dropdownConfig)

-- Add to config for dropdown #2
dropdownConfig.MultiSelect = true
dropdownConfig.Label = {
	Title = "Multi Dropdown",
	Text = "I am a dropdown that can select from multiple values at a time."
}

-- Create dropdown #2
local dropdown2 = sections.Self.Main:CreateElement("Dropdown", dropdownConfig)

-- Create a text box
local textBox = sections.Self.Main:CreateElement("TextBox", {
	Value = "Default Text",
	PlaceholderText = "Placeholder Text",
	Label = {
		Title = "This is a text box.",
		Text = "You type stuff into it, and it does cool things."
	},
	OnChanged = function(value)
		print("The textbox's text changed to:", value)
	end
})

--==--== PAGE "Self" SECTION "A Cool Section" ==--==--

-- Create an alert displaying info for this section
sections.Self.Another:CreateElement("Alert", {
	Type = 1,
	Label = {
		Title = "Section Info",
		Text = "This demon-strates the use of sections! Sections are very useful for organization; they can break stuff into categories so they don't have to be moved into another tab!"
	}
})

-- Create some button for this section
sections.Self.Another:CreateElement("Button", {
	Text = "Example Button",
	Label = {
		Title = "Some Cool Thing",
		Text = "This thing belongs in this section"
	}
}).Click:Connect(function()
	Progress.Window:ShowMessage(
		"Hello there!",
		"Hey! You just pressed a button in another section! Cool, right?"
	)
end)

--==--== PAGE "Teleports" SECTION "Another Page" ==--==--

local character = game:GetService("Players").LocalPlayer.Character

-- Create an alert displaying info for this section
sections.Teleports.Main:CreateElement("Alert", {
	Label = {
		Title = "Hello Again!",
		Text = "This is an example of content on another tab (page)"
	}
})

-- Create teleport buttons for all four corners of the baseplate.
sections.Teleports.Main:CreateElement("Button", {
	Text = "Teleport!",
	Label = {
		Title = "Teleport to NW corner",
		Text = "Teleports to the north-west corner of the baseplate."
	}
}).Click:Connect(function()
	character:PivotTo(CFrame.new(-500,20,-500))
end)

sections.Teleports.Main:CreateElement("Button", {
	Text = "Teleport!",
	Label = {
		Title = "Teleport to NE corner",
		Text = "Teleports to the north-east corner of the baseplate."
	}
}).Click:Connect(function()
	character:PivotTo(CFrame.new(500,20,-500))
end)

sections.Teleports.Main:CreateElement("Button", {
	Text = "Teleport!",
	Label = {
		Title = "Teleport to SW corner",
		Text = "Teleports to the south-west corner of the baseplate."
	}
}).Click:Connect(function()
	character:PivotTo(CFrame.new(-500,20,500))
end)

sections.Teleports.Main:CreateElement("Button", {
	Text = "Teleport!",
	Label = {
		Title = "Teleport to SE corner",
		Text = "Teleports to the south-east corner of the baseplate."
	}
}).Click:Connect(function()
	character:PivotTo(CFrame.new(500,20,500))
end)

--==--== PAGE "Alerts" SECTION "Alerts" ==--==--

-- Create a label displaying info for this section
sections.Alerts.Main:CreateElement("Label", {
	Label = {
		Title = "All Alerts",
		Text = "Here, you can check out all the different kinds of in-page alerts!"
	}
})

-- Create all alert types, from 0 to 5
sections.Alerts.Main:CreateElement("Alert", {
	Type = 0, -- Unset (you don't actually need to include this if unset)
	Label = {
		Title = "Unset",
		Text = "An alert with no type, used for displaying generic information."
	}
})

sections.Alerts.Main:CreateElement("Alert", {
	Type = 1, -- Note
	Label = {
		Title = "Note",
		Text = "Please, folks. Don't stay up til 3am working on projects. You'll regret it later. You'll be falling asleep in your chair, even with coffee. You'll need to blast music in order to keep yourself awake (until 12:00 AM midnight)"
	}
})

sections.Alerts.Main:CreateElement("Alert", {
	Type = 2, -- Tip
	Label = {
		Title = "Tip",
		Text = "If you are kind to others, others will be kind to you. If you walk up to someone and randomly punch them, don't expect them to be your friend any time soon."
	}
})

sections.Alerts.Main:CreateElement("Alert", {
	Type = 3, -- Important
	Label = {
		Title = "Imp-ortant",
		Text = "Do not underestimate the power of cats."
	}
})

sections.Alerts.Main:CreateElement("Alert", {
	Type = 4, -- Warning
	Label = {
		Title = "Warning",
		Text = "When you connected to the McDonalds' Wi-Fi hotspot, they have logged your IP and reported it to the feds. McDonald's now has your IP address. You should be very worried."
	}
})

sections.Alerts.Main:CreateElement("Alert", {
	Type = 5, -- Caution
	Label = {
		Title = "Caution",
		Text = "Eh, well, by the time you've read this, it's already too late."
	}
})

-- End of example script
