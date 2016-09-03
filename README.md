#BCS Color Picker for Swift

##Description

I needed a color picker for my project and I couldn't find a one which is easy to use and does not contain features I don't need. I wanted it to be super easy to use and good looking. I am pretty new in Swift world, so if anything wrong, please let me know.

##Usage

You just need to copy BCSColorPicker.swift into your workspace and call:

```
BCSColorPicker.picker.colorPickerVC.showColorPicker(controller: UIViewController, animated: Bool, selection: ((UIColor?, Int) -> Void))
```

For controller: you will enter the controller that you want to show color picker. In selection: you will have the color (*UIColor*) and the index (*Int*) of the color that is chosen by the user. If the cancel button touched UIColor will be **nil** and index will be **-1**.

You can customize the picker by using the options below:

```
let colorPickerVC = BCSColorPicker.picker

//You can customize color palette
colorPickerVC.colorPalette = []

//You can customize number of color in a single row
colorPickerVC.numberOfColorsInARow = 13

//You can customize height and width
colorPickerVC.height = 130
colorPickerVC..width = 130

//You can customize background color
colorPickerVC.backgroundColor = UIColor.whiteColor()

//You can customize border and its properties
colorPickerVC.border = 3
	//For no border use 0 
colorPickerVC.borderColor = UIColor.whiteColor()
colorPickerVC.radius = 13
```

For next version, I am thinking to add a auto palette generator but not random. For any recommendation, please feel free to contact.

Enjoy. 